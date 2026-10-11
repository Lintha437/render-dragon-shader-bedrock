#version 460
#extension GL_GOOGLE_include_directive : require
// SingleBlock / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
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

#include "../../include/materials/SingleBlock/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue9 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue9);
    precise float productValue12 = inverseLengthValue1 * reinterpretedBits;
    precise float productValue13 = inverseLengthValue1 * reinterpretedBits1;
    precise float productValue14 = inverseLengthValue1 * reinterpretedBits2;
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits4 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x);
    precise float reinterpretedBits5 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y);
    precise float reinterpretedBits6 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z);
    float scalarValue10 = rdDot3Precise(vec3(-productValue12, -productValue13, -productValue14), vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
    precise float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[53u])) - reinterpretedBits7;
    precise float sumValue = scalarValue10 - reinterpretedBits7;
    precise float quotientValue2 = 1.0 / reinterpretedBits8;
    precise float productValue15 = quotientValue2 * sumValue;
    float scalarValue11 = spvNClamp(productValue15, 0.0, 1.0);
    precise float productValue16 = scalarValue11 * scalarValue11;
    precise float multiplyAddValue = productValue16 * fma(scalarValue11, -2.0, 3.0);
    precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue1 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x);
    precise float multiplyAddValue2 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[54u]));
    precise float quotientValue5 = multiplyAddValue1 / reinterpretedBits10;
    precise float quotientValue6 = multiplyAddValue2 / reinterpretedBits10;
    precise float productValue17 = floor(quotientValue5) * reinterpretedBits10;
    precise float productValue18 = floor(quotientValue6) * reinterpretedBits10;
    precise float productValue19 = productValue17 * 0.25;
    precise float productValue20 = productValue18 * 0.25;
    precise float productValue21 = productValue17 * 0.5;
    precise float productValue22 = productValue18 * 0.5;
    float scalarValue12 = floor(productValue20);
    float scalarValue13 = floor(productValue22);
    precise float productValue23 = scalarValue12 * scalarValue12;
    precise float productValue24 = scalarValue13 * scalarValue13;
    precise float productValue25 = productValue23 * 0.75;
    precise float productValue26 = productValue24 * 0.75;
    float scalarValue14 = floor(productValue18);
    precise float productValue27 = scalarValue14 * scalarValue14;
    precise float productValue28 = productValue27 * 0.75;
    precise float multiplyAddValue3 = fma(fma(fma(fract(fma(floor(productValue19), 0.5, productValue25)), 0.25, fract(fma(floor(productValue21), 0.5, productValue26))), 0.25, fract(fma(floor(productValue17), 0.5, productValue28))), 64.0, 0.5) * 0.015625;
    bool reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if ((!reinterpretedBits11) && (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue3 >= multiplyAddValue)) || (scalarValue8 <= 0.0)))
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue9 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue9);
    precise float productValue12 = inverseLengthValue1 * reinterpretedBits;
    precise float productValue13 = inverseLengthValue1 * reinterpretedBits1;
    precise float productValue14 = inverseLengthValue1 * reinterpretedBits2;
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits4 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x);
    precise float reinterpretedBits5 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y);
    precise float reinterpretedBits6 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z);
    float scalarValue10 = rdDot3Precise(vec3(-productValue12, -productValue13, -productValue14), vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6));
    float reinterpretedBits27 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    precise float reinterpretedBits28 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits27;
    precise float sumValue7 = scalarValue10 - reinterpretedBits27;
    precise float quotientValue9 = 1.0 / reinterpretedBits28;
    precise float productValue56 = quotientValue9 * sumValue7;
    float scalarValue17 = spvNClamp(productValue56, 0.0, 1.0);
    precise float productValue57 = scalarValue17 * scalarValue17;
    precise float multiplyAddValue30 = productValue57 * fma(scalarValue17, -2.0, 3.0);
    precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
    precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    precise float multiplyAddValue31 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits29.x);
    precise float multiplyAddValue32 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits29.y);
    float reinterpretedBits30 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
    precise float quotientValue10 = multiplyAddValue31 / reinterpretedBits30;
    precise float quotientValue11 = multiplyAddValue32 / reinterpretedBits30;
    precise float productValue58 = floor(quotientValue10) * reinterpretedBits30;
    precise float productValue59 = floor(quotientValue11) * reinterpretedBits30;
    precise float productValue60 = productValue58 * 0.25;
    precise float productValue61 = productValue59 * 0.25;
    precise float productValue62 = productValue58 * 0.5;
    precise float productValue63 = productValue59 * 0.5;
    float scalarValue18 = floor(productValue61);
    float scalarValue19 = floor(productValue63);
    precise float productValue64 = scalarValue18 * scalarValue18;
    precise float productValue65 = scalarValue19 * scalarValue19;
    precise float productValue66 = productValue64 * 0.75;
    precise float productValue67 = productValue65 * 0.75;
    float scalarValue20 = floor(productValue59);
    precise float productValue68 = scalarValue20 * scalarValue20;
    precise float productValue69 = productValue68 * 0.75;
    precise float multiplyAddValue33 = fma(fma(fma(fract(fma(floor(productValue60), 0.5, productValue66)), 0.25, fract(fma(floor(productValue62), 0.5, productValue67))), 0.25, fract(fma(floor(productValue58), 0.5, productValue69))), 64.0, 0.5) * 0.015625;
    bool reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if ((!reinterpretedBits11) && (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && (multiplyAddValue33 >= multiplyAddValue30)) || (scalarValue8 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])))))
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue9 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue9);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits24 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits), -(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
    float reinterpretedBits25 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[53u])) - reinterpretedBits7)) * (reinterpretedBits24 - reinterpretedBits7), 0.0, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[54u]));
    float multiplyAddValue10 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x)) / reinterpretedBits10) * reinterpretedBits10;
    float multiplyAddValue11 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y)) / reinterpretedBits10) * reinterpretedBits10;
    float productValue36 = floor(multiplyAddValue11 * 0.25);
    float productValue37 = floor(multiplyAddValue11 * 0.5);
    float scalarValue15 = floor(multiplyAddValue11);
    bool reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (((scalarValue8 <= 0.0) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue10 * 0.25), 0.5, (productValue36 * productValue36) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue10 * 0.5), 0.5, (productValue37 * productValue37) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue10), 0.5, (scalarValue15 * scalarValue15) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits25 * reinterpretedBits25) * fma(reinterpretedBits25, -2.0, 3.0))))) && (!reinterpretedBits11))
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue1.x;
    float scalarValue6 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.z;
    float scalarValue8 = sampledTextureValue1.w;
    float reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits, reinterpretedBits1, reinterpretedBits2);
    float scalarValue9 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue9);
    uvec4 reinterpretedBits3 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits24 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits), -(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits3.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits3.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits3.z)));
    float reinterpretedBits27 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
    float reinterpretedBits31 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits27)) * (reinterpretedBits24 - reinterpretedBits27), 0.0, 1.0);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits30 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
    float multiplyAddValue34 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits29.x)) / reinterpretedBits30) * reinterpretedBits30;
    float multiplyAddValue35 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits29.y)) / reinterpretedBits30) * reinterpretedBits30;
    float productValue70 = floor(multiplyAddValue35 * 0.25);
    float productValue71 = floor(multiplyAddValue35 * 0.5);
    float scalarValue21 = floor(multiplyAddValue35);
    bool reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if ((!reinterpretedBits11) && ((scalarValue8 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue34 * 0.25), 0.5, (productValue70 * productValue70) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue34 * 0.5), 0.5, (productValue71 * productValue71) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue34), 0.5, (scalarValue21 * scalarValue21) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits31 * reinterpretedBits31) * fma(reinterpretedBits31, -2.0, 3.0))))))
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue = floor(quotientValue1 * 0.25);
        float productValue1 = floor(quotientValue1 * 0.5);
        float scalarValue4 = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue1 * productValue1) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue * productValue) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue4 * scalarValue4) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((scalarValue3 <= 0.0) || comparisonValue) && (fragmentVectorConstants1.packedValues[10u].x == 0.0))
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    uint comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
#endif
    {
#if RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED || RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        isFragmentDiscarded = true;
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[14u].x) / (fragmentVectorConstants1.packedValues[14u].y - fragmentVectorConstants1.packedValues[14u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
        float quotientValue8 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
        float productValue54 = floor(quotientValue8 * 0.25);
        float productValue55 = floor(quotientValue8 * 0.5);
        float scalarValue16 = floor(quotientValue8);
        comparisonValue = uint(((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue55 * productValue55) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue54 * productValue54) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue16 * scalarValue16) * 0.75) + (floor(quotientValue7) * 0.5))));
#endif
    }
#if (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits13 = uintBitsToFloat(reinterpretedBits12.x) - scalarValue5;
    precise float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits12.y) - scalarValue6;
    precise float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits12.z) - scalarValue7;
    float reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue4 = fma(reinterpretedBits16, reinterpretedBits13, scalarValue5);
    float multiplyAddValue5 = fma(reinterpretedBits16, reinterpretedBits14, scalarValue6);
    float multiplyAddValue6 = fma(reinterpretedBits16, reinterpretedBits15, scalarValue7);
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue7 = fma(scalarValue8, fma(multiplyAddValue4, varyingColor0.x, -multiplyAddValue4), multiplyAddValue4) * uintBitsToFloat(reinterpretedBits17.x);
    precise float multiplyAddValue8 = fma(scalarValue8, fma(multiplyAddValue5, varyingColor0.y, -multiplyAddValue5), multiplyAddValue5) * uintBitsToFloat(reinterpretedBits17.y);
    precise float multiplyAddValue9 = fma(scalarValue8, fma(multiplyAddValue6, varyingColor0.z, -multiplyAddValue6), multiplyAddValue6) * uintBitsToFloat(reinterpretedBits17.z);
    precise float productValue29 = multiplyAddValue7 * varyingColor0.w;
    precise float productValue30 = multiplyAddValue8 * varyingColor0.w;
    precise float productValue31 = multiplyAddValue9 * varyingColor0.w;
    uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits19 = varyingColor0.x * uintBitsToFloat(reinterpretedBits18.x);
    precise float reinterpretedBits20 = varyingColor0.y * uintBitsToFloat(reinterpretedBits18.y);
    precise float reinterpretedBits21 = varyingColor0.z * uintBitsToFloat(reinterpretedBits18.z);
    precise float reinterpretedBits22 = varyingColor0.w * uintBitsToFloat(reinterpretedBits18.w);
    precise float productValue32 = multiplyAddValue4 * reinterpretedBits19;
    precise float productValue33 = multiplyAddValue5 * reinterpretedBits20;
    precise float productValue34 = multiplyAddValue6 * reinterpretedBits21;
    precise float productValue35 = scalarValue8 * reinterpretedBits22;
    float comparisonValue1 = reinterpretedBits11 ? productValue29 : productValue32;
    float comparisonValue2 = reinterpretedBits11 ? productValue30 : productValue33;
    float comparisonValue3 = reinterpretedBits11 ? productValue31 : productValue34;
    precise float reinterpretedBits23 = (reinterpretedBits11 ? 1.0 : productValue35) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.w = reinterpretedBits23;
    precise float sumValue1 = varyingColor2.x - comparisonValue1;
    precise float sumValue2 = varyingColor2.y - comparisonValue2;
    precise float sumValue3 = varyingColor2.z - comparisonValue3;
    fragmentColor0.x = fma(varyingColor2.w, sumValue1, comparisonValue1);
    fragmentColor0.y = fma(varyingColor2.w, sumValue2, comparisonValue2);
    fragmentColor0.z = fma(varyingColor2.w, sumValue3, comparisonValue3);
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits13 = uintBitsToFloat(reinterpretedBits12.x) - scalarValue5;
    precise float reinterpretedBits14 = uintBitsToFloat(reinterpretedBits12.y) - scalarValue6;
    precise float reinterpretedBits15 = uintBitsToFloat(reinterpretedBits12.z) - scalarValue7;
    float reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    precise float multiplyAddValue24 = fma(reinterpretedBits16, reinterpretedBits13, scalarValue5) * varyingColor1.x;
    precise float multiplyAddValue25 = fma(reinterpretedBits16, reinterpretedBits14, scalarValue6) * varyingColor1.y;
    precise float multiplyAddValue26 = fma(reinterpretedBits16, reinterpretedBits15, scalarValue7) * varyingColor1.z;
    precise float productValue46 = scalarValue8 * varyingColor1.w;
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue27 = fma(productValue46, fma(multiplyAddValue24, varyingColor0.x, -multiplyAddValue24), multiplyAddValue24) * uintBitsToFloat(reinterpretedBits17.x);
    precise float multiplyAddValue28 = fma(productValue46, fma(multiplyAddValue25, varyingColor0.y, -multiplyAddValue25), multiplyAddValue25) * uintBitsToFloat(reinterpretedBits17.y);
    precise float multiplyAddValue29 = fma(productValue46, fma(multiplyAddValue26, varyingColor0.z, -multiplyAddValue26), multiplyAddValue26) * uintBitsToFloat(reinterpretedBits17.z);
    precise float productValue47 = multiplyAddValue27 * varyingColor0.w;
    precise float productValue48 = multiplyAddValue28 * varyingColor0.w;
    precise float productValue49 = multiplyAddValue29 * varyingColor0.w;
    uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits19 = varyingColor0.x * uintBitsToFloat(reinterpretedBits18.x);
    precise float reinterpretedBits20 = varyingColor0.y * uintBitsToFloat(reinterpretedBits18.y);
    precise float reinterpretedBits21 = varyingColor0.z * uintBitsToFloat(reinterpretedBits18.z);
    precise float reinterpretedBits22 = varyingColor0.w * uintBitsToFloat(reinterpretedBits18.w);
    precise float productValue50 = multiplyAddValue24 * reinterpretedBits19;
    precise float productValue51 = multiplyAddValue25 * reinterpretedBits20;
    precise float productValue52 = multiplyAddValue26 * reinterpretedBits21;
    precise float productValue53 = productValue46 * reinterpretedBits22;
    float comparisonValue4 = reinterpretedBits11 ? productValue47 : productValue50;
    float comparisonValue5 = reinterpretedBits11 ? productValue48 : productValue51;
    float comparisonValue6 = reinterpretedBits11 ? productValue49 : productValue52;
    precise float reinterpretedBits26 = (reinterpretedBits11 ? 1.0 : productValue53) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.w = reinterpretedBits26;
    precise float sumValue4 = varyingColor2.x - comparisonValue4;
    precise float sumValue5 = varyingColor2.y - comparisonValue5;
    precise float sumValue6 = varyingColor2.z - comparisonValue6;
    fragmentColor0.x = fma(varyingColor2.w, sumValue4, comparisonValue4);
    fragmentColor0.y = fma(varyingColor2.w, sumValue5, comparisonValue5);
    fragmentColor0.z = fma(varyingColor2.w, sumValue6, comparisonValue6);
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue12 = fma(reinterpretedBits16, uintBitsToFloat(reinterpretedBits12.x) - scalarValue5, scalarValue5);
    float multiplyAddValue13 = fma(reinterpretedBits16, uintBitsToFloat(reinterpretedBits12.y) - scalarValue6, scalarValue6);
    float multiplyAddValue14 = fma(reinterpretedBits16, uintBitsToFloat(reinterpretedBits12.z) - scalarValue7, scalarValue7);
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue15 = reinterpretedBits11 ? ((fma(scalarValue8, fma(multiplyAddValue12, varyingColor0.x, -multiplyAddValue12), multiplyAddValue12) * uintBitsToFloat(reinterpretedBits17.x)) * varyingColor0.w) : (multiplyAddValue12 * (varyingColor0.x * uintBitsToFloat(reinterpretedBits18.x)));
    float multiplyAddValue16 = reinterpretedBits11 ? ((fma(scalarValue8, fma(multiplyAddValue13, varyingColor0.y, -multiplyAddValue13), multiplyAddValue13) * uintBitsToFloat(reinterpretedBits17.y)) * varyingColor0.w) : (multiplyAddValue13 * (varyingColor0.y * uintBitsToFloat(reinterpretedBits18.y)));
    float multiplyAddValue17 = reinterpretedBits11 ? ((fma(scalarValue8, fma(multiplyAddValue14, varyingColor0.z, -multiplyAddValue14), multiplyAddValue14) * uintBitsToFloat(reinterpretedBits17.z)) * varyingColor0.w) : (multiplyAddValue14 * (varyingColor0.z * uintBitsToFloat(reinterpretedBits18.z)));
    fragmentColor0.w = (reinterpretedBits11 ? 1.0 : (scalarValue8 * (varyingColor0.w * uintBitsToFloat(reinterpretedBits18.w)))) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue15, multiplyAddValue15);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue16, multiplyAddValue16);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue17, multiplyAddValue17);
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue18 = fma(reinterpretedBits16, uintBitsToFloat(reinterpretedBits12.x) - scalarValue5, scalarValue5) * varyingColor1.x;
    float multiplyAddValue19 = fma(reinterpretedBits16, uintBitsToFloat(reinterpretedBits12.y) - scalarValue6, scalarValue6) * varyingColor1.y;
    float multiplyAddValue20 = fma(reinterpretedBits16, uintBitsToFloat(reinterpretedBits12.z) - scalarValue7, scalarValue7) * varyingColor1.z;
    float productValue45 = scalarValue8 * varyingColor1.w;
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits18 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue21 = reinterpretedBits11 ? ((fma(productValue45, fma(multiplyAddValue18, varyingColor0.x, -multiplyAddValue18), multiplyAddValue18) * uintBitsToFloat(reinterpretedBits17.x)) * varyingColor0.w) : (multiplyAddValue18 * (varyingColor0.x * uintBitsToFloat(reinterpretedBits18.x)));
    float multiplyAddValue22 = reinterpretedBits11 ? ((fma(productValue45, fma(multiplyAddValue19, varyingColor0.y, -multiplyAddValue19), multiplyAddValue19) * uintBitsToFloat(reinterpretedBits17.y)) * varyingColor0.w) : (multiplyAddValue19 * (varyingColor0.y * uintBitsToFloat(reinterpretedBits18.y)));
    float multiplyAddValue23 = reinterpretedBits11 ? ((fma(productValue45, fma(multiplyAddValue20, varyingColor0.z, -multiplyAddValue20), multiplyAddValue20) * uintBitsToFloat(reinterpretedBits17.z)) * varyingColor0.w) : (multiplyAddValue20 * (varyingColor0.z * uintBitsToFloat(reinterpretedBits18.z)));
    fragmentColor0.w = (reinterpretedBits11 ? 1.0 : (productValue45 * (varyingColor0.w * uintBitsToFloat(reinterpretedBits18.w)))) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue21, multiplyAddValue21);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue22, multiplyAddValue22);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue23, multiplyAddValue23);
#elif (RD_FEATURE_LIT == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue2 = ((fragmentVectorConstants1.packedValues[8u].x - scalarValue) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue;
    float productValue3 = ((fragmentVectorConstants1.packedValues[8u].y - scalarValue1) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue1;
    float productValue4 = ((fragmentVectorConstants1.packedValues[8u].z - scalarValue2) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue2;
    float productValue5 = productValue2 * varyingColor0.x;
    float productValue6 = productValue3 * varyingColor0.y;
    float productValue7 = productValue4 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue5;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue8 = (fragmentVectorConstants1.packedValues[11u].x * varyingColor0.w) * (((productValue5 - productValue2) * scalarValue3) + productValue2);
        productValue9 = (fragmentVectorConstants1.packedValues[11u].y * varyingColor0.w) * (((productValue6 - productValue3) * scalarValue3) + productValue3);
        productValue10 = (fragmentVectorConstants1.packedValues[11u].z * varyingColor0.w) * (((productValue7 - productValue4) * scalarValue3) + productValue4);
        intermediateValue5 = 1.0;
    }
    else
    {
        productValue8 = productValue5 * fragmentVectorConstants1.packedValues[11u].x;
        productValue9 = productValue6 * fragmentVectorConstants1.packedValues[11u].y;
        productValue10 = productValue7 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue5 = (scalarValue3 * varyingColor0.w) * fragmentVectorConstants1.packedValues[11u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.y = ((varyingColor2.y - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.z = ((varyingColor2.z - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue5;
#elif (RD_FEATURE_LIT == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue38 = (((fragmentVectorConstants1.packedValues[8u].x - scalarValue) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue) * varyingColor1.x;
    float productValue39 = (((fragmentVectorConstants1.packedValues[8u].y - scalarValue1) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue1) * varyingColor1.y;
    float productValue40 = (((fragmentVectorConstants1.packedValues[8u].z - scalarValue2) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue2) * varyingColor1.z;
    float productValue41 = scalarValue3 * varyingColor1.w;
    float productValue42 = productValue38 * varyingColor0.x;
    float productValue43 = productValue39 * varyingColor0.y;
    float productValue44 = productValue40 * varyingColor0.z;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue5;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue9 = (fragmentVectorConstants1.packedValues[11u].x * varyingColor0.w) * (((productValue42 - productValue38) * productValue41) + productValue38);
        productValue10 = (fragmentVectorConstants1.packedValues[11u].y * varyingColor0.w) * (((productValue43 - productValue39) * productValue41) + productValue39);
        productValue11 = (fragmentVectorConstants1.packedValues[11u].z * varyingColor0.w) * (((productValue44 - productValue40) * productValue41) + productValue40);
        intermediateValue5 = 1.0;
    }
    else
    {
        productValue9 = productValue42 * fragmentVectorConstants1.packedValues[11u].x;
        productValue10 = productValue43 * fragmentVectorConstants1.packedValues[11u].y;
        productValue11 = productValue44 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue5 = (productValue41 * varyingColor0.w) * fragmentVectorConstants1.packedValues[11u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue5;
#elif (RD_FEATURE_LIT == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    else
    {
        comparisonValue = 0u;
    }
    if (!(fragmentVectorConstants1.packedValues[10u].x != 0.0))
    {
        if ((comparisonValue != 0u) || (scalarValue3 < fragmentVectorConstants1.packedValues[12u].x))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue2 = ((fragmentVectorConstants1.packedValues[8u].x - scalarValue) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue;
    float productValue3 = ((fragmentVectorConstants1.packedValues[8u].y - scalarValue1) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue1;
    float productValue4 = ((fragmentVectorConstants1.packedValues[8u].z - scalarValue2) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue2;
    float productValue5 = productValue2 * varyingColor0.x;
    float productValue6 = productValue3 * varyingColor0.y;
    float productValue7 = productValue4 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue5;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue8 = (fragmentVectorConstants1.packedValues[11u].x * varyingColor0.w) * (((productValue5 - productValue2) * scalarValue3) + productValue2);
        productValue9 = (fragmentVectorConstants1.packedValues[11u].y * varyingColor0.w) * (((productValue6 - productValue3) * scalarValue3) + productValue3);
        productValue10 = (fragmentVectorConstants1.packedValues[11u].z * varyingColor0.w) * (((productValue7 - productValue4) * scalarValue3) + productValue4);
        intermediateValue5 = 1.0;
    }
    else
    {
        productValue8 = productValue5 * fragmentVectorConstants1.packedValues[11u].x;
        productValue9 = productValue6 * fragmentVectorConstants1.packedValues[11u].y;
        productValue10 = productValue7 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue5 = (scalarValue3 * varyingColor0.w) * fragmentVectorConstants1.packedValues[11u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.y = ((varyingColor2.y - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.z = ((varyingColor2.z - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue5;
#elif (RD_FEATURE_LIT == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    else
    {
        comparisonValue = 0u;
    }
    if (!(fragmentVectorConstants1.packedValues[10u].x != 0.0))
    {
        if ((comparisonValue != 0u) || (scalarValue3 < fragmentVectorConstants1.packedValues[12u].x))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue38 = (((fragmentVectorConstants1.packedValues[8u].x - scalarValue) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue) * varyingColor1.x;
    float productValue39 = (((fragmentVectorConstants1.packedValues[8u].y - scalarValue1) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue1) * varyingColor1.y;
    float productValue40 = (((fragmentVectorConstants1.packedValues[8u].z - scalarValue2) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue2) * varyingColor1.z;
    float productValue41 = scalarValue3 * varyingColor1.w;
    float productValue42 = productValue38 * varyingColor0.x;
    float productValue43 = productValue39 * varyingColor0.y;
    float productValue44 = productValue40 * varyingColor0.z;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue5;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue9 = (fragmentVectorConstants1.packedValues[11u].x * varyingColor0.w) * (((productValue42 - productValue38) * productValue41) + productValue38);
        productValue10 = (fragmentVectorConstants1.packedValues[11u].y * varyingColor0.w) * (((productValue43 - productValue39) * productValue41) + productValue39);
        productValue11 = (fragmentVectorConstants1.packedValues[11u].z * varyingColor0.w) * (((productValue44 - productValue40) * productValue41) + productValue40);
        intermediateValue5 = 1.0;
    }
    else
    {
        productValue9 = productValue42 * fragmentVectorConstants1.packedValues[11u].x;
        productValue10 = productValue43 * fragmentVectorConstants1.packedValues[11u].y;
        productValue11 = productValue44 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue5 = (productValue41 * varyingColor0.w) * fragmentVectorConstants1.packedValues[11u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue5;
#endif
    discardIfRequested();
}
