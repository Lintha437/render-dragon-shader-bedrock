#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPattern / AlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ActorPattern/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue4);
    precise float productValue9 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[2u];
    precise float productValue10 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u];
    precise float productValue11 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u];
    precise float sumValue7 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue8 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue9 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float scalarValue8 = rdDot3Precise(vec3(-productValue9, -productValue10, -productValue11), vec3(sumValue7, sumValue8, sumValue9));
    precise float sumValue10 = fragmentScalarConstants1.packedValues[41u] - fragmentScalarConstants1.packedValues[40u];
    precise float sumValue11 = scalarValue8 - fragmentScalarConstants1.packedValues[40u];
    precise float quotientValue3 = 1.0 / sumValue10;
    precise float productValue12 = quotientValue3 * sumValue11;
    float scalarValue9 = spvNClamp(productValue12, 0.0, 1.0);
    precise float productValue13 = scalarValue9 * scalarValue9;
    precise float multiplyAddValue7 = productValue13 * fma(scalarValue9, -2.0, 3.0);
    precise float quotientValue4 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue5 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue8 = fma(quotientValue4, 0.5, 0.5) * fragmentVectorConstants1.packedValues[13u].x;
    precise float multiplyAddValue9 = fma(quotientValue5, 0.5, 0.5) * fragmentVectorConstants1.packedValues[13u].y;
    precise float quotientValue6 = multiplyAddValue8 / fragmentScalarConstants1.packedValues[42u];
    precise float quotientValue7 = multiplyAddValue9 / fragmentScalarConstants1.packedValues[42u];
    precise float productValue14 = floor(quotientValue6) * fragmentScalarConstants1.packedValues[42u];
    precise float productValue15 = floor(quotientValue7) * fragmentScalarConstants1.packedValues[42u];
    precise float productValue16 = productValue14 * 0.25;
    precise float productValue17 = productValue15 * 0.25;
    precise float productValue18 = productValue14 * 0.5;
    precise float productValue19 = productValue15 * 0.5;
    float scalarValue10 = floor(productValue17);
    float scalarValue11 = floor(productValue19);
    precise float productValue20 = scalarValue10 * scalarValue10;
    precise float productValue21 = scalarValue11 * scalarValue11;
    precise float productValue22 = productValue20 * 0.75;
    precise float productValue23 = productValue21 * 0.75;
    float scalarValue12 = floor(productValue15);
    precise float productValue24 = scalarValue12 * scalarValue12;
    precise float productValue25 = productValue24 * 0.75;
    precise float multiplyAddValue10 = fma(fma(fma(fract(fma(floor(productValue16), 0.5, productValue22)), 0.25, fract(fma(floor(productValue18), 0.5, productValue23))), 0.25, fract(fma(floor(productValue14), 0.5, productValue25))), 64.0, 0.5) * 0.015625;
    if ((sampledTextureValue2.w < fragmentScalarConstants1.packedValues[36u]) || ((fragmentScalarConstants1.packedValues[56u] != 0.0) && (multiplyAddValue10 >= multiplyAddValue7)))
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue2.x;
    float scalarValue16 = sampledTextureValue2.y;
    float scalarValue17 = sampledTextureValue2.z;
    float scalarValue18 = sampledTextureValue2.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue1 = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue19 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue2 = inversesqrt(scalarValue19);
    precise float productValue36 = inverseLengthValue2 * reinterpretedBits;
    precise float productValue37 = inverseLengthValue2 * reinterpretedBits1;
    precise float productValue38 = inverseLengthValue2 * reinterpretedBits2;
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits9 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x);
    precise float reinterpretedBits10 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y);
    precise float reinterpretedBits11 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z);
    float scalarValue21 = rdDot3Precise(vec3(-productValue36, -productValue37, -productValue38), vec3(reinterpretedBits9, reinterpretedBits10, reinterpretedBits11));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    precise float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[37u])) - reinterpretedBits5;
    precise float sumValue15 = scalarValue21 - reinterpretedBits5;
    precise float quotientValue10 = 1.0 / reinterpretedBits12;
    precise float productValue39 = quotientValue10 * sumValue15;
    float scalarValue22 = spvNClamp(productValue39, 0.0, 1.0);
    precise float productValue40 = scalarValue22 * scalarValue22;
    precise float multiplyAddValue13 = productValue40 * fma(scalarValue22, -2.0, 3.0);
    precise float quotientValue4 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue5 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float multiplyAddValue14 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x);
    precise float multiplyAddValue15 = fma(quotientValue5, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[38u]));
    precise float quotientValue11 = multiplyAddValue14 / reinterpretedBits8;
    precise float quotientValue12 = multiplyAddValue15 / reinterpretedBits8;
    precise float productValue41 = floor(quotientValue11) * reinterpretedBits8;
    precise float productValue42 = floor(quotientValue12) * reinterpretedBits8;
    precise float productValue43 = productValue41 * 0.25;
    precise float productValue44 = productValue42 * 0.25;
    precise float productValue45 = productValue41 * 0.5;
    precise float productValue46 = productValue42 * 0.5;
    float scalarValue23 = floor(productValue44);
    float scalarValue24 = floor(productValue46);
    precise float productValue47 = scalarValue23 * scalarValue23;
    precise float productValue48 = scalarValue24 * scalarValue24;
    precise float productValue49 = productValue47 * 0.75;
    precise float productValue50 = productValue48 * 0.75;
    float scalarValue25 = floor(productValue42);
    precise float productValue51 = scalarValue25 * scalarValue25;
    precise float productValue52 = productValue51 * 0.75;
    precise float multiplyAddValue16 = fma(fma(fma(fract(fma(floor(productValue43), 0.5, productValue49)), 0.25, fract(fma(floor(productValue45), 0.5, productValue50))), 0.25, fract(fma(floor(productValue41), 0.5, productValue52))), 64.0, 0.5) * 0.015625;
    if ((scalarValue18 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) != 0.0) && (multiplyAddValue16 >= multiplyAddValue13)))
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue4);
    float productValue6 = rdDot3Precise(vec3(-(inverseLengthValue1 * fragmentScalarConstants1.packedValues[2u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z));
    float quotientValue2 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[41u] - fragmentScalarConstants1.packedValues[40u])) * (productValue6 - fragmentScalarConstants1.packedValues[40u]), 0.0, 1.0);
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[13u].x) / fragmentScalarConstants1.packedValues[42u]) * fragmentScalarConstants1.packedValues[42u];
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[13u].y) / fragmentScalarConstants1.packedValues[42u]) * fragmentScalarConstants1.packedValues[42u];
    float productValue7 = floor(multiplyAddValue1 * 0.25);
    float productValue8 = floor(multiplyAddValue1 * 0.5);
    float scalarValue5 = floor(multiplyAddValue1);
    if ((sampledTextureValue2.w < fragmentScalarConstants1.packedValues[36u]) || ((fragmentScalarConstants1.packedValues[56u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue7 * productValue7) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue8 * productValue8) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue5 * scalarValue5) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue2 * quotientValue2) * fma(quotientValue2, -2.0, 3.0)))))
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[2u], fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u]);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue4);
    float productValue6 = rdDot3Precise(vec3(-(inverseLengthValue1 * fragmentScalarConstants1.packedValues[2u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z));
    float quotientValue2 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[41u] - fragmentScalarConstants1.packedValues[40u])) * (productValue6 - fragmentScalarConstants1.packedValues[40u]), 0.0, 1.0);
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[13u].x) / fragmentScalarConstants1.packedValues[42u]) * fragmentScalarConstants1.packedValues[42u];
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[13u].y) / fragmentScalarConstants1.packedValues[42u]) * fragmentScalarConstants1.packedValues[42u];
    float productValue7 = floor(multiplyAddValue1 * 0.25);
    float productValue8 = floor(multiplyAddValue1 * 0.5);
    float scalarValue5 = floor(multiplyAddValue1);
    if (((fragmentScalarConstants1.packedValues[56u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue7 * productValue7) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue8 * productValue8) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue5 * scalarValue5) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue2 * quotientValue2) * fma(quotientValue2, -2.0, 3.0)))) || (sampledTextureValue2.w < fragmentScalarConstants1.packedValues[36u]))
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue15 = sampledTextureValue2.x;
    float scalarValue16 = sampledTextureValue2.y;
    float scalarValue17 = sampledTextureValue2.z;
    float scalarValue18 = sampledTextureValue2.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue1 = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue19 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue2 = inversesqrt(scalarValue19);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits4 = rdDot3Precise(vec3(-(inverseLengthValue2 * reinterpretedBits), -(inverseLengthValue2 * reinterpretedBits1), -(inverseLengthValue2 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    float reinterpretedBits6 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[37u])) - reinterpretedBits5)) * (reinterpretedBits4 - reinterpretedBits5), 0.0, 1.0);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[38u]));
    float multiplyAddValue11 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.x)) / reinterpretedBits8) * reinterpretedBits8;
    float multiplyAddValue12 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits7.y)) / reinterpretedBits8) * reinterpretedBits8;
    float productValue34 = floor(multiplyAddValue12 * 0.25);
    float productValue35 = floor(multiplyAddValue12 * 0.5);
    float scalarValue20 = floor(multiplyAddValue12);
    if ((scalarValue18 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[32u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue11 * 0.25), 0.5, (productValue34 * productValue34) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue11 * 0.5), 0.5, (productValue35 * productValue35) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue11), 0.5, (scalarValue20 * scalarValue20) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits6 * reinterpretedBits6) * fma(reinterpretedBits6, -2.0, 3.0)))))
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
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue13 = sampledTextureValue.w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[13u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[9u].x) / (fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[9u].x), 0.0, 1.0);
        float quotientValue8 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[12u].x) / fragmentVectorConstants1.packedValues[9u].z) * fragmentVectorConstants1.packedValues[9u].z;
        float quotientValue9 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[12u].y) / fragmentVectorConstants1.packedValues[9u].z) * fragmentVectorConstants1.packedValues[9u].z;
        float productValue29 = floor(quotientValue9 * 0.25);
        float productValue30 = floor(quotientValue9 * 0.5);
        float scalarValue14 = floor(quotientValue9);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue30 * productValue30) * 0.75) + (floor(quotientValue8 * 0.5) * 0.5)) + (fract(((productValue29 * productValue29) * 0.75) + (floor(quotientValue8 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue14 * scalarValue14) * 0.75) + (floor(quotientValue8) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((scalarValue13 < fragmentVectorConstants1.packedValues[8u].x) || comparisonValue)
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue.w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[13u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[9u].x) / (fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[9u].x), 0.0, 1.0);
        float quotientValue8 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[12u].x) / fragmentVectorConstants1.packedValues[9u].z) * fragmentVectorConstants1.packedValues[9u].z;
        float quotientValue9 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[12u].y) / fragmentVectorConstants1.packedValues[9u].z) * fragmentVectorConstants1.packedValues[9u].z;
        float productValue29 = floor(quotientValue9 * 0.25);
        float productValue30 = floor(quotientValue9 * 0.5);
        float scalarValue14 = floor(quotientValue9);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue30 * productValue30) * 0.75) + (floor(quotientValue8 * 0.5) * 0.5)) + (fract(((productValue29 * productValue29) * 0.75) + (floor(quotientValue8 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue14 * scalarValue14) * 0.75) + (floor(quotientValue8) * 0.5)));
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
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    intermediateValue16 = sampledTextureValue2.z;
    intermediateValue17 = sampledTextureValue2.y;
    intermediateValue18 = sampledTextureValue2.x;
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
        uint sumValue4 = scalarValue7 + 23u;
        vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue6 = scalarValue7 + 16u;
        precise float bitwiseValue1 = sampledTextureValue3.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue7) + 256u) + 12u) >> 2u];
        multiplyAddValue6 = fma(bitwiseValue1, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[sumValue6].x, -intermediateValue18), intermediateValue18);
        multiplyAddValue5 = fma(bitwiseValue1, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[sumValue6].y, -intermediateValue17), intermediateValue17);
        multiplyAddValue4 = fma(bitwiseValue1, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[sumValue6].z, -intermediateValue16), intermediateValue16);
        sumValue5 = scalarValue7 + 1u;
        intermediateValue16 = multiplyAddValue4;
        intermediateValue17 = multiplyAddValue5;
        intermediateValue18 = multiplyAddValue6;
        scalarValue7 = sumValue5;
        continue;
    }
    precise float sumValue12 = varyingColor2.x - intermediateValue18;
    precise float sumValue13 = varyingColor2.y - intermediateValue17;
    precise float sumValue14 = varyingColor2.z - intermediateValue16;
    fragmentColor0.x = fma(varyingColor2.w, sumValue12, intermediateValue18);
    fragmentColor0.y = fma(varyingColor2.w, sumValue13, intermediateValue17);
    fragmentColor0.z = fma(varyingColor2.w, sumValue14, intermediateValue16);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[60u];
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uint scalarValue6 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    intermediateValue16 = sampledTextureValue2.z;
    intermediateValue17 = sampledTextureValue2.y;
    intermediateValue18 = sampledTextureValue2.x;
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
        uint sumValue4 = scalarValue7 + 23u;
        vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue6 = scalarValue7 + 16u;
        precise float bitwiseValue1 = sampledTextureValue3.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue7) + 256u) + 12u) >> 2u];
        multiplyAddValue6 = fma(bitwiseValue1, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[sumValue6].x, -intermediateValue18), intermediateValue18);
        multiplyAddValue5 = fma(bitwiseValue1, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[sumValue6].y, -intermediateValue17), intermediateValue17);
        multiplyAddValue4 = fma(bitwiseValue1, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[sumValue6].z, -intermediateValue16), intermediateValue16);
        sumValue5 = scalarValue7 + 1u;
        intermediateValue16 = multiplyAddValue4;
        intermediateValue17 = multiplyAddValue5;
        intermediateValue18 = multiplyAddValue6;
        scalarValue7 = sumValue5;
        continue;
    }
    precise float productValue31 = intermediateValue18 * varyingColor3.x;
    precise float productValue32 = intermediateValue17 * varyingColor3.y;
    precise float productValue33 = intermediateValue16 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-intermediateValue18, varyingColor3.x, varyingColor2.x), productValue31);
    fragmentColor0.y = fma(varyingColor2.w, fma(-intermediateValue17, varyingColor3.y, varyingColor2.y), productValue32);
    fragmentColor0.z = fma(varyingColor2.w, fma(-intermediateValue16, varyingColor3.z, varyingColor2.z), productValue33);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[60u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float reinterpretedBits13 = scalarValue18 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    fragmentColor0.w = reinterpretedBits13;
    precise float sumValue16 = varyingColor2.x - scalarValue15;
    precise float sumValue17 = varyingColor2.y - scalarValue16;
    precise float sumValue18 = varyingColor2.z - scalarValue17;
    fragmentColor0.x = fma(varyingColor2.w, sumValue16, scalarValue15);
    fragmentColor0.y = fma(varyingColor2.w, sumValue17, scalarValue16);
    fragmentColor0.z = fma(varyingColor2.w, sumValue18, scalarValue17);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue56 = scalarValue15 * varyingColor3.x;
    precise float productValue57 = scalarValue16 * varyingColor3.y;
    precise float productValue58 = scalarValue17 * varyingColor3.z;
    precise float reinterpretedBits13 = scalarValue18 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    fragmentColor0.w = reinterpretedBits13;
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue15, varyingColor3.x, varyingColor2.x), productValue56);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue16, varyingColor3.y, varyingColor2.y), productValue57);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue17, varyingColor3.z, varyingColor2.z), productValue58);
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue6 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    intermediateValue12 = sampledTextureValue2.z;
    intermediateValue13 = sampledTextureValue2.y;
    intermediateValue14 = sampledTextureValue2.x;
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
        uint sumValue4 = scalarValue7 + 23u;
        vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue6 = scalarValue7 + 16u;
        float bitwiseValue = sampledTextureValue3.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue7) + 256u) + 12u) >> 2u];
        multiplyAddValue4 = fma(bitwiseValue, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[sumValue6].x, -intermediateValue14), intermediateValue14);
        multiplyAddValue3 = fma(bitwiseValue, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[sumValue6].y, -intermediateValue13), intermediateValue13);
        multiplyAddValue2 = fma(bitwiseValue, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[sumValue6].z, -intermediateValue12), intermediateValue12);
        sumValue = scalarValue7 + 1u;
        intermediateValue12 = multiplyAddValue2;
        intermediateValue13 = multiplyAddValue3;
        intermediateValue14 = multiplyAddValue4;
        scalarValue7 = sumValue;
        continue;
    }
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - intermediateValue14, intermediateValue14);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - intermediateValue13, intermediateValue13);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - intermediateValue12, intermediateValue12);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[60u];
#elif (RD_FEATURE_TINTING == RD_ON && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint scalarValue6 = uint(int(fragmentScalarConstants1.packedValues[16u]));
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    intermediateValue12 = sampledTextureValue2.z;
    intermediateValue13 = sampledTextureValue2.y;
    intermediateValue14 = sampledTextureValue2.x;
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
        uint sumValue4 = scalarValue7 + 23u;
        vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fma(fragmentVectorConstants1.packedValues[sumValue4].z, varyingTexCoord0.x, fragmentVectorConstants1.packedValues[sumValue4].x), fma(fragmentVectorConstants1.packedValues[sumValue4].w, varyingTexCoord0.y, fragmentVectorConstants1.packedValues[sumValue4].y)));
        uint sumValue6 = scalarValue7 + 16u;
        float bitwiseValue = sampledTextureValue3.w * fragmentScalarConstants1.packedValues[(((16u * scalarValue7) + 256u) + 12u) >> 2u];
        multiplyAddValue4 = fma(bitwiseValue, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[sumValue6].x, -intermediateValue14), intermediateValue14);
        multiplyAddValue3 = fma(bitwiseValue, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[sumValue6].y, -intermediateValue13), intermediateValue13);
        multiplyAddValue2 = fma(bitwiseValue, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[sumValue6].z, -intermediateValue12), intermediateValue12);
        sumValue = scalarValue7 + 1u;
        intermediateValue12 = multiplyAddValue2;
        intermediateValue13 = multiplyAddValue3;
        intermediateValue14 = multiplyAddValue4;
        scalarValue7 = sumValue;
        continue;
    }
    fragmentColor0.x = fma(varyingColor2.w, fma(-intermediateValue14, varyingColor3.x, varyingColor2.x), intermediateValue14 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-intermediateValue13, varyingColor3.y, varyingColor2.y), intermediateValue13 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-intermediateValue12, varyingColor3.z, varyingColor2.z), intermediateValue12 * varyingColor3.z);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[60u];
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.w = scalarValue18 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - scalarValue15, scalarValue15);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - scalarValue16, scalarValue16);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - scalarValue17, scalarValue17);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.w = scalarValue18 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    fragmentColor0.x = fma(varyingColor2.w, fma(-scalarValue15, varyingColor3.x, varyingColor2.x), scalarValue15 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-scalarValue16, varyingColor3.y, varyingColor2.y), scalarValue16 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-scalarValue17, varyingColor3.z, varyingColor2.z), scalarValue17 * varyingColor3.z);
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
            uint sumValue1 = intermediateValue7 + 23u;
            uint sumValue2 = intermediateValue7 + 16u;
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
    fragmentColor0.x = ((varyingColor2.x - intermediateValue4) * varyingColor2.w) + intermediateValue4;
    fragmentColor0.y = ((varyingColor2.y - intermediateValue5) * varyingColor2.w) + intermediateValue5;
    fragmentColor0.z = ((varyingColor2.z - intermediateValue6) * varyingColor2.w) + intermediateValue6;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[15u].x;
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
            uint sumValue1 = intermediateValue7 + 23u;
            uint sumValue2 = intermediateValue7 + 16u;
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
    float productValue26 = intermediateValue4 * varyingColor3.x;
    float productValue27 = intermediateValue5 * varyingColor3.y;
    float productValue28 = intermediateValue6 * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue26) * varyingColor2.w) + productValue26;
    fragmentColor0.y = ((varyingColor2.y - productValue27) * varyingColor2.w) + productValue27;
    fragmentColor0.z = ((varyingColor2.z - productValue28) * varyingColor2.w) + productValue28;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[15u].x;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - scalarValue) * varyingColor2.w) + scalarValue;
    fragmentColor0.y = ((varyingColor2.y - scalarValue1) * varyingColor2.w) + scalarValue1;
    fragmentColor0.z = ((varyingColor2.z - scalarValue2) * varyingColor2.w) + scalarValue2;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[14u].x * scalarValue13;
#elif (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_TINTING == RD_OFF && RD_FEATURE_UIENTITY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue53 = sampledTextureValue.x * varyingColor3.x;
    float productValue54 = sampledTextureValue.y * varyingColor3.y;
    float productValue55 = sampledTextureValue.z * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue53) * varyingColor2.w) + productValue53;
    fragmentColor0.y = ((varyingColor2.y - productValue54) * varyingColor2.w) + productValue54;
    fragmentColor0.z = ((varyingColor2.z - productValue55) * varyingColor2.w) + productValue55;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[14u].x * scalarValue13;
#endif
    discardIfRequested();
}
