#version 460
#extension GL_GOOGLE_include_directive : require
// ActorMultiTexture / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 36
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_FEATURE_COLOR_SECOND_TEXTURE
#define RD_FEATURE_COLOR_SECOND_TEXTURE RD_OFF
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ActorMultiTexture/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    precise float reinterpretedBits15 = scalarValue * uintBitsToFloat(reinterpretedBits.x);
    precise float reinterpretedBits16 = scalarValue1 * uintBitsToFloat(reinterpretedBits.y);
    precise float reinterpretedBits17 = scalarValue2 * uintBitsToFloat(reinterpretedBits.z);
    precise float reinterpretedBits18 = sampledTextureValue.w * uintBitsToFloat(reinterpretedBits.w);
    float scalarValue13 = spvNMax(reinterpretedBits18, 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits19 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits20 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits21 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float scalarValue14 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits19, reinterpretedBits20, reinterpretedBits21));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float reinterpretedBits22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits7;
    precise float sumValue = scalarValue14 - reinterpretedBits7;
    precise float quotientValue2 = 1.0 / reinterpretedBits22;
    precise float productValue43 = quotientValue2 * sumValue;
    float scalarValue15 = spvNClamp(productValue43, 0.0, 1.0);
    precise float productValue44 = scalarValue15 * scalarValue15;
    precise float multiplyAddValue14 = productValue44 * fma(scalarValue15, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    precise float multiplyAddValue15 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x);
    precise float multiplyAddValue16 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    precise float quotientValue5 = multiplyAddValue15 / reinterpretedBits10;
    precise float quotientValue6 = multiplyAddValue16 / reinterpretedBits10;
    precise float productValue45 = floor(quotientValue5) * reinterpretedBits10;
    precise float productValue46 = floor(quotientValue6) * reinterpretedBits10;
    precise float productValue47 = productValue45 * 0.25;
    precise float productValue48 = productValue46 * 0.25;
    precise float productValue49 = productValue45 * 0.5;
    precise float productValue50 = productValue46 * 0.5;
    float scalarValue16 = floor(productValue48);
    float scalarValue17 = floor(productValue50);
    precise float productValue51 = scalarValue16 * scalarValue16;
    precise float productValue52 = scalarValue17 * scalarValue17;
    precise float productValue53 = productValue51 * 0.75;
    precise float productValue54 = productValue52 * 0.75;
    float scalarValue18 = floor(productValue46);
    precise float productValue55 = scalarValue18 * scalarValue18;
    precise float productValue56 = productValue55 * 0.75;
    precise float multiplyAddValue17 = fma(fma(fma(fract(fma(floor(productValue47), 0.5, productValue53)), 0.25, fract(fma(floor(productValue49), 0.5, productValue54))), 0.25, fract(fma(floor(productValue45), 0.5, productValue56))), 64.0, 0.5) * 0.015625;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && (multiplyAddValue17 >= multiplyAddValue14)) || ((scalarValue13 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    precise float sumValue7 = scalarValue20 + scalarValue19;
    precise float sumValue8 = scalarValue21 + sumValue7;
    precise float sumValue9 = 1.0 - scalarValue3;
    precise float productValue64 = sumValue9 * sumValue8;
    float scalarValue22 = float(productValue64 > 0.0);
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue43 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue.x, -scalarValue19), scalarValue19);
    float multiplyAddValue44 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue.y, -scalarValue20), scalarValue20);
    float multiplyAddValue45 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue.z, -scalarValue21), scalarValue21);
    float multiplyAddValue46 = spvNMax(fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue.w, -scalarValue3), scalarValue3), 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits19 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x);
    precise float reinterpretedBits20 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y);
    precise float reinterpretedBits21 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z);
    float scalarValue14 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits19, reinterpretedBits20, reinterpretedBits21));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float reinterpretedBits22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits7;
    precise float sumValue = scalarValue14 - reinterpretedBits7;
    precise float quotientValue2 = 1.0 / reinterpretedBits22;
    precise float productValue43 = quotientValue2 * sumValue;
    float scalarValue15 = spvNClamp(productValue43, 0.0, 1.0);
    precise float productValue44 = scalarValue15 * scalarValue15;
    precise float multiplyAddValue14 = productValue44 * fma(scalarValue15, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    precise float multiplyAddValue15 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x);
    precise float multiplyAddValue16 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    precise float quotientValue5 = multiplyAddValue15 / reinterpretedBits10;
    precise float quotientValue6 = multiplyAddValue16 / reinterpretedBits10;
    precise float productValue45 = floor(quotientValue5) * reinterpretedBits10;
    precise float productValue46 = floor(quotientValue6) * reinterpretedBits10;
    precise float productValue47 = productValue45 * 0.25;
    precise float productValue48 = productValue46 * 0.25;
    precise float productValue49 = productValue45 * 0.5;
    precise float productValue50 = productValue46 * 0.5;
    float scalarValue16 = floor(productValue48);
    float scalarValue17 = floor(productValue50);
    precise float productValue51 = scalarValue16 * scalarValue16;
    precise float productValue52 = scalarValue17 * scalarValue17;
    precise float productValue53 = productValue51 * 0.75;
    precise float productValue54 = productValue52 * 0.75;
    float scalarValue18 = floor(productValue46);
    precise float productValue55 = scalarValue18 * scalarValue18;
    precise float productValue56 = productValue55 * 0.75;
    precise float multiplyAddValue17 = fma(fma(fma(fract(fma(floor(productValue47), 0.5, productValue53)), 0.25, fract(fma(floor(productValue49), 0.5, productValue54))), 0.25, fract(fma(floor(productValue45), 0.5, productValue56))), 64.0, 0.5) * 0.015625;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && (multiplyAddValue17 >= multiplyAddValue14)) || ((multiplyAddValue46 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float reinterpretedBits34 = scalarValue * uintBitsToFloat(reinterpretedBits23.x);
    precise float reinterpretedBits35 = scalarValue1 * uintBitsToFloat(reinterpretedBits23.y);
    precise float reinterpretedBits36 = scalarValue2 * uintBitsToFloat(reinterpretedBits23.z);
    precise float reinterpretedBits37 = sampledTextureValue.w * uintBitsToFloat(reinterpretedBits23.w);
    float scalarValue31 = spvNMax(reinterpretedBits37, 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits38 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits39 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits40 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue32 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits38, reinterpretedBits39, reinterpretedBits40));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26;
    precise float sumValue16 = scalarValue32 - reinterpretedBits26;
    precise float quotientValue9 = 1.0 / reinterpretedBits41;
    precise float productValue85 = quotientValue9 * sumValue16;
    float scalarValue33 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue33 * scalarValue33;
    precise float multiplyAddValue67 = productValue86 * fma(scalarValue33, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue68 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x);
    precise float multiplyAddValue69 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue68 / reinterpretedBits29;
    precise float quotientValue11 = multiplyAddValue69 / reinterpretedBits29;
    precise float productValue87 = floor(quotientValue10) * reinterpretedBits29;
    precise float productValue88 = floor(quotientValue11) * reinterpretedBits29;
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue34 = floor(productValue90);
    float scalarValue35 = floor(productValue92);
    precise float productValue93 = scalarValue34 * scalarValue34;
    precise float productValue94 = scalarValue35 * scalarValue35;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue36 = floor(productValue88);
    precise float productValue97 = scalarValue36 * scalarValue36;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue70 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue70 >= multiplyAddValue67)) || ((scalarValue31 < 0.5) && (scalarValue3 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    precise float sumValue7 = scalarValue20 + scalarValue19;
    precise float sumValue8 = scalarValue21 + sumValue7;
    precise float sumValue9 = 1.0 - scalarValue3;
    precise float productValue64 = sumValue9 * sumValue8;
    float scalarValue22 = float(productValue64 > 0.0);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue90 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.x), sampledTextureValue.x, -scalarValue19), scalarValue19);
    float multiplyAddValue91 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.y), sampledTextureValue.y, -scalarValue20), scalarValue20);
    float multiplyAddValue92 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.z), sampledTextureValue.z, -scalarValue21), scalarValue21);
    float multiplyAddValue93 = spvNMax(fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.w), sampledTextureValue.w, -scalarValue3), scalarValue3), 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits38 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits39 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits40 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue32 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits38, reinterpretedBits39, reinterpretedBits40));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26;
    precise float sumValue16 = scalarValue32 - reinterpretedBits26;
    precise float quotientValue9 = 1.0 / reinterpretedBits41;
    precise float productValue85 = quotientValue9 * sumValue16;
    float scalarValue33 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue33 * scalarValue33;
    precise float multiplyAddValue67 = productValue86 * fma(scalarValue33, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue68 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x);
    precise float multiplyAddValue69 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue68 / reinterpretedBits29;
    precise float quotientValue11 = multiplyAddValue69 / reinterpretedBits29;
    precise float productValue87 = floor(quotientValue10) * reinterpretedBits29;
    precise float productValue88 = floor(quotientValue11) * reinterpretedBits29;
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue34 = floor(productValue90);
    float scalarValue35 = floor(productValue92);
    precise float productValue93 = scalarValue34 * scalarValue34;
    precise float productValue94 = scalarValue35 * scalarValue35;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue36 = floor(productValue88);
    precise float productValue97 = scalarValue36 * scalarValue36;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue70 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue70 >= multiplyAddValue67)) || ((multiplyAddValue93 < 0.5) && (scalarValue3 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float reinterpretedBits42 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits23.x);
    precise float reinterpretedBits43 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits23.y);
    precise float reinterpretedBits44 = sampledTextureValue.z * uintBitsToFloat(reinterpretedBits23.z);
    precise float reinterpretedBits37 = sampledTextureValue.w * uintBitsToFloat(reinterpretedBits23.w);
    precise float reinterpretedBits45 = reinterpretedBits37 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u]));
    float scalarValue37 = spvNMax(reinterpretedBits45, 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits38 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits39 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits40 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue32 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits38, reinterpretedBits39, reinterpretedBits40));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26;
    precise float sumValue16 = scalarValue32 - reinterpretedBits26;
    precise float quotientValue9 = 1.0 / reinterpretedBits41;
    precise float productValue85 = quotientValue9 * sumValue16;
    float scalarValue33 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue33 * scalarValue33;
    precise float multiplyAddValue67 = productValue86 * fma(scalarValue33, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue68 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x);
    precise float multiplyAddValue69 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue68 / reinterpretedBits29;
    precise float quotientValue11 = multiplyAddValue69 / reinterpretedBits29;
    precise float productValue87 = floor(quotientValue10) * reinterpretedBits29;
    precise float productValue88 = floor(quotientValue11) * reinterpretedBits29;
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue34 = floor(productValue90);
    float scalarValue35 = floor(productValue92);
    precise float productValue93 = scalarValue34 * scalarValue34;
    precise float productValue94 = scalarValue35 * scalarValue35;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue36 = floor(productValue88);
    precise float productValue97 = scalarValue36 * scalarValue36;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue70 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue70 >= multiplyAddValue67)) || ((scalarValue37 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    precise float sumValue7 = scalarValue20 + scalarValue19;
    precise float sumValue8 = scalarValue21 + sumValue7;
    precise float sumValue9 = 1.0 - scalarValue3;
    precise float productValue64 = sumValue9 * sumValue8;
    float scalarValue22 = float(productValue64 > 0.0);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue90 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.x), sampledTextureValue.x, -scalarValue19), scalarValue19);
    float multiplyAddValue91 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.y), sampledTextureValue.y, -scalarValue20), scalarValue20);
    float multiplyAddValue92 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.z), sampledTextureValue.z, -scalarValue21), scalarValue21);
    float multiplyAddValue137 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.w), sampledTextureValue.w, -scalarValue3), scalarValue3);
    precise float reinterpretedBits52 = multiplyAddValue137 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u]));
    float scalarValue38 = spvNMax(reinterpretedBits52, 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits38 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits39 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits40 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue32 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits38, reinterpretedBits39, reinterpretedBits40));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26;
    precise float sumValue16 = scalarValue32 - reinterpretedBits26;
    precise float quotientValue9 = 1.0 / reinterpretedBits41;
    precise float productValue85 = quotientValue9 * sumValue16;
    float scalarValue33 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue33 * scalarValue33;
    precise float multiplyAddValue67 = productValue86 * fma(scalarValue33, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue68 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x);
    precise float multiplyAddValue69 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue68 / reinterpretedBits29;
    precise float quotientValue11 = multiplyAddValue69 / reinterpretedBits29;
    precise float productValue87 = floor(quotientValue10) * reinterpretedBits29;
    precise float productValue88 = floor(quotientValue11) * reinterpretedBits29;
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue34 = floor(productValue90);
    float scalarValue35 = floor(productValue92);
    precise float productValue93 = scalarValue34 * scalarValue34;
    precise float productValue94 = scalarValue35 * scalarValue35;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue36 = floor(productValue88);
    precise float productValue97 = scalarValue36 * scalarValue36;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue70 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue70 >= multiplyAddValue67)) || ((scalarValue38 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float reinterpretedBits42 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits23.x);
    precise float reinterpretedBits43 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits23.y);
    precise float reinterpretedBits44 = sampledTextureValue.z * uintBitsToFloat(reinterpretedBits23.z);
    precise float reinterpretedBits37 = sampledTextureValue.w * uintBitsToFloat(reinterpretedBits23.w);
    precise float reinterpretedBits45 = reinterpretedBits37 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u]));
    float scalarValue37 = spvNMax(reinterpretedBits45, 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits38 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits39 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits40 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue32 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits38, reinterpretedBits39, reinterpretedBits40));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26;
    precise float sumValue16 = scalarValue32 - reinterpretedBits26;
    precise float quotientValue9 = 1.0 / reinterpretedBits41;
    precise float productValue85 = quotientValue9 * sumValue16;
    float scalarValue33 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue33 * scalarValue33;
    precise float multiplyAddValue67 = productValue86 * fma(scalarValue33, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue68 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x);
    precise float multiplyAddValue69 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue68 / reinterpretedBits29;
    precise float quotientValue11 = multiplyAddValue69 / reinterpretedBits29;
    precise float productValue87 = floor(quotientValue10) * reinterpretedBits29;
    precise float productValue88 = floor(quotientValue11) * reinterpretedBits29;
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue34 = floor(productValue90);
    float scalarValue35 = floor(productValue92);
    precise float productValue93 = scalarValue34 * scalarValue34;
    precise float productValue94 = scalarValue35 * scalarValue35;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue36 = floor(productValue88);
    precise float productValue97 = scalarValue36 * scalarValue36;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue70 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue70 >= multiplyAddValue67)) || ((scalarValue37 < 0.5) && (scalarValue3 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    precise float sumValue7 = scalarValue20 + scalarValue19;
    precise float sumValue8 = scalarValue21 + sumValue7;
    precise float sumValue9 = 1.0 - scalarValue3;
    precise float productValue64 = sumValue9 * sumValue8;
    float scalarValue22 = float(productValue64 > 0.0);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue90 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.x), sampledTextureValue.x, -scalarValue19), scalarValue19);
    float multiplyAddValue91 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.y), sampledTextureValue.y, -scalarValue20), scalarValue20);
    float multiplyAddValue92 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.z), sampledTextureValue.z, -scalarValue21), scalarValue21);
    float multiplyAddValue137 = fma(scalarValue22, fma(uintBitsToFloat(reinterpretedBits23.w), sampledTextureValue.w, -scalarValue3), scalarValue3);
    precise float reinterpretedBits52 = multiplyAddValue137 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u]));
    float scalarValue38 = spvNMax(reinterpretedBits52, 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits38 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits39 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits40 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue32 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits38, reinterpretedBits39, reinterpretedBits40));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26;
    precise float sumValue16 = scalarValue32 - reinterpretedBits26;
    precise float quotientValue9 = 1.0 / reinterpretedBits41;
    precise float productValue85 = quotientValue9 * sumValue16;
    float scalarValue33 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue33 * scalarValue33;
    precise float multiplyAddValue67 = productValue86 * fma(scalarValue33, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue68 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x);
    precise float multiplyAddValue69 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue68 / reinterpretedBits29;
    precise float quotientValue11 = multiplyAddValue69 / reinterpretedBits29;
    precise float productValue87 = floor(quotientValue10) * reinterpretedBits29;
    precise float productValue88 = floor(quotientValue11) * reinterpretedBits29;
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue34 = floor(productValue90);
    float scalarValue35 = floor(productValue92);
    precise float productValue93 = scalarValue34 * scalarValue34;
    precise float productValue94 = scalarValue35 * scalarValue35;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue36 = floor(productValue88);
    precise float productValue97 = scalarValue36 * scalarValue36;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue70 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue70 >= multiplyAddValue67)) || ((scalarValue38 < 0.5) && (scalarValue3 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float reinterpretedBits42 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits23.x);
    precise float reinterpretedBits43 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits23.y);
    precise float reinterpretedBits61 = sampledTextureValue.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    float scalarValue42 = spvNMax(reinterpretedBits61, 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits38 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits39 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits40 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue32 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits38, reinterpretedBits39, reinterpretedBits40));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26;
    precise float sumValue16 = scalarValue32 - reinterpretedBits26;
    precise float quotientValue9 = 1.0 / reinterpretedBits41;
    precise float productValue85 = quotientValue9 * sumValue16;
    float scalarValue33 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue33 * scalarValue33;
    precise float multiplyAddValue67 = productValue86 * fma(scalarValue33, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue68 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x);
    precise float multiplyAddValue69 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue68 / reinterpretedBits29;
    precise float quotientValue11 = multiplyAddValue69 / reinterpretedBits29;
    precise float productValue87 = floor(quotientValue10) * reinterpretedBits29;
    precise float productValue88 = floor(quotientValue11) * reinterpretedBits29;
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue34 = floor(productValue90);
    float scalarValue35 = floor(productValue92);
    precise float productValue93 = scalarValue34 * scalarValue34;
    precise float productValue94 = scalarValue35 * scalarValue35;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue36 = floor(productValue88);
    precise float productValue97 = scalarValue36 * scalarValue36;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue70 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue70 >= multiplyAddValue67)) || ((scalarValue42 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    precise float sumValue7 = scalarValue20 + scalarValue19;
    precise float sumValue8 = scalarValue21 + sumValue7;
    precise float sumValue9 = 1.0 - scalarValue3;
    precise float productValue224 = sumValue8 * sumValue9;
    float scalarValue44 = float(productValue224 > 0.0);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue210 = fma(scalarValue44, fma(uintBitsToFloat(reinterpretedBits23.x), sampledTextureValue.x, -scalarValue19), scalarValue19);
    float multiplyAddValue211 = fma(scalarValue44, fma(uintBitsToFloat(reinterpretedBits23.y), sampledTextureValue.y, -scalarValue20), scalarValue20);
    float multiplyAddValue212 = spvNMax(fma(scalarValue44, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), sampledTextureValue.w, -scalarValue3), scalarValue3), 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits38 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits39 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits40 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue32 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits38, reinterpretedBits39, reinterpretedBits40));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26;
    precise float sumValue16 = scalarValue32 - reinterpretedBits26;
    precise float quotientValue9 = 1.0 / reinterpretedBits41;
    precise float productValue85 = quotientValue9 * sumValue16;
    float scalarValue33 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue33 * scalarValue33;
    precise float multiplyAddValue67 = productValue86 * fma(scalarValue33, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue68 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x);
    precise float multiplyAddValue69 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue68 / reinterpretedBits29;
    precise float quotientValue11 = multiplyAddValue69 / reinterpretedBits29;
    precise float productValue87 = floor(quotientValue10) * reinterpretedBits29;
    precise float productValue88 = floor(quotientValue11) * reinterpretedBits29;
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue34 = floor(productValue90);
    float scalarValue35 = floor(productValue92);
    precise float productValue93 = scalarValue34 * scalarValue34;
    precise float productValue94 = scalarValue35 * scalarValue35;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue36 = floor(productValue88);
    precise float productValue97 = scalarValue36 * scalarValue36;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue70 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue70 >= multiplyAddValue67)) || ((multiplyAddValue212 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float reinterpretedBits42 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits23.x);
    precise float reinterpretedBits43 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits23.y);
    precise float reinterpretedBits61 = sampledTextureValue.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    float scalarValue42 = spvNMax(reinterpretedBits61, 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits38 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits39 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits40 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue32 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits38, reinterpretedBits39, reinterpretedBits40));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26;
    precise float sumValue16 = scalarValue32 - reinterpretedBits26;
    precise float quotientValue9 = 1.0 / reinterpretedBits41;
    precise float productValue85 = quotientValue9 * sumValue16;
    float scalarValue33 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue33 * scalarValue33;
    precise float multiplyAddValue67 = productValue86 * fma(scalarValue33, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue68 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x);
    precise float multiplyAddValue69 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue68 / reinterpretedBits29;
    precise float quotientValue11 = multiplyAddValue69 / reinterpretedBits29;
    precise float productValue87 = floor(quotientValue10) * reinterpretedBits29;
    precise float productValue88 = floor(quotientValue11) * reinterpretedBits29;
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue34 = floor(productValue90);
    float scalarValue35 = floor(productValue92);
    precise float productValue93 = scalarValue34 * scalarValue34;
    precise float productValue94 = scalarValue35 * scalarValue35;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue36 = floor(productValue88);
    precise float productValue97 = scalarValue36 * scalarValue36;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue70 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue70 >= multiplyAddValue67)) || ((scalarValue42 < 0.5) && (scalarValue3 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    precise float sumValue7 = scalarValue20 + scalarValue19;
    precise float sumValue8 = scalarValue21 + sumValue7;
    precise float sumValue9 = 1.0 - scalarValue3;
    precise float productValue224 = sumValue8 * sumValue9;
    float scalarValue44 = float(productValue224 > 0.0);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue210 = fma(scalarValue44, fma(uintBitsToFloat(reinterpretedBits23.x), sampledTextureValue.x, -scalarValue19), scalarValue19);
    float multiplyAddValue211 = fma(scalarValue44, fma(uintBitsToFloat(reinterpretedBits23.y), sampledTextureValue.y, -scalarValue20), scalarValue20);
    float multiplyAddValue212 = spvNMax(fma(scalarValue44, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), sampledTextureValue.w, -scalarValue3), scalarValue3), 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    precise float productValue40 = inverseLengthValue * reinterpretedBits2;
    precise float productValue41 = inverseLengthValue * reinterpretedBits3;
    precise float productValue42 = inverseLengthValue * reinterpretedBits4;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits38 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits39 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits40 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z);
    float scalarValue32 = rdDot3Precise(vec3(-productValue40, -productValue41, -productValue42), vec3(reinterpretedBits38, reinterpretedBits39, reinterpretedBits40));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26;
    precise float sumValue16 = scalarValue32 - reinterpretedBits26;
    precise float quotientValue9 = 1.0 / reinterpretedBits41;
    precise float productValue85 = quotientValue9 * sumValue16;
    float scalarValue33 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue33 * scalarValue33;
    precise float multiplyAddValue67 = productValue86 * fma(scalarValue33, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue68 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x);
    precise float multiplyAddValue69 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue68 / reinterpretedBits29;
    precise float quotientValue11 = multiplyAddValue69 / reinterpretedBits29;
    precise float productValue87 = floor(quotientValue10) * reinterpretedBits29;
    precise float productValue88 = floor(quotientValue11) * reinterpretedBits29;
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue34 = floor(productValue90);
    float scalarValue35 = floor(productValue92);
    precise float productValue93 = scalarValue34 * scalarValue34;
    precise float productValue94 = scalarValue35 * scalarValue35;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue36 = floor(productValue88);
    precise float productValue97 = scalarValue36 * scalarValue36;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue70 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue70 >= multiplyAddValue67)) || ((multiplyAddValue212 < 0.5) && (scalarValue3 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits1 = spvNMax(sampledTextureValue.w * uintBitsToFloat(reinterpretedBits.w), 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits6 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z)));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float reinterpretedBits8 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits7)) * (reinterpretedBits6 - reinterpretedBits7), 0.0, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x)) / reinterpretedBits10) * reinterpretedBits10;
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y)) / reinterpretedBits10) * reinterpretedBits10;
    float productValue = floor(multiplyAddValue1 * 0.25);
    float productValue1 = floor(multiplyAddValue1 * 0.5);
    float scalarValue5 = floor(multiplyAddValue1);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue * productValue) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue1 * productValue1) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue5 * scalarValue5) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits8 * reinterpretedBits8) * fma(reinterpretedBits8, -2.0, 3.0)))) || ((reinterpretedBits1 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    bool productValue63 = ((1.0 - scalarValue3) * (scalarValue21 + (scalarValue20 + scalarValue19))) > 0.0;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue30 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue.x, -scalarValue19) + scalarValue19) : scalarValue19;
    float multiplyAddValue31 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue.y, -scalarValue20) + scalarValue20) : scalarValue20;
    float multiplyAddValue32 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue.z, -scalarValue21) + scalarValue21) : scalarValue21;
    float multiplyAddValue33 = spvNMax(productValue63 ? (fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue.w, -scalarValue3) + scalarValue3) : scalarValue3, 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits5 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits6 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits5.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits5.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits5.z)));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float reinterpretedBits8 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits7)) * (reinterpretedBits6 - reinterpretedBits7), 0.0, 1.0);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.x)) / reinterpretedBits10) * reinterpretedBits10;
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits9.y)) / reinterpretedBits10) * reinterpretedBits10;
    float productValue = floor(multiplyAddValue1 * 0.25);
    float productValue1 = floor(multiplyAddValue1 * 0.5);
    float scalarValue5 = floor(multiplyAddValue1);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue * productValue) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue1 * productValue1) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue5 * scalarValue5) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits8 * reinterpretedBits8) * fma(reinterpretedBits8, -2.0, 3.0)))) || ((multiplyAddValue33 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits24 = spvNMax(sampledTextureValue.w * uintBitsToFloat(reinterpretedBits23.w), 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits25 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z)));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits27 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26)) * (reinterpretedBits25 - reinterpretedBits26), 0.0, 1.0);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue56 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x)) / reinterpretedBits29) * reinterpretedBits29;
    float multiplyAddValue57 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y)) / reinterpretedBits29) * reinterpretedBits29;
    float productValue83 = floor(multiplyAddValue57 * 0.25);
    float productValue84 = floor(multiplyAddValue57 * 0.5);
    float scalarValue27 = floor(multiplyAddValue57);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue56 * 0.25), 0.5, (productValue83 * productValue83) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue56 * 0.5), 0.5, (productValue84 * productValue84) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue56), 0.5, (scalarValue27 * scalarValue27) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits27 * reinterpretedBits27) * fma(reinterpretedBits27, -2.0, 3.0)))) || ((reinterpretedBits24 < 0.5) && (scalarValue3 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    bool productValue63 = ((1.0 - scalarValue3) * (scalarValue21 + (scalarValue20 + scalarValue19))) > 0.0;
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue80 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.x), sampledTextureValue.x, -scalarValue19) + scalarValue19) : scalarValue19;
    float multiplyAddValue81 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.y), sampledTextureValue.y, -scalarValue20) + scalarValue20) : scalarValue20;
    float multiplyAddValue82 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.z), sampledTextureValue.z, -scalarValue21) + scalarValue21) : scalarValue21;
    float multiplyAddValue83 = spvNMax(productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.w), sampledTextureValue.w, -scalarValue3) + scalarValue3) : scalarValue3, 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits25 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z)));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits27 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26)) * (reinterpretedBits25 - reinterpretedBits26), 0.0, 1.0);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue56 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x)) / reinterpretedBits29) * reinterpretedBits29;
    float multiplyAddValue57 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y)) / reinterpretedBits29) * reinterpretedBits29;
    float productValue83 = floor(multiplyAddValue57 * 0.25);
    float productValue84 = floor(multiplyAddValue57 * 0.5);
    float scalarValue27 = floor(multiplyAddValue57);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((multiplyAddValue83 < 0.5) && (scalarValue3 < reinterpretedBits12)) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue56 * 0.25), 0.5, (productValue83 * productValue83) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue56 * 0.5), 0.5, (productValue84 * productValue84) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue56), 0.5, (scalarValue27 * scalarValue27) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits27 * reinterpretedBits27) * fma(reinterpretedBits27, -2.0, 3.0)))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits46 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits23.x);
    float reinterpretedBits47 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits23.y);
    float reinterpretedBits48 = sampledTextureValue.z * uintBitsToFloat(reinterpretedBits23.z);
    float reinterpretedBits49 = sampledTextureValue.w * uintBitsToFloat(reinterpretedBits23.w);
    float reinterpretedBits50 = spvNMax(reinterpretedBits49 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits25 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z)));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits27 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26)) * (reinterpretedBits25 - reinterpretedBits26), 0.0, 1.0);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue56 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x)) / reinterpretedBits29) * reinterpretedBits29;
    float multiplyAddValue57 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y)) / reinterpretedBits29) * reinterpretedBits29;
    float productValue83 = floor(multiplyAddValue57 * 0.25);
    float productValue84 = floor(multiplyAddValue57 * 0.5);
    float scalarValue27 = floor(multiplyAddValue57);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue56 * 0.25), 0.5, (productValue83 * productValue83) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue56 * 0.5), 0.5, (productValue84 * productValue84) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue56), 0.5, (scalarValue27 * scalarValue27) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits27 * reinterpretedBits27) * fma(reinterpretedBits27, -2.0, 3.0)))) || ((reinterpretedBits50 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    bool productValue63 = ((1.0 - scalarValue3) * (scalarValue21 + (scalarValue20 + scalarValue19))) > 0.0;
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue80 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.x), sampledTextureValue.x, -scalarValue19) + scalarValue19) : scalarValue19;
    float multiplyAddValue81 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.y), sampledTextureValue.y, -scalarValue20) + scalarValue20) : scalarValue20;
    float multiplyAddValue82 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.z), sampledTextureValue.z, -scalarValue21) + scalarValue21) : scalarValue21;
    float multiplyAddValue124 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.w), sampledTextureValue.w, -scalarValue3) + scalarValue3) : scalarValue3;
    float reinterpretedBits51 = spvNMax(multiplyAddValue124 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits25 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z)));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits27 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26)) * (reinterpretedBits25 - reinterpretedBits26), 0.0, 1.0);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue56 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x)) / reinterpretedBits29) * reinterpretedBits29;
    float multiplyAddValue57 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y)) / reinterpretedBits29) * reinterpretedBits29;
    float productValue83 = floor(multiplyAddValue57 * 0.25);
    float productValue84 = floor(multiplyAddValue57 * 0.5);
    float scalarValue27 = floor(multiplyAddValue57);
    if (((reinterpretedBits51 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue56 * 0.25), 0.5, (productValue83 * productValue83) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue56 * 0.5), 0.5, (productValue84 * productValue84) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue56), 0.5, (scalarValue27 * scalarValue27) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits27 * reinterpretedBits27) * fma(reinterpretedBits27, -2.0, 3.0)))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits46 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits23.x);
    float reinterpretedBits47 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits23.y);
    float reinterpretedBits48 = sampledTextureValue.z * uintBitsToFloat(reinterpretedBits23.z);
    float reinterpretedBits49 = sampledTextureValue.w * uintBitsToFloat(reinterpretedBits23.w);
    float reinterpretedBits50 = spvNMax(reinterpretedBits49 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits25 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z)));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits27 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26)) * (reinterpretedBits25 - reinterpretedBits26), 0.0, 1.0);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue56 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x)) / reinterpretedBits29) * reinterpretedBits29;
    float multiplyAddValue57 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y)) / reinterpretedBits29) * reinterpretedBits29;
    float productValue83 = floor(multiplyAddValue57 * 0.25);
    float productValue84 = floor(multiplyAddValue57 * 0.5);
    float scalarValue27 = floor(multiplyAddValue57);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((reinterpretedBits50 < 0.5) && (scalarValue3 < reinterpretedBits12)) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue56 * 0.25), 0.5, (productValue83 * productValue83) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue56 * 0.5), 0.5, (productValue84 * productValue84) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue56), 0.5, (scalarValue27 * scalarValue27) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits27 * reinterpretedBits27) * fma(reinterpretedBits27, -2.0, 3.0)))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    bool productValue63 = ((1.0 - scalarValue3) * (scalarValue21 + (scalarValue20 + scalarValue19))) > 0.0;
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue80 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.x), sampledTextureValue.x, -scalarValue19) + scalarValue19) : scalarValue19;
    float multiplyAddValue81 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.y), sampledTextureValue.y, -scalarValue20) + scalarValue20) : scalarValue20;
    float multiplyAddValue82 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.z), sampledTextureValue.z, -scalarValue21) + scalarValue21) : scalarValue21;
    float multiplyAddValue124 = productValue63 ? (fma(uintBitsToFloat(reinterpretedBits23.w), sampledTextureValue.w, -scalarValue3) + scalarValue3) : scalarValue3;
    float reinterpretedBits51 = spvNMax(multiplyAddValue124 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits25 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z)));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits27 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26)) * (reinterpretedBits25 - reinterpretedBits26), 0.0, 1.0);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue56 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x)) / reinterpretedBits29) * reinterpretedBits29;
    float multiplyAddValue57 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y)) / reinterpretedBits29) * reinterpretedBits29;
    float productValue83 = floor(multiplyAddValue57 * 0.25);
    float productValue84 = floor(multiplyAddValue57 * 0.5);
    float scalarValue27 = floor(multiplyAddValue57);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue56 * 0.25), 0.5, (productValue83 * productValue83) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue56 * 0.5), 0.5, (productValue84 * productValue84) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue56), 0.5, (scalarValue27 * scalarValue27) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits27 * reinterpretedBits27) * fma(reinterpretedBits27, -2.0, 3.0)))) || ((reinterpretedBits51 < 0.5) && (scalarValue3 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits46 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits23.x);
    float reinterpretedBits47 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits23.y);
    float reinterpretedBits56 = spvNMax(sampledTextureValue.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits25 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z)));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits27 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26)) * (reinterpretedBits25 - reinterpretedBits26), 0.0, 1.0);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue56 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x)) / reinterpretedBits29) * reinterpretedBits29;
    float multiplyAddValue57 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y)) / reinterpretedBits29) * reinterpretedBits29;
    float productValue83 = floor(multiplyAddValue57 * 0.25);
    float productValue84 = floor(multiplyAddValue57 * 0.5);
    float scalarValue27 = floor(multiplyAddValue57);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue56 * 0.25), 0.5, (productValue83 * productValue83) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue56 * 0.5), 0.5, (productValue84 * productValue84) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue56), 0.5, (scalarValue27 * scalarValue27) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits27 * reinterpretedBits27) * fma(reinterpretedBits27, -2.0, 3.0)))) || ((reinterpretedBits56 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    bool productValue231 = ((scalarValue21 + (scalarValue20 + scalarValue19)) * (1.0 - scalarValue3)) > 0.0;
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue225 = productValue231 ? (fma(uintBitsToFloat(reinterpretedBits23.x), sampledTextureValue.x, -scalarValue19) + scalarValue19) : scalarValue19;
    float multiplyAddValue226 = productValue231 ? (fma(uintBitsToFloat(reinterpretedBits23.y), sampledTextureValue.y, -scalarValue20) + scalarValue20) : scalarValue20;
    float multiplyAddValue227 = spvNMax(productValue231 ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), sampledTextureValue.w, -scalarValue3) + scalarValue3) : scalarValue3, 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits25 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z)));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits27 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26)) * (reinterpretedBits25 - reinterpretedBits26), 0.0, 1.0);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue56 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x)) / reinterpretedBits29) * reinterpretedBits29;
    float multiplyAddValue57 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y)) / reinterpretedBits29) * reinterpretedBits29;
    float productValue83 = floor(multiplyAddValue57 * 0.25);
    float productValue84 = floor(multiplyAddValue57 * 0.5);
    float scalarValue27 = floor(multiplyAddValue57);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue56 * 0.25), 0.5, (productValue83 * productValue83) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue56 * 0.5), 0.5, (productValue84 * productValue84) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue56), 0.5, (scalarValue27 * scalarValue27) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits27 * reinterpretedBits27) * fma(reinterpretedBits27, -2.0, 3.0)))) || ((multiplyAddValue227 < 0.5) && (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits46 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits23.x);
    float reinterpretedBits47 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits23.y);
    float reinterpretedBits56 = spvNMax(sampledTextureValue.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue1.w;
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits25 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z)));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits27 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26)) * (reinterpretedBits25 - reinterpretedBits26), 0.0, 1.0);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue56 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x)) / reinterpretedBits29) * reinterpretedBits29;
    float multiplyAddValue57 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y)) / reinterpretedBits29) * reinterpretedBits29;
    float productValue83 = floor(multiplyAddValue57 * 0.25);
    float productValue84 = floor(multiplyAddValue57 * 0.5);
    float scalarValue27 = floor(multiplyAddValue57);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((reinterpretedBits56 < 0.5) && (scalarValue3 < reinterpretedBits12)) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue56 * 0.25), 0.5, (productValue83 * productValue83) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue56 * 0.5), 0.5, (productValue84 * productValue84) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue56), 0.5, (scalarValue27 * scalarValue27) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits27 * reinterpretedBits27) * fma(reinterpretedBits27, -2.0, 3.0)))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue19 = sampledTextureValue1.x;
    float scalarValue20 = sampledTextureValue1.y;
    float scalarValue21 = sampledTextureValue1.z;
    float scalarValue3 = sampledTextureValue1.w;
    bool productValue231 = ((scalarValue21 + (scalarValue20 + scalarValue19)) * (1.0 - scalarValue3)) > 0.0;
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue225 = productValue231 ? (fma(uintBitsToFloat(reinterpretedBits23.x), sampledTextureValue.x, -scalarValue19) + scalarValue19) : scalarValue19;
    float multiplyAddValue226 = productValue231 ? (fma(uintBitsToFloat(reinterpretedBits23.y), sampledTextureValue.y, -scalarValue20) + scalarValue20) : scalarValue20;
    float multiplyAddValue227 = spvNMax(productValue231 ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), sampledTextureValue.w, -scalarValue3) + scalarValue3) : scalarValue3, 0.0);
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits2, reinterpretedBits3, reinterpretedBits4);
    float scalarValue4 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue4);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits25 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits2), -(inverseLengthValue * reinterpretedBits3), -(inverseLengthValue * reinterpretedBits4)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits13.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits13.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits13.z)));
    float reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits27 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits26)) * (reinterpretedBits25 - reinterpretedBits26), 0.0, 1.0);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue56 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.x)) / reinterpretedBits29) * reinterpretedBits29;
    float multiplyAddValue57 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits28.y)) / reinterpretedBits29) * reinterpretedBits29;
    float productValue83 = floor(multiplyAddValue57 * 0.25);
    float productValue84 = floor(multiplyAddValue57 * 0.5);
    float scalarValue27 = floor(multiplyAddValue57);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue56 * 0.25), 0.5, (productValue83 * productValue83) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue56 * 0.5), 0.5, (productValue84 * productValue84) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue56), 0.5, (scalarValue27 * scalarValue27) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits27 * reinterpretedBits27) * fma(reinterpretedBits27, -2.0, 3.0)))) || ((multiplyAddValue227 < 0.5) && (scalarValue3 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue2 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue3 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue13 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[16u].z;
    float productValue14 = spvNMax(0.0, sampledTextureValue3.w * fragmentVectorConstants1.packedValues[16u].w);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.w;
    float productValue15 = ((sampledTextureValue4.x - productValue2) * scalarValue7) + productValue2;
    float productValue16 = ((sampledTextureValue4.y - productValue3) * scalarValue7) + productValue3;
    float productValue17 = ((sampledTextureValue4.z - productValue13) * scalarValue7) + productValue13;
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue5.w;
    float productValue18 = (((sampledTextureValue5.x - productValue15) * scalarValue8) + productValue15) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue19 = (((sampledTextureValue5.y - productValue16) * scalarValue8) + productValue16) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue20 = (((sampledTextureValue5.z - productValue17) * scalarValue8) + productValue17) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue21 = (((fragmentVectorConstants1.packedValues[8u].x - productValue18) * fragmentVectorConstants1.packedValues[8u].w) + productValue18) * varyingColor3.x;
    float productValue22 = (((fragmentVectorConstants1.packedValues[8u].y - productValue19) * fragmentVectorConstants1.packedValues[8u].w) + productValue19) * varyingColor3.y;
    float productValue23 = (((fragmentVectorConstants1.packedValues[8u].z - productValue20) * fragmentVectorConstants1.packedValues[8u].w) + productValue20) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue24 = floor(quotientValue1 * 0.25);
        float productValue25 = floor(quotientValue1 * 0.5);
        float scalarValue9 = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue25 * productValue25) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue24 * productValue24) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue9 * scalarValue9) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((productValue14 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[9u].x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    float productValue26 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0 - scalarValue7)) > 0.0);
    float productValue27 = productValue26 * ((sampledTextureValue3.x * fragmentVectorConstants1.packedValues[16u].x) - scalarValue10);
    float productValue28 = productValue26 * ((sampledTextureValue3.y * fragmentVectorConstants1.packedValues[16u].y) - scalarValue11);
    float productValue29 = productValue26 * ((sampledTextureValue3.z * fragmentVectorConstants1.packedValues[16u].z) - scalarValue12);
    float productValue30 = spvNMax(0.0, (productValue26 * ((sampledTextureValue3.w * fragmentVectorConstants1.packedValues[16u].w) - scalarValue7)) + scalarValue7);
    float productValue31 = (productValue27 + scalarValue10) - (productValue27 * scalarValue7);
    float productValue32 = (productValue28 + scalarValue11) - (productValue28 * scalarValue7);
    float productValue33 = (productValue29 + scalarValue12) - (productValue29 * scalarValue7);
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue5.w;
    float productValue34 = (((sampledTextureValue5.x - productValue31) * scalarValue8) + productValue31) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue35 = (((sampledTextureValue5.y - productValue32) * scalarValue8) + productValue32) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue36 = (((sampledTextureValue5.z - productValue33) * scalarValue8) + productValue33) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue37 = (((fragmentVectorConstants1.packedValues[8u].x - productValue34) * fragmentVectorConstants1.packedValues[8u].w) + productValue34) * varyingColor3.x;
    float productValue38 = (((fragmentVectorConstants1.packedValues[8u].y - productValue35) * fragmentVectorConstants1.packedValues[8u].w) + productValue35) * varyingColor3.y;
    float productValue39 = (((fragmentVectorConstants1.packedValues[8u].z - productValue36) * fragmentVectorConstants1.packedValues[8u].w) + productValue36) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue24 = floor(quotientValue1 * 0.25);
        float productValue25 = floor(quotientValue1 * 0.5);
        float scalarValue9 = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue25 * productValue25) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue24 * productValue24) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue9 * scalarValue9) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((productValue30 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[9u].x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue71 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue72 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue73 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue74 = spvNMax(0.0, sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.w;
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue5.x;
    float scalarValue24 = sampledTextureValue5.y;
    float scalarValue25 = sampledTextureValue5.z;
    float scalarValue8 = sampledTextureValue5.w;
    float productValue4;
    float productValue5;
    float productValue6;
    if (scalarValue8 > fragmentVectorConstants1.packedValues[10u].x)
    {
        productValue4 = (((fragmentVectorConstants1.packedValues[4u].x * scalarValue23) - scalarValue23) * scalarValue8) + scalarValue23;
        productValue5 = (((fragmentVectorConstants1.packedValues[4u].y * scalarValue24) - scalarValue24) * scalarValue8) + scalarValue24;
        productValue6 = (((fragmentVectorConstants1.packedValues[4u].z * scalarValue25) - scalarValue25) * scalarValue8) + scalarValue25;
    }
    else
    {
        productValue4 = ((sampledTextureValue4.x - productValue71) * scalarValue7) + productValue71;
        productValue5 = ((sampledTextureValue4.y - productValue72) * scalarValue7) + productValue72;
        productValue6 = ((sampledTextureValue4.z - productValue73) * scalarValue7) + productValue73;
    }
    float productValue75 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue4;
    float productValue76 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue5;
    float productValue77 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue6;
    float productValue78 = (((fragmentVectorConstants1.packedValues[9u].x - productValue75) * fragmentVectorConstants1.packedValues[9u].w) + productValue75) * varyingColor3.x;
    float productValue79 = (((fragmentVectorConstants1.packedValues[9u].y - productValue76) * fragmentVectorConstants1.packedValues[9u].w) + productValue76) * varyingColor3.y;
    float productValue80 = (((fragmentVectorConstants1.packedValues[9u].z - productValue77) * fragmentVectorConstants1.packedValues[9u].w) + productValue77) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue81 = floor(quotientValue8 * 0.25);
        float productValue82 = floor(quotientValue8 * 0.5);
        float scalarValue26 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue82 * productValue82) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue74 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[10u].x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    float productValue26 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0 - scalarValue7)) > 0.0);
    float productValue105 = productValue26 * ((sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue10);
    float productValue106 = productValue26 * ((sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue11);
    float productValue107 = productValue26 * ((sampledTextureValue3.z * fragmentVectorConstants1.packedValues[17u].z) - scalarValue12);
    float productValue108 = spvNMax(0.0, (productValue26 * ((sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue7)) + scalarValue7);
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue5.x;
    float scalarValue24 = sampledTextureValue5.y;
    float scalarValue25 = sampledTextureValue5.z;
    float scalarValue8 = sampledTextureValue5.w;
    float productValue5;
    float productValue6;
    float productValue7;
    if (scalarValue8 > fragmentVectorConstants1.packedValues[10u].x)
    {
        productValue5 = (((fragmentVectorConstants1.packedValues[4u].x * scalarValue23) - scalarValue23) * scalarValue8) + scalarValue23;
        productValue6 = (((fragmentVectorConstants1.packedValues[4u].y * scalarValue24) - scalarValue24) * scalarValue8) + scalarValue24;
        productValue7 = (((fragmentVectorConstants1.packedValues[4u].z * scalarValue25) - scalarValue25) * scalarValue8) + scalarValue25;
    }
    else
    {
        productValue5 = (productValue105 + scalarValue10) - (productValue105 * scalarValue7);
        productValue6 = (productValue106 + scalarValue11) - (productValue106 * scalarValue7);
        productValue7 = (productValue107 + scalarValue12) - (productValue107 * scalarValue7);
    }
    float productValue109 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue5;
    float productValue110 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue6;
    float productValue111 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue7;
    float productValue112 = (((fragmentVectorConstants1.packedValues[9u].x - productValue109) * fragmentVectorConstants1.packedValues[9u].w) + productValue109) * varyingColor3.x;
    float productValue113 = (((fragmentVectorConstants1.packedValues[9u].y - productValue110) * fragmentVectorConstants1.packedValues[9u].w) + productValue110) * varyingColor3.y;
    float productValue114 = (((fragmentVectorConstants1.packedValues[9u].z - productValue111) * fragmentVectorConstants1.packedValues[9u].w) + productValue111) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue81 = floor(quotientValue8 * 0.25);
        float productValue82 = floor(quotientValue8 * 0.5);
        float scalarValue26 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue82 * productValue82) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue108 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[10u].x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue71 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue72 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue73 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue115 = sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w;
    float productValue116 = (((productValue71 * fragmentVectorConstants1.packedValues[4u].x) - productValue71) * productValue115) + productValue71;
    float productValue117 = (((productValue72 * fragmentVectorConstants1.packedValues[4u].y) - productValue72) * productValue115) + productValue72;
    float productValue118 = (((productValue73 * fragmentVectorConstants1.packedValues[4u].z) - productValue73) * productValue115) + productValue73;
    float productValue119 = spvNMax(0.0, productValue115 * fragmentVectorConstants1.packedValues[4u].w);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.w;
    float productValue120 = ((sampledTextureValue4.x - productValue116) * scalarValue7) + productValue116;
    float productValue121 = ((sampledTextureValue4.y - productValue117) * scalarValue7) + productValue117;
    float productValue122 = ((sampledTextureValue4.z - productValue118) * scalarValue7) + productValue118;
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue5.w;
    float productValue123 = (((sampledTextureValue5.x - productValue120) * scalarValue8) + productValue120) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue124 = (((sampledTextureValue5.y - productValue121) * scalarValue8) + productValue121) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue125 = (((sampledTextureValue5.z - productValue122) * scalarValue8) + productValue122) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue126 = (((fragmentVectorConstants1.packedValues[9u].x - productValue123) * fragmentVectorConstants1.packedValues[9u].w) + productValue123) * varyingColor3.x;
    float productValue127 = (((fragmentVectorConstants1.packedValues[9u].y - productValue124) * fragmentVectorConstants1.packedValues[9u].w) + productValue124) * varyingColor3.y;
    float productValue128 = (((fragmentVectorConstants1.packedValues[9u].z - productValue125) * fragmentVectorConstants1.packedValues[9u].w) + productValue125) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue81 = floor(quotientValue8 * 0.25);
        float productValue82 = floor(quotientValue8 * 0.5);
        float scalarValue26 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue82 * productValue82) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((productValue119 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[10u].x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    float productValue26 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0 - scalarValue7)) > 0.0);
    float productValue141 = (productValue26 * ((sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue10)) + scalarValue10;
    float productValue142 = (productValue26 * ((sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue11)) + scalarValue11;
    float productValue143 = (productValue26 * ((sampledTextureValue3.z * fragmentVectorConstants1.packedValues[17u].z) - scalarValue12)) + scalarValue12;
    float productValue144 = (productValue26 * ((sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue7)) + scalarValue7;
    float productValue145 = (((productValue141 * fragmentVectorConstants1.packedValues[4u].x) - productValue141) * productValue144) + productValue141;
    float productValue146 = (((productValue142 * fragmentVectorConstants1.packedValues[4u].y) - productValue142) * productValue144) + productValue142;
    float productValue147 = (((productValue143 * fragmentVectorConstants1.packedValues[4u].z) - productValue143) * productValue144) + productValue143;
    float productValue148 = spvNMax(0.0, productValue144 * fragmentVectorConstants1.packedValues[4u].w);
    float productValue149 = ((scalarValue10 - productValue145) * scalarValue7) + productValue145;
    float productValue150 = ((scalarValue11 - productValue146) * scalarValue7) + productValue146;
    float productValue151 = ((scalarValue12 - productValue147) * scalarValue7) + productValue147;
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue5.w;
    float productValue152 = (((sampledTextureValue5.x - productValue149) * scalarValue8) + productValue149) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue153 = (((sampledTextureValue5.y - productValue150) * scalarValue8) + productValue150) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue154 = (((sampledTextureValue5.z - productValue151) * scalarValue8) + productValue151) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue155 = (((fragmentVectorConstants1.packedValues[9u].x - productValue152) * fragmentVectorConstants1.packedValues[9u].w) + productValue152) * varyingColor3.x;
    float productValue156 = (((fragmentVectorConstants1.packedValues[9u].y - productValue153) * fragmentVectorConstants1.packedValues[9u].w) + productValue153) * varyingColor3.y;
    float productValue157 = (((fragmentVectorConstants1.packedValues[9u].z - productValue154) * fragmentVectorConstants1.packedValues[9u].w) + productValue154) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue81 = floor(quotientValue8 * 0.25);
        float productValue82 = floor(quotientValue8 * 0.5);
        float scalarValue26 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue82 * productValue82) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((productValue148 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[10u].x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue71 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue72 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue73 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue115 = sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w;
    float productValue116 = (((productValue71 * fragmentVectorConstants1.packedValues[4u].x) - productValue71) * productValue115) + productValue71;
    float productValue117 = (((productValue72 * fragmentVectorConstants1.packedValues[4u].y) - productValue72) * productValue115) + productValue72;
    float productValue118 = (((productValue73 * fragmentVectorConstants1.packedValues[4u].z) - productValue73) * productValue115) + productValue73;
    float productValue119 = spvNMax(0.0, productValue115 * fragmentVectorConstants1.packedValues[4u].w);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.w;
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue5.x;
    float scalarValue24 = sampledTextureValue5.y;
    float scalarValue25 = sampledTextureValue5.z;
    float scalarValue8 = sampledTextureValue5.w;
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue8 > fragmentVectorConstants1.packedValues[10u].x)
    {
        productValue8 = (((scalarValue23 * fragmentVectorConstants1.packedValues[4u].x) - scalarValue23) * scalarValue8) + scalarValue23;
        productValue9 = (((scalarValue24 * fragmentVectorConstants1.packedValues[4u].y) - scalarValue24) * scalarValue8) + scalarValue24;
        productValue10 = (((scalarValue25 * fragmentVectorConstants1.packedValues[4u].z) - scalarValue25) * scalarValue8) + scalarValue25;
    }
    else
    {
        productValue8 = ((sampledTextureValue4.x - productValue116) * scalarValue7) + productValue116;
        productValue9 = ((sampledTextureValue4.y - productValue117) * scalarValue7) + productValue117;
        productValue10 = ((sampledTextureValue4.z - productValue118) * scalarValue7) + productValue118;
    }
    float productValue164 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue8;
    float productValue165 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue9;
    float productValue166 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue10;
    float productValue167 = (((fragmentVectorConstants1.packedValues[9u].x - productValue164) * fragmentVectorConstants1.packedValues[9u].w) + productValue164) * varyingColor3.x;
    float productValue168 = (((fragmentVectorConstants1.packedValues[9u].y - productValue165) * fragmentVectorConstants1.packedValues[9u].w) + productValue165) * varyingColor3.y;
    float productValue169 = (((fragmentVectorConstants1.packedValues[9u].z - productValue166) * fragmentVectorConstants1.packedValues[9u].w) + productValue166) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue81 = floor(quotientValue8 * 0.25);
        float productValue82 = floor(quotientValue8 * 0.5);
        float scalarValue26 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue82 * productValue82) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue119 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[10u].x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    float productValue26 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0 - scalarValue7)) > 0.0);
    float productValue141 = (productValue26 * ((sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue10)) + scalarValue10;
    float productValue142 = (productValue26 * ((sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue11)) + scalarValue11;
    float productValue143 = (productValue26 * ((sampledTextureValue3.z * fragmentVectorConstants1.packedValues[17u].z) - scalarValue12)) + scalarValue12;
    float productValue144 = (productValue26 * ((sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue7)) + scalarValue7;
    float productValue145 = (((productValue141 * fragmentVectorConstants1.packedValues[4u].x) - productValue141) * productValue144) + productValue141;
    float productValue146 = (((productValue142 * fragmentVectorConstants1.packedValues[4u].y) - productValue142) * productValue144) + productValue142;
    float productValue147 = (((productValue143 * fragmentVectorConstants1.packedValues[4u].z) - productValue143) * productValue144) + productValue143;
    float productValue148 = spvNMax(0.0, productValue144 * fragmentVectorConstants1.packedValues[4u].w);
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue5.x;
    float scalarValue24 = sampledTextureValue5.y;
    float scalarValue25 = sampledTextureValue5.z;
    float scalarValue8 = sampledTextureValue5.w;
    float productValue9;
    float productValue10;
    float productValue11;
    if (scalarValue8 > fragmentVectorConstants1.packedValues[10u].x)
    {
        productValue9 = (((scalarValue23 * fragmentVectorConstants1.packedValues[4u].x) - scalarValue23) * scalarValue8) + scalarValue23;
        productValue10 = (((scalarValue24 * fragmentVectorConstants1.packedValues[4u].y) - scalarValue24) * scalarValue8) + scalarValue24;
        productValue11 = (((scalarValue25 * fragmentVectorConstants1.packedValues[4u].z) - scalarValue25) * scalarValue8) + scalarValue25;
    }
    else
    {
        productValue9 = ((scalarValue10 - productValue145) * scalarValue7) + productValue145;
        productValue10 = ((scalarValue11 - productValue146) * scalarValue7) + productValue146;
        productValue11 = ((scalarValue12 - productValue147) * scalarValue7) + productValue147;
    }
    float productValue170 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue9;
    float productValue171 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue10;
    float productValue172 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue11;
    float productValue173 = (((fragmentVectorConstants1.packedValues[9u].x - productValue170) * fragmentVectorConstants1.packedValues[9u].w) + productValue170) * varyingColor3.x;
    float productValue174 = (((fragmentVectorConstants1.packedValues[9u].y - productValue171) * fragmentVectorConstants1.packedValues[9u].w) + productValue171) * varyingColor3.y;
    float productValue175 = (((fragmentVectorConstants1.packedValues[9u].z - productValue172) * fragmentVectorConstants1.packedValues[9u].w) + productValue172) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue81 = floor(quotientValue8 * 0.25);
        float productValue82 = floor(quotientValue8 * 0.5);
        float scalarValue26 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue82 * productValue82) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue148 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[10u].x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue71 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue72 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue188 = fragmentVectorConstants1.packedValues[4u].x * productValue71;
    float productValue189 = fragmentVectorConstants1.packedValues[4u].y * productValue71;
    float productValue190 = fragmentVectorConstants1.packedValues[4u].z * productValue71;
    float scalarValue39 = ceil(productValue72);
    float productValue191 = (((productValue72 * fragmentVectorConstants1.packedValues[18u].x) - productValue188) * scalarValue39) + productValue188;
    float productValue192 = (((productValue72 * fragmentVectorConstants1.packedValues[18u].y) - productValue189) * scalarValue39) + productValue189;
    float productValue193 = (((productValue72 * fragmentVectorConstants1.packedValues[18u].z) - productValue190) * scalarValue39) + productValue190;
    float productValue74 = spvNMax(0.0, sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.w;
    float productValue194 = ((sampledTextureValue4.x - productValue191) * scalarValue7) + productValue191;
    float productValue195 = ((sampledTextureValue4.y - productValue192) * scalarValue7) + productValue192;
    float productValue196 = ((sampledTextureValue4.z - productValue193) * scalarValue7) + productValue193;
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue5.w;
    float productValue197 = (((sampledTextureValue5.x - productValue194) * scalarValue8) + productValue194) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue198 = (((sampledTextureValue5.y - productValue195) * scalarValue8) + productValue195) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue199 = (((sampledTextureValue5.z - productValue196) * scalarValue8) + productValue196) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue200 = (((fragmentVectorConstants1.packedValues[9u].x - productValue197) * fragmentVectorConstants1.packedValues[9u].w) + productValue197) * varyingColor3.x;
    float productValue201 = (((fragmentVectorConstants1.packedValues[9u].y - productValue198) * fragmentVectorConstants1.packedValues[9u].w) + productValue198) * varyingColor3.y;
    float productValue202 = (((fragmentVectorConstants1.packedValues[9u].z - productValue199) * fragmentVectorConstants1.packedValues[9u].w) + productValue199) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue81 = floor(quotientValue8 * 0.25);
        float productValue82 = floor(quotientValue8 * 0.5);
        float scalarValue26 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue82 * productValue82) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((productValue74 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[10u].x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    float productValue26 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0 - scalarValue7)) > 0.0);
    float productValue141 = (productValue26 * ((sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue10)) + scalarValue10;
    float productValue142 = (productValue26 * ((sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue11)) + scalarValue11;
    float productValue203 = productValue141 * fragmentVectorConstants1.packedValues[4u].x;
    float productValue204 = productValue141 * fragmentVectorConstants1.packedValues[4u].y;
    float productValue205 = productValue141 * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue41 = ceil(productValue142);
    float productValue206 = (((productValue142 * fragmentVectorConstants1.packedValues[18u].x) - productValue203) * scalarValue41) + productValue203;
    float productValue207 = (((productValue142 * fragmentVectorConstants1.packedValues[18u].y) - productValue204) * scalarValue41) + productValue204;
    float productValue208 = (((productValue142 * fragmentVectorConstants1.packedValues[18u].z) - productValue205) * scalarValue41) + productValue205;
    float productValue108 = spvNMax(0.0, (productValue26 * ((sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue7)) + scalarValue7);
    float productValue209 = ((scalarValue10 - productValue206) * scalarValue7) + productValue206;
    float productValue210 = ((scalarValue11 - productValue207) * scalarValue7) + productValue207;
    float productValue211 = ((scalarValue12 - productValue208) * scalarValue7) + productValue208;
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue5.w;
    float productValue212 = (((sampledTextureValue5.x - productValue209) * scalarValue8) + productValue209) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue213 = (((sampledTextureValue5.y - productValue210) * scalarValue8) + productValue210) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue214 = (((sampledTextureValue5.z - productValue211) * scalarValue8) + productValue211) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue215 = (((fragmentVectorConstants1.packedValues[9u].x - productValue212) * fragmentVectorConstants1.packedValues[9u].w) + productValue212) * varyingColor3.x;
    float productValue216 = (((fragmentVectorConstants1.packedValues[9u].y - productValue213) * fragmentVectorConstants1.packedValues[9u].w) + productValue213) * varyingColor3.y;
    float productValue217 = (((fragmentVectorConstants1.packedValues[9u].z - productValue214) * fragmentVectorConstants1.packedValues[9u].w) + productValue214) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue81 = floor(quotientValue8 * 0.25);
        float productValue82 = floor(quotientValue8 * 0.5);
        float scalarValue26 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue82 * productValue82) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((productValue108 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[10u].x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue71 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue72 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue188 = fragmentVectorConstants1.packedValues[4u].x * productValue71;
    float productValue189 = fragmentVectorConstants1.packedValues[4u].y * productValue71;
    float productValue190 = fragmentVectorConstants1.packedValues[4u].z * productValue71;
    float scalarValue39 = ceil(productValue72);
    float productValue191 = (((productValue72 * fragmentVectorConstants1.packedValues[18u].x) - productValue188) * scalarValue39) + productValue188;
    float productValue192 = (((productValue72 * fragmentVectorConstants1.packedValues[18u].y) - productValue189) * scalarValue39) + productValue189;
    float productValue193 = (((productValue72 * fragmentVectorConstants1.packedValues[18u].z) - productValue190) * scalarValue39) + productValue190;
    float productValue74 = spvNMax(0.0, sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue4.w;
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue5.x;
    float scalarValue24 = sampledTextureValue5.y;
    float scalarValue25 = sampledTextureValue5.z;
    float scalarValue8 = sampledTextureValue5.w;
    float productValue9;
    float productValue10;
    float productValue11;
    if (scalarValue8 > fragmentVectorConstants1.packedValues[10u].x)
    {
        productValue9 = (((scalarValue23 * fragmentVectorConstants1.packedValues[4u].x) - scalarValue23) * scalarValue8) + scalarValue23;
        productValue10 = (((scalarValue24 * fragmentVectorConstants1.packedValues[4u].y) - scalarValue24) * scalarValue8) + scalarValue24;
        productValue11 = (((scalarValue25 * fragmentVectorConstants1.packedValues[4u].z) - scalarValue25) * scalarValue8) + scalarValue25;
    }
    else
    {
        productValue9 = ((sampledTextureValue4.x - productValue191) * scalarValue7) + productValue191;
        productValue10 = ((sampledTextureValue4.y - productValue192) * scalarValue7) + productValue192;
        productValue11 = ((sampledTextureValue4.z - productValue193) * scalarValue7) + productValue193;
    }
    float productValue170 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue9;
    float productValue171 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue10;
    float productValue172 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue11;
    float productValue173 = (((fragmentVectorConstants1.packedValues[9u].x - productValue170) * fragmentVectorConstants1.packedValues[9u].w) + productValue170) * varyingColor3.x;
    float productValue174 = (((fragmentVectorConstants1.packedValues[9u].y - productValue171) * fragmentVectorConstants1.packedValues[9u].w) + productValue171) * varyingColor3.y;
    float productValue175 = (((fragmentVectorConstants1.packedValues[9u].z - productValue172) * fragmentVectorConstants1.packedValues[9u].w) + productValue172) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue81 = floor(quotientValue8 * 0.25);
        float productValue82 = floor(quotientValue8 * 0.5);
        float scalarValue26 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue82 * productValue82) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue74 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[10u].x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue4.x;
    float scalarValue11 = sampledTextureValue4.y;
    float scalarValue12 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    float productValue26 = float((((scalarValue10 + scalarValue11) + scalarValue12) * (1.0 - scalarValue7)) > 0.0);
    float productValue141 = (productValue26 * ((sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue10)) + scalarValue10;
    float productValue142 = (productValue26 * ((sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue11)) + scalarValue11;
    float productValue203 = productValue141 * fragmentVectorConstants1.packedValues[4u].x;
    float productValue204 = productValue141 * fragmentVectorConstants1.packedValues[4u].y;
    float productValue205 = productValue141 * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue41 = ceil(productValue142);
    float productValue206 = (((productValue142 * fragmentVectorConstants1.packedValues[18u].x) - productValue203) * scalarValue41) + productValue203;
    float productValue207 = (((productValue142 * fragmentVectorConstants1.packedValues[18u].y) - productValue204) * scalarValue41) + productValue204;
    float productValue208 = (((productValue142 * fragmentVectorConstants1.packedValues[18u].z) - productValue205) * scalarValue41) + productValue205;
    float productValue108 = spvNMax(0.0, (productValue26 * ((sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue7)) + scalarValue7);
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue5.x;
    float scalarValue24 = sampledTextureValue5.y;
    float scalarValue25 = sampledTextureValue5.z;
    float scalarValue8 = sampledTextureValue5.w;
    float productValue10;
    float productValue11;
    float productValue12;
    if (scalarValue8 > fragmentVectorConstants1.packedValues[10u].x)
    {
        productValue10 = (((scalarValue23 * fragmentVectorConstants1.packedValues[4u].x) - scalarValue23) * scalarValue8) + scalarValue23;
        productValue11 = (((scalarValue24 * fragmentVectorConstants1.packedValues[4u].y) - scalarValue24) * scalarValue8) + scalarValue24;
        productValue12 = (((scalarValue25 * fragmentVectorConstants1.packedValues[4u].z) - scalarValue25) * scalarValue8) + scalarValue25;
    }
    else
    {
        productValue10 = ((scalarValue10 - productValue206) * scalarValue7) + productValue206;
        productValue11 = ((scalarValue11 - productValue207) * scalarValue7) + productValue207;
        productValue12 = ((scalarValue12 - productValue208) * scalarValue7) + productValue208;
    }
    float productValue244 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue10;
    float productValue245 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue11;
    float productValue246 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue12;
    float productValue247 = (((fragmentVectorConstants1.packedValues[9u].x - productValue244) * fragmentVectorConstants1.packedValues[9u].w) + productValue244) * varyingColor3.x;
    float productValue248 = (((fragmentVectorConstants1.packedValues[9u].y - productValue245) * fragmentVectorConstants1.packedValues[9u].w) + productValue245) * varyingColor3.y;
    float productValue249 = (((fragmentVectorConstants1.packedValues[9u].z - productValue246) * fragmentVectorConstants1.packedValues[9u].w) + productValue246) * varyingColor3.z;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue81 = floor(quotientValue8 * 0.25);
        float productValue82 = floor(quotientValue8 * 0.5);
        float scalarValue26 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue82 * productValue82) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue81 * productValue81) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue108 < 0.5) && (scalarValue7 < fragmentVectorConstants1.packedValues[10u].x)) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue18 = fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits11.x), scalarValue, sampledTextureValue1.x), reinterpretedBits15);
    float multiplyAddValue19 = fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits11.y), scalarValue1, sampledTextureValue1.y), reinterpretedBits16);
    float multiplyAddValue20 = fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits11.z), scalarValue2, sampledTextureValue1.z), reinterpretedBits17);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    precise float sumValue1 = sampledTextureValue2.x - multiplyAddValue18;
    precise float sumValue2 = sampledTextureValue2.y - multiplyAddValue19;
    precise float sumValue3 = sampledTextureValue2.z - multiplyAddValue20;
    float multiplyAddValue21 = fma(scalarValue6, sumValue1, multiplyAddValue18);
    float multiplyAddValue22 = fma(scalarValue6, sumValue2, multiplyAddValue19);
    float multiplyAddValue23 = fma(scalarValue6, sumValue3, multiplyAddValue20);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue24 = fma(reinterpretedBits12, sumValue4, 1.0);
    float multiplyAddValue25 = fma(reinterpretedBits12, sumValue5, 1.0);
    float multiplyAddValue26 = fma(reinterpretedBits12, sumValue6, 1.0);
    precise float productValue57 = multiplyAddValue21 * multiplyAddValue24;
    precise float productValue58 = multiplyAddValue22 * multiplyAddValue25;
    precise float productValue59 = multiplyAddValue23 * multiplyAddValue26;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue27 = fma(reinterpretedBits14, fma(-multiplyAddValue21, multiplyAddValue24, uintBitsToFloat(reinterpretedBits13.x)), productValue57);
    float multiplyAddValue28 = fma(reinterpretedBits14, fma(-multiplyAddValue22, multiplyAddValue25, uintBitsToFloat(reinterpretedBits13.y)), productValue58);
    float multiplyAddValue29 = fma(reinterpretedBits14, fma(-multiplyAddValue23, multiplyAddValue26, uintBitsToFloat(reinterpretedBits13.z)), productValue59);
    precise float productValue60 = multiplyAddValue27 * varyingColor3.x;
    precise float productValue61 = multiplyAddValue28 * varyingColor3.y;
    precise float productValue62 = multiplyAddValue29 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue27, varyingColor3.x, varyingColor2.x), productValue60);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue28, varyingColor3.y, varyingColor2.y), productValue61);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue29, varyingColor3.z, varyingColor2.z), productValue62);
    fragmentColor0.w = scalarValue13;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue10 = scalarValue19 - multiplyAddValue43;
    precise float sumValue11 = scalarValue20 - multiplyAddValue44;
    precise float sumValue12 = scalarValue21 - multiplyAddValue45;
    float multiplyAddValue47 = fma(scalarValue3, sumValue10, multiplyAddValue43);
    float multiplyAddValue48 = fma(scalarValue3, sumValue11, multiplyAddValue44);
    float multiplyAddValue49 = fma(scalarValue3, sumValue12, multiplyAddValue45);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    precise float sumValue13 = sampledTextureValue2.x - multiplyAddValue47;
    precise float sumValue14 = sampledTextureValue2.y - multiplyAddValue48;
    precise float sumValue15 = sampledTextureValue2.z - multiplyAddValue49;
    float multiplyAddValue50 = fma(scalarValue6, sumValue13, multiplyAddValue47);
    float multiplyAddValue51 = fma(scalarValue6, sumValue14, multiplyAddValue48);
    float multiplyAddValue52 = fma(scalarValue6, sumValue15, multiplyAddValue49);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue24 = fma(reinterpretedBits12, sumValue4, 1.0);
    float multiplyAddValue25 = fma(reinterpretedBits12, sumValue5, 1.0);
    float multiplyAddValue26 = fma(reinterpretedBits12, sumValue6, 1.0);
    precise float productValue65 = multiplyAddValue50 * multiplyAddValue24;
    precise float productValue66 = multiplyAddValue51 * multiplyAddValue25;
    precise float productValue67 = multiplyAddValue52 * multiplyAddValue26;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue53 = fma(reinterpretedBits14, fma(-multiplyAddValue50, multiplyAddValue24, uintBitsToFloat(reinterpretedBits13.x)), productValue65);
    float multiplyAddValue54 = fma(reinterpretedBits14, fma(-multiplyAddValue51, multiplyAddValue25, uintBitsToFloat(reinterpretedBits13.y)), productValue66);
    float multiplyAddValue55 = fma(reinterpretedBits14, fma(-multiplyAddValue52, multiplyAddValue26, uintBitsToFloat(reinterpretedBits13.z)), productValue67);
    precise float productValue68 = multiplyAddValue53 * varyingColor3.x;
    precise float productValue69 = multiplyAddValue54 * varyingColor3.y;
    precise float productValue70 = multiplyAddValue55 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue53, varyingColor3.x, varyingColor2.x), productValue68);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue54, varyingColor3.y, varyingColor2.y), productValue69);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue55, varyingColor3.z, varyingColor2.z), productValue70);
    fragmentColor0.w = multiplyAddValue46;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue71 = conditionValue ? fma(scalarValue6, fma(scalarValue28, uintBitsToFloat(reinterpretedBits31.x), -scalarValue28), scalarValue28) : fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits30.x), scalarValue, sampledTextureValue1.x), reinterpretedBits34);
    float multiplyAddValue72 = conditionValue ? fma(scalarValue6, fma(scalarValue29, uintBitsToFloat(reinterpretedBits31.y), -scalarValue29), scalarValue29) : fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits30.y), scalarValue1, sampledTextureValue1.y), reinterpretedBits35);
    float multiplyAddValue73 = conditionValue ? fma(scalarValue6, fma(scalarValue30, uintBitsToFloat(reinterpretedBits31.z), -scalarValue30), scalarValue30) : fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits30.z), scalarValue2, sampledTextureValue1.z), reinterpretedBits36);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue74 = fma(reinterpretedBits7, sumValue4, 1.0);
    float multiplyAddValue75 = fma(reinterpretedBits7, sumValue5, 1.0);
    float multiplyAddValue76 = fma(reinterpretedBits7, sumValue6, 1.0);
    precise float productValue99 = multiplyAddValue71 * multiplyAddValue74;
    precise float productValue100 = multiplyAddValue72 * multiplyAddValue75;
    precise float productValue101 = multiplyAddValue73 * multiplyAddValue76;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue77 = fma(reinterpretedBits33, fma(-multiplyAddValue71, multiplyAddValue74, uintBitsToFloat(reinterpretedBits32.x)), productValue99);
    float multiplyAddValue78 = fma(reinterpretedBits33, fma(-multiplyAddValue72, multiplyAddValue75, uintBitsToFloat(reinterpretedBits32.y)), productValue100);
    float multiplyAddValue79 = fma(reinterpretedBits33, fma(-multiplyAddValue73, multiplyAddValue76, uintBitsToFloat(reinterpretedBits32.z)), productValue101);
    precise float productValue102 = multiplyAddValue77 * varyingColor3.x;
    precise float productValue103 = multiplyAddValue78 * varyingColor3.y;
    precise float productValue104 = multiplyAddValue79 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue77, varyingColor3.x, varyingColor2.x), productValue102);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue78, varyingColor3.y, varyingColor2.y), productValue103);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue79, varyingColor3.z, varyingColor2.z), productValue104);
    fragmentColor0.w = scalarValue31;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue17 = scalarValue19 - multiplyAddValue90;
    precise float sumValue18 = scalarValue20 - multiplyAddValue91;
    precise float sumValue19 = scalarValue21 - multiplyAddValue92;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue94 = conditionValue ? fma(scalarValue6, fma(scalarValue28, uintBitsToFloat(reinterpretedBits31.x), -scalarValue28), scalarValue28) : fma(scalarValue3, sumValue17, multiplyAddValue90);
    float multiplyAddValue95 = conditionValue ? fma(scalarValue6, fma(scalarValue29, uintBitsToFloat(reinterpretedBits31.y), -scalarValue29), scalarValue29) : fma(scalarValue3, sumValue18, multiplyAddValue91);
    float multiplyAddValue96 = conditionValue ? fma(scalarValue6, fma(scalarValue30, uintBitsToFloat(reinterpretedBits31.z), -scalarValue30), scalarValue30) : fma(scalarValue3, sumValue19, multiplyAddValue92);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue74 = fma(reinterpretedBits7, sumValue4, 1.0);
    float multiplyAddValue75 = fma(reinterpretedBits7, sumValue5, 1.0);
    float multiplyAddValue76 = fma(reinterpretedBits7, sumValue6, 1.0);
    precise float productValue129 = multiplyAddValue94 * multiplyAddValue74;
    precise float productValue130 = multiplyAddValue95 * multiplyAddValue75;
    precise float productValue131 = multiplyAddValue96 * multiplyAddValue76;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue97 = fma(reinterpretedBits33, fma(-multiplyAddValue94, multiplyAddValue74, uintBitsToFloat(reinterpretedBits32.x)), productValue129);
    float multiplyAddValue98 = fma(reinterpretedBits33, fma(-multiplyAddValue95, multiplyAddValue75, uintBitsToFloat(reinterpretedBits32.y)), productValue130);
    float multiplyAddValue99 = fma(reinterpretedBits33, fma(-multiplyAddValue96, multiplyAddValue76, uintBitsToFloat(reinterpretedBits32.z)), productValue131);
    precise float productValue132 = multiplyAddValue97 * varyingColor3.x;
    precise float productValue133 = multiplyAddValue98 * varyingColor3.y;
    precise float productValue134 = multiplyAddValue99 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue97, varyingColor3.x, varyingColor2.x), productValue132);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue98, varyingColor3.y, varyingColor2.y), productValue133);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue99, varyingColor3.z, varyingColor2.z), productValue134);
    fragmentColor0.w = multiplyAddValue93;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue100 = fma(reinterpretedBits37, fma(reinterpretedBits42, uintBitsToFloat(reinterpretedBits31.x), -reinterpretedBits42), reinterpretedBits42);
    float multiplyAddValue101 = fma(reinterpretedBits37, fma(reinterpretedBits43, uintBitsToFloat(reinterpretedBits31.y), -reinterpretedBits43), reinterpretedBits43);
    float multiplyAddValue102 = fma(reinterpretedBits37, fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits31.z), -reinterpretedBits44), reinterpretedBits44);
    precise float sumValue20 = sampledTextureValue1.x - multiplyAddValue100;
    precise float sumValue21 = sampledTextureValue1.y - multiplyAddValue101;
    precise float sumValue22 = sampledTextureValue1.z - multiplyAddValue102;
    float multiplyAddValue103 = fma(scalarValue3, sumValue20, multiplyAddValue100);
    float multiplyAddValue104 = fma(scalarValue3, sumValue21, multiplyAddValue101);
    float multiplyAddValue105 = fma(scalarValue3, sumValue22, multiplyAddValue102);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    precise float sumValue23 = sampledTextureValue2.x - multiplyAddValue103;
    precise float sumValue24 = sampledTextureValue2.y - multiplyAddValue104;
    precise float sumValue25 = sampledTextureValue2.z - multiplyAddValue105;
    float multiplyAddValue106 = fma(scalarValue6, sumValue23, multiplyAddValue103);
    float multiplyAddValue107 = fma(scalarValue6, sumValue24, multiplyAddValue104);
    float multiplyAddValue108 = fma(scalarValue6, sumValue25, multiplyAddValue105);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue74 = fma(reinterpretedBits7, sumValue4, 1.0);
    float multiplyAddValue75 = fma(reinterpretedBits7, sumValue5, 1.0);
    float multiplyAddValue76 = fma(reinterpretedBits7, sumValue6, 1.0);
    precise float productValue135 = multiplyAddValue106 * multiplyAddValue74;
    precise float productValue136 = multiplyAddValue107 * multiplyAddValue75;
    precise float productValue137 = multiplyAddValue108 * multiplyAddValue76;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue109 = fma(reinterpretedBits33, fma(-multiplyAddValue106, multiplyAddValue74, uintBitsToFloat(reinterpretedBits32.x)), productValue135);
    float multiplyAddValue110 = fma(reinterpretedBits33, fma(-multiplyAddValue107, multiplyAddValue75, uintBitsToFloat(reinterpretedBits32.y)), productValue136);
    float multiplyAddValue111 = fma(reinterpretedBits33, fma(-multiplyAddValue108, multiplyAddValue76, uintBitsToFloat(reinterpretedBits32.z)), productValue137);
    precise float productValue138 = multiplyAddValue109 * varyingColor3.x;
    precise float productValue139 = multiplyAddValue110 * varyingColor3.y;
    precise float productValue140 = multiplyAddValue111 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue109, varyingColor3.x, varyingColor2.x), productValue138);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue110, varyingColor3.y, varyingColor2.y), productValue139);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue111, varyingColor3.z, varyingColor2.z), productValue140);
    fragmentColor0.w = scalarValue37;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue138 = fma(multiplyAddValue137, fma(multiplyAddValue90, uintBitsToFloat(reinterpretedBits31.x), -multiplyAddValue90), multiplyAddValue90);
    float multiplyAddValue139 = fma(multiplyAddValue137, fma(multiplyAddValue91, uintBitsToFloat(reinterpretedBits31.y), -multiplyAddValue91), multiplyAddValue91);
    float multiplyAddValue140 = fma(multiplyAddValue137, fma(multiplyAddValue92, uintBitsToFloat(reinterpretedBits31.z), -multiplyAddValue92), multiplyAddValue92);
    precise float sumValue26 = scalarValue19 - multiplyAddValue138;
    precise float sumValue27 = scalarValue20 - multiplyAddValue139;
    precise float sumValue28 = scalarValue21 - multiplyAddValue140;
    float multiplyAddValue141 = fma(scalarValue3, sumValue26, multiplyAddValue138);
    float multiplyAddValue142 = fma(scalarValue3, sumValue27, multiplyAddValue139);
    float multiplyAddValue143 = fma(scalarValue3, sumValue28, multiplyAddValue140);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    precise float sumValue29 = sampledTextureValue2.x - multiplyAddValue141;
    precise float sumValue30 = sampledTextureValue2.y - multiplyAddValue142;
    precise float sumValue31 = sampledTextureValue2.z - multiplyAddValue143;
    float multiplyAddValue144 = fma(scalarValue6, sumValue29, multiplyAddValue141);
    float multiplyAddValue145 = fma(scalarValue6, sumValue30, multiplyAddValue142);
    float multiplyAddValue146 = fma(scalarValue6, sumValue31, multiplyAddValue143);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue74 = fma(reinterpretedBits7, sumValue4, 1.0);
    float multiplyAddValue75 = fma(reinterpretedBits7, sumValue5, 1.0);
    float multiplyAddValue76 = fma(reinterpretedBits7, sumValue6, 1.0);
    precise float productValue158 = multiplyAddValue144 * multiplyAddValue74;
    precise float productValue159 = multiplyAddValue145 * multiplyAddValue75;
    precise float productValue160 = multiplyAddValue146 * multiplyAddValue76;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue147 = fma(reinterpretedBits33, fma(-multiplyAddValue144, multiplyAddValue74, uintBitsToFloat(reinterpretedBits32.x)), productValue158);
    float multiplyAddValue148 = fma(reinterpretedBits33, fma(-multiplyAddValue145, multiplyAddValue75, uintBitsToFloat(reinterpretedBits32.y)), productValue159);
    float multiplyAddValue149 = fma(reinterpretedBits33, fma(-multiplyAddValue146, multiplyAddValue76, uintBitsToFloat(reinterpretedBits32.z)), productValue160);
    precise float productValue161 = multiplyAddValue147 * varyingColor3.x;
    precise float productValue162 = multiplyAddValue148 * varyingColor3.y;
    precise float productValue163 = multiplyAddValue149 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue147, varyingColor3.x, varyingColor2.x), productValue161);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue148, varyingColor3.y, varyingColor2.y), productValue162);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue149, varyingColor3.z, varyingColor2.z), productValue163);
    fragmentColor0.w = scalarValue38;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits53 = uintBitsToFloat(reinterpretedBits31.x);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits31.y);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits31.z);
    float multiplyAddValue159 = fma(reinterpretedBits37, fma(reinterpretedBits42, reinterpretedBits53, -reinterpretedBits42), reinterpretedBits42);
    float multiplyAddValue160 = fma(reinterpretedBits37, fma(reinterpretedBits43, reinterpretedBits54, -reinterpretedBits43), reinterpretedBits43);
    float multiplyAddValue161 = fma(reinterpretedBits37, fma(reinterpretedBits44, reinterpretedBits55, -reinterpretedBits44), reinterpretedBits44);
    precise float sumValue32 = sampledTextureValue1.x - multiplyAddValue159;
    precise float sumValue33 = sampledTextureValue1.y - multiplyAddValue160;
    precise float sumValue34 = sampledTextureValue1.z - multiplyAddValue161;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    float multiplyAddValue162 = conditionValue ? fma(scalarValue6, fma(scalarValue28, reinterpretedBits53, -scalarValue28), scalarValue28) : fma(scalarValue3, sumValue32, multiplyAddValue159);
    float multiplyAddValue163 = conditionValue ? fma(scalarValue6, fma(scalarValue29, reinterpretedBits54, -scalarValue29), scalarValue29) : fma(scalarValue3, sumValue33, multiplyAddValue160);
    float multiplyAddValue164 = conditionValue ? fma(scalarValue6, fma(scalarValue30, reinterpretedBits55, -scalarValue30), scalarValue30) : fma(scalarValue3, sumValue34, multiplyAddValue161);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue74 = fma(reinterpretedBits7, sumValue4, 1.0);
    float multiplyAddValue75 = fma(reinterpretedBits7, sumValue5, 1.0);
    float multiplyAddValue76 = fma(reinterpretedBits7, sumValue6, 1.0);
    precise float productValue176 = multiplyAddValue162 * multiplyAddValue74;
    precise float productValue177 = multiplyAddValue163 * multiplyAddValue75;
    precise float productValue178 = multiplyAddValue164 * multiplyAddValue76;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue165 = fma(reinterpretedBits33, fma(-multiplyAddValue162, multiplyAddValue74, uintBitsToFloat(reinterpretedBits32.x)), productValue176);
    float multiplyAddValue166 = fma(reinterpretedBits33, fma(-multiplyAddValue163, multiplyAddValue75, uintBitsToFloat(reinterpretedBits32.y)), productValue177);
    float multiplyAddValue167 = fma(reinterpretedBits33, fma(-multiplyAddValue164, multiplyAddValue76, uintBitsToFloat(reinterpretedBits32.z)), productValue178);
    precise float productValue179 = multiplyAddValue165 * varyingColor3.x;
    precise float productValue180 = multiplyAddValue166 * varyingColor3.y;
    precise float productValue181 = multiplyAddValue167 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue165, varyingColor3.x, varyingColor2.x), productValue179);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue166, varyingColor3.y, varyingColor2.y), productValue180);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue167, varyingColor3.z, varyingColor2.z), productValue181);
    fragmentColor0.w = scalarValue37;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits53 = uintBitsToFloat(reinterpretedBits31.x);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits31.y);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits31.z);
    float multiplyAddValue168 = fma(multiplyAddValue137, fma(multiplyAddValue90, reinterpretedBits53, -multiplyAddValue90), multiplyAddValue90);
    float multiplyAddValue169 = fma(multiplyAddValue137, fma(multiplyAddValue91, reinterpretedBits54, -multiplyAddValue91), multiplyAddValue91);
    float multiplyAddValue170 = fma(multiplyAddValue137, fma(multiplyAddValue92, reinterpretedBits55, -multiplyAddValue92), multiplyAddValue92);
    precise float sumValue35 = scalarValue19 - multiplyAddValue168;
    precise float sumValue36 = scalarValue20 - multiplyAddValue169;
    precise float sumValue37 = scalarValue21 - multiplyAddValue170;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    float multiplyAddValue171 = conditionValue ? fma(scalarValue6, fma(scalarValue28, reinterpretedBits53, -scalarValue28), scalarValue28) : fma(scalarValue3, sumValue35, multiplyAddValue168);
    float multiplyAddValue172 = conditionValue ? fma(scalarValue6, fma(scalarValue29, reinterpretedBits54, -scalarValue29), scalarValue29) : fma(scalarValue3, sumValue36, multiplyAddValue169);
    float multiplyAddValue173 = conditionValue ? fma(scalarValue6, fma(scalarValue30, reinterpretedBits55, -scalarValue30), scalarValue30) : fma(scalarValue3, sumValue37, multiplyAddValue170);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue74 = fma(reinterpretedBits7, sumValue4, 1.0);
    float multiplyAddValue75 = fma(reinterpretedBits7, sumValue5, 1.0);
    float multiplyAddValue76 = fma(reinterpretedBits7, sumValue6, 1.0);
    precise float productValue182 = multiplyAddValue171 * multiplyAddValue74;
    precise float productValue183 = multiplyAddValue172 * multiplyAddValue75;
    precise float productValue184 = multiplyAddValue173 * multiplyAddValue76;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue174 = fma(reinterpretedBits33, fma(-multiplyAddValue171, multiplyAddValue74, uintBitsToFloat(reinterpretedBits32.x)), productValue182);
    float multiplyAddValue175 = fma(reinterpretedBits33, fma(-multiplyAddValue172, multiplyAddValue75, uintBitsToFloat(reinterpretedBits32.y)), productValue183);
    float multiplyAddValue176 = fma(reinterpretedBits33, fma(-multiplyAddValue173, multiplyAddValue76, uintBitsToFloat(reinterpretedBits32.z)), productValue184);
    precise float productValue185 = multiplyAddValue174 * varyingColor3.x;
    precise float productValue186 = multiplyAddValue175 * varyingColor3.y;
    precise float productValue187 = multiplyAddValue176 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue174, varyingColor3.x, varyingColor2.x), productValue185);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue175, varyingColor3.y, varyingColor2.y), productValue186);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue176, varyingColor3.z, varyingColor2.z), productValue187);
    fragmentColor0.w = scalarValue38;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    precise float reinterpretedBits62 = reinterpretedBits42 * uintBitsToFloat(reinterpretedBits31.x);
    precise float reinterpretedBits63 = reinterpretedBits42 * uintBitsToFloat(reinterpretedBits31.y);
    precise float reinterpretedBits64 = reinterpretedBits42 * uintBitsToFloat(reinterpretedBits31.z);
    float scalarValue43 = ceil(reinterpretedBits43);
    uvec4 reinterpretedBits60 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue198 = fma(scalarValue43, fma(reinterpretedBits43, uintBitsToFloat(reinterpretedBits60.x), -reinterpretedBits62), reinterpretedBits62);
    float multiplyAddValue199 = fma(scalarValue43, fma(reinterpretedBits43, uintBitsToFloat(reinterpretedBits60.y), -reinterpretedBits63), reinterpretedBits63);
    float multiplyAddValue200 = fma(scalarValue43, fma(reinterpretedBits43, uintBitsToFloat(reinterpretedBits60.z), -reinterpretedBits64), reinterpretedBits64);
    precise float sumValue38 = sampledTextureValue1.x - multiplyAddValue198;
    precise float sumValue39 = sampledTextureValue1.y - multiplyAddValue199;
    precise float sumValue40 = sampledTextureValue1.z - multiplyAddValue200;
    float multiplyAddValue201 = fma(scalarValue3, sumValue38, multiplyAddValue198);
    float multiplyAddValue202 = fma(scalarValue3, sumValue39, multiplyAddValue199);
    float multiplyAddValue203 = fma(scalarValue3, sumValue40, multiplyAddValue200);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    precise float sumValue41 = sampledTextureValue2.x - multiplyAddValue201;
    precise float sumValue42 = sampledTextureValue2.y - multiplyAddValue202;
    precise float sumValue43 = sampledTextureValue2.z - multiplyAddValue203;
    float multiplyAddValue204 = fma(scalarValue6, sumValue41, multiplyAddValue201);
    float multiplyAddValue205 = fma(scalarValue6, sumValue42, multiplyAddValue202);
    float multiplyAddValue206 = fma(scalarValue6, sumValue43, multiplyAddValue203);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue74 = fma(reinterpretedBits7, sumValue4, 1.0);
    float multiplyAddValue75 = fma(reinterpretedBits7, sumValue5, 1.0);
    float multiplyAddValue76 = fma(reinterpretedBits7, sumValue6, 1.0);
    precise float productValue218 = multiplyAddValue204 * multiplyAddValue74;
    precise float productValue219 = multiplyAddValue205 * multiplyAddValue75;
    precise float productValue220 = multiplyAddValue206 * multiplyAddValue76;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue207 = fma(reinterpretedBits33, fma(-multiplyAddValue204, multiplyAddValue74, uintBitsToFloat(reinterpretedBits32.x)), productValue218);
    float multiplyAddValue208 = fma(reinterpretedBits33, fma(-multiplyAddValue205, multiplyAddValue75, uintBitsToFloat(reinterpretedBits32.y)), productValue219);
    float multiplyAddValue209 = fma(reinterpretedBits33, fma(-multiplyAddValue206, multiplyAddValue76, uintBitsToFloat(reinterpretedBits32.z)), productValue220);
    precise float productValue221 = multiplyAddValue207 * varyingColor3.x;
    precise float productValue222 = multiplyAddValue208 * varyingColor3.y;
    precise float productValue223 = multiplyAddValue209 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue207, varyingColor3.x, varyingColor2.x), productValue221);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue208, varyingColor3.y, varyingColor2.y), productValue222);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue209, varyingColor3.z, varyingColor2.z), productValue223);
    fragmentColor0.w = scalarValue42;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    precise float reinterpretedBits65 = multiplyAddValue210 * uintBitsToFloat(reinterpretedBits31.x);
    precise float reinterpretedBits66 = multiplyAddValue210 * uintBitsToFloat(reinterpretedBits31.y);
    precise float reinterpretedBits67 = multiplyAddValue210 * uintBitsToFloat(reinterpretedBits31.z);
    float scalarValue45 = ceil(multiplyAddValue211);
    uvec4 reinterpretedBits60 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue213 = fma(scalarValue45, fma(multiplyAddValue211, uintBitsToFloat(reinterpretedBits60.x), -reinterpretedBits65), reinterpretedBits65);
    float multiplyAddValue214 = fma(scalarValue45, fma(multiplyAddValue211, uintBitsToFloat(reinterpretedBits60.y), -reinterpretedBits66), reinterpretedBits66);
    float multiplyAddValue215 = fma(scalarValue45, fma(multiplyAddValue211, uintBitsToFloat(reinterpretedBits60.z), -reinterpretedBits67), reinterpretedBits67);
    precise float sumValue44 = scalarValue19 - multiplyAddValue213;
    precise float sumValue45 = scalarValue20 - multiplyAddValue214;
    precise float sumValue46 = scalarValue21 - multiplyAddValue215;
    float multiplyAddValue216 = fma(scalarValue3, sumValue44, multiplyAddValue213);
    float multiplyAddValue217 = fma(scalarValue3, sumValue45, multiplyAddValue214);
    float multiplyAddValue218 = fma(scalarValue3, sumValue46, multiplyAddValue215);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    precise float sumValue47 = sampledTextureValue2.x - multiplyAddValue216;
    precise float sumValue48 = sampledTextureValue2.y - multiplyAddValue217;
    precise float sumValue49 = sampledTextureValue2.z - multiplyAddValue218;
    float multiplyAddValue219 = fma(scalarValue6, sumValue47, multiplyAddValue216);
    float multiplyAddValue220 = fma(scalarValue6, sumValue48, multiplyAddValue217);
    float multiplyAddValue221 = fma(scalarValue6, sumValue49, multiplyAddValue218);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue74 = fma(reinterpretedBits7, sumValue4, 1.0);
    float multiplyAddValue75 = fma(reinterpretedBits7, sumValue5, 1.0);
    float multiplyAddValue76 = fma(reinterpretedBits7, sumValue6, 1.0);
    precise float productValue225 = multiplyAddValue219 * multiplyAddValue74;
    precise float productValue226 = multiplyAddValue220 * multiplyAddValue75;
    precise float productValue227 = multiplyAddValue221 * multiplyAddValue76;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue222 = fma(reinterpretedBits33, fma(-multiplyAddValue219, multiplyAddValue74, uintBitsToFloat(reinterpretedBits32.x)), productValue225);
    float multiplyAddValue223 = fma(reinterpretedBits33, fma(-multiplyAddValue220, multiplyAddValue75, uintBitsToFloat(reinterpretedBits32.y)), productValue226);
    float multiplyAddValue224 = fma(reinterpretedBits33, fma(-multiplyAddValue221, multiplyAddValue76, uintBitsToFloat(reinterpretedBits32.z)), productValue227);
    precise float productValue228 = multiplyAddValue222 * varyingColor3.x;
    precise float productValue229 = multiplyAddValue223 * varyingColor3.y;
    precise float productValue230 = multiplyAddValue224 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue222, varyingColor3.x, varyingColor2.x), productValue228);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue223, varyingColor3.y, varyingColor2.y), productValue229);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue224, varyingColor3.z, varyingColor2.z), productValue230);
    fragmentColor0.w = multiplyAddValue212;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits53 = uintBitsToFloat(reinterpretedBits31.x);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits31.y);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits31.z);
    precise float productValue235 = reinterpretedBits42 * reinterpretedBits53;
    precise float productValue236 = reinterpretedBits42 * reinterpretedBits54;
    precise float productValue237 = reinterpretedBits42 * reinterpretedBits55;
    float scalarValue43 = ceil(reinterpretedBits43);
    uvec4 reinterpretedBits60 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue249 = fma(scalarValue43, fma(reinterpretedBits43, uintBitsToFloat(reinterpretedBits60.x), -productValue235), productValue235);
    float multiplyAddValue250 = fma(scalarValue43, fma(reinterpretedBits43, uintBitsToFloat(reinterpretedBits60.y), -productValue236), productValue236);
    float multiplyAddValue251 = fma(scalarValue43, fma(reinterpretedBits43, uintBitsToFloat(reinterpretedBits60.z), -productValue237), productValue237);
    precise float sumValue50 = sampledTextureValue1.x - multiplyAddValue249;
    precise float sumValue51 = sampledTextureValue1.y - multiplyAddValue250;
    precise float sumValue52 = sampledTextureValue1.z - multiplyAddValue251;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    float multiplyAddValue252 = conditionValue ? fma(scalarValue6, fma(scalarValue28, reinterpretedBits53, -scalarValue28), scalarValue28) : fma(scalarValue3, sumValue50, multiplyAddValue249);
    float multiplyAddValue253 = conditionValue ? fma(scalarValue6, fma(scalarValue29, reinterpretedBits54, -scalarValue29), scalarValue29) : fma(scalarValue3, sumValue51, multiplyAddValue250);
    float multiplyAddValue254 = conditionValue ? fma(scalarValue6, fma(scalarValue30, reinterpretedBits55, -scalarValue30), scalarValue30) : fma(scalarValue3, sumValue52, multiplyAddValue251);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue74 = fma(reinterpretedBits7, sumValue4, 1.0);
    float multiplyAddValue75 = fma(reinterpretedBits7, sumValue5, 1.0);
    float multiplyAddValue76 = fma(reinterpretedBits7, sumValue6, 1.0);
    precise float productValue238 = multiplyAddValue252 * multiplyAddValue74;
    precise float productValue239 = multiplyAddValue253 * multiplyAddValue75;
    precise float productValue240 = multiplyAddValue254 * multiplyAddValue76;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue255 = fma(reinterpretedBits33, fma(-multiplyAddValue252, multiplyAddValue74, uintBitsToFloat(reinterpretedBits32.x)), productValue238);
    float multiplyAddValue256 = fma(reinterpretedBits33, fma(-multiplyAddValue253, multiplyAddValue75, uintBitsToFloat(reinterpretedBits32.y)), productValue239);
    float multiplyAddValue257 = fma(reinterpretedBits33, fma(-multiplyAddValue254, multiplyAddValue76, uintBitsToFloat(reinterpretedBits32.z)), productValue240);
    precise float productValue241 = multiplyAddValue255 * varyingColor3.x;
    precise float productValue242 = multiplyAddValue256 * varyingColor3.y;
    precise float productValue243 = multiplyAddValue257 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue255, varyingColor3.x, varyingColor2.x), productValue241);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue256, varyingColor3.y, varyingColor2.y), productValue242);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue257, varyingColor3.z, varyingColor2.z), productValue243);
    fragmentColor0.w = scalarValue42;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits53 = uintBitsToFloat(reinterpretedBits31.x);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits31.y);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits31.z);
    precise float productValue250 = multiplyAddValue210 * reinterpretedBits53;
    precise float productValue251 = multiplyAddValue210 * reinterpretedBits54;
    precise float productValue252 = multiplyAddValue210 * reinterpretedBits55;
    float scalarValue45 = ceil(multiplyAddValue211);
    uvec4 reinterpretedBits60 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue258 = fma(scalarValue45, fma(multiplyAddValue211, uintBitsToFloat(reinterpretedBits60.x), -productValue250), productValue250);
    float multiplyAddValue259 = fma(scalarValue45, fma(multiplyAddValue211, uintBitsToFloat(reinterpretedBits60.y), -productValue251), productValue251);
    float multiplyAddValue260 = fma(scalarValue45, fma(multiplyAddValue211, uintBitsToFloat(reinterpretedBits60.z), -productValue252), productValue252);
    precise float sumValue53 = scalarValue19 - multiplyAddValue258;
    precise float sumValue54 = scalarValue20 - multiplyAddValue259;
    precise float sumValue55 = scalarValue21 - multiplyAddValue260;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    float multiplyAddValue261 = conditionValue ? fma(scalarValue6, fma(scalarValue28, reinterpretedBits53, -scalarValue28), scalarValue28) : fma(scalarValue3, sumValue53, multiplyAddValue258);
    float multiplyAddValue262 = conditionValue ? fma(scalarValue6, fma(scalarValue29, reinterpretedBits54, -scalarValue29), scalarValue29) : fma(scalarValue3, sumValue54, multiplyAddValue259);
    float multiplyAddValue263 = conditionValue ? fma(scalarValue6, fma(scalarValue30, reinterpretedBits55, -scalarValue30), scalarValue30) : fma(scalarValue3, sumValue55, multiplyAddValue260);
    precise float sumValue4 = varyingColor0.x - 1.0;
    precise float sumValue5 = varyingColor0.y - 1.0;
    precise float sumValue6 = varyingColor0.z - 1.0;
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue74 = fma(reinterpretedBits7, sumValue4, 1.0);
    float multiplyAddValue75 = fma(reinterpretedBits7, sumValue5, 1.0);
    float multiplyAddValue76 = fma(reinterpretedBits7, sumValue6, 1.0);
    precise float productValue253 = multiplyAddValue261 * multiplyAddValue74;
    precise float productValue254 = multiplyAddValue262 * multiplyAddValue75;
    precise float productValue255 = multiplyAddValue263 * multiplyAddValue76;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue264 = fma(reinterpretedBits33, fma(-multiplyAddValue261, multiplyAddValue74, uintBitsToFloat(reinterpretedBits32.x)), productValue253);
    float multiplyAddValue265 = fma(reinterpretedBits33, fma(-multiplyAddValue262, multiplyAddValue75, uintBitsToFloat(reinterpretedBits32.y)), productValue254);
    float multiplyAddValue266 = fma(reinterpretedBits33, fma(-multiplyAddValue263, multiplyAddValue76, uintBitsToFloat(reinterpretedBits32.z)), productValue255);
    precise float productValue256 = multiplyAddValue264 * varyingColor3.x;
    precise float productValue257 = multiplyAddValue265 * varyingColor3.y;
    precise float productValue258 = multiplyAddValue266 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue264, varyingColor3.x, varyingColor2.x), productValue256);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue265, varyingColor3.y, varyingColor2.y), productValue257);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue266, varyingColor3.z, varyingColor2.z), productValue258);
    fragmentColor0.w = multiplyAddValue212;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue2 = fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits11.x), scalarValue, sampledTextureValue1.x), scalarValue * uintBitsToFloat(reinterpretedBits.x));
    float multiplyAddValue3 = fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits11.y), scalarValue1, sampledTextureValue1.y), scalarValue1 * uintBitsToFloat(reinterpretedBits.y));
    float multiplyAddValue4 = fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits11.z), scalarValue2, sampledTextureValue1.z), scalarValue2 * uintBitsToFloat(reinterpretedBits.z));
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    float multiplyAddValue5 = fma(scalarValue6, sampledTextureValue2.x - multiplyAddValue2, multiplyAddValue2);
    float multiplyAddValue6 = fma(scalarValue6, sampledTextureValue2.y - multiplyAddValue3, multiplyAddValue3);
    float multiplyAddValue7 = fma(scalarValue6, sampledTextureValue2.z - multiplyAddValue4, multiplyAddValue4);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue8 = fma(reinterpretedBits12, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue9 = fma(reinterpretedBits12, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue10 = fma(reinterpretedBits12, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue11 = fma(reinterpretedBits14, fma(-multiplyAddValue5, multiplyAddValue8, uintBitsToFloat(reinterpretedBits13.x)), multiplyAddValue5 * multiplyAddValue8);
    float multiplyAddValue12 = fma(reinterpretedBits14, fma(-multiplyAddValue6, multiplyAddValue9, uintBitsToFloat(reinterpretedBits13.y)), multiplyAddValue6 * multiplyAddValue9);
    float multiplyAddValue13 = fma(reinterpretedBits14, fma(-multiplyAddValue7, multiplyAddValue10, uintBitsToFloat(reinterpretedBits13.z)), multiplyAddValue7 * multiplyAddValue10);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue11, varyingColor3.x, varyingColor2.x), multiplyAddValue11 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue12, varyingColor3.y, varyingColor2.y), multiplyAddValue12 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue13, varyingColor3.z, varyingColor2.z), multiplyAddValue13 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits1;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue34 = fma(scalarValue3, scalarValue19 - multiplyAddValue30, multiplyAddValue30);
    float multiplyAddValue35 = fma(scalarValue3, scalarValue20 - multiplyAddValue31, multiplyAddValue31);
    float multiplyAddValue36 = fma(scalarValue3, scalarValue21 - multiplyAddValue32, multiplyAddValue32);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    float multiplyAddValue37 = fma(scalarValue6, sampledTextureValue2.x - multiplyAddValue34, multiplyAddValue34);
    float multiplyAddValue38 = fma(scalarValue6, sampledTextureValue2.y - multiplyAddValue35, multiplyAddValue35);
    float multiplyAddValue39 = fma(scalarValue6, sampledTextureValue2.z - multiplyAddValue36, multiplyAddValue36);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue8 = fma(reinterpretedBits12, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue9 = fma(reinterpretedBits12, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue10 = fma(reinterpretedBits12, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue40 = fma(reinterpretedBits14, fma(-multiplyAddValue37, multiplyAddValue8, uintBitsToFloat(reinterpretedBits13.x)), multiplyAddValue37 * multiplyAddValue8);
    float multiplyAddValue41 = fma(reinterpretedBits14, fma(-multiplyAddValue38, multiplyAddValue9, uintBitsToFloat(reinterpretedBits13.y)), multiplyAddValue38 * multiplyAddValue9);
    float multiplyAddValue42 = fma(reinterpretedBits14, fma(-multiplyAddValue39, multiplyAddValue10, uintBitsToFloat(reinterpretedBits13.z)), multiplyAddValue39 * multiplyAddValue10);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue40, varyingColor3.x, varyingColor2.x), multiplyAddValue40 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue41, varyingColor3.y, varyingColor2.y), multiplyAddValue41 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue42, varyingColor3.z, varyingColor2.z), multiplyAddValue42 * varyingColor3.z);
    fragmentColor0.w = multiplyAddValue33;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue58 = conditionValue ? fma(scalarValue6, fma(scalarValue28, uintBitsToFloat(reinterpretedBits31.x), -scalarValue28), scalarValue28) : fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits30.x), scalarValue, sampledTextureValue1.x), scalarValue * uintBitsToFloat(reinterpretedBits23.x));
    float multiplyAddValue59 = conditionValue ? fma(scalarValue6, fma(scalarValue29, uintBitsToFloat(reinterpretedBits31.y), -scalarValue29), scalarValue29) : fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits30.y), scalarValue1, sampledTextureValue1.y), scalarValue1 * uintBitsToFloat(reinterpretedBits23.y));
    float multiplyAddValue60 = conditionValue ? fma(scalarValue6, fma(scalarValue30, uintBitsToFloat(reinterpretedBits31.z), -scalarValue30), scalarValue30) : fma(scalarValue3, fma(-uintBitsToFloat(reinterpretedBits30.z), scalarValue2, sampledTextureValue1.z), scalarValue2 * uintBitsToFloat(reinterpretedBits23.z));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue61 = fma(reinterpretedBits7, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue62 = fma(reinterpretedBits7, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue63 = fma(reinterpretedBits7, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue64 = fma(reinterpretedBits33, fma(-multiplyAddValue58, multiplyAddValue61, uintBitsToFloat(reinterpretedBits32.x)), multiplyAddValue58 * multiplyAddValue61);
    float multiplyAddValue65 = fma(reinterpretedBits33, fma(-multiplyAddValue59, multiplyAddValue62, uintBitsToFloat(reinterpretedBits32.y)), multiplyAddValue59 * multiplyAddValue62);
    float multiplyAddValue66 = fma(reinterpretedBits33, fma(-multiplyAddValue60, multiplyAddValue63, uintBitsToFloat(reinterpretedBits32.z)), multiplyAddValue60 * multiplyAddValue63);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue64, varyingColor3.x, varyingColor2.x), multiplyAddValue64 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue65, varyingColor3.y, varyingColor2.y), multiplyAddValue65 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue66, varyingColor3.z, varyingColor2.z), multiplyAddValue66 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits24;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue84 = conditionValue ? fma(scalarValue6, fma(scalarValue28, uintBitsToFloat(reinterpretedBits31.x), -scalarValue28), scalarValue28) : fma(scalarValue3, scalarValue19 - multiplyAddValue80, multiplyAddValue80);
    float multiplyAddValue85 = conditionValue ? fma(scalarValue6, fma(scalarValue29, uintBitsToFloat(reinterpretedBits31.y), -scalarValue29), scalarValue29) : fma(scalarValue3, scalarValue20 - multiplyAddValue81, multiplyAddValue81);
    float multiplyAddValue86 = conditionValue ? fma(scalarValue6, fma(scalarValue30, uintBitsToFloat(reinterpretedBits31.z), -scalarValue30), scalarValue30) : fma(scalarValue3, scalarValue21 - multiplyAddValue82, multiplyAddValue82);
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue61 = fma(reinterpretedBits7, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue62 = fma(reinterpretedBits7, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue63 = fma(reinterpretedBits7, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue87 = fma(reinterpretedBits33, fma(-multiplyAddValue84, multiplyAddValue61, uintBitsToFloat(reinterpretedBits32.x)), multiplyAddValue84 * multiplyAddValue61);
    float multiplyAddValue88 = fma(reinterpretedBits33, fma(-multiplyAddValue85, multiplyAddValue62, uintBitsToFloat(reinterpretedBits32.y)), multiplyAddValue85 * multiplyAddValue62);
    float multiplyAddValue89 = fma(reinterpretedBits33, fma(-multiplyAddValue86, multiplyAddValue63, uintBitsToFloat(reinterpretedBits32.z)), multiplyAddValue86 * multiplyAddValue63);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue87, varyingColor3.x, varyingColor2.x), multiplyAddValue87 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue88, varyingColor3.y, varyingColor2.y), multiplyAddValue88 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue89, varyingColor3.z, varyingColor2.z), multiplyAddValue89 * varyingColor3.z);
    fragmentColor0.w = multiplyAddValue83;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue112 = fma(reinterpretedBits49, fma(reinterpretedBits46, uintBitsToFloat(reinterpretedBits31.x), -reinterpretedBits46), reinterpretedBits46);
    float multiplyAddValue113 = fma(reinterpretedBits49, fma(reinterpretedBits47, uintBitsToFloat(reinterpretedBits31.y), -reinterpretedBits47), reinterpretedBits47);
    float multiplyAddValue114 = fma(reinterpretedBits49, fma(reinterpretedBits48, uintBitsToFloat(reinterpretedBits31.z), -reinterpretedBits48), reinterpretedBits48);
    float multiplyAddValue115 = fma(scalarValue3, sampledTextureValue1.x - multiplyAddValue112, multiplyAddValue112);
    float multiplyAddValue116 = fma(scalarValue3, sampledTextureValue1.y - multiplyAddValue113, multiplyAddValue113);
    float multiplyAddValue117 = fma(scalarValue3, sampledTextureValue1.z - multiplyAddValue114, multiplyAddValue114);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    float multiplyAddValue118 = fma(scalarValue6, sampledTextureValue2.x - multiplyAddValue115, multiplyAddValue115);
    float multiplyAddValue119 = fma(scalarValue6, sampledTextureValue2.y - multiplyAddValue116, multiplyAddValue116);
    float multiplyAddValue120 = fma(scalarValue6, sampledTextureValue2.z - multiplyAddValue117, multiplyAddValue117);
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue61 = fma(reinterpretedBits7, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue62 = fma(reinterpretedBits7, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue63 = fma(reinterpretedBits7, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue121 = fma(reinterpretedBits33, fma(-multiplyAddValue118, multiplyAddValue61, uintBitsToFloat(reinterpretedBits32.x)), multiplyAddValue118 * multiplyAddValue61);
    float multiplyAddValue122 = fma(reinterpretedBits33, fma(-multiplyAddValue119, multiplyAddValue62, uintBitsToFloat(reinterpretedBits32.y)), multiplyAddValue119 * multiplyAddValue62);
    float multiplyAddValue123 = fma(reinterpretedBits33, fma(-multiplyAddValue120, multiplyAddValue63, uintBitsToFloat(reinterpretedBits32.z)), multiplyAddValue120 * multiplyAddValue63);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue121, varyingColor3.x, varyingColor2.x), multiplyAddValue121 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue122, varyingColor3.y, varyingColor2.y), multiplyAddValue122 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue123, varyingColor3.z, varyingColor2.z), multiplyAddValue123 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits50;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue125 = fma(multiplyAddValue124, fma(multiplyAddValue80, uintBitsToFloat(reinterpretedBits31.x), -multiplyAddValue80), multiplyAddValue80);
    float multiplyAddValue126 = fma(multiplyAddValue124, fma(multiplyAddValue81, uintBitsToFloat(reinterpretedBits31.y), -multiplyAddValue81), multiplyAddValue81);
    float multiplyAddValue127 = fma(multiplyAddValue124, fma(multiplyAddValue82, uintBitsToFloat(reinterpretedBits31.z), -multiplyAddValue82), multiplyAddValue82);
    float multiplyAddValue128 = fma(scalarValue3, scalarValue19 - multiplyAddValue125, multiplyAddValue125);
    float multiplyAddValue129 = fma(scalarValue3, scalarValue20 - multiplyAddValue126, multiplyAddValue126);
    float multiplyAddValue130 = fma(scalarValue3, scalarValue21 - multiplyAddValue127, multiplyAddValue127);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    float multiplyAddValue131 = fma(scalarValue6, sampledTextureValue2.x - multiplyAddValue128, multiplyAddValue128);
    float multiplyAddValue132 = fma(scalarValue6, sampledTextureValue2.y - multiplyAddValue129, multiplyAddValue129);
    float multiplyAddValue133 = fma(scalarValue6, sampledTextureValue2.z - multiplyAddValue130, multiplyAddValue130);
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue61 = fma(reinterpretedBits7, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue62 = fma(reinterpretedBits7, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue63 = fma(reinterpretedBits7, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue134 = fma(reinterpretedBits33, fma(-multiplyAddValue131, multiplyAddValue61, uintBitsToFloat(reinterpretedBits32.x)), multiplyAddValue131 * multiplyAddValue61);
    float multiplyAddValue135 = fma(reinterpretedBits33, fma(-multiplyAddValue132, multiplyAddValue62, uintBitsToFloat(reinterpretedBits32.y)), multiplyAddValue132 * multiplyAddValue62);
    float multiplyAddValue136 = fma(reinterpretedBits33, fma(-multiplyAddValue133, multiplyAddValue63, uintBitsToFloat(reinterpretedBits32.z)), multiplyAddValue133 * multiplyAddValue63);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue134, varyingColor3.x, varyingColor2.x), multiplyAddValue134 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue135, varyingColor3.y, varyingColor2.y), multiplyAddValue135 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue136, varyingColor3.z, varyingColor2.z), multiplyAddValue136 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits51;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits53 = uintBitsToFloat(reinterpretedBits31.x);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits31.y);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits31.z);
    float multiplyAddValue150 = fma(reinterpretedBits49, fma(reinterpretedBits46, reinterpretedBits53, -reinterpretedBits46), reinterpretedBits46);
    float multiplyAddValue151 = fma(reinterpretedBits49, fma(reinterpretedBits47, reinterpretedBits54, -reinterpretedBits47), reinterpretedBits47);
    float multiplyAddValue152 = fma(reinterpretedBits49, fma(reinterpretedBits48, reinterpretedBits55, -reinterpretedBits48), reinterpretedBits48);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    float multiplyAddValue153 = conditionValue ? fma(scalarValue6, fma(scalarValue28, reinterpretedBits53, -scalarValue28), scalarValue28) : fma(scalarValue3, sampledTextureValue1.x - multiplyAddValue150, multiplyAddValue150);
    float multiplyAddValue154 = conditionValue ? fma(scalarValue6, fma(scalarValue29, reinterpretedBits54, -scalarValue29), scalarValue29) : fma(scalarValue3, sampledTextureValue1.y - multiplyAddValue151, multiplyAddValue151);
    float multiplyAddValue155 = conditionValue ? fma(scalarValue6, fma(scalarValue30, reinterpretedBits55, -scalarValue30), scalarValue30) : fma(scalarValue3, sampledTextureValue1.z - multiplyAddValue152, multiplyAddValue152);
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue61 = fma(reinterpretedBits7, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue62 = fma(reinterpretedBits7, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue63 = fma(reinterpretedBits7, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue156 = fma(reinterpretedBits33, fma(-multiplyAddValue153, multiplyAddValue61, uintBitsToFloat(reinterpretedBits32.x)), multiplyAddValue153 * multiplyAddValue61);
    float multiplyAddValue157 = fma(reinterpretedBits33, fma(-multiplyAddValue154, multiplyAddValue62, uintBitsToFloat(reinterpretedBits32.y)), multiplyAddValue154 * multiplyAddValue62);
    float multiplyAddValue158 = fma(reinterpretedBits33, fma(-multiplyAddValue155, multiplyAddValue63, uintBitsToFloat(reinterpretedBits32.z)), multiplyAddValue155 * multiplyAddValue63);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue156, varyingColor3.x, varyingColor2.x), multiplyAddValue156 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue157, varyingColor3.y, varyingColor2.y), multiplyAddValue157 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue158, varyingColor3.z, varyingColor2.z), multiplyAddValue158 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits50;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits53 = uintBitsToFloat(reinterpretedBits31.x);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits31.y);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits31.z);
    float multiplyAddValue177 = fma(multiplyAddValue124, fma(multiplyAddValue80, reinterpretedBits53, -multiplyAddValue80), multiplyAddValue80);
    float multiplyAddValue178 = fma(multiplyAddValue124, fma(multiplyAddValue81, reinterpretedBits54, -multiplyAddValue81), multiplyAddValue81);
    float multiplyAddValue179 = fma(multiplyAddValue124, fma(multiplyAddValue82, reinterpretedBits55, -multiplyAddValue82), multiplyAddValue82);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    float multiplyAddValue180 = conditionValue ? fma(scalarValue6, fma(scalarValue28, reinterpretedBits53, -scalarValue28), scalarValue28) : fma(scalarValue3, scalarValue19 - multiplyAddValue177, multiplyAddValue177);
    float multiplyAddValue181 = conditionValue ? fma(scalarValue6, fma(scalarValue29, reinterpretedBits54, -scalarValue29), scalarValue29) : fma(scalarValue3, scalarValue20 - multiplyAddValue178, multiplyAddValue178);
    float multiplyAddValue182 = conditionValue ? fma(scalarValue6, fma(scalarValue30, reinterpretedBits55, -scalarValue30), scalarValue30) : fma(scalarValue3, scalarValue21 - multiplyAddValue179, multiplyAddValue179);
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue61 = fma(reinterpretedBits7, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue62 = fma(reinterpretedBits7, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue63 = fma(reinterpretedBits7, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue183 = fma(reinterpretedBits33, fma(-multiplyAddValue180, multiplyAddValue61, uintBitsToFloat(reinterpretedBits32.x)), multiplyAddValue180 * multiplyAddValue61);
    float multiplyAddValue184 = fma(reinterpretedBits33, fma(-multiplyAddValue181, multiplyAddValue62, uintBitsToFloat(reinterpretedBits32.y)), multiplyAddValue181 * multiplyAddValue62);
    float multiplyAddValue185 = fma(reinterpretedBits33, fma(-multiplyAddValue182, multiplyAddValue63, uintBitsToFloat(reinterpretedBits32.z)), multiplyAddValue182 * multiplyAddValue63);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue183, varyingColor3.x, varyingColor2.x), multiplyAddValue183 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue184, varyingColor3.y, varyingColor2.y), multiplyAddValue184 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue185, varyingColor3.z, varyingColor2.z), multiplyAddValue185 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits51;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits57 = reinterpretedBits46 * uintBitsToFloat(reinterpretedBits31.x);
    float reinterpretedBits58 = reinterpretedBits46 * uintBitsToFloat(reinterpretedBits31.y);
    float reinterpretedBits59 = reinterpretedBits46 * uintBitsToFloat(reinterpretedBits31.z);
    float scalarValue40 = ceil(reinterpretedBits47);
    uvec4 reinterpretedBits60 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue186 = fma(scalarValue40, fma(reinterpretedBits47, uintBitsToFloat(reinterpretedBits60.x), -reinterpretedBits57), reinterpretedBits57);
    float multiplyAddValue187 = fma(scalarValue40, fma(reinterpretedBits47, uintBitsToFloat(reinterpretedBits60.y), -reinterpretedBits58), reinterpretedBits58);
    float multiplyAddValue188 = fma(scalarValue40, fma(reinterpretedBits47, uintBitsToFloat(reinterpretedBits60.z), -reinterpretedBits59), reinterpretedBits59);
    float multiplyAddValue189 = fma(scalarValue3, sampledTextureValue1.x - multiplyAddValue186, multiplyAddValue186);
    float multiplyAddValue190 = fma(scalarValue3, sampledTextureValue1.y - multiplyAddValue187, multiplyAddValue187);
    float multiplyAddValue191 = fma(scalarValue3, sampledTextureValue1.z - multiplyAddValue188, multiplyAddValue188);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    float multiplyAddValue192 = fma(scalarValue6, sampledTextureValue2.x - multiplyAddValue189, multiplyAddValue189);
    float multiplyAddValue193 = fma(scalarValue6, sampledTextureValue2.y - multiplyAddValue190, multiplyAddValue190);
    float multiplyAddValue194 = fma(scalarValue6, sampledTextureValue2.z - multiplyAddValue191, multiplyAddValue191);
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue61 = fma(reinterpretedBits7, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue62 = fma(reinterpretedBits7, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue63 = fma(reinterpretedBits7, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue195 = fma(reinterpretedBits33, fma(-multiplyAddValue192, multiplyAddValue61, uintBitsToFloat(reinterpretedBits32.x)), multiplyAddValue192 * multiplyAddValue61);
    float multiplyAddValue196 = fma(reinterpretedBits33, fma(-multiplyAddValue193, multiplyAddValue62, uintBitsToFloat(reinterpretedBits32.y)), multiplyAddValue193 * multiplyAddValue62);
    float multiplyAddValue197 = fma(reinterpretedBits33, fma(-multiplyAddValue194, multiplyAddValue63, uintBitsToFloat(reinterpretedBits32.z)), multiplyAddValue194 * multiplyAddValue63);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue195, varyingColor3.x, varyingColor2.x), multiplyAddValue195 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue196, varyingColor3.y, varyingColor2.y), multiplyAddValue196 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue197, varyingColor3.z, varyingColor2.z), multiplyAddValue197 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits56;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits68 = multiplyAddValue225 * uintBitsToFloat(reinterpretedBits31.x);
    float reinterpretedBits69 = multiplyAddValue225 * uintBitsToFloat(reinterpretedBits31.y);
    float reinterpretedBits70 = multiplyAddValue225 * uintBitsToFloat(reinterpretedBits31.z);
    float scalarValue46 = ceil(multiplyAddValue226);
    uvec4 reinterpretedBits60 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue228 = fma(scalarValue46, fma(multiplyAddValue226, uintBitsToFloat(reinterpretedBits60.x), -reinterpretedBits68), reinterpretedBits68);
    float multiplyAddValue229 = fma(scalarValue46, fma(multiplyAddValue226, uintBitsToFloat(reinterpretedBits60.y), -reinterpretedBits69), reinterpretedBits69);
    float multiplyAddValue230 = fma(scalarValue46, fma(multiplyAddValue226, uintBitsToFloat(reinterpretedBits60.z), -reinterpretedBits70), reinterpretedBits70);
    float multiplyAddValue231 = fma(scalarValue3, scalarValue19 - multiplyAddValue228, multiplyAddValue228);
    float multiplyAddValue232 = fma(scalarValue3, scalarValue20 - multiplyAddValue229, multiplyAddValue229);
    float multiplyAddValue233 = fma(scalarValue3, scalarValue21 - multiplyAddValue230, multiplyAddValue230);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue2.w;
    float multiplyAddValue234 = fma(scalarValue6, sampledTextureValue2.x - multiplyAddValue231, multiplyAddValue231);
    float multiplyAddValue235 = fma(scalarValue6, sampledTextureValue2.y - multiplyAddValue232, multiplyAddValue232);
    float multiplyAddValue236 = fma(scalarValue6, sampledTextureValue2.z - multiplyAddValue233, multiplyAddValue233);
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue61 = fma(reinterpretedBits7, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue62 = fma(reinterpretedBits7, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue63 = fma(reinterpretedBits7, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue237 = fma(reinterpretedBits33, fma(-multiplyAddValue234, multiplyAddValue61, uintBitsToFloat(reinterpretedBits32.x)), multiplyAddValue234 * multiplyAddValue61);
    float multiplyAddValue238 = fma(reinterpretedBits33, fma(-multiplyAddValue235, multiplyAddValue62, uintBitsToFloat(reinterpretedBits32.y)), multiplyAddValue235 * multiplyAddValue62);
    float multiplyAddValue239 = fma(reinterpretedBits33, fma(-multiplyAddValue236, multiplyAddValue63, uintBitsToFloat(reinterpretedBits32.z)), multiplyAddValue236 * multiplyAddValue63);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue237, varyingColor3.x, varyingColor2.x), multiplyAddValue237 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue238, varyingColor3.y, varyingColor2.y), multiplyAddValue238 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue239, varyingColor3.z, varyingColor2.z), multiplyAddValue239 * varyingColor3.z);
    fragmentColor0.w = multiplyAddValue227;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits53 = uintBitsToFloat(reinterpretedBits31.x);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits31.y);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits31.z);
    float productValue232 = reinterpretedBits46 * reinterpretedBits53;
    float productValue233 = reinterpretedBits46 * reinterpretedBits54;
    float productValue234 = reinterpretedBits46 * reinterpretedBits55;
    float scalarValue40 = ceil(reinterpretedBits47);
    uvec4 reinterpretedBits60 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue240 = fma(scalarValue40, fma(reinterpretedBits47, uintBitsToFloat(reinterpretedBits60.x), -productValue232), productValue232);
    float multiplyAddValue241 = fma(scalarValue40, fma(reinterpretedBits47, uintBitsToFloat(reinterpretedBits60.y), -productValue233), productValue233);
    float multiplyAddValue242 = fma(scalarValue40, fma(reinterpretedBits47, uintBitsToFloat(reinterpretedBits60.z), -productValue234), productValue234);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    float multiplyAddValue243 = conditionValue ? fma(scalarValue6, fma(scalarValue28, reinterpretedBits53, -scalarValue28), scalarValue28) : fma(scalarValue3, sampledTextureValue1.x - multiplyAddValue240, multiplyAddValue240);
    float multiplyAddValue244 = conditionValue ? fma(scalarValue6, fma(scalarValue29, reinterpretedBits54, -scalarValue29), scalarValue29) : fma(scalarValue3, sampledTextureValue1.y - multiplyAddValue241, multiplyAddValue241);
    float multiplyAddValue245 = conditionValue ? fma(scalarValue6, fma(scalarValue30, reinterpretedBits55, -scalarValue30), scalarValue30) : fma(scalarValue3, sampledTextureValue1.z - multiplyAddValue242, multiplyAddValue242);
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue61 = fma(reinterpretedBits7, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue62 = fma(reinterpretedBits7, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue63 = fma(reinterpretedBits7, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue246 = fma(reinterpretedBits33, fma(-multiplyAddValue243, multiplyAddValue61, uintBitsToFloat(reinterpretedBits32.x)), multiplyAddValue243 * multiplyAddValue61);
    float multiplyAddValue247 = fma(reinterpretedBits33, fma(-multiplyAddValue244, multiplyAddValue62, uintBitsToFloat(reinterpretedBits32.y)), multiplyAddValue244 * multiplyAddValue62);
    float multiplyAddValue248 = fma(reinterpretedBits33, fma(-multiplyAddValue245, multiplyAddValue63, uintBitsToFloat(reinterpretedBits32.z)), multiplyAddValue245 * multiplyAddValue63);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue246, varyingColor3.x, varyingColor2.x), multiplyAddValue246 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue247, varyingColor3.y, varyingColor2.y), multiplyAddValue247 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue248, varyingColor3.z, varyingColor2.z), multiplyAddValue248 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits56;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits53 = uintBitsToFloat(reinterpretedBits31.x);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits31.y);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits31.z);
    float productValue259 = multiplyAddValue225 * reinterpretedBits53;
    float productValue260 = multiplyAddValue225 * reinterpretedBits54;
    float productValue261 = multiplyAddValue225 * reinterpretedBits55;
    float scalarValue46 = ceil(multiplyAddValue226);
    uvec4 reinterpretedBits60 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue267 = fma(scalarValue46, fma(multiplyAddValue226, uintBitsToFloat(reinterpretedBits60.x), -productValue259), productValue259);
    float multiplyAddValue268 = fma(scalarValue46, fma(multiplyAddValue226, uintBitsToFloat(reinterpretedBits60.y), -productValue260), productValue260);
    float multiplyAddValue269 = fma(scalarValue46, fma(multiplyAddValue226, uintBitsToFloat(reinterpretedBits60.z), -productValue261), productValue261);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue28 = sampledTextureValue2.x;
    float scalarValue29 = sampledTextureValue2.y;
    float scalarValue30 = sampledTextureValue2.z;
    float scalarValue6 = sampledTextureValue2.w;
    bool conditionValue = reinterpretedBits12 < scalarValue6;
    float multiplyAddValue270 = conditionValue ? fma(scalarValue6, fma(scalarValue28, reinterpretedBits53, -scalarValue28), scalarValue28) : fma(scalarValue3, scalarValue19 - multiplyAddValue267, multiplyAddValue267);
    float multiplyAddValue271 = conditionValue ? fma(scalarValue6, fma(scalarValue29, reinterpretedBits54, -scalarValue29), scalarValue29) : fma(scalarValue3, scalarValue20 - multiplyAddValue268, multiplyAddValue268);
    float multiplyAddValue272 = conditionValue ? fma(scalarValue6, fma(scalarValue30, reinterpretedBits55, -scalarValue30), scalarValue30) : fma(scalarValue3, scalarValue21 - multiplyAddValue269, multiplyAddValue269);
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue61 = fma(reinterpretedBits7, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue62 = fma(reinterpretedBits7, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue63 = fma(reinterpretedBits7, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits33 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue273 = fma(reinterpretedBits33, fma(-multiplyAddValue270, multiplyAddValue61, uintBitsToFloat(reinterpretedBits32.x)), multiplyAddValue270 * multiplyAddValue61);
    float multiplyAddValue274 = fma(reinterpretedBits33, fma(-multiplyAddValue271, multiplyAddValue62, uintBitsToFloat(reinterpretedBits32.y)), multiplyAddValue271 * multiplyAddValue62);
    float multiplyAddValue275 = fma(reinterpretedBits33, fma(-multiplyAddValue272, multiplyAddValue63, uintBitsToFloat(reinterpretedBits32.z)), multiplyAddValue272 * multiplyAddValue63);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue273, varyingColor3.x, varyingColor2.x), multiplyAddValue273 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue274, varyingColor3.y, varyingColor2.y), multiplyAddValue274 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue275, varyingColor3.z, varyingColor2.z), multiplyAddValue275 * varyingColor3.z);
    fragmentColor0.w = multiplyAddValue227;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue21) * varyingColor2.w) + productValue21;
    fragmentColor0.y = ((varyingColor2.y - productValue22) * varyingColor2.w) + productValue22;
    fragmentColor0.z = ((varyingColor2.z - productValue23) * varyingColor2.w) + productValue23;
    fragmentColor0.w = productValue14;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue37) * varyingColor2.w) + productValue37;
    fragmentColor0.y = ((varyingColor2.y - productValue38) * varyingColor2.w) + productValue38;
    fragmentColor0.z = ((varyingColor2.z - productValue39) * varyingColor2.w) + productValue39;
    fragmentColor0.w = productValue30;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue78) * varyingColor2.w) + productValue78;
    fragmentColor0.y = ((varyingColor2.y - productValue79) * varyingColor2.w) + productValue79;
    fragmentColor0.z = ((varyingColor2.z - productValue80) * varyingColor2.w) + productValue80;
    fragmentColor0.w = productValue74;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue112) * varyingColor2.w) + productValue112;
    fragmentColor0.y = ((varyingColor2.y - productValue113) * varyingColor2.w) + productValue113;
    fragmentColor0.z = ((varyingColor2.z - productValue114) * varyingColor2.w) + productValue114;
    fragmentColor0.w = productValue108;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue126) * varyingColor2.w) + productValue126;
    fragmentColor0.y = ((varyingColor2.y - productValue127) * varyingColor2.w) + productValue127;
    fragmentColor0.z = ((varyingColor2.z - productValue128) * varyingColor2.w) + productValue128;
    fragmentColor0.w = productValue119;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue155) * varyingColor2.w) + productValue155;
    fragmentColor0.y = ((varyingColor2.y - productValue156) * varyingColor2.w) + productValue156;
    fragmentColor0.z = ((varyingColor2.z - productValue157) * varyingColor2.w) + productValue157;
    fragmentColor0.w = productValue148;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue167) * varyingColor2.w) + productValue167;
    fragmentColor0.y = ((varyingColor2.y - productValue168) * varyingColor2.w) + productValue168;
    fragmentColor0.z = ((varyingColor2.z - productValue169) * varyingColor2.w) + productValue169;
    fragmentColor0.w = productValue119;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue173) * varyingColor2.w) + productValue173;
    fragmentColor0.y = ((varyingColor2.y - productValue174) * varyingColor2.w) + productValue174;
    fragmentColor0.z = ((varyingColor2.z - productValue175) * varyingColor2.w) + productValue175;
    fragmentColor0.w = productValue148;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue200) * varyingColor2.w) + productValue200;
    fragmentColor0.y = ((varyingColor2.y - productValue201) * varyingColor2.w) + productValue201;
    fragmentColor0.z = ((varyingColor2.z - productValue202) * varyingColor2.w) + productValue202;
    fragmentColor0.w = productValue74;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue215) * varyingColor2.w) + productValue215;
    fragmentColor0.y = ((varyingColor2.y - productValue216) * varyingColor2.w) + productValue216;
    fragmentColor0.z = ((varyingColor2.z - productValue217) * varyingColor2.w) + productValue217;
    fragmentColor0.w = productValue108;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue173) * varyingColor2.w) + productValue173;
    fragmentColor0.y = ((varyingColor2.y - productValue174) * varyingColor2.w) + productValue174;
    fragmentColor0.z = ((varyingColor2.z - productValue175) * varyingColor2.w) + productValue175;
    fragmentColor0.w = productValue74;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.x = ((varyingColor2.x - productValue247) * varyingColor2.w) + productValue247;
    fragmentColor0.y = ((varyingColor2.y - productValue248) * varyingColor2.w) + productValue248;
    fragmentColor0.z = ((varyingColor2.z - productValue249) * varyingColor2.w) + productValue249;
    fragmentColor0.w = productValue108;
#endif
    discardIfRequested();
}
