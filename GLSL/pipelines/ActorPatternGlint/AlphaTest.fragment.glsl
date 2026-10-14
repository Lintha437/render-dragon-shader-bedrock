#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPatternGlint / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
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
#ifndef RD_FEATURE_UIENTITY
#define RD_FEATURE_UIENTITY RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 2
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ActorPatternGlint/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue4);
    precise float productValue15 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[2u];
    precise float productValue16 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u];
    precise float productValue17 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u];
    precise float sumValue7 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue8 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue9 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float scalarValue8 = rdDot3Precise(vec3(-productValue15, -productValue16, -productValue17), vec3(sumValue7, sumValue8, sumValue9));
    precise float sumValue10 = fragmentScalarConstants1.packedValues[41u] - fragmentScalarConstants1.packedValues[40u];
    precise float sumValue11 = scalarValue8 - fragmentScalarConstants1.packedValues[40u];
    precise float quotientValue3 = 1.0 / sumValue10;
    precise float productValue18 = quotientValue3 * sumValue11;
    float scalarValue9 = spvNClamp(productValue18, 0.0, 1.0);
    precise float productValue19 = scalarValue9 * scalarValue9;
    precise float multiplyAddValue13 = productValue19 * fma(scalarValue9, -2.0, 3.0);
    precise float quotientValue4 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue5 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue14 = fma(quotientValue4, 0.5, 0.5) * fragmentVectorConstants1.packedValues[13u].x;
    precise float multiplyAddValue15 = fma(quotientValue5, 0.5, 0.5) * fragmentVectorConstants1.packedValues[13u].y;
    precise float quotientValue6 = multiplyAddValue14 / fragmentScalarConstants1.packedValues[42u];
    precise float quotientValue7 = multiplyAddValue15 / fragmentScalarConstants1.packedValues[42u];
    precise float productValue20 = floor(quotientValue6) * fragmentScalarConstants1.packedValues[42u];
    precise float productValue21 = floor(quotientValue7) * fragmentScalarConstants1.packedValues[42u];
    precise float productValue22 = productValue20 * 0.25;
    precise float productValue23 = productValue21 * 0.25;
    precise float productValue24 = productValue20 * 0.5;
    precise float productValue25 = productValue21 * 0.5;
    float scalarValue10 = floor(productValue23);
    float scalarValue11 = floor(productValue25);
    precise float productValue26 = scalarValue10 * scalarValue10;
    precise float productValue27 = scalarValue11 * scalarValue11;
    precise float productValue28 = productValue26 * 0.75;
    precise float productValue29 = productValue27 * 0.75;
    float scalarValue12 = floor(productValue21);
    precise float productValue30 = scalarValue12 * scalarValue12;
    precise float productValue31 = productValue30 * 0.75;
    precise float multiplyAddValue16 = fma(fma(fma(fract(fma(floor(productValue22), 0.5, productValue28)), 0.25, fract(fma(floor(productValue24), 0.5, productValue29))), 0.25, fract(fma(floor(productValue20), 0.5, productValue31))), 64.0, 0.5) * 0.015625;
    if ((sampledTextureValue4.w < fragmentScalarConstants1.packedValues[36u]) || ((fragmentScalarConstants1.packedValues[56u] != 0.0) && (multiplyAddValue16 >= multiplyAddValue13)))
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue4.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue1 = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue16 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue2 = inversesqrt(scalarValue16);
    precise float productValue51 = inverseLengthValue2 * reinterpretedBits;
    precise float productValue52 = inverseLengthValue2 * reinterpretedBits1;
    precise float productValue53 = inverseLengthValue2 * reinterpretedBits2;
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits14 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x);
    precise float reinterpretedBits15 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y);
    precise float reinterpretedBits16 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z);
    float scalarValue18 = rdDot3Precise(vec3(-productValue51, -productValue52, -productValue53), vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    precise float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[37u])) - reinterpretedBits5;
    precise float sumValue18 = scalarValue18 - reinterpretedBits5;
    precise float quotientValue10 = 1.0 / reinterpretedBits17;
    precise float productValue54 = quotientValue10 * sumValue18;
    float scalarValue19 = spvNClamp(productValue54, 0.0, 1.0);
    precise float productValue55 = scalarValue19 * scalarValue19;
    precise float multiplyAddValue37 = productValue55 * fma(scalarValue19, -2.0, 3.0);
    precise float quotientValue4 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue5 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float multiplyAddValue38 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x);
    precise float multiplyAddValue39 = fma(quotientValue5, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[38u]));
    precise float quotientValue11 = multiplyAddValue38 / reinterpretedBits8;
    precise float quotientValue12 = multiplyAddValue39 / reinterpretedBits8;
    precise float productValue56 = floor(quotientValue11) * reinterpretedBits8;
    precise float productValue57 = floor(quotientValue12) * reinterpretedBits8;
    precise float productValue58 = productValue56 * 0.25;
    precise float productValue59 = productValue57 * 0.25;
    precise float productValue60 = productValue56 * 0.5;
    precise float productValue61 = productValue57 * 0.5;
    float scalarValue20 = floor(productValue59);
    float scalarValue21 = floor(productValue61);
    precise float productValue62 = scalarValue20 * scalarValue20;
    precise float productValue63 = scalarValue21 * scalarValue21;
    precise float productValue64 = productValue62 * 0.75;
    precise float productValue65 = productValue63 * 0.75;
    float scalarValue22 = floor(productValue57);
    precise float productValue66 = scalarValue22 * scalarValue22;
    precise float productValue67 = productValue66 * 0.75;
    precise float multiplyAddValue40 = fma(fma(fma(fract(fma(floor(productValue58), 0.5, productValue64)), 0.25, fract(fma(floor(productValue60), 0.5, productValue65))), 0.25, fract(fma(floor(productValue56), 0.5, productValue67))), 64.0, 0.5) * 0.015625;
    if ((scalarValue15 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) != 0.0) && (multiplyAddValue40 >= multiplyAddValue37)))
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue4);
    float productValue12 = rdDot3Precise(vec3(-(inverseLengthValue1 * fragmentScalarConstants1.packedValues[2u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z));
    float quotientValue2 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[41u] - fragmentScalarConstants1.packedValues[40u])) * (productValue12 - fragmentScalarConstants1.packedValues[40u]), 0.0, 1.0);
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[13u].x) / fragmentScalarConstants1.packedValues[42u]) * fragmentScalarConstants1.packedValues[42u];
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[13u].y) / fragmentScalarConstants1.packedValues[42u]) * fragmentScalarConstants1.packedValues[42u];
    float productValue13 = floor(multiplyAddValue1 * 0.25);
    float productValue14 = floor(multiplyAddValue1 * 0.5);
    float scalarValue5 = floor(multiplyAddValue1);
    if ((sampledTextureValue4.w < fragmentScalarConstants1.packedValues[36u]) || ((fragmentScalarConstants1.packedValues[56u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue13 * productValue13) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue14 * productValue14) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue5 * scalarValue5) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue2 * quotientValue2) * fma(quotientValue2, -2.0, 3.0)))))
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue4.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue1 = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue16 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue2 = inversesqrt(scalarValue16);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue2 * reinterpretedBits), -(inverseLengthValue2 * reinterpretedBits1), -(inverseLengthValue2 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    float reinterpretedBits6 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[37u])) - reinterpretedBits5)) * (reinterpretedBits4 - reinterpretedBits5), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[38u]));
    float multiplyAddValue29 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue30 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue49 = floor(multiplyAddValue30 * 0.25);
    float productValue50 = floor(multiplyAddValue30 * 0.5);
    float scalarValue17 = floor(multiplyAddValue30);
    if ((scalarValue15 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue29 * 0.25), 0.5, (productValue49 * productValue49) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue29 * 0.5), 0.5, (productValue50 * productValue50) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue29), 0.5, (scalarValue17 * scalarValue17) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits6 * reinterpretedBits6) * fma(reinterpretedBits6, -2.0, 3.0)))))
#elif (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[14u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[10u].x) / (fragmentVectorConstants1.packedValues[10u].y - fragmentVectorConstants1.packedValues[10u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[13u].x) / fragmentVectorConstants1.packedValues[10u].z) * fragmentVectorConstants1.packedValues[10u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[13u].y) / fragmentVectorConstants1.packedValues[10u].z) * fragmentVectorConstants1.packedValues[10u].z;
        float productValue = floor(quotientValue1 * 0.25);
        float productValue1 = floor(quotientValue1 * 0.5);
        float scalarValue3 = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue1 * productValue1) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue * productValue) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue3 * scalarValue3) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((sampledTextureValue.w < fragmentVectorConstants1.packedValues[9u].x) || comparisonValue)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue.w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[13u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[9u].x) / (fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[9u].x), 0.0, 1.0);
        float quotientValue8 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[12u].x) / fragmentVectorConstants1.packedValues[9u].z) * fragmentVectorConstants1.packedValues[9u].z;
        float quotientValue9 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[12u].y) / fragmentVectorConstants1.packedValues[9u].z) * fragmentVectorConstants1.packedValues[9u].z;
        float productValue38 = floor(quotientValue9 * 0.25);
        float productValue39 = floor(quotientValue9 * 0.5);
        float scalarValue14 = floor(quotientValue9);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue39 * productValue39) * 0.75) + (floor(quotientValue8 * 0.5) * 0.5)) + (fract(((productValue38 * productValue38) * 0.75) + (floor(quotientValue8 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue14 * scalarValue14) * 0.75) + (floor(quotientValue8) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((scalarValue13 < fragmentVectorConstants1.packedValues[8u].x) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    uint scalarValue6 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
    intermediateValue18 = sampledTextureValue4.z;
    intermediateValue19 = sampledTextureValue4.y;
    intermediateValue20 = sampledTextureValue4.x;
    float multiplyAddValue4;
    float multiplyAddValue5;
    float multiplyAddValue6;
    uint sumValue5;
    uint scalarValue7 = 0u;
    for (;;)
    {
        if (int(scalarValue6) <= int(scalarValue7))
        {
            break;
        }
        uint sumValue4 = scalarValue7 + 24u;
        vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue6 = scalarValue7 + 17u;
        precise float bitwiseValue1 = sampledTextureValue5.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue7) + 272u) + 12u) >> 2u];
        multiplyAddValue6 = fma(bitwiseValue1, fma(sampledTextureValue5.x, fragmentVectorConstants1.packedValues[sumValue6].x, -intermediateValue20), intermediateValue20);
        multiplyAddValue5 = fma(bitwiseValue1, fma(sampledTextureValue5.y, fragmentVectorConstants1.packedValues[sumValue6].y, -intermediateValue19), intermediateValue19);
        multiplyAddValue4 = fma(bitwiseValue1, fma(sampledTextureValue5.z, fragmentVectorConstants1.packedValues[sumValue6].z, -intermediateValue18), intermediateValue18);
        sumValue5 = scalarValue7 + 1u;
        intermediateValue18 = multiplyAddValue4;
        intermediateValue19 = multiplyAddValue5;
        intermediateValue20 = multiplyAddValue6;
        scalarValue7 = sumValue5;
        continue;
    }
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    precise float productValue32 = sampledTextureValue7.x * fragmentVectorConstants1.packedValues[15u].x;
    precise float productValue33 = sampledTextureValue7.y * fragmentVectorConstants1.packedValues[15u].y;
    precise float productValue34 = sampledTextureValue7.z * fragmentVectorConstants1.packedValues[15u].z;
    precise float multiplyAddValue17 = fma(sampledTextureValue6.x, fragmentVectorConstants1.packedValues[15u].x, productValue32) * fragmentVectorConstants1.packedValues[31u].x;
    precise float multiplyAddValue18 = fma(sampledTextureValue6.y, fragmentVectorConstants1.packedValues[15u].y, productValue33) * fragmentVectorConstants1.packedValues[31u].y;
    precise float multiplyAddValue19 = fma(sampledTextureValue6.z, fragmentVectorConstants1.packedValues[15u].z, productValue34) * fragmentVectorConstants1.packedValues[31u].z;
    float multiplyAddValue20 = fma(multiplyAddValue17, multiplyAddValue17, intermediateValue20);
    float multiplyAddValue21 = fma(multiplyAddValue18, multiplyAddValue18, intermediateValue19);
    float multiplyAddValue22 = fma(multiplyAddValue19, multiplyAddValue19, intermediateValue18);
    precise float sumValue12 = varyingColor2.x - multiplyAddValue20;
    precise float sumValue13 = varyingColor2.y - multiplyAddValue21;
    precise float sumValue14 = varyingColor2.z - multiplyAddValue22;
    fragmentColor0.x = fma(varyingColor2.w, sumValue12, multiplyAddValue20);
    fragmentColor0.y = fma(varyingColor2.w, sumValue13, multiplyAddValue21);
    fragmentColor0.z = fma(varyingColor2.w, sumValue14, multiplyAddValue22);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[64u];
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uint scalarValue6 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue18;
    float intermediateValue19;
    float intermediateValue20;
    intermediateValue18 = sampledTextureValue4.z;
    intermediateValue19 = sampledTextureValue4.y;
    intermediateValue20 = sampledTextureValue4.x;
    float multiplyAddValue4;
    float multiplyAddValue5;
    float multiplyAddValue6;
    uint sumValue5;
    uint scalarValue7 = 0u;
    for (;;)
    {
        if (int(scalarValue6) <= int(scalarValue7))
        {
            break;
        }
        uint sumValue4 = scalarValue7 + 24u;
        vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue6 = scalarValue7 + 17u;
        precise float bitwiseValue1 = sampledTextureValue5.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue7) + 272u) + 12u) >> 2u];
        multiplyAddValue6 = fma(bitwiseValue1, fma(sampledTextureValue5.x, fragmentVectorConstants1.packedValues[sumValue6].x, -intermediateValue20), intermediateValue20);
        multiplyAddValue5 = fma(bitwiseValue1, fma(sampledTextureValue5.y, fragmentVectorConstants1.packedValues[sumValue6].y, -intermediateValue19), intermediateValue19);
        multiplyAddValue4 = fma(bitwiseValue1, fma(sampledTextureValue5.z, fragmentVectorConstants1.packedValues[sumValue6].z, -intermediateValue18), intermediateValue18);
        sumValue5 = scalarValue7 + 1u;
        intermediateValue18 = multiplyAddValue4;
        intermediateValue19 = multiplyAddValue5;
        intermediateValue20 = multiplyAddValue6;
        scalarValue7 = sumValue5;
        continue;
    }
    precise float productValue46 = intermediateValue20 * varyingColor3.x;
    precise float productValue47 = intermediateValue19 * varyingColor3.y;
    precise float productValue48 = intermediateValue18 * varyingColor3.z;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    precise float productValue32 = sampledTextureValue7.x * fragmentVectorConstants1.packedValues[15u].x;
    precise float productValue33 = sampledTextureValue7.y * fragmentVectorConstants1.packedValues[15u].y;
    precise float productValue34 = sampledTextureValue7.z * fragmentVectorConstants1.packedValues[15u].z;
    precise float multiplyAddValue17 = fma(sampledTextureValue6.x, fragmentVectorConstants1.packedValues[15u].x, productValue32) * fragmentVectorConstants1.packedValues[31u].x;
    precise float multiplyAddValue18 = fma(sampledTextureValue6.y, fragmentVectorConstants1.packedValues[15u].y, productValue33) * fragmentVectorConstants1.packedValues[31u].y;
    precise float multiplyAddValue19 = fma(sampledTextureValue6.z, fragmentVectorConstants1.packedValues[15u].z, productValue34) * fragmentVectorConstants1.packedValues[31u].z;
    float multiplyAddValue23 = fma(multiplyAddValue17, multiplyAddValue17, productValue46);
    float multiplyAddValue24 = fma(multiplyAddValue18, multiplyAddValue18, productValue47);
    float multiplyAddValue25 = fma(multiplyAddValue19, multiplyAddValue19, productValue48);
    precise float sumValue15 = varyingColor2.x - multiplyAddValue23;
    precise float sumValue16 = varyingColor2.y - multiplyAddValue24;
    precise float sumValue17 = varyingColor2.z - multiplyAddValue25;
    fragmentColor0.x = fma(varyingColor2.w, sumValue15, multiplyAddValue23);
    fragmentColor0.y = fma(varyingColor2.w, sumValue16, multiplyAddValue24);
    fragmentColor0.z = fma(varyingColor2.w, sumValue17, multiplyAddValue25);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[64u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits10 = uintBitsToFloat(reinterpretedBits9.x);
    float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits12 = uintBitsToFloat(reinterpretedBits9.z);
    precise float productValue68 = sampledTextureValue7.x * reinterpretedBits10;
    precise float productValue69 = sampledTextureValue7.y * reinterpretedBits11;
    precise float productValue70 = sampledTextureValue7.z * reinterpretedBits12;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    precise float multiplyAddValue41 = fma(sampledTextureValue6.x, reinterpretedBits10, productValue68) * uintBitsToFloat(reinterpretedBits13.x);
    precise float multiplyAddValue42 = fma(sampledTextureValue6.y, reinterpretedBits11, productValue69) * uintBitsToFloat(reinterpretedBits13.y);
    precise float multiplyAddValue43 = fma(sampledTextureValue6.z, reinterpretedBits12, productValue70) * uintBitsToFloat(reinterpretedBits13.z);
    float multiplyAddValue44 = fma(multiplyAddValue41, multiplyAddValue41, sampledTextureValue4.x);
    float multiplyAddValue45 = fma(multiplyAddValue42, multiplyAddValue42, sampledTextureValue4.y);
    float multiplyAddValue46 = fma(multiplyAddValue43, multiplyAddValue43, sampledTextureValue4.z);
    precise float reinterpretedBits18 = scalarValue15 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
    fragmentColor0.w = reinterpretedBits18;
    precise float sumValue19 = varyingColor2.x - multiplyAddValue44;
    precise float sumValue20 = varyingColor2.y - multiplyAddValue45;
    precise float sumValue21 = varyingColor2.z - multiplyAddValue46;
    fragmentColor0.x = fma(varyingColor2.w, sumValue19, multiplyAddValue44);
    fragmentColor0.y = fma(varyingColor2.w, sumValue20, multiplyAddValue45);
    fragmentColor0.z = fma(varyingColor2.w, sumValue21, multiplyAddValue46);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue74 = sampledTextureValue4.x * varyingColor3.x;
    precise float productValue75 = sampledTextureValue4.y * varyingColor3.y;
    precise float productValue76 = sampledTextureValue4.z * varyingColor3.z;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits10 = uintBitsToFloat(reinterpretedBits9.x);
    float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits12 = uintBitsToFloat(reinterpretedBits9.z);
    precise float productValue68 = sampledTextureValue7.x * reinterpretedBits10;
    precise float productValue69 = sampledTextureValue7.y * reinterpretedBits11;
    precise float productValue70 = sampledTextureValue7.z * reinterpretedBits12;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    precise float multiplyAddValue41 = fma(sampledTextureValue6.x, reinterpretedBits10, productValue68) * uintBitsToFloat(reinterpretedBits13.x);
    precise float multiplyAddValue42 = fma(sampledTextureValue6.y, reinterpretedBits11, productValue69) * uintBitsToFloat(reinterpretedBits13.y);
    precise float multiplyAddValue43 = fma(sampledTextureValue6.z, reinterpretedBits12, productValue70) * uintBitsToFloat(reinterpretedBits13.z);
    float multiplyAddValue50 = fma(multiplyAddValue41, multiplyAddValue41, productValue74);
    float multiplyAddValue51 = fma(multiplyAddValue42, multiplyAddValue42, productValue75);
    float multiplyAddValue52 = fma(multiplyAddValue43, multiplyAddValue43, productValue76);
    precise float reinterpretedBits18 = scalarValue15 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
    fragmentColor0.w = reinterpretedBits18;
    precise float sumValue22 = varyingColor2.x - multiplyAddValue50;
    precise float sumValue23 = varyingColor2.y - multiplyAddValue51;
    precise float sumValue24 = varyingColor2.z - multiplyAddValue52;
    fragmentColor0.x = fma(varyingColor2.w, sumValue22, multiplyAddValue50);
    fragmentColor0.y = fma(varyingColor2.w, sumValue23, multiplyAddValue51);
    fragmentColor0.z = fma(varyingColor2.w, sumValue24, multiplyAddValue52);
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue6 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    intermediateValue14 = sampledTextureValue4.z;
    intermediateValue15 = sampledTextureValue4.y;
    intermediateValue16 = sampledTextureValue4.x;
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    uint sumValue;
    uint scalarValue7 = 0u;
    for (;;)
    {
        if (int(scalarValue6) <= int(scalarValue7))
        {
            break;
        }
        uint sumValue4 = scalarValue7 + 24u;
        vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue6 = scalarValue7 + 17u;
        float bitwiseValue = sampledTextureValue5.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue7) + 272u) + 12u) >> 2u];
        multiplyAddValue4 = fma(bitwiseValue, fma(sampledTextureValue5.x, fragmentVectorConstants1.packedValues[sumValue6].x, -intermediateValue16), intermediateValue16);
        multiplyAddValue3 = fma(bitwiseValue, fma(sampledTextureValue5.y, fragmentVectorConstants1.packedValues[sumValue6].y, -intermediateValue15), intermediateValue15);
        multiplyAddValue2 = fma(bitwiseValue, fma(sampledTextureValue5.z, fragmentVectorConstants1.packedValues[sumValue6].z, -intermediateValue14), intermediateValue14);
        sumValue = scalarValue7 + 1u;
        intermediateValue14 = multiplyAddValue2;
        intermediateValue15 = multiplyAddValue3;
        intermediateValue16 = multiplyAddValue4;
        scalarValue7 = sumValue;
        continue;
    }
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float multiplyAddValue7 = fma(sampledTextureValue6.x, fragmentVectorConstants1.packedValues[15u].x, sampledTextureValue7.x * fragmentVectorConstants1.packedValues[15u].x) * fragmentVectorConstants1.packedValues[31u].x;
    float multiplyAddValue8 = fma(sampledTextureValue6.y, fragmentVectorConstants1.packedValues[15u].y, sampledTextureValue7.y * fragmentVectorConstants1.packedValues[15u].y) * fragmentVectorConstants1.packedValues[31u].y;
    float multiplyAddValue9 = fma(sampledTextureValue6.z, fragmentVectorConstants1.packedValues[15u].z, sampledTextureValue7.z * fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[31u].z;
    float multiplyAddValue10 = fma(multiplyAddValue7, multiplyAddValue7, intermediateValue16);
    float multiplyAddValue11 = fma(multiplyAddValue8, multiplyAddValue8, intermediateValue15);
    float multiplyAddValue12 = fma(multiplyAddValue9, multiplyAddValue9, intermediateValue14);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue10, multiplyAddValue10);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue11, multiplyAddValue11);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue12, multiplyAddValue12);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[64u];
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue6 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    intermediateValue14 = sampledTextureValue4.z;
    intermediateValue15 = sampledTextureValue4.y;
    intermediateValue16 = sampledTextureValue4.x;
    float multiplyAddValue2;
    float multiplyAddValue3;
    float multiplyAddValue4;
    uint sumValue;
    uint scalarValue7 = 0u;
    for (;;)
    {
        if (int(scalarValue6) <= int(scalarValue7))
        {
            break;
        }
        uint sumValue4 = scalarValue7 + 24u;
        vec4 sampledTextureValue5 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue6 = scalarValue7 + 17u;
        float bitwiseValue = sampledTextureValue5.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue7) + 272u) + 12u) >> 2u];
        multiplyAddValue4 = fma(bitwiseValue, fma(sampledTextureValue5.x, fragmentVectorConstants1.packedValues[sumValue6].x, -intermediateValue16), intermediateValue16);
        multiplyAddValue3 = fma(bitwiseValue, fma(sampledTextureValue5.y, fragmentVectorConstants1.packedValues[sumValue6].y, -intermediateValue15), intermediateValue15);
        multiplyAddValue2 = fma(bitwiseValue, fma(sampledTextureValue5.z, fragmentVectorConstants1.packedValues[sumValue6].z, -intermediateValue14), intermediateValue14);
        sumValue = scalarValue7 + 1u;
        intermediateValue14 = multiplyAddValue2;
        intermediateValue15 = multiplyAddValue3;
        intermediateValue16 = multiplyAddValue4;
        scalarValue7 = sumValue;
        continue;
    }
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float multiplyAddValue7 = fma(sampledTextureValue6.x, fragmentVectorConstants1.packedValues[15u].x, sampledTextureValue7.x * fragmentVectorConstants1.packedValues[15u].x) * fragmentVectorConstants1.packedValues[31u].x;
    float multiplyAddValue8 = fma(sampledTextureValue6.y, fragmentVectorConstants1.packedValues[15u].y, sampledTextureValue7.y * fragmentVectorConstants1.packedValues[15u].y) * fragmentVectorConstants1.packedValues[31u].y;
    float multiplyAddValue9 = fma(sampledTextureValue6.z, fragmentVectorConstants1.packedValues[15u].z, sampledTextureValue7.z * fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[31u].z;
    float multiplyAddValue26 = fma(multiplyAddValue7, multiplyAddValue7, intermediateValue16 * varyingColor3.x);
    float multiplyAddValue27 = fma(multiplyAddValue8, multiplyAddValue8, intermediateValue15 * varyingColor3.y);
    float multiplyAddValue28 = fma(multiplyAddValue9, multiplyAddValue9, intermediateValue14 * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue26, multiplyAddValue26);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue27, multiplyAddValue27);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue28, multiplyAddValue28);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[64u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits10 = uintBitsToFloat(reinterpretedBits9.x);
    float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits12 = uintBitsToFloat(reinterpretedBits9.z);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue31 = fma(sampledTextureValue6.x, reinterpretedBits10, sampledTextureValue7.x * reinterpretedBits10) * uintBitsToFloat(reinterpretedBits13.x);
    float multiplyAddValue32 = fma(sampledTextureValue6.y, reinterpretedBits11, sampledTextureValue7.y * reinterpretedBits11) * uintBitsToFloat(reinterpretedBits13.y);
    float multiplyAddValue33 = fma(sampledTextureValue6.z, reinterpretedBits12, sampledTextureValue7.z * reinterpretedBits12) * uintBitsToFloat(reinterpretedBits13.z);
    float multiplyAddValue34 = fma(multiplyAddValue31, multiplyAddValue31, sampledTextureValue4.x);
    float multiplyAddValue35 = fma(multiplyAddValue32, multiplyAddValue32, sampledTextureValue4.y);
    float multiplyAddValue36 = fma(multiplyAddValue33, multiplyAddValue33, sampledTextureValue4.z);
    fragmentColor0.w = scalarValue15 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue34, multiplyAddValue34);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue35, multiplyAddValue35);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue36, multiplyAddValue36);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits10 = uintBitsToFloat(reinterpretedBits9.x);
    float reinterpretedBits11 = uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits12 = uintBitsToFloat(reinterpretedBits9.z);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue31 = fma(sampledTextureValue6.x, reinterpretedBits10, sampledTextureValue7.x * reinterpretedBits10) * uintBitsToFloat(reinterpretedBits13.x);
    float multiplyAddValue32 = fma(sampledTextureValue6.y, reinterpretedBits11, sampledTextureValue7.y * reinterpretedBits11) * uintBitsToFloat(reinterpretedBits13.y);
    float multiplyAddValue33 = fma(sampledTextureValue6.z, reinterpretedBits12, sampledTextureValue7.z * reinterpretedBits12) * uintBitsToFloat(reinterpretedBits13.z);
    float multiplyAddValue47 = fma(multiplyAddValue31, multiplyAddValue31, sampledTextureValue4.x * varyingColor3.x);
    float multiplyAddValue48 = fma(multiplyAddValue32, multiplyAddValue32, sampledTextureValue4.y * varyingColor3.y);
    float multiplyAddValue49 = fma(multiplyAddValue33, multiplyAddValue33, sampledTextureValue4.z * varyingColor3.z);
    fragmentColor0.w = scalarValue15 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue47, multiplyAddValue47);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue48, multiplyAddValue48);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue49, multiplyAddValue49);
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (int(uint(int(fragmentVectorConstants1.packedValues[4u].x))) > int(0u))
    {
        uint intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        intermediateValue7 = 0u;
        intermediateValue8 = scalarValue;
        intermediateValue9 = scalarValue1;
        intermediateValue10 = scalarValue2;
        float productValue2;
        float productValue3;
        float productValue4;
        for (;;)
        {
            uint sumValue1 = intermediateValue7 + 24u;
            uint sumValue2 = intermediateValue7 + 17u;
            vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue1].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue1].x, (fragmentVectorConstants1.packedValues[sumValue1].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue1].y));
            float productValue5 = sampledTextureValue1.w * fragmentVectorConstants1.packedValues[sumValue2].w;
            productValue2 = (((sampledTextureValue1.x * fragmentVectorConstants1.packedValues[sumValue2].x) - intermediateValue8) * productValue5) + intermediateValue8;
            productValue3 = (((sampledTextureValue1.y * fragmentVectorConstants1.packedValues[sumValue2].y) - intermediateValue9) * productValue5) + intermediateValue9;
            productValue4 = (((sampledTextureValue1.z * fragmentVectorConstants1.packedValues[sumValue2].z) - intermediateValue10) * productValue5) + intermediateValue10;
            uint sumValue3 = intermediateValue7 + 1u;
            if (int(sumValue3) < int(uint(int(fragmentVectorConstants1.packedValues[4u].x))))
            {
                intermediateValue7 = sumValue3;
                intermediateValue8 = productValue2;
                intermediateValue9 = productValue3;
                intermediateValue10 = productValue4;
            }
            else
            {
                break;
            }
        }
        intermediateValue4 = productValue2;
        intermediateValue5 = productValue3;
        intermediateValue6 = productValue4;
    }
    else
    {
        intermediateValue4 = scalarValue;
        intermediateValue5 = scalarValue1;
        intermediateValue6 = scalarValue2;
    }
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float productValue6 = (fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[31u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue7 = (fragmentVectorConstants1.packedValues[15u].y * fragmentVectorConstants1.packedValues[31u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue8 = (fragmentVectorConstants1.packedValues[15u].z * fragmentVectorConstants1.packedValues[31u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float productValue9 = (productValue6 * productValue6) + intermediateValue4;
    float productValue10 = (productValue7 * productValue7) + intermediateValue5;
    float productValue11 = (productValue8 * productValue8) + intermediateValue6;
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[16u].x;
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if (int(uint(int(fragmentVectorConstants1.packedValues[4u].x))) > int(0u))
    {
        uint intermediateValue7;
        float intermediateValue8;
        float intermediateValue9;
        float intermediateValue10;
        intermediateValue7 = 0u;
        intermediateValue8 = scalarValue;
        intermediateValue9 = scalarValue1;
        intermediateValue10 = scalarValue2;
        float productValue2;
        float productValue3;
        float productValue4;
        for (;;)
        {
            uint sumValue1 = intermediateValue7 + 24u;
            uint sumValue2 = intermediateValue7 + 17u;
            vec4 sampledTextureValue1 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2((fragmentVectorConstants1.packedValues[sumValue1].z * varyingTexCoord0.x) + fragmentVectorConstants1.packedValues[sumValue1].x, (fragmentVectorConstants1.packedValues[sumValue1].w * varyingTexCoord0.y) + fragmentVectorConstants1.packedValues[sumValue1].y));
            float productValue5 = sampledTextureValue1.w * fragmentVectorConstants1.packedValues[sumValue2].w;
            productValue2 = (((sampledTextureValue1.x * fragmentVectorConstants1.packedValues[sumValue2].x) - intermediateValue8) * productValue5) + intermediateValue8;
            productValue3 = (((sampledTextureValue1.y * fragmentVectorConstants1.packedValues[sumValue2].y) - intermediateValue9) * productValue5) + intermediateValue9;
            productValue4 = (((sampledTextureValue1.z * fragmentVectorConstants1.packedValues[sumValue2].z) - intermediateValue10) * productValue5) + intermediateValue10;
            uint sumValue3 = intermediateValue7 + 1u;
            if (int(sumValue3) < int(uint(int(fragmentVectorConstants1.packedValues[4u].x))))
            {
                intermediateValue7 = sumValue3;
                intermediateValue8 = productValue2;
                intermediateValue9 = productValue3;
                intermediateValue10 = productValue4;
            }
            else
            {
                break;
            }
        }
        intermediateValue4 = productValue2;
        intermediateValue5 = productValue3;
        intermediateValue6 = productValue4;
    }
    else
    {
        intermediateValue4 = scalarValue;
        intermediateValue5 = scalarValue1;
        intermediateValue6 = scalarValue2;
    }
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float productValue6 = (fragmentVectorConstants1.packedValues[15u].x * fragmentVectorConstants1.packedValues[31u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue7 = (fragmentVectorConstants1.packedValues[15u].y * fragmentVectorConstants1.packedValues[31u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue8 = (fragmentVectorConstants1.packedValues[15u].z * fragmentVectorConstants1.packedValues[31u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float productValue35 = (productValue6 * productValue6) + (intermediateValue4 * varyingColor3.x);
    float productValue36 = (productValue7 * productValue7) + (intermediateValue5 * varyingColor3.y);
    float productValue37 = (productValue8 * productValue8) + (intermediateValue6 * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue35) * varyingColor2.w) + productValue35;
    fragmentColor0.y = ((varyingColor2.y - productValue36) * varyingColor2.w) + productValue36;
    fragmentColor0.z = ((varyingColor2.z - productValue37) * varyingColor2.w) + productValue37;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[16u].x;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float productValue40 = (fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[16u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue41 = (fragmentVectorConstants1.packedValues[14u].y * fragmentVectorConstants1.packedValues[16u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue42 = (fragmentVectorConstants1.packedValues[14u].z * fragmentVectorConstants1.packedValues[16u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float productValue43 = (productValue40 * productValue40) + sampledTextureValue.x;
    float productValue44 = (productValue41 * productValue41) + sampledTextureValue.y;
    float productValue45 = (productValue42 * productValue42) + sampledTextureValue.z;
    fragmentColor0.x = ((varyingColor2.x - productValue43) * varyingColor2.w) + productValue43;
    fragmentColor0.y = ((varyingColor2.y - productValue44) * varyingColor2.w) + productValue44;
    fragmentColor0.z = ((varyingColor2.z - productValue45) * varyingColor2.w) + productValue45;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[15u].x * scalarValue13;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.x), fract(varyingTexCoord1.y)));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord1.z), fract(varyingTexCoord1.w)));
    float productValue40 = (fragmentVectorConstants1.packedValues[14u].x * fragmentVectorConstants1.packedValues[16u].x) * (sampledTextureValue3.x + sampledTextureValue2.x);
    float productValue41 = (fragmentVectorConstants1.packedValues[14u].y * fragmentVectorConstants1.packedValues[16u].y) * (sampledTextureValue3.y + sampledTextureValue2.y);
    float productValue42 = (fragmentVectorConstants1.packedValues[14u].z * fragmentVectorConstants1.packedValues[16u].z) * (sampledTextureValue3.z + sampledTextureValue2.z);
    float productValue71 = (productValue40 * productValue40) + (sampledTextureValue.x * varyingColor3.x);
    float productValue72 = (productValue41 * productValue41) + (sampledTextureValue.y * varyingColor3.y);
    float productValue73 = (productValue42 * productValue42) + (sampledTextureValue.z * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue71) * varyingColor2.w) + productValue71;
    fragmentColor0.y = ((varyingColor2.y - productValue72) * varyingColor2.w) + productValue72;
    fragmentColor0.z = ((varyingColor2.z - productValue73) * varyingColor2.w) + productValue73;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[15u].x * scalarValue13;
#endif
    discardIfRequested();
}
