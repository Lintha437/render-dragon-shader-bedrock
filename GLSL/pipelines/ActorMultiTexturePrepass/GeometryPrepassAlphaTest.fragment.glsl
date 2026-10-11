#version 460
#extension GL_GOOGLE_include_directive : require
// ActorMultiTexturePrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 24
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
#define RD_BINDING_LAYOUT 19
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

#include "../../include/materials/ActorMultiTexturePrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue9.x;
    float scalarValue11 = sampledTextureValue9.y;
    float scalarValue12 = sampledTextureValue9.z;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue10.w;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits5 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z)));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits6)) * (reinterpretedBits5 - reinterpretedBits6), 0.0, 1.0);
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue5 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.x)) / reinterpretedBits9) * reinterpretedBits9;
    float multiplyAddValue6 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.y)) / reinterpretedBits9) * reinterpretedBits9;
    float productValue48 = floor(multiplyAddValue6 * 0.25);
    float productValue49 = floor(multiplyAddValue6 * 0.5);
    float scalarValue15 = floor(multiplyAddValue6);
    float productValue50 = (scalarValue15 * scalarValue15) * 0.75;
    float multiplyAddValue7 = fma(fma(fma(fract(fma(floor(multiplyAddValue5 * 0.25), 0.5, (productValue48 * productValue48) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue5 * 0.5), 0.5, (productValue49 * productValue49) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue5), 0.5, productValue50))), 64.0, 0.5) * 0.015625;
    bool reinterpretedBits10 = scalarValue13 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && (multiplyAddValue7 >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0)))) || ((spvNMax(sampledTextureValue9.w * uintBitsToFloat(reinterpretedBits.w), 0.0) < 0.5) && reinterpretedBits10))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue33 = sampledTextureValue10.x;
    float scalarValue34 = sampledTextureValue10.y;
    float scalarValue35 = sampledTextureValue10.z;
    float scalarValue13 = sampledTextureValue10.w;
    bool productValue80 = ((1.0 - scalarValue13) * (scalarValue35 + (scalarValue34 + scalarValue33))) > 0.0;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float multiplyAddValue47 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue9.x, -scalarValue33) + scalarValue33) : scalarValue33;
    float multiplyAddValue48 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue9.y, -scalarValue34) + scalarValue34) : scalarValue34;
    float multiplyAddValue49 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue9.z, -scalarValue35) + scalarValue35) : scalarValue35;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits5 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z)));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits6)) * (reinterpretedBits5 - reinterpretedBits6), 0.0, 1.0);
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue5 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.x)) / reinterpretedBits9) * reinterpretedBits9;
    float multiplyAddValue6 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.y)) / reinterpretedBits9) * reinterpretedBits9;
    float productValue48 = floor(multiplyAddValue6 * 0.25);
    float productValue81 = floor(multiplyAddValue5 * 0.5);
    float productValue49 = floor(multiplyAddValue6 * 0.5);
    float multiplyAddValue50 = fract(fma(productValue81, 0.5, (productValue49 * productValue49) * 0.75));
    float multiplyAddValue51 = fma(fract(fma(floor(multiplyAddValue5 * 0.25), 0.5, (productValue48 * productValue48) * 0.75)), 0.25, multiplyAddValue50);
    float scalarValue15 = floor(multiplyAddValue6);
    if (((spvNMax(productValue80 ? (fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue9.w, -scalarValue13) + scalarValue13) : scalarValue13, 0.0) < 0.5) && (scalarValue13 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u])))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && ((fma(fma(multiplyAddValue51, 0.25, fract(fma(floor(multiplyAddValue5), 0.5, (scalarValue15 * scalarValue15) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0)))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue10 = sampledTextureValue9.x;
    float scalarValue11 = sampledTextureValue9.y;
    float scalarValue12 = sampledTextureValue9.z;
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue10.w;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits43 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits30.z)));
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits45 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits44)) * (reinterpretedBits43 - reinterpretedBits44), 0.0, 1.0);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits47 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue63 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.x)) / reinterpretedBits47) * reinterpretedBits47;
    float multiplyAddValue64 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.y)) / reinterpretedBits47) * reinterpretedBits47;
    float productValue97 = floor(multiplyAddValue64 * 0.25);
    float productValue98 = floor(multiplyAddValue64 * 0.5);
    float scalarValue43 = floor(multiplyAddValue64);
    float productValue99 = (scalarValue43 * scalarValue43) * 0.75;
    float multiplyAddValue65 = fma(fma(fma(fract(fma(floor(multiplyAddValue63 * 0.25), 0.5, (productValue97 * productValue97) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue63 * 0.5), 0.5, (productValue98 * productValue98) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue63), 0.5, productValue99))), 64.0, 0.5) * 0.015625;
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    bool conditionValue8 = scalarValue13 < reinterpretedBits12;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && (multiplyAddValue65 >= ((reinterpretedBits45 * reinterpretedBits45) * fma(reinterpretedBits45, -2.0, 3.0)))) || ((spvNMax(sampledTextureValue9.w * uintBitsToFloat(reinterpretedBits42.w), 0.0) < 0.5) && conditionValue8))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue33 = sampledTextureValue10.x;
    float scalarValue34 = sampledTextureValue10.y;
    float scalarValue35 = sampledTextureValue10.z;
    float scalarValue13 = sampledTextureValue10.w;
    bool productValue80 = ((1.0 - scalarValue13) * (scalarValue35 + (scalarValue34 + scalarValue33))) > 0.0;
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float multiplyAddValue82 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.x), sampledTextureValue9.x, -scalarValue33) + scalarValue33) : scalarValue33;
    float multiplyAddValue83 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.y), sampledTextureValue9.y, -scalarValue34) + scalarValue34) : scalarValue34;
    float multiplyAddValue84 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.z), sampledTextureValue9.z, -scalarValue35) + scalarValue35) : scalarValue35;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits43 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits30.z)));
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits45 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits44)) * (reinterpretedBits43 - reinterpretedBits44), 0.0, 1.0);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits47 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue63 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.x)) / reinterpretedBits47) * reinterpretedBits47;
    float multiplyAddValue64 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.y)) / reinterpretedBits47) * reinterpretedBits47;
    float productValue97 = floor(multiplyAddValue64 * 0.25);
    float productValue115 = floor(multiplyAddValue63 * 0.5);
    float productValue98 = floor(multiplyAddValue64 * 0.5);
    float multiplyAddValue85 = fract(fma(productValue115, 0.5, (productValue98 * productValue98) * 0.75));
    float multiplyAddValue86 = fma(fract(fma(floor(multiplyAddValue63 * 0.25), 0.5, (productValue97 * productValue97) * 0.75)), 0.25, multiplyAddValue85);
    float scalarValue43 = floor(multiplyAddValue64);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(multiplyAddValue86, 0.25, fract(fma(floor(multiplyAddValue63), 0.5, (scalarValue43 * scalarValue43) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits45 * reinterpretedBits45) * fma(reinterpretedBits45, -2.0, 3.0)))) || ((spvNMax(productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.w), sampledTextureValue9.w, -scalarValue13) + scalarValue13) : scalarValue13, 0.0) < 0.5) && (scalarValue13 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float reinterpretedBits60 = sampledTextureValue9.x * uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits61 = sampledTextureValue9.y * uintBitsToFloat(reinterpretedBits42.y);
    float reinterpretedBits62 = sampledTextureValue9.z * uintBitsToFloat(reinterpretedBits42.z);
    float reinterpretedBits63 = sampledTextureValue9.w * uintBitsToFloat(reinterpretedBits42.w);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue10.w;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits43 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits30.z)));
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits45 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits44)) * (reinterpretedBits43 - reinterpretedBits44), 0.0, 1.0);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits47 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue63 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.x)) / reinterpretedBits47) * reinterpretedBits47;
    float multiplyAddValue64 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.y)) / reinterpretedBits47) * reinterpretedBits47;
    float productValue97 = floor(multiplyAddValue64 * 0.25);
    float productValue98 = floor(multiplyAddValue64 * 0.5);
    float multiplyAddValue93 = fract(fma(floor(multiplyAddValue63 * 0.25), 0.5, (productValue97 * productValue97) * 0.75));
    float scalarValue43 = floor(multiplyAddValue64);
    float productValue99 = (scalarValue43 * scalarValue43) * 0.75;
    float multiplyAddValue94 = fract(fma(floor(multiplyAddValue63), 0.5, productValue99));
    if (((spvNMax(reinterpretedBits63 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0) < 0.5) && (scalarValue13 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u])))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(multiplyAddValue93, 0.25, fract(fma(floor(multiplyAddValue63 * 0.5), 0.5, (productValue98 * productValue98) * 0.75))), 0.25, multiplyAddValue94), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits45 * reinterpretedBits45) * fma(reinterpretedBits45, -2.0, 3.0)))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue33 = sampledTextureValue10.x;
    float scalarValue34 = sampledTextureValue10.y;
    float scalarValue35 = sampledTextureValue10.z;
    float scalarValue13 = sampledTextureValue10.w;
    bool productValue80 = ((1.0 - scalarValue13) * (scalarValue35 + (scalarValue34 + scalarValue33))) > 0.0;
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float multiplyAddValue82 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.x), sampledTextureValue9.x, -scalarValue33) + scalarValue33) : scalarValue33;
    float multiplyAddValue83 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.y), sampledTextureValue9.y, -scalarValue34) + scalarValue34) : scalarValue34;
    float multiplyAddValue84 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.z), sampledTextureValue9.z, -scalarValue35) + scalarValue35) : scalarValue35;
    float multiplyAddValue107 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.w), sampledTextureValue9.w, -scalarValue13) + scalarValue13) : scalarValue13;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits43 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits30.z)));
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits45 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits44)) * (reinterpretedBits43 - reinterpretedBits44), 0.0, 1.0);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits47 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue63 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.x)) / reinterpretedBits47) * reinterpretedBits47;
    float multiplyAddValue64 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.y)) / reinterpretedBits47) * reinterpretedBits47;
    float productValue97 = floor(multiplyAddValue64 * 0.25);
    float productValue98 = floor(multiplyAddValue64 * 0.5);
    float multiplyAddValue93 = fract(fma(floor(multiplyAddValue63 * 0.25), 0.5, (productValue97 * productValue97) * 0.75));
    float scalarValue43 = floor(multiplyAddValue64);
    float productValue99 = (scalarValue43 * scalarValue43) * 0.75;
    float multiplyAddValue94 = fract(fma(floor(multiplyAddValue63), 0.5, productValue99));
    if (((spvNMax(multiplyAddValue107 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0) < 0.5) && (scalarValue13 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u])))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(multiplyAddValue93, 0.25, fract(fma(floor(multiplyAddValue63 * 0.5), 0.5, (productValue98 * productValue98) * 0.75))), 0.25, multiplyAddValue94), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits45 * reinterpretedBits45) * fma(reinterpretedBits45, -2.0, 3.0)))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float reinterpretedBits60 = sampledTextureValue9.x * uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits61 = sampledTextureValue9.y * uintBitsToFloat(reinterpretedBits42.y);
    float reinterpretedBits62 = sampledTextureValue9.z * uintBitsToFloat(reinterpretedBits42.z);
    float reinterpretedBits63 = sampledTextureValue9.w * uintBitsToFloat(reinterpretedBits42.w);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue10.w;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits43 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits30.z)));
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits45 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits44)) * (reinterpretedBits43 - reinterpretedBits44), 0.0, 1.0);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits47 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue63 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.x)) / reinterpretedBits47) * reinterpretedBits47;
    float multiplyAddValue64 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.y)) / reinterpretedBits47) * reinterpretedBits47;
    float productValue97 = floor(multiplyAddValue64 * 0.25);
    float productValue98 = floor(multiplyAddValue64 * 0.5);
    float multiplyAddValue93 = fract(fma(floor(multiplyAddValue63 * 0.25), 0.5, (productValue97 * productValue97) * 0.75));
    float scalarValue43 = floor(multiplyAddValue64);
    float productValue99 = (scalarValue43 * scalarValue43) * 0.75;
    float multiplyAddValue94 = fract(fma(floor(multiplyAddValue63), 0.5, productValue99));
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(multiplyAddValue93, 0.25, fract(fma(floor(multiplyAddValue63 * 0.5), 0.5, (productValue98 * productValue98) * 0.75))), 0.25, multiplyAddValue94), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits45 * reinterpretedBits45) * fma(reinterpretedBits45, -2.0, 3.0)))) || ((spvNMax(reinterpretedBits63 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0) < 0.5) && (scalarValue13 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue33 = sampledTextureValue10.x;
    float scalarValue34 = sampledTextureValue10.y;
    float scalarValue35 = sampledTextureValue10.z;
    float scalarValue13 = sampledTextureValue10.w;
    bool productValue80 = ((1.0 - scalarValue13) * (scalarValue35 + (scalarValue34 + scalarValue33))) > 0.0;
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float multiplyAddValue82 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.x), sampledTextureValue9.x, -scalarValue33) + scalarValue33) : scalarValue33;
    float multiplyAddValue83 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.y), sampledTextureValue9.y, -scalarValue34) + scalarValue34) : scalarValue34;
    float multiplyAddValue84 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.z), sampledTextureValue9.z, -scalarValue35) + scalarValue35) : scalarValue35;
    float multiplyAddValue107 = productValue80 ? (fma(uintBitsToFloat(reinterpretedBits42.w), sampledTextureValue9.w, -scalarValue13) + scalarValue13) : scalarValue13;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits43 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits30.z)));
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits45 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits44)) * (reinterpretedBits43 - reinterpretedBits44), 0.0, 1.0);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits47 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue63 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.x)) / reinterpretedBits47) * reinterpretedBits47;
    float multiplyAddValue64 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.y)) / reinterpretedBits47) * reinterpretedBits47;
    float productValue97 = floor(multiplyAddValue64 * 0.25);
    float productValue98 = floor(multiplyAddValue64 * 0.5);
    float multiplyAddValue93 = fract(fma(floor(multiplyAddValue63 * 0.25), 0.5, (productValue97 * productValue97) * 0.75));
    float scalarValue43 = floor(multiplyAddValue64);
    float productValue99 = (scalarValue43 * scalarValue43) * 0.75;
    float multiplyAddValue94 = fract(fma(floor(multiplyAddValue63), 0.5, productValue99));
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(multiplyAddValue93, 0.25, fract(fma(floor(multiplyAddValue63 * 0.5), 0.5, (productValue98 * productValue98) * 0.75))), 0.25, multiplyAddValue94), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits45 * reinterpretedBits45) * fma(reinterpretedBits45, -2.0, 3.0)))) || ((spvNMax(multiplyAddValue107 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0) < 0.5) && (scalarValue13 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float reinterpretedBits60 = sampledTextureValue9.x * uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits61 = sampledTextureValue9.y * uintBitsToFloat(reinterpretedBits42.y);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue10.w;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits43 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits30.z)));
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits45 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits44)) * (reinterpretedBits43 - reinterpretedBits44), 0.0, 1.0);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits47 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue63 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.x)) / reinterpretedBits47) * reinterpretedBits47;
    float multiplyAddValue64 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.y)) / reinterpretedBits47) * reinterpretedBits47;
    float productValue97 = floor(multiplyAddValue64 * 0.25);
    float productValue115 = floor(multiplyAddValue63 * 0.5);
    float productValue98 = floor(multiplyAddValue64 * 0.5);
    float multiplyAddValue93 = fract(fma(floor(multiplyAddValue63 * 0.25), 0.5, (productValue97 * productValue97) * 0.75));
    float multiplyAddValue85 = fract(fma(productValue115, 0.5, (productValue98 * productValue98) * 0.75));
    float scalarValue43 = floor(multiplyAddValue64);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(multiplyAddValue93, 0.25, multiplyAddValue85), 0.25, fract(fma(floor(multiplyAddValue63), 0.5, (scalarValue43 * scalarValue43) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits45 * reinterpretedBits45) * fma(reinterpretedBits45, -2.0, 3.0)))) || ((spvNMax(sampledTextureValue9.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[123u])), 0.0) < 0.5) && (scalarValue13 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue33 = sampledTextureValue10.x;
    float scalarValue34 = sampledTextureValue10.y;
    float scalarValue35 = sampledTextureValue10.z;
    float scalarValue13 = sampledTextureValue10.w;
    bool productValue191 = ((scalarValue35 + (scalarValue34 + scalarValue33)) * (1.0 - scalarValue13)) > 0.0;
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float multiplyAddValue156 = productValue191 ? (fma(uintBitsToFloat(reinterpretedBits42.x), sampledTextureValue9.x, -scalarValue33) + scalarValue33) : scalarValue33;
    float multiplyAddValue157 = productValue191 ? (fma(uintBitsToFloat(reinterpretedBits42.y), sampledTextureValue9.y, -scalarValue34) + scalarValue34) : scalarValue34;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits43 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits30.z)));
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits45 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits44)) * (reinterpretedBits43 - reinterpretedBits44), 0.0, 1.0);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits47 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue63 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.x)) / reinterpretedBits47) * reinterpretedBits47;
    float multiplyAddValue64 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.y)) / reinterpretedBits47) * reinterpretedBits47;
    float productValue97 = floor(multiplyAddValue64 * 0.25);
    float productValue115 = floor(multiplyAddValue63 * 0.5);
    float productValue98 = floor(multiplyAddValue64 * 0.5);
    float multiplyAddValue93 = fract(fma(floor(multiplyAddValue63 * 0.25), 0.5, (productValue97 * productValue97) * 0.75));
    float multiplyAddValue85 = fract(fma(productValue115, 0.5, (productValue98 * productValue98) * 0.75));
    float scalarValue43 = floor(multiplyAddValue64);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(multiplyAddValue93, 0.25, multiplyAddValue85), 0.25, fract(fma(floor(multiplyAddValue63), 0.5, (scalarValue43 * scalarValue43) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits45 * reinterpretedBits45) * fma(reinterpretedBits45, -2.0, 3.0)))) || ((spvNMax(productValue191 ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[123u])), sampledTextureValue9.w, -scalarValue13) + scalarValue13) : scalarValue13, 0.0) < 0.5) && (scalarValue13 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u])))))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float reinterpretedBits60 = sampledTextureValue9.x * uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits61 = sampledTextureValue9.y * uintBitsToFloat(reinterpretedBits42.y);
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue10.w;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits43 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits30.z)));
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits45 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits44)) * (reinterpretedBits43 - reinterpretedBits44), 0.0, 1.0);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits47 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue63 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.x)) / reinterpretedBits47) * reinterpretedBits47;
    float multiplyAddValue64 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.y)) / reinterpretedBits47) * reinterpretedBits47;
    float productValue97 = floor(multiplyAddValue64 * 0.25);
    float productValue115 = floor(multiplyAddValue63 * 0.5);
    float productValue98 = floor(multiplyAddValue64 * 0.5);
    float multiplyAddValue93 = fract(fma(floor(multiplyAddValue63 * 0.25), 0.5, (productValue97 * productValue97) * 0.75));
    float multiplyAddValue85 = fract(fma(productValue115, 0.5, (productValue98 * productValue98) * 0.75));
    float scalarValue43 = floor(multiplyAddValue64);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(multiplyAddValue93, 0.25, multiplyAddValue85), 0.25, fract(fma(floor(multiplyAddValue63), 0.5, (scalarValue43 * scalarValue43) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits45 * reinterpretedBits45) * fma(reinterpretedBits45, -2.0, 3.0)))) || ((spvNMax(sampledTextureValue9.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[123u])), 0.0) < 0.5) && (scalarValue13 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue33 = sampledTextureValue10.x;
    float scalarValue34 = sampledTextureValue10.y;
    float scalarValue35 = sampledTextureValue10.z;
    float scalarValue13 = sampledTextureValue10.w;
    bool productValue191 = ((scalarValue35 + (scalarValue34 + scalarValue33)) * (1.0 - scalarValue13)) > 0.0;
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float multiplyAddValue156 = productValue191 ? (fma(uintBitsToFloat(reinterpretedBits42.x), sampledTextureValue9.x, -scalarValue33) + scalarValue33) : scalarValue33;
    float multiplyAddValue157 = productValue191 ? (fma(uintBitsToFloat(reinterpretedBits42.y), sampledTextureValue9.y, -scalarValue34) + scalarValue34) : scalarValue34;
    float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
    float scalarValue14 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue14);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits43 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits1), -(inverseLengthValue8 * reinterpretedBits2), -(inverseLengthValue8 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits30.z)));
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits45 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits44)) * (reinterpretedBits43 - reinterpretedBits44), 0.0, 1.0);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits47 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue63 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.x)) / reinterpretedBits47) * reinterpretedBits47;
    float multiplyAddValue64 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits46.y)) / reinterpretedBits47) * reinterpretedBits47;
    float productValue97 = floor(multiplyAddValue64 * 0.25);
    float productValue115 = floor(multiplyAddValue63 * 0.5);
    float productValue98 = floor(multiplyAddValue64 * 0.5);
    float multiplyAddValue93 = fract(fma(floor(multiplyAddValue63 * 0.25), 0.5, (productValue97 * productValue97) * 0.75));
    float multiplyAddValue85 = fract(fma(productValue115, 0.5, (productValue98 * productValue98) * 0.75));
    float scalarValue43 = floor(multiplyAddValue64);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(multiplyAddValue93, 0.25, multiplyAddValue85), 0.25, fract(fma(floor(multiplyAddValue63), 0.5, (scalarValue43 * scalarValue43) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits45 * reinterpretedBits45) * fma(reinterpretedBits45, -2.0, 3.0)))) || ((spvNMax(productValue191 ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[123u])), sampledTextureValue9.w, -scalarValue13) + scalarValue13) : scalarValue13, 0.0) < 0.5) && (scalarValue13 < reinterpretedBits12)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * fragmentVectorConstants1.packedValues[29u].x;
    float productValue1 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[29u].y;
    float productValue2 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[29u].z;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue12 = ((sampledTextureValue1.x - productValue) * scalarValue) + productValue;
    float productValue13 = ((sampledTextureValue1.y - productValue1) * scalarValue) + productValue1;
    float productValue25 = ((sampledTextureValue1.z - productValue2) * scalarValue) + productValue2;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue26 = (((sampledTextureValue2.x - productValue12) * scalarValue1) + productValue12) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue27 = (((sampledTextureValue2.y - productValue13) * scalarValue1) + productValue13) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue28 = (((sampledTextureValue2.z - productValue25) * scalarValue1) + productValue25) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue30 = sampledTextureValue1.x;
    float scalarValue31 = sampledTextureValue1.y;
    float scalarValue32 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue62 = float((((scalarValue30 + scalarValue31) + scalarValue32) * (1.0 - scalarValue)) > 0.0);
    float productValue63 = productValue62 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[29u].x) - scalarValue30);
    float productValue64 = productValue62 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[29u].y) - scalarValue31);
    float productValue65 = productValue62 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[29u].z) - scalarValue32);
    float productValue66 = (productValue63 + scalarValue30) - (productValue63 * scalarValue);
    float productValue67 = (productValue64 + scalarValue31) - (productValue64 * scalarValue);
    float productValue68 = (productValue65 + scalarValue32) - (productValue65 * scalarValue);
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue69 = (((sampledTextureValue2.x - productValue66) * scalarValue1) + productValue66) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue70 = (((sampledTextureValue2.y - productValue67) * scalarValue1) + productValue67) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue71 = (((sampledTextureValue2.z - productValue68) * scalarValue1) + productValue68) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue87 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x;
    float productValue88 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y;
    float productValue89 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue38 = sampledTextureValue2.x;
    float scalarValue39 = sampledTextureValue2.y;
    float scalarValue40 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue3;
    float productValue4;
    float productValue5;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[21u].x)
    {
        productValue3 = (((fragmentVectorConstants1.packedValues[4u].x * scalarValue38) - scalarValue38) * scalarValue1) + scalarValue38;
        productValue4 = (((fragmentVectorConstants1.packedValues[4u].y * scalarValue39) - scalarValue39) * scalarValue1) + scalarValue39;
        productValue5 = (((fragmentVectorConstants1.packedValues[4u].z * scalarValue40) - scalarValue40) * scalarValue1) + scalarValue40;
    }
    else
    {
        productValue3 = ((sampledTextureValue1.x - productValue87) * scalarValue) + productValue87;
        productValue4 = ((sampledTextureValue1.y - productValue88) * scalarValue) + productValue88;
        productValue5 = ((sampledTextureValue1.z - productValue89) * scalarValue) + productValue89;
    }
    float productValue90 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue3;
    float productValue91 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue4;
    float productValue92 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue5;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue30 = sampledTextureValue1.x;
    float scalarValue31 = sampledTextureValue1.y;
    float scalarValue32 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue62 = float((((scalarValue30 + scalarValue31) + scalarValue32) * (1.0 - scalarValue)) > 0.0);
    float productValue102 = productValue62 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x) - scalarValue30);
    float productValue103 = productValue62 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y) - scalarValue31);
    float productValue104 = productValue62 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z) - scalarValue32);
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue38 = sampledTextureValue2.x;
    float scalarValue39 = sampledTextureValue2.y;
    float scalarValue40 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue4;
    float productValue5;
    float productValue6;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[21u].x)
    {
        productValue4 = (((fragmentVectorConstants1.packedValues[4u].x * scalarValue38) - scalarValue38) * scalarValue1) + scalarValue38;
        productValue5 = (((fragmentVectorConstants1.packedValues[4u].y * scalarValue39) - scalarValue39) * scalarValue1) + scalarValue39;
        productValue6 = (((fragmentVectorConstants1.packedValues[4u].z * scalarValue40) - scalarValue40) * scalarValue1) + scalarValue40;
    }
    else
    {
        productValue4 = (productValue102 + scalarValue30) - (productValue102 * scalarValue);
        productValue5 = (productValue103 + scalarValue31) - (productValue103 * scalarValue);
        productValue6 = (productValue104 + scalarValue32) - (productValue104 * scalarValue);
    }
    float productValue105 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue4;
    float productValue106 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue5;
    float productValue107 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue6;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue87 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x;
    float productValue88 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y;
    float productValue89 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z;
    float productValue116 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w;
    float productValue117 = (((productValue87 * fragmentVectorConstants1.packedValues[4u].x) - productValue87) * productValue116) + productValue87;
    float productValue118 = (((productValue88 * fragmentVectorConstants1.packedValues[4u].y) - productValue88) * productValue116) + productValue88;
    float productValue119 = (((productValue89 * fragmentVectorConstants1.packedValues[4u].z) - productValue89) * productValue116) + productValue89;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue120 = ((sampledTextureValue1.x - productValue117) * scalarValue) + productValue117;
    float productValue121 = ((sampledTextureValue1.y - productValue118) * scalarValue) + productValue118;
    float productValue122 = ((sampledTextureValue1.z - productValue119) * scalarValue) + productValue119;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue123 = (((sampledTextureValue2.x - productValue120) * scalarValue1) + productValue120) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue124 = (((sampledTextureValue2.y - productValue121) * scalarValue1) + productValue121) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue125 = (((sampledTextureValue2.z - productValue122) * scalarValue1) + productValue122) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue30 = sampledTextureValue1.x;
    float scalarValue31 = sampledTextureValue1.y;
    float scalarValue32 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue62 = float((((scalarValue30 + scalarValue31) + scalarValue32) * (1.0 - scalarValue)) > 0.0);
    float productValue129 = (productValue62 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x) - scalarValue30)) + scalarValue30;
    float productValue130 = (productValue62 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y) - scalarValue31)) + scalarValue31;
    float productValue131 = (productValue62 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z) - scalarValue32)) + scalarValue32;
    float productValue132 = (productValue62 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) - scalarValue)) + scalarValue;
    float productValue133 = (((productValue129 * fragmentVectorConstants1.packedValues[4u].x) - productValue129) * productValue132) + productValue129;
    float productValue134 = (((productValue130 * fragmentVectorConstants1.packedValues[4u].y) - productValue130) * productValue132) + productValue130;
    float productValue135 = (((productValue131 * fragmentVectorConstants1.packedValues[4u].z) - productValue131) * productValue132) + productValue131;
    float productValue136 = ((scalarValue30 - productValue133) * scalarValue) + productValue133;
    float productValue137 = ((scalarValue31 - productValue134) * scalarValue) + productValue134;
    float productValue138 = ((scalarValue32 - productValue135) * scalarValue) + productValue135;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue139 = (((sampledTextureValue2.x - productValue136) * scalarValue1) + productValue136) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue140 = (((sampledTextureValue2.y - productValue137) * scalarValue1) + productValue137) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue141 = (((sampledTextureValue2.z - productValue138) * scalarValue1) + productValue138) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue87 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x;
    float productValue88 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y;
    float productValue89 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z;
    float productValue116 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w;
    float productValue117 = (((productValue87 * fragmentVectorConstants1.packedValues[4u].x) - productValue87) * productValue116) + productValue87;
    float productValue118 = (((productValue88 * fragmentVectorConstants1.packedValues[4u].y) - productValue88) * productValue116) + productValue88;
    float productValue119 = (((productValue89 * fragmentVectorConstants1.packedValues[4u].z) - productValue89) * productValue116) + productValue89;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue38 = sampledTextureValue2.x;
    float scalarValue39 = sampledTextureValue2.y;
    float scalarValue40 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue7;
    float productValue8;
    float productValue9;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[21u].x)
    {
        productValue7 = (((scalarValue38 * fragmentVectorConstants1.packedValues[4u].x) - scalarValue38) * scalarValue1) + scalarValue38;
        productValue8 = (((scalarValue39 * fragmentVectorConstants1.packedValues[4u].y) - scalarValue39) * scalarValue1) + scalarValue39;
        productValue9 = (((scalarValue40 * fragmentVectorConstants1.packedValues[4u].z) - scalarValue40) * scalarValue1) + scalarValue40;
    }
    else
    {
        productValue7 = ((sampledTextureValue1.x - productValue117) * scalarValue) + productValue117;
        productValue8 = ((sampledTextureValue1.y - productValue118) * scalarValue) + productValue118;
        productValue9 = ((sampledTextureValue1.z - productValue119) * scalarValue) + productValue119;
    }
    float productValue144 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue7;
    float productValue145 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue8;
    float productValue146 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue9;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue30 = sampledTextureValue1.x;
    float scalarValue31 = sampledTextureValue1.y;
    float scalarValue32 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue62 = float((((scalarValue30 + scalarValue31) + scalarValue32) * (1.0 - scalarValue)) > 0.0);
    float productValue129 = (productValue62 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x) - scalarValue30)) + scalarValue30;
    float productValue130 = (productValue62 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y) - scalarValue31)) + scalarValue31;
    float productValue131 = (productValue62 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z) - scalarValue32)) + scalarValue32;
    float productValue132 = (productValue62 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) - scalarValue)) + scalarValue;
    float productValue133 = (((productValue129 * fragmentVectorConstants1.packedValues[4u].x) - productValue129) * productValue132) + productValue129;
    float productValue134 = (((productValue130 * fragmentVectorConstants1.packedValues[4u].y) - productValue130) * productValue132) + productValue130;
    float productValue135 = (((productValue131 * fragmentVectorConstants1.packedValues[4u].z) - productValue131) * productValue132) + productValue131;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue38 = sampledTextureValue2.x;
    float scalarValue39 = sampledTextureValue2.y;
    float scalarValue40 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[21u].x)
    {
        productValue8 = (((scalarValue38 * fragmentVectorConstants1.packedValues[4u].x) - scalarValue38) * scalarValue1) + scalarValue38;
        productValue9 = (((scalarValue39 * fragmentVectorConstants1.packedValues[4u].y) - scalarValue39) * scalarValue1) + scalarValue39;
        productValue10 = (((scalarValue40 * fragmentVectorConstants1.packedValues[4u].z) - scalarValue40) * scalarValue1) + scalarValue40;
    }
    else
    {
        productValue8 = ((scalarValue30 - productValue133) * scalarValue) + productValue133;
        productValue9 = ((scalarValue31 - productValue134) * scalarValue) + productValue134;
        productValue10 = ((scalarValue32 - productValue135) * scalarValue) + productValue135;
    }
    float productValue148 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue8;
    float productValue149 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue9;
    float productValue150 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue10;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue87 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x;
    float productValue88 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y;
    float productValue152 = fragmentVectorConstants1.packedValues[4u].x * productValue87;
    float productValue153 = fragmentVectorConstants1.packedValues[4u].y * productValue87;
    float productValue154 = fragmentVectorConstants1.packedValues[4u].z * productValue87;
    float scalarValue53 = ceil(productValue88);
    float productValue155 = (((productValue88 * fragmentVectorConstants1.packedValues[31u].x) - productValue152) * scalarValue53) + productValue152;
    float productValue156 = (((productValue88 * fragmentVectorConstants1.packedValues[31u].y) - productValue153) * scalarValue53) + productValue153;
    float productValue157 = (((productValue88 * fragmentVectorConstants1.packedValues[31u].z) - productValue154) * scalarValue53) + productValue154;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue158 = ((sampledTextureValue1.x - productValue155) * scalarValue) + productValue155;
    float productValue159 = ((sampledTextureValue1.y - productValue156) * scalarValue) + productValue156;
    float productValue160 = ((sampledTextureValue1.z - productValue157) * scalarValue) + productValue157;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue161 = (((sampledTextureValue2.x - productValue158) * scalarValue1) + productValue158) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue162 = (((sampledTextureValue2.y - productValue159) * scalarValue1) + productValue159) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue163 = (((sampledTextureValue2.z - productValue160) * scalarValue1) + productValue160) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue30 = sampledTextureValue1.x;
    float scalarValue31 = sampledTextureValue1.y;
    float scalarValue32 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue62 = float((((scalarValue30 + scalarValue31) + scalarValue32) * (1.0 - scalarValue)) > 0.0);
    float productValue129 = (productValue62 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x) - scalarValue30)) + scalarValue30;
    float productValue130 = (productValue62 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y) - scalarValue31)) + scalarValue31;
    float productValue171 = productValue129 * fragmentVectorConstants1.packedValues[4u].x;
    float productValue172 = productValue129 * fragmentVectorConstants1.packedValues[4u].y;
    float productValue173 = productValue129 * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue54 = ceil(productValue130);
    float productValue174 = (((productValue130 * fragmentVectorConstants1.packedValues[31u].x) - productValue171) * scalarValue54) + productValue171;
    float productValue175 = (((productValue130 * fragmentVectorConstants1.packedValues[31u].y) - productValue172) * scalarValue54) + productValue172;
    float productValue176 = (((productValue130 * fragmentVectorConstants1.packedValues[31u].z) - productValue173) * scalarValue54) + productValue173;
    float productValue177 = ((scalarValue30 - productValue174) * scalarValue) + productValue174;
    float productValue178 = ((scalarValue31 - productValue175) * scalarValue) + productValue175;
    float productValue179 = ((scalarValue32 - productValue176) * scalarValue) + productValue176;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue2.w;
    float productValue180 = (((sampledTextureValue2.x - productValue177) * scalarValue1) + productValue177) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue181 = (((sampledTextureValue2.y - productValue178) * scalarValue1) + productValue178) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue182 = (((sampledTextureValue2.z - productValue179) * scalarValue1) + productValue179) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue87 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x;
    float productValue88 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y;
    float productValue152 = fragmentVectorConstants1.packedValues[4u].x * productValue87;
    float productValue153 = fragmentVectorConstants1.packedValues[4u].y * productValue87;
    float productValue154 = fragmentVectorConstants1.packedValues[4u].z * productValue87;
    float scalarValue53 = ceil(productValue88);
    float productValue155 = (((productValue88 * fragmentVectorConstants1.packedValues[31u].x) - productValue152) * scalarValue53) + productValue152;
    float productValue156 = (((productValue88 * fragmentVectorConstants1.packedValues[31u].y) - productValue153) * scalarValue53) + productValue153;
    float productValue157 = (((productValue88 * fragmentVectorConstants1.packedValues[31u].z) - productValue154) * scalarValue53) + productValue154;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue38 = sampledTextureValue2.x;
    float scalarValue39 = sampledTextureValue2.y;
    float scalarValue40 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue8;
    float productValue9;
    float productValue10;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[21u].x)
    {
        productValue8 = (((scalarValue38 * fragmentVectorConstants1.packedValues[4u].x) - scalarValue38) * scalarValue1) + scalarValue38;
        productValue9 = (((scalarValue39 * fragmentVectorConstants1.packedValues[4u].y) - scalarValue39) * scalarValue1) + scalarValue39;
        productValue10 = (((scalarValue40 * fragmentVectorConstants1.packedValues[4u].z) - scalarValue40) * scalarValue1) + scalarValue40;
    }
    else
    {
        productValue8 = ((sampledTextureValue1.x - productValue155) * scalarValue) + productValue155;
        productValue9 = ((sampledTextureValue1.y - productValue156) * scalarValue) + productValue156;
        productValue10 = ((sampledTextureValue1.z - productValue157) * scalarValue) + productValue157;
    }
    float productValue148 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue8;
    float productValue149 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue9;
    float productValue150 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue10;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue30 = sampledTextureValue1.x;
    float scalarValue31 = sampledTextureValue1.y;
    float scalarValue32 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue62 = float((((scalarValue30 + scalarValue31) + scalarValue32) * (1.0 - scalarValue)) > 0.0);
    float productValue129 = (productValue62 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x) - scalarValue30)) + scalarValue30;
    float productValue130 = (productValue62 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y) - scalarValue31)) + scalarValue31;
    float productValue171 = productValue129 * fragmentVectorConstants1.packedValues[4u].x;
    float productValue172 = productValue129 * fragmentVectorConstants1.packedValues[4u].y;
    float productValue173 = productValue129 * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue54 = ceil(productValue130);
    float productValue174 = (((productValue130 * fragmentVectorConstants1.packedValues[31u].x) - productValue171) * scalarValue54) + productValue171;
    float productValue175 = (((productValue130 * fragmentVectorConstants1.packedValues[31u].y) - productValue172) * scalarValue54) + productValue172;
    float productValue176 = (((productValue130 * fragmentVectorConstants1.packedValues[31u].z) - productValue173) * scalarValue54) + productValue173;
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture2Texture, matTexture2Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue38 = sampledTextureValue2.x;
    float scalarValue39 = sampledTextureValue2.y;
    float scalarValue40 = sampledTextureValue2.z;
    float scalarValue1 = sampledTextureValue2.w;
    float productValue9;
    float productValue10;
    float productValue11;
    if (scalarValue1 > fragmentVectorConstants1.packedValues[21u].x)
    {
        productValue9 = (((scalarValue38 * fragmentVectorConstants1.packedValues[4u].x) - scalarValue38) * scalarValue1) + scalarValue38;
        productValue10 = (((scalarValue39 * fragmentVectorConstants1.packedValues[4u].y) - scalarValue39) * scalarValue1) + scalarValue39;
        productValue11 = (((scalarValue40 * fragmentVectorConstants1.packedValues[4u].z) - scalarValue40) * scalarValue1) + scalarValue40;
    }
    else
    {
        productValue9 = ((scalarValue30 - productValue174) * scalarValue) + productValue174;
        productValue10 = ((scalarValue31 - productValue175) * scalarValue) + productValue175;
        productValue11 = ((scalarValue32 - productValue176) * scalarValue) + productValue176;
    }
    float productValue201 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue9;
    float productValue202 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue10;
    float productValue203 = ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue11;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#endif
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float multiplyAddValue8 = fma(scalarValue13, fma(-uintBitsToFloat(reinterpretedBits11.x), scalarValue10, sampledTextureValue10.x), scalarValue10 * uintBitsToFloat(reinterpretedBits.x));
    float multiplyAddValue9 = fma(scalarValue13, fma(-uintBitsToFloat(reinterpretedBits11.y), scalarValue11, sampledTextureValue10.y), scalarValue11 * uintBitsToFloat(reinterpretedBits.y));
    float multiplyAddValue10 = fma(scalarValue13, fma(-uintBitsToFloat(reinterpretedBits11.z), scalarValue12, sampledTextureValue10.z), scalarValue12 * uintBitsToFloat(reinterpretedBits.z));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue11 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue8, multiplyAddValue8);
    float multiplyAddValue12 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue9, multiplyAddValue9);
    float multiplyAddValue27 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue10, multiplyAddValue10);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue28 = fma(reinterpretedBits12, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue29 = fma(reinterpretedBits12, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue30 = fma(reinterpretedBits12, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    fragmentColor1.x = fma(reinterpretedBits18, fma(-multiplyAddValue11, multiplyAddValue28, uintBitsToFloat(reinterpretedBits13.x)), multiplyAddValue11 * multiplyAddValue28);
    fragmentColor1.y = fma(reinterpretedBits18, fma(-multiplyAddValue12, multiplyAddValue29, uintBitsToFloat(reinterpretedBits13.y)), multiplyAddValue12 * multiplyAddValue29);
    fragmentColor1.z = fma(reinterpretedBits18, fma(-multiplyAddValue27, multiplyAddValue30, uintBitsToFloat(reinterpretedBits13.z)), multiplyAddValue27 * multiplyAddValue30);
    uint reinterpretedBits24 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[16u]))));
    bool comparisonValue7 = (reinterpretedBits24 & 16u) == 16u;
    bool comparisonValue8 = (reinterpretedBits24 & 4u) == 4u;
    bool comparisonValue9 = (reinterpretedBits24 & 8u) == 8u;
    float reinterpretedBits16;
    float intermediateValue23;
    float intermediateValue24;
    float intermediateValue25;
    if ((reinterpretedBits24 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits16 = ((reinterpretedBits24 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue23 = sampledTextureValue12.x;
        intermediateValue24 = sampledTextureValue12.z;
        intermediateValue25 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    float multiplyAddValue52 = fma(scalarValue13, scalarValue33 - multiplyAddValue47, multiplyAddValue47);
    float multiplyAddValue53 = fma(scalarValue13, scalarValue34 - multiplyAddValue48, multiplyAddValue48);
    float multiplyAddValue54 = fma(scalarValue13, scalarValue35 - multiplyAddValue49, multiplyAddValue49);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue55 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue52, multiplyAddValue52);
    float multiplyAddValue56 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue53, multiplyAddValue53);
    float multiplyAddValue57 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue54, multiplyAddValue54);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue28 = fma(reinterpretedBits12, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue29 = fma(reinterpretedBits12, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue30 = fma(reinterpretedBits12, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    fragmentColor1.x = fma(reinterpretedBits18, fma(-multiplyAddValue55, multiplyAddValue28, uintBitsToFloat(reinterpretedBits13.x)), multiplyAddValue55 * multiplyAddValue28);
    fragmentColor1.y = fma(reinterpretedBits18, fma(-multiplyAddValue56, multiplyAddValue29, uintBitsToFloat(reinterpretedBits13.y)), multiplyAddValue56 * multiplyAddValue29);
    fragmentColor1.z = fma(reinterpretedBits18, fma(-multiplyAddValue57, multiplyAddValue30, uintBitsToFloat(reinterpretedBits13.z)), multiplyAddValue57 * multiplyAddValue30);
    uint reinterpretedBits24 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[16u]))));
    bool comparisonValue7 = (reinterpretedBits24 & 16u) == 16u;
    bool comparisonValue8 = (reinterpretedBits24 & 4u) == 4u;
    bool comparisonValue9 = (reinterpretedBits24 & 8u) == 8u;
    float reinterpretedBits14;
    float intermediateValue23;
    float intermediateValue24;
    float intermediateValue25;
    if ((reinterpretedBits24 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits14 = ((reinterpretedBits24 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue23 = sampledTextureValue12.x;
        intermediateValue24 = sampledTextureValue12.z;
        intermediateValue25 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits48 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue44 = sampledTextureValue11.x;
    float scalarValue45 = sampledTextureValue11.y;
    float scalarValue46 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = reinterpretedBits12 < scalarValue16;
    uvec4 reinterpretedBits49 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue66 = conditionValue9 ? fma(scalarValue16, fma(scalarValue44, uintBitsToFloat(reinterpretedBits49.x), -scalarValue44), scalarValue44) : fma(scalarValue13, fma(-uintBitsToFloat(reinterpretedBits48.x), scalarValue10, sampledTextureValue10.x), scalarValue10 * uintBitsToFloat(reinterpretedBits42.x));
    float multiplyAddValue67 = conditionValue9 ? fma(scalarValue16, fma(scalarValue45, uintBitsToFloat(reinterpretedBits49.y), -scalarValue45), scalarValue45) : fma(scalarValue13, fma(-uintBitsToFloat(reinterpretedBits48.y), scalarValue11, sampledTextureValue10.y), scalarValue11 * uintBitsToFloat(reinterpretedBits42.y));
    float multiplyAddValue68 = conditionValue9 ? fma(scalarValue16, fma(scalarValue46, uintBitsToFloat(reinterpretedBits49.z), -scalarValue46), scalarValue46) : fma(scalarValue13, fma(-uintBitsToFloat(reinterpretedBits48.z), scalarValue12, sampledTextureValue10.z), scalarValue12 * uintBitsToFloat(reinterpretedBits42.z));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue69 = fma(reinterpretedBits6, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits6, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue71 = fma(reinterpretedBits6, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    fragmentColor1.x = fma(reinterpretedBits50, fma(-multiplyAddValue66, multiplyAddValue69, uintBitsToFloat(reinterpretedBits34.x)), multiplyAddValue66 * multiplyAddValue69);
    fragmentColor1.y = fma(reinterpretedBits50, fma(-multiplyAddValue67, multiplyAddValue70, uintBitsToFloat(reinterpretedBits34.y)), multiplyAddValue67 * multiplyAddValue70);
    fragmentColor1.z = fma(reinterpretedBits50, fma(-multiplyAddValue68, multiplyAddValue71, uintBitsToFloat(reinterpretedBits34.z)), multiplyAddValue68 * multiplyAddValue71);
    uint reinterpretedBits51 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits51 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits51 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits51 & 8u) == 8u;
    float reinterpretedBits17;
    float intermediateValue28;
    float intermediateValue29;
    float intermediateValue30;
    if ((reinterpretedBits51 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits17 = ((reinterpretedBits51 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue28 = sampledTextureValue12.x;
        intermediateValue29 = sampledTextureValue12.z;
        intermediateValue30 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue44 = sampledTextureValue11.x;
    float scalarValue45 = sampledTextureValue11.y;
    float scalarValue46 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = reinterpretedBits12 < scalarValue16;
    uvec4 reinterpretedBits49 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue87 = conditionValue9 ? fma(scalarValue16, fma(scalarValue44, uintBitsToFloat(reinterpretedBits49.x), -scalarValue44), scalarValue44) : fma(scalarValue13, scalarValue33 - multiplyAddValue82, multiplyAddValue82);
    float multiplyAddValue88 = conditionValue9 ? fma(scalarValue16, fma(scalarValue45, uintBitsToFloat(reinterpretedBits49.y), -scalarValue45), scalarValue45) : fma(scalarValue13, scalarValue34 - multiplyAddValue83, multiplyAddValue83);
    float multiplyAddValue89 = conditionValue9 ? fma(scalarValue16, fma(scalarValue46, uintBitsToFloat(reinterpretedBits49.z), -scalarValue46), scalarValue46) : fma(scalarValue13, scalarValue35 - multiplyAddValue84, multiplyAddValue84);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue69 = fma(reinterpretedBits6, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits6, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue71 = fma(reinterpretedBits6, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    fragmentColor1.x = fma(reinterpretedBits50, fma(-multiplyAddValue87, multiplyAddValue69, uintBitsToFloat(reinterpretedBits34.x)), multiplyAddValue87 * multiplyAddValue69);
    fragmentColor1.y = fma(reinterpretedBits50, fma(-multiplyAddValue88, multiplyAddValue70, uintBitsToFloat(reinterpretedBits34.y)), multiplyAddValue88 * multiplyAddValue70);
    fragmentColor1.z = fma(reinterpretedBits50, fma(-multiplyAddValue89, multiplyAddValue71, uintBitsToFloat(reinterpretedBits34.z)), multiplyAddValue89 * multiplyAddValue71);
    uint reinterpretedBits51 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits51 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits51 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits51 & 8u) == 8u;
    float reinterpretedBits16;
    float intermediateValue27;
    float intermediateValue28;
    float intermediateValue29;
    if ((reinterpretedBits51 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits16 = ((reinterpretedBits51 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue27 = sampledTextureValue12.x;
        intermediateValue28 = sampledTextureValue12.z;
        intermediateValue29 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits49 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue95 = fma(reinterpretedBits63, fma(reinterpretedBits60, uintBitsToFloat(reinterpretedBits49.x), -reinterpretedBits60), reinterpretedBits60);
    float multiplyAddValue96 = fma(reinterpretedBits63, fma(reinterpretedBits61, uintBitsToFloat(reinterpretedBits49.y), -reinterpretedBits61), reinterpretedBits61);
    float multiplyAddValue97 = fma(reinterpretedBits63, fma(reinterpretedBits62, uintBitsToFloat(reinterpretedBits49.z), -reinterpretedBits62), reinterpretedBits62);
    float multiplyAddValue98 = fma(scalarValue13, sampledTextureValue10.x - multiplyAddValue95, multiplyAddValue95);
    float multiplyAddValue99 = fma(scalarValue13, sampledTextureValue10.y - multiplyAddValue96, multiplyAddValue96);
    float multiplyAddValue100 = fma(scalarValue13, sampledTextureValue10.z - multiplyAddValue97, multiplyAddValue97);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue101 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue98, multiplyAddValue98);
    float multiplyAddValue102 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue99, multiplyAddValue99);
    float multiplyAddValue103 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue100, multiplyAddValue100);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue69 = fma(reinterpretedBits6, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits6, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue71 = fma(reinterpretedBits6, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    fragmentColor1.x = fma(reinterpretedBits50, fma(-multiplyAddValue101, multiplyAddValue69, uintBitsToFloat(reinterpretedBits34.x)), multiplyAddValue101 * multiplyAddValue69);
    fragmentColor1.y = fma(reinterpretedBits50, fma(-multiplyAddValue102, multiplyAddValue70, uintBitsToFloat(reinterpretedBits34.y)), multiplyAddValue102 * multiplyAddValue70);
    fragmentColor1.z = fma(reinterpretedBits50, fma(-multiplyAddValue103, multiplyAddValue71, uintBitsToFloat(reinterpretedBits34.z)), multiplyAddValue103 * multiplyAddValue71);
    uint reinterpretedBits51 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits51 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits51 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits51 & 8u) == 8u;
    float reinterpretedBits19;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((reinterpretedBits51 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits19 = ((reinterpretedBits51 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue20 = sampledTextureValue12.x;
        intermediateValue21 = sampledTextureValue12.z;
        intermediateValue22 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits49 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue108 = fma(multiplyAddValue107, fma(multiplyAddValue82, uintBitsToFloat(reinterpretedBits49.x), -multiplyAddValue82), multiplyAddValue82);
    float multiplyAddValue109 = fma(multiplyAddValue107, fma(multiplyAddValue83, uintBitsToFloat(reinterpretedBits49.y), -multiplyAddValue83), multiplyAddValue83);
    float multiplyAddValue110 = fma(multiplyAddValue107, fma(multiplyAddValue84, uintBitsToFloat(reinterpretedBits49.z), -multiplyAddValue84), multiplyAddValue84);
    float multiplyAddValue111 = fma(scalarValue13, scalarValue33 - multiplyAddValue108, multiplyAddValue108);
    float multiplyAddValue112 = fma(scalarValue13, scalarValue34 - multiplyAddValue109, multiplyAddValue109);
    float multiplyAddValue113 = fma(scalarValue13, scalarValue35 - multiplyAddValue110, multiplyAddValue110);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue114 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue111, multiplyAddValue111);
    float multiplyAddValue115 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue112, multiplyAddValue112);
    float multiplyAddValue116 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue113, multiplyAddValue113);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue69 = fma(reinterpretedBits6, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits6, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue71 = fma(reinterpretedBits6, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    fragmentColor1.x = fma(reinterpretedBits50, fma(-multiplyAddValue114, multiplyAddValue69, uintBitsToFloat(reinterpretedBits34.x)), multiplyAddValue114 * multiplyAddValue69);
    fragmentColor1.y = fma(reinterpretedBits50, fma(-multiplyAddValue115, multiplyAddValue70, uintBitsToFloat(reinterpretedBits34.y)), multiplyAddValue115 * multiplyAddValue70);
    fragmentColor1.z = fma(reinterpretedBits50, fma(-multiplyAddValue116, multiplyAddValue71, uintBitsToFloat(reinterpretedBits34.z)), multiplyAddValue116 * multiplyAddValue71);
    uint reinterpretedBits51 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits51 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits51 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits51 & 8u) == 8u;
    float reinterpretedBits15;
    float intermediateValue23;
    float intermediateValue24;
    float intermediateValue25;
    if ((reinterpretedBits51 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits15 = ((reinterpretedBits51 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue23 = sampledTextureValue12.x;
        intermediateValue24 = sampledTextureValue12.z;
        intermediateValue25 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits49 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits64 = uintBitsToFloat(reinterpretedBits49.x);
    float reinterpretedBits65 = uintBitsToFloat(reinterpretedBits49.y);
    float reinterpretedBits66 = uintBitsToFloat(reinterpretedBits49.z);
    float multiplyAddValue120 = fma(reinterpretedBits63, fma(reinterpretedBits60, reinterpretedBits64, -reinterpretedBits60), reinterpretedBits60);
    float multiplyAddValue121 = fma(reinterpretedBits63, fma(reinterpretedBits61, reinterpretedBits65, -reinterpretedBits61), reinterpretedBits61);
    float multiplyAddValue122 = fma(reinterpretedBits63, fma(reinterpretedBits62, reinterpretedBits66, -reinterpretedBits62), reinterpretedBits62);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue44 = sampledTextureValue11.x;
    float scalarValue45 = sampledTextureValue11.y;
    float scalarValue46 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = reinterpretedBits12 < scalarValue16;
    float multiplyAddValue123 = conditionValue9 ? fma(scalarValue16, fma(scalarValue44, reinterpretedBits64, -scalarValue44), scalarValue44) : fma(scalarValue13, sampledTextureValue10.x - multiplyAddValue120, multiplyAddValue120);
    float multiplyAddValue124 = conditionValue9 ? fma(scalarValue16, fma(scalarValue45, reinterpretedBits65, -scalarValue45), scalarValue45) : fma(scalarValue13, sampledTextureValue10.y - multiplyAddValue121, multiplyAddValue121);
    float multiplyAddValue125 = conditionValue9 ? fma(scalarValue16, fma(scalarValue46, reinterpretedBits66, -scalarValue46), scalarValue46) : fma(scalarValue13, sampledTextureValue10.z - multiplyAddValue122, multiplyAddValue122);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue69 = fma(reinterpretedBits6, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits6, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue71 = fma(reinterpretedBits6, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    fragmentColor1.x = fma(reinterpretedBits50, fma(-multiplyAddValue123, multiplyAddValue69, uintBitsToFloat(reinterpretedBits34.x)), multiplyAddValue123 * multiplyAddValue69);
    fragmentColor1.y = fma(reinterpretedBits50, fma(-multiplyAddValue124, multiplyAddValue70, uintBitsToFloat(reinterpretedBits34.y)), multiplyAddValue124 * multiplyAddValue70);
    fragmentColor1.z = fma(reinterpretedBits50, fma(-multiplyAddValue125, multiplyAddValue71, uintBitsToFloat(reinterpretedBits34.z)), multiplyAddValue125 * multiplyAddValue71);
    uint reinterpretedBits51 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits51 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits51 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits51 & 8u) == 8u;
    float reinterpretedBits23;
    float intermediateValue24;
    float intermediateValue25;
    float intermediateValue26;
    if ((reinterpretedBits51 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits23 = ((reinterpretedBits51 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue24 = sampledTextureValue12.x;
        intermediateValue25 = sampledTextureValue12.z;
        intermediateValue26 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits49 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits64 = uintBitsToFloat(reinterpretedBits49.x);
    float reinterpretedBits65 = uintBitsToFloat(reinterpretedBits49.y);
    float reinterpretedBits66 = uintBitsToFloat(reinterpretedBits49.z);
    float multiplyAddValue129 = fma(multiplyAddValue107, fma(multiplyAddValue82, reinterpretedBits64, -multiplyAddValue82), multiplyAddValue82);
    float multiplyAddValue130 = fma(multiplyAddValue107, fma(multiplyAddValue83, reinterpretedBits65, -multiplyAddValue83), multiplyAddValue83);
    float multiplyAddValue131 = fma(multiplyAddValue107, fma(multiplyAddValue84, reinterpretedBits66, -multiplyAddValue84), multiplyAddValue84);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue44 = sampledTextureValue11.x;
    float scalarValue45 = sampledTextureValue11.y;
    float scalarValue46 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = reinterpretedBits12 < scalarValue16;
    float multiplyAddValue132 = conditionValue9 ? fma(scalarValue16, fma(scalarValue44, reinterpretedBits64, -scalarValue44), scalarValue44) : fma(scalarValue13, scalarValue33 - multiplyAddValue129, multiplyAddValue129);
    float multiplyAddValue133 = conditionValue9 ? fma(scalarValue16, fma(scalarValue45, reinterpretedBits65, -scalarValue45), scalarValue45) : fma(scalarValue13, scalarValue34 - multiplyAddValue130, multiplyAddValue130);
    float multiplyAddValue134 = conditionValue9 ? fma(scalarValue16, fma(scalarValue46, reinterpretedBits66, -scalarValue46), scalarValue46) : fma(scalarValue13, scalarValue35 - multiplyAddValue131, multiplyAddValue131);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue69 = fma(reinterpretedBits6, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits6, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue71 = fma(reinterpretedBits6, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    fragmentColor1.x = fma(reinterpretedBits50, fma(-multiplyAddValue132, multiplyAddValue69, uintBitsToFloat(reinterpretedBits34.x)), multiplyAddValue132 * multiplyAddValue69);
    fragmentColor1.y = fma(reinterpretedBits50, fma(-multiplyAddValue133, multiplyAddValue70, uintBitsToFloat(reinterpretedBits34.y)), multiplyAddValue133 * multiplyAddValue70);
    fragmentColor1.z = fma(reinterpretedBits50, fma(-multiplyAddValue134, multiplyAddValue71, uintBitsToFloat(reinterpretedBits34.z)), multiplyAddValue134 * multiplyAddValue71);
    uint reinterpretedBits51 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits51 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits51 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits51 & 8u) == 8u;
    float reinterpretedBits19;
    float intermediateValue27;
    float intermediateValue28;
    float intermediateValue29;
    if ((reinterpretedBits51 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits19 = ((reinterpretedBits51 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue27 = sampledTextureValue12.x;
        intermediateValue28 = sampledTextureValue12.z;
        intermediateValue29 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits49 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits67 = reinterpretedBits60 * uintBitsToFloat(reinterpretedBits49.x);
    float reinterpretedBits68 = reinterpretedBits60 * uintBitsToFloat(reinterpretedBits49.y);
    float reinterpretedBits69 = reinterpretedBits60 * uintBitsToFloat(reinterpretedBits49.z);
    float scalarValue55 = ceil(reinterpretedBits61);
    uvec4 reinterpretedBits70 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue144 = fma(scalarValue55, fma(reinterpretedBits61, uintBitsToFloat(reinterpretedBits70.x), -reinterpretedBits67), reinterpretedBits67);
    float multiplyAddValue145 = fma(scalarValue55, fma(reinterpretedBits61, uintBitsToFloat(reinterpretedBits70.y), -reinterpretedBits68), reinterpretedBits68);
    float multiplyAddValue146 = fma(scalarValue55, fma(reinterpretedBits61, uintBitsToFloat(reinterpretedBits70.z), -reinterpretedBits69), reinterpretedBits69);
    float multiplyAddValue147 = fma(scalarValue13, sampledTextureValue10.x - multiplyAddValue144, multiplyAddValue144);
    float multiplyAddValue148 = fma(scalarValue13, sampledTextureValue10.y - multiplyAddValue145, multiplyAddValue145);
    float multiplyAddValue149 = fma(scalarValue13, sampledTextureValue10.z - multiplyAddValue146, multiplyAddValue146);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue150 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue147, multiplyAddValue147);
    float multiplyAddValue151 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue148, multiplyAddValue148);
    float multiplyAddValue152 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue149, multiplyAddValue149);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue69 = fma(reinterpretedBits6, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits6, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue71 = fma(reinterpretedBits6, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    fragmentColor1.x = fma(reinterpretedBits50, fma(-multiplyAddValue150, multiplyAddValue69, uintBitsToFloat(reinterpretedBits34.x)), multiplyAddValue150 * multiplyAddValue69);
    fragmentColor1.y = fma(reinterpretedBits50, fma(-multiplyAddValue151, multiplyAddValue70, uintBitsToFloat(reinterpretedBits34.y)), multiplyAddValue151 * multiplyAddValue70);
    fragmentColor1.z = fma(reinterpretedBits50, fma(-multiplyAddValue152, multiplyAddValue71, uintBitsToFloat(reinterpretedBits34.z)), multiplyAddValue152 * multiplyAddValue71);
    uint reinterpretedBits51 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits51 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits51 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits51 & 8u) == 8u;
    float reinterpretedBits21;
    float intermediateValue21;
    float intermediateValue22;
    float intermediateValue23;
    if ((reinterpretedBits51 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits21 = ((reinterpretedBits51 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue21 = sampledTextureValue12.x;
        intermediateValue22 = sampledTextureValue12.z;
        intermediateValue23 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits49 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits71 = multiplyAddValue156 * uintBitsToFloat(reinterpretedBits49.x);
    float reinterpretedBits72 = multiplyAddValue156 * uintBitsToFloat(reinterpretedBits49.y);
    float reinterpretedBits73 = multiplyAddValue156 * uintBitsToFloat(reinterpretedBits49.z);
    float scalarValue57 = ceil(multiplyAddValue157);
    uvec4 reinterpretedBits70 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue158 = fma(scalarValue57, fma(multiplyAddValue157, uintBitsToFloat(reinterpretedBits70.x), -reinterpretedBits71), reinterpretedBits71);
    float multiplyAddValue159 = fma(scalarValue57, fma(multiplyAddValue157, uintBitsToFloat(reinterpretedBits70.y), -reinterpretedBits72), reinterpretedBits72);
    float multiplyAddValue160 = fma(scalarValue57, fma(multiplyAddValue157, uintBitsToFloat(reinterpretedBits70.z), -reinterpretedBits73), reinterpretedBits73);
    float multiplyAddValue161 = fma(scalarValue13, scalarValue33 - multiplyAddValue158, multiplyAddValue158);
    float multiplyAddValue162 = fma(scalarValue13, scalarValue34 - multiplyAddValue159, multiplyAddValue159);
    float multiplyAddValue163 = fma(scalarValue13, scalarValue35 - multiplyAddValue160, multiplyAddValue160);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue16 = sampledTextureValue11.w;
    float multiplyAddValue164 = fma(scalarValue16, sampledTextureValue11.x - multiplyAddValue161, multiplyAddValue161);
    float multiplyAddValue165 = fma(scalarValue16, sampledTextureValue11.y - multiplyAddValue162, multiplyAddValue162);
    float multiplyAddValue166 = fma(scalarValue16, sampledTextureValue11.z - multiplyAddValue163, multiplyAddValue163);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue69 = fma(reinterpretedBits6, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits6, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue71 = fma(reinterpretedBits6, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    fragmentColor1.x = fma(reinterpretedBits50, fma(-multiplyAddValue164, multiplyAddValue69, uintBitsToFloat(reinterpretedBits34.x)), multiplyAddValue164 * multiplyAddValue69);
    fragmentColor1.y = fma(reinterpretedBits50, fma(-multiplyAddValue165, multiplyAddValue70, uintBitsToFloat(reinterpretedBits34.y)), multiplyAddValue165 * multiplyAddValue70);
    fragmentColor1.z = fma(reinterpretedBits50, fma(-multiplyAddValue166, multiplyAddValue71, uintBitsToFloat(reinterpretedBits34.z)), multiplyAddValue166 * multiplyAddValue71);
    uint reinterpretedBits51 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits51 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits51 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits51 & 8u) == 8u;
    float reinterpretedBits19;
    float intermediateValue24;
    float intermediateValue25;
    float intermediateValue26;
    if ((reinterpretedBits51 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits19 = ((reinterpretedBits51 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue24 = sampledTextureValue12.x;
        intermediateValue25 = sampledTextureValue12.z;
        intermediateValue26 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits49 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits64 = uintBitsToFloat(reinterpretedBits49.x);
    float reinterpretedBits65 = uintBitsToFloat(reinterpretedBits49.y);
    float reinterpretedBits66 = uintBitsToFloat(reinterpretedBits49.z);
    float productValue193 = reinterpretedBits60 * reinterpretedBits64;
    float productValue194 = reinterpretedBits60 * reinterpretedBits65;
    float productValue195 = reinterpretedBits60 * reinterpretedBits66;
    float scalarValue55 = ceil(reinterpretedBits61);
    uvec4 reinterpretedBits70 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue170 = fma(scalarValue55, fma(reinterpretedBits61, uintBitsToFloat(reinterpretedBits70.x), -productValue193), productValue193);
    float multiplyAddValue171 = fma(scalarValue55, fma(reinterpretedBits61, uintBitsToFloat(reinterpretedBits70.y), -productValue194), productValue194);
    float multiplyAddValue172 = fma(scalarValue55, fma(reinterpretedBits61, uintBitsToFloat(reinterpretedBits70.z), -productValue195), productValue195);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue44 = sampledTextureValue11.x;
    float scalarValue45 = sampledTextureValue11.y;
    float scalarValue46 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = reinterpretedBits12 < scalarValue16;
    float multiplyAddValue173 = conditionValue9 ? fma(scalarValue16, fma(scalarValue44, reinterpretedBits64, -scalarValue44), scalarValue44) : fma(scalarValue13, sampledTextureValue10.x - multiplyAddValue170, multiplyAddValue170);
    float multiplyAddValue174 = conditionValue9 ? fma(scalarValue16, fma(scalarValue45, reinterpretedBits65, -scalarValue45), scalarValue45) : fma(scalarValue13, sampledTextureValue10.y - multiplyAddValue171, multiplyAddValue171);
    float multiplyAddValue175 = conditionValue9 ? fma(scalarValue16, fma(scalarValue46, reinterpretedBits66, -scalarValue46), scalarValue46) : fma(scalarValue13, sampledTextureValue10.z - multiplyAddValue172, multiplyAddValue172);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue69 = fma(reinterpretedBits6, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits6, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue71 = fma(reinterpretedBits6, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    fragmentColor1.x = fma(reinterpretedBits50, fma(-multiplyAddValue173, multiplyAddValue69, uintBitsToFloat(reinterpretedBits34.x)), multiplyAddValue173 * multiplyAddValue69);
    fragmentColor1.y = fma(reinterpretedBits50, fma(-multiplyAddValue174, multiplyAddValue70, uintBitsToFloat(reinterpretedBits34.y)), multiplyAddValue174 * multiplyAddValue70);
    fragmentColor1.z = fma(reinterpretedBits50, fma(-multiplyAddValue175, multiplyAddValue71, uintBitsToFloat(reinterpretedBits34.z)), multiplyAddValue175 * multiplyAddValue71);
    uint reinterpretedBits51 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits51 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits51 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits51 & 8u) == 8u;
    float reinterpretedBits22;
    float intermediateValue25;
    float intermediateValue26;
    float intermediateValue27;
    if ((reinterpretedBits51 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits22 = ((reinterpretedBits51 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue25 = sampledTextureValue12.x;
        intermediateValue26 = sampledTextureValue12.z;
        intermediateValue27 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits49 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits64 = uintBitsToFloat(reinterpretedBits49.x);
    float reinterpretedBits65 = uintBitsToFloat(reinterpretedBits49.y);
    float reinterpretedBits66 = uintBitsToFloat(reinterpretedBits49.z);
    float productValue211 = multiplyAddValue156 * reinterpretedBits64;
    float productValue212 = multiplyAddValue156 * reinterpretedBits65;
    float productValue213 = multiplyAddValue156 * reinterpretedBits66;
    float scalarValue57 = ceil(multiplyAddValue157);
    uvec4 reinterpretedBits70 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue182 = fma(scalarValue57, fma(multiplyAddValue157, uintBitsToFloat(reinterpretedBits70.x), -productValue211), productValue211);
    float multiplyAddValue183 = fma(scalarValue57, fma(multiplyAddValue157, uintBitsToFloat(reinterpretedBits70.y), -productValue212), productValue212);
    float multiplyAddValue184 = fma(scalarValue57, fma(multiplyAddValue157, uintBitsToFloat(reinterpretedBits70.z), -productValue213), productValue213);
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue44 = sampledTextureValue11.x;
    float scalarValue45 = sampledTextureValue11.y;
    float scalarValue46 = sampledTextureValue11.z;
    float scalarValue16 = sampledTextureValue11.w;
    bool conditionValue9 = reinterpretedBits12 < scalarValue16;
    float multiplyAddValue185 = conditionValue9 ? fma(scalarValue16, fma(scalarValue44, reinterpretedBits64, -scalarValue44), scalarValue44) : fma(scalarValue13, scalarValue33 - multiplyAddValue182, multiplyAddValue182);
    float multiplyAddValue186 = conditionValue9 ? fma(scalarValue16, fma(scalarValue45, reinterpretedBits65, -scalarValue45), scalarValue45) : fma(scalarValue13, scalarValue34 - multiplyAddValue183, multiplyAddValue183);
    float multiplyAddValue187 = conditionValue9 ? fma(scalarValue16, fma(scalarValue46, reinterpretedBits66, -scalarValue46), scalarValue46) : fma(scalarValue13, scalarValue35 - multiplyAddValue184, multiplyAddValue184);
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue69 = fma(reinterpretedBits6, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits6, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue71 = fma(reinterpretedBits6, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    fragmentColor1.x = fma(reinterpretedBits50, fma(-multiplyAddValue185, multiplyAddValue69, uintBitsToFloat(reinterpretedBits34.x)), multiplyAddValue185 * multiplyAddValue69);
    fragmentColor1.y = fma(reinterpretedBits50, fma(-multiplyAddValue186, multiplyAddValue70, uintBitsToFloat(reinterpretedBits34.y)), multiplyAddValue186 * multiplyAddValue70);
    fragmentColor1.z = fma(reinterpretedBits50, fma(-multiplyAddValue187, multiplyAddValue71, uintBitsToFloat(reinterpretedBits34.z)), multiplyAddValue187 * multiplyAddValue71);
    uint reinterpretedBits51 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits51 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits51 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits51 & 8u) == 8u;
    float reinterpretedBits20;
    float intermediateValue28;
    float intermediateValue29;
    float intermediateValue30;
    if ((reinterpretedBits51 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits20 = ((reinterpretedBits51 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue28 = sampledTextureValue12.x;
        intermediateValue29 = sampledTextureValue12.z;
        intermediateValue30 = sampledTextureValue12.y;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[22u].x) / (fragmentVectorConstants1.packedValues[22u].y - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float productValue29 = floor(quotientValue1 * 0.25);
        float productValue30 = floor(quotientValue1 * 0.5);
        float scalarValue2 = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue30 * productValue30) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue29 * productValue29) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue2 * scalarValue2) * 0.75) + (floor(quotientValue) * 0.5)));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[23u].x) / (fragmentVectorConstants1.packedValues[23u].y - fragmentVectorConstants1.packedValues[23u].x), 0.0, 1.0);
        float quotientValue6 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[26u].x) / fragmentVectorConstants1.packedValues[23u].z) * fragmentVectorConstants1.packedValues[23u].z;
        float quotientValue7 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[26u].y) / fragmentVectorConstants1.packedValues[23u].z) * fragmentVectorConstants1.packedValues[23u].z;
        float productValue93 = floor(quotientValue7 * 0.25);
        float productValue94 = floor(quotientValue7 * 0.5);
        float scalarValue41 = floor(quotientValue7);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue94 * productValue94) * 0.75) + (floor(quotientValue6 * 0.5) * 0.5)) + (fract(((productValue93 * productValue93) * 0.75) + (floor(quotientValue6 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue41 * scalarValue41) * 0.75) + (floor(quotientValue6) * 0.5)));
#endif
    }
    else
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
        intermediateValue24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue25 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
        intermediateValue24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue25 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue28 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue30 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue27 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue28 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue25 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue25 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue27 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue28 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue25 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue25 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue27 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue28 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue30 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        comparisonValue = false;
#endif
    }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue4;
    float productValue5;
    float productValue6;
    if (comparisonValue7 || (comparisonValue9 || comparisonValue8))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue5;
    float productValue6;
    float productValue7;
    if (comparisonValue7 || (comparisonValue9 || comparisonValue8))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue4;
    float productValue5;
    float productValue6;
    if (comparisonValue27 || (comparisonValue29 || comparisonValue28))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue5;
    float productValue6;
    float productValue7;
    if (comparisonValue27 || (comparisonValue29 || comparisonValue28))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue7;
    float productValue8;
    float productValue9;
    if (comparisonValue27 || (comparisonValue29 || comparisonValue28))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue8;
    float productValue9;
    float productValue10;
    if (comparisonValue27 || (comparisonValue29 || comparisonValue28))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if (comparisonValue || ((spvNMax(0.0, sampledTextureValue.w * fragmentVectorConstants1.packedValues[29u].w) < 0.5) && (scalarValue < fragmentVectorConstants1.packedValues[20u].x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if (comparisonValue || ((spvNMax(0.0, (productValue62 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[29u].w) - scalarValue)) + scalarValue) < 0.5) && (scalarValue < fragmentVectorConstants1.packedValues[20u].x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((spvNMax(0.0, sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) < 0.5) && (scalarValue < fragmentVectorConstants1.packedValues[21u].x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((spvNMax(0.0, (productValue62 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) - scalarValue)) + scalarValue) < 0.5) && (scalarValue < fragmentVectorConstants1.packedValues[21u].x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    if (comparisonValue || ((spvNMax(0.0, productValue116 * fragmentVectorConstants1.packedValues[4u].w) < 0.5) && (scalarValue < fragmentVectorConstants1.packedValues[21u].x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    if (comparisonValue || ((spvNMax(0.0, productValue132 * fragmentVectorConstants1.packedValues[4u].w) < 0.5) && (scalarValue < fragmentVectorConstants1.packedValues[21u].x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((spvNMax(0.0, productValue116 * fragmentVectorConstants1.packedValues[4u].w) < 0.5) && (scalarValue < fragmentVectorConstants1.packedValues[21u].x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((spvNMax(0.0, productValue132 * fragmentVectorConstants1.packedValues[4u].w) < 0.5) && (scalarValue < fragmentVectorConstants1.packedValues[21u].x)) || comparisonValue)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    if (comparisonValue || ((spvNMax(0.0, sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) < 0.5) && (scalarValue < fragmentVectorConstants1.packedValues[21u].x)))
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    if (comparisonValue || ((spvNMax(0.0, (productValue62 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) - scalarValue)) + scalarValue) < 0.5) && (scalarValue < fragmentVectorConstants1.packedValues[21u].x)))
#endif
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue16;
        float multiplyAddValue17;
        float multiplyAddValue18;
        bool intermediateValue29;
        if (comparisonValue8)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue20;
        float multiplyAddValue21;
        float multiplyAddValue22;
        bool intermediateValue29;
        if (comparisonValue8)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue34;
        if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue17;
        float multiplyAddValue18;
        float multiplyAddValue19;
        bool intermediateValue33;
        if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue20;
        float multiplyAddValue21;
        float multiplyAddValue22;
        bool intermediateValue26;
        if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue24;
        float multiplyAddValue25;
        float multiplyAddValue26;
        bool intermediateValue29;
        if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue17;
        float multiplyAddValue18;
        float multiplyAddValue19;
        bool intermediateValue30;
        if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue21;
        float multiplyAddValue22;
        float multiplyAddValue23;
        bool intermediateValue33;
        if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue20;
        float multiplyAddValue21;
        float multiplyAddValue22;
        bool intermediateValue27;
        if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue22;
        float multiplyAddValue23;
        float multiplyAddValue24;
        bool intermediateValue30;
        if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue17;
        float multiplyAddValue18;
        float multiplyAddValue19;
        bool intermediateValue31;
        if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue19;
        float multiplyAddValue20;
        float multiplyAddValue21;
        bool intermediateValue34;
        if (comparisonValue28)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    uint scalarValue3 = uint(int(fragmentVectorConstants1.packedValues[4u].x));
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if ((scalarValue3 & 1u) == 0u)
    {
        intermediateValue5 = fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[32u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue5 = sampledTextureValue3.x;
        intermediateValue6 = sampledTextureValue3.y;
        intermediateValue7 = sampledTextureValue3.z;
        intermediateValue8 = ((scalarValue3 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[32u].x;
    }
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue3 & 28u) == 0u)
    {
        intermediateValue9 = varyingNormal0.x;
        intermediateValue10 = varyingNormal0.y;
        intermediateValue11 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
        if ((scalarValue3 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    uint scalarValue3 = uint(int(fragmentVectorConstants1.packedValues[4u].x));
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue3 & 1u) == 0u)
    {
        intermediateValue8 = fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue11 = fragmentVectorConstants1.packedValues[32u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue8 = sampledTextureValue3.x;
        intermediateValue9 = sampledTextureValue3.y;
        intermediateValue10 = sampledTextureValue3.z;
        intermediateValue11 = ((scalarValue3 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[32u].x;
    }
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((scalarValue3 & 28u) == 0u)
    {
        intermediateValue12 = varyingNormal0.x;
        intermediateValue13 = varyingNormal0.y;
        intermediateValue14 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
        if ((scalarValue3 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    uint scalarValue42 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue42 & 1u) == 0u)
    {
        intermediateValue8 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue11 = fragmentVectorConstants1.packedValues[33u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue8 = sampledTextureValue3.x;
        intermediateValue9 = sampledTextureValue3.y;
        intermediateValue10 = sampledTextureValue3.z;
        intermediateValue11 = ((scalarValue42 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[33u].x;
    }
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((scalarValue42 & 28u) == 0u)
    {
        intermediateValue12 = varyingNormal0.x;
        intermediateValue13 = varyingNormal0.y;
        intermediateValue14 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue19;
        float intermediateValue20;
        float intermediateValue21;
        if ((scalarValue42 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    uint scalarValue42 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((scalarValue42 & 1u) == 0u)
    {
        intermediateValue11 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue12 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue14 = fragmentVectorConstants1.packedValues[33u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue11 = sampledTextureValue3.x;
        intermediateValue12 = sampledTextureValue3.y;
        intermediateValue13 = sampledTextureValue3.z;
        intermediateValue14 = ((scalarValue42 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[33u].x;
    }
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if ((scalarValue42 & 28u) == 0u)
    {
        intermediateValue15 = varyingNormal0.x;
        intermediateValue16 = varyingNormal0.y;
        intermediateValue17 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue22;
        float intermediateValue23;
        float intermediateValue24;
        if ((scalarValue42 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    uint scalarValue42 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    if ((scalarValue42 & 1u) == 0u)
    {
        intermediateValue5 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[33u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue5 = sampledTextureValue3.x;
        intermediateValue6 = sampledTextureValue3.y;
        intermediateValue7 = sampledTextureValue3.z;
        intermediateValue8 = ((scalarValue42 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[33u].x;
    }
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue42 & 28u) == 0u)
    {
        intermediateValue9 = varyingNormal0.x;
        intermediateValue10 = varyingNormal0.y;
        intermediateValue11 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue16;
        float intermediateValue17;
        float intermediateValue18;
        if ((scalarValue42 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    uint scalarValue42 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue6;
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if ((scalarValue42 & 1u) == 0u)
    {
        intermediateValue6 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[34u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue6 = sampledTextureValue3.x;
        intermediateValue7 = sampledTextureValue3.y;
        intermediateValue8 = sampledTextureValue3.z;
        intermediateValue9 = ((scalarValue42 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[34u].x;
    }
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    if ((scalarValue42 & 28u) == 0u)
    {
        intermediateValue10 = varyingNormal0.x;
        intermediateValue11 = varyingNormal0.y;
        intermediateValue12 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue17;
        float intermediateValue18;
        float intermediateValue19;
        if ((scalarValue42 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    uint scalarValue42 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    float intermediateValue12;
    if ((scalarValue42 & 1u) == 0u)
    {
        intermediateValue9 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue11 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue12 = fragmentVectorConstants1.packedValues[34u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue9 = sampledTextureValue3.x;
        intermediateValue10 = sampledTextureValue3.y;
        intermediateValue11 = sampledTextureValue3.z;
        intermediateValue12 = ((scalarValue42 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[34u].x;
    }
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if ((scalarValue42 & 28u) == 0u)
    {
        intermediateValue13 = varyingNormal0.x;
        intermediateValue14 = varyingNormal0.y;
        intermediateValue15 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue20;
        float intermediateValue21;
        float intermediateValue22;
        if ((scalarValue42 & 4u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    uint scalarValue42 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    float intermediateValue15;
    if ((scalarValue42 & 1u) == 0u)
    {
        intermediateValue12 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue13 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue14 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue15 = fragmentVectorConstants1.packedValues[34u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue12 = sampledTextureValue3.x;
        intermediateValue13 = sampledTextureValue3.y;
        intermediateValue14 = sampledTextureValue3.z;
        intermediateValue15 = ((scalarValue42 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[34u].x;
    }
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if ((scalarValue42 & 28u) == 0u)
    {
        intermediateValue16 = varyingNormal0.x;
        intermediateValue17 = varyingNormal0.y;
        intermediateValue18 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue23;
        float intermediateValue24;
        float intermediateValue25;
        if ((scalarValue42 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue16 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue29 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue30;
            if (comparisonValue9)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue20 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue21 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue22 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue29 = true;
        }
        else
        {
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue30;
            if (comparisonValue9)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue34 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue35;
            if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue17 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue19 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue33 = true;
        }
        else
        {
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue34;
            if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue20 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue21 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue22 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue27;
            if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue24 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue25 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue26 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue29 = true;
        }
        else
        {
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue30;
            if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue17 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue19 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue30 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue31;
            if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue21 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue22 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue23 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue33 = true;
        }
        else
        {
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue34;
            if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue20 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue21 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue22 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue27 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue28;
            if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue22 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue23 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue24 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue30 = true;
        }
        else
        {
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue31;
            if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue17 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue19 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue31 = true;
        }
        else
        {
            float productValue17;
            float productValue18;
            float productValue19;
            bool intermediateValue32;
            if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue19 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue20 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue21 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue34 = true;
        }
        else
        {
            float productValue18;
            float productValue19;
            float productValue20;
            bool intermediateValue35;
            if (comparisonValue29)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue3 & 8u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue42 & 8u) == 0u)
#endif
            {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue17 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue17 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue51 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue52 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue51 - 0.5) < 0.0625) ? (((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue18 = sampledTextureValue16.x;
                float scalarValue19 = sampledTextureValue16.y;
                float scalarValue20 = sampledTextureValue16.z;
                float scalarValue21 = sampledTextureValue16.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue32 > 0.5;
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue18 : scalarValue21;
                float comparisonValue15 = conditionValue3 ? scalarValue19 : scalarValue20;
                float comparisonValue16 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue17 = conditionValue4 ? scalarValue19 : scalarValue18;
                float sumValue6 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue22 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue22);
                intermediateValue30 = true;
                productValue16 = inverseLengthValue9 * comparisonValue18;
                productValue15 = inverseLengthValue9 * comparisonValue19;
                productValue14 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue19;
                if (comparisonValue7)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue17 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue17 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue51 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue52 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue51 - 0.5) < 0.0625) ? (((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue18 = sampledTextureValue16.x;
                float scalarValue19 = sampledTextureValue16.y;
                float scalarValue20 = sampledTextureValue16.z;
                float scalarValue21 = sampledTextureValue16.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue32 > 0.5;
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue18 : scalarValue21;
                float comparisonValue15 = conditionValue3 ? scalarValue19 : scalarValue20;
                float comparisonValue16 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue17 = conditionValue4 ? scalarValue19 : scalarValue18;
                float sumValue6 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue22 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue22);
                intermediateValue30 = true;
                productValue17 = inverseLengthValue9 * comparisonValue18;
                productValue16 = inverseLengthValue9 * comparisonValue19;
                productValue15 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue20;
                if (comparisonValue7)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue17 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue17 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue51 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue52 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue51 - 0.5) < 0.0625) ? (((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue18 = sampledTextureValue16.x;
                float scalarValue19 = sampledTextureValue16.y;
                float scalarValue20 = sampledTextureValue16.z;
                float scalarValue21 = sampledTextureValue16.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue32 > 0.5;
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue18 : scalarValue21;
                float comparisonValue15 = conditionValue3 ? scalarValue19 : scalarValue20;
                float comparisonValue16 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue17 = conditionValue4 ? scalarValue19 : scalarValue18;
                float sumValue6 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue22 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue22);
                intermediateValue35 = true;
                productValue16 = inverseLengthValue9 * comparisonValue18;
                productValue15 = inverseLengthValue9 * comparisonValue19;
                productValue14 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue19;
                if (comparisonValue27)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue17 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue17 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue51 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue52 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue51 - 0.5) < 0.0625) ? (((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue18 = sampledTextureValue16.x;
                float scalarValue19 = sampledTextureValue16.y;
                float scalarValue20 = sampledTextureValue16.z;
                float scalarValue21 = sampledTextureValue16.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue32 > 0.5;
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue18 : scalarValue21;
                float comparisonValue15 = conditionValue3 ? scalarValue19 : scalarValue20;
                float comparisonValue16 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue17 = conditionValue4 ? scalarValue19 : scalarValue18;
                float sumValue6 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue22 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue22);
                intermediateValue34 = true;
                productValue17 = inverseLengthValue9 * comparisonValue18;
                productValue16 = inverseLengthValue9 * comparisonValue19;
                productValue15 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue20;
                if (comparisonValue27)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue17 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue17 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue51 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue52 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue51 - 0.5) < 0.0625) ? (((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue18 = sampledTextureValue16.x;
                float scalarValue19 = sampledTextureValue16.y;
                float scalarValue20 = sampledTextureValue16.z;
                float scalarValue21 = sampledTextureValue16.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue32 > 0.5;
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue18 : scalarValue21;
                float comparisonValue15 = conditionValue3 ? scalarValue19 : scalarValue20;
                float comparisonValue16 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue17 = conditionValue4 ? scalarValue19 : scalarValue18;
                float sumValue6 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue22 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue22);
                intermediateValue27 = true;
                productValue16 = inverseLengthValue9 * comparisonValue18;
                productValue15 = inverseLengthValue9 * comparisonValue19;
                productValue14 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue19;
                if (comparisonValue27)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue17 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue17 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue51 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue52 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue51 - 0.5) < 0.0625) ? (((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue18 = sampledTextureValue16.x;
                float scalarValue19 = sampledTextureValue16.y;
                float scalarValue20 = sampledTextureValue16.z;
                float scalarValue21 = sampledTextureValue16.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue32 > 0.5;
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue18 : scalarValue21;
                float comparisonValue15 = conditionValue3 ? scalarValue19 : scalarValue20;
                float comparisonValue16 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue17 = conditionValue4 ? scalarValue19 : scalarValue18;
                float sumValue6 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue22 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue22);
                intermediateValue30 = true;
                productValue17 = inverseLengthValue9 * comparisonValue18;
                productValue16 = inverseLengthValue9 * comparisonValue19;
                productValue15 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue20;
                if (comparisonValue27)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue17 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue17 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue51 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue52 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue51 - 0.5) < 0.0625) ? (((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue18 = sampledTextureValue16.x;
                float scalarValue19 = sampledTextureValue16.y;
                float scalarValue20 = sampledTextureValue16.z;
                float scalarValue21 = sampledTextureValue16.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue32 > 0.5;
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue18 : scalarValue21;
                float comparisonValue15 = conditionValue3 ? scalarValue19 : scalarValue20;
                float comparisonValue16 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue17 = conditionValue4 ? scalarValue19 : scalarValue18;
                float sumValue6 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue22 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue22);
                intermediateValue31 = true;
                productValue16 = inverseLengthValue9 * comparisonValue18;
                productValue15 = inverseLengthValue9 * comparisonValue19;
                productValue14 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue19;
                if (comparisonValue27)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue17 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue17 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue51 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue52 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue51 - 0.5) < 0.0625) ? (((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue18 = sampledTextureValue16.x;
                float scalarValue19 = sampledTextureValue16.y;
                float scalarValue20 = sampledTextureValue16.z;
                float scalarValue21 = sampledTextureValue16.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue32 > 0.5;
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue18 : scalarValue21;
                float comparisonValue15 = conditionValue3 ? scalarValue19 : scalarValue20;
                float comparisonValue16 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue17 = conditionValue4 ? scalarValue19 : scalarValue18;
                float sumValue6 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue22 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue22);
                intermediateValue28 = true;
                productValue16 = inverseLengthValue9 * comparisonValue18;
                productValue15 = inverseLengthValue9 * comparisonValue19;
                productValue14 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue19;
                if (comparisonValue27)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue17 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue17 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue51 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue52 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue51 - 0.5) < 0.0625) ? (((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue18 = sampledTextureValue16.x;
                float scalarValue19 = sampledTextureValue16.y;
                float scalarValue20 = sampledTextureValue16.z;
                float scalarValue21 = sampledTextureValue16.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue32 > 0.5;
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue18 : scalarValue21;
                float comparisonValue15 = conditionValue3 ? scalarValue19 : scalarValue20;
                float comparisonValue16 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue17 = conditionValue4 ? scalarValue19 : scalarValue18;
                float sumValue6 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue22 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue22);
                intermediateValue31 = true;
                productValue17 = inverseLengthValue9 * comparisonValue18;
                productValue16 = inverseLengthValue9 * comparisonValue19;
                productValue15 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue20;
                if (comparisonValue27)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue17 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue17 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue51 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue52 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue51 - 0.5) < 0.0625) ? (((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue18 = sampledTextureValue16.x;
                float scalarValue19 = sampledTextureValue16.y;
                float scalarValue20 = sampledTextureValue16.z;
                float scalarValue21 = sampledTextureValue16.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue32 > 0.5;
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue18 : scalarValue21;
                float comparisonValue15 = conditionValue3 ? scalarValue19 : scalarValue20;
                float comparisonValue16 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue17 = conditionValue4 ? scalarValue19 : scalarValue18;
                float sumValue6 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue22 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue22);
                intermediateValue32 = true;
                productValue19 = inverseLengthValue9 * comparisonValue18;
                productValue18 = inverseLengthValue9 * comparisonValue19;
                productValue17 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue22;
                if (comparisonValue27)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture4)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture4, int(0u)));
                uint scalarValue17 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue17 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue51 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue52 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture4, textureSampler4), vec2((abs(productValue51 - 0.5) < 0.0625) ? (((productValue51 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue52 - 0.5) < 0.0625) ? (((productValue52 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue18 = sampledTextureValue16.x;
                float scalarValue19 = sampledTextureValue16.y;
                float scalarValue20 = sampledTextureValue16.z;
                float scalarValue21 = sampledTextureValue16.w;
                float multiplyAddValue31 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue32 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue32 > 0.5;
                bool conditionValue4 = multiplyAddValue31 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue18 : scalarValue21;
                float comparisonValue15 = conditionValue3 ? scalarValue19 : scalarValue20;
                float comparisonValue16 = conditionValue4 ? scalarValue20 : scalarValue21;
                float comparisonValue17 = conditionValue4 ? scalarValue19 : scalarValue18;
                float sumValue6 = multiplyAddValue31 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue31 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue32 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue32 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue22 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue22);
                intermediateValue35 = true;
                productValue20 = inverseLengthValue9 * comparisonValue18;
                productValue19 = inverseLengthValue9 * comparisonValue19;
                productValue18 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue23;
                if (comparisonValue27)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue3 & 16u) == 0u)
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue42 & 16u) == 0u)
#endif
                {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue23 = sampledTextureValue18.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue17 ? scalarValue23 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue17 ? sampledTextureValue18.y : 0u);
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue53 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue54 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue33 = (productValue53 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (productValue54 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue35 = (productValue53 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    float multiplyAddValue36 = (productValue54 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue34) : multiplyAddValue34;
                    bool comparisonValue22 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue36) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue35 : 0.0, comparisonValue23 ? multiplyAddValue36 : 0.0, 0.25);
                    float scalarValue24 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue10 = inversesqrt(scalarValue24);
                    comparisonValue12 = comparisonValue22 ? (inverseLengthValue10 * multiplyAddValue35) : 0.0;
                    comparisonValue13 = comparisonValue23 ? (inverseLengthValue10 * multiplyAddValue36) : 0.0;
                    productValue19 = inverseLengthValue10 * 0.25;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue23 = sampledTextureValue18.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue17 ? scalarValue23 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue17 ? sampledTextureValue18.y : 0u);
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue53 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue54 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue33 = (productValue53 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (productValue54 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue35 = (productValue53 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    float multiplyAddValue36 = (productValue54 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue34) : multiplyAddValue34;
                    bool comparisonValue22 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue36) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue35 : 0.0, comparisonValue23 ? multiplyAddValue36 : 0.0, 0.25);
                    float scalarValue24 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue10 = inversesqrt(scalarValue24);
                    comparisonValue12 = comparisonValue22 ? (inverseLengthValue10 * multiplyAddValue35) : 0.0;
                    comparisonValue13 = comparisonValue23 ? (inverseLengthValue10 * multiplyAddValue36) : 0.0;
                    productValue20 = inverseLengthValue10 * 0.25;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue23 = sampledTextureValue18.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue17 ? scalarValue23 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue17 ? sampledTextureValue18.y : 0u);
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue53 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue54 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue33 = (productValue53 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (productValue54 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue35 = (productValue53 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    float multiplyAddValue36 = (productValue54 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue34) : multiplyAddValue34;
                    bool comparisonValue22 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue36) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue35 : 0.0, comparisonValue23 ? multiplyAddValue36 : 0.0, 0.25);
                    float scalarValue24 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue10 = inversesqrt(scalarValue24);
                    comparisonValue12 = comparisonValue22 ? (inverseLengthValue10 * multiplyAddValue35) : 0.0;
                    comparisonValue13 = comparisonValue23 ? (inverseLengthValue10 * multiplyAddValue36) : 0.0;
                    productValue22 = inverseLengthValue10 * 0.25;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture4)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture4, int(0u)));
                    uint scalarValue23 = sampledTextureValue18.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue17 ? scalarValue23 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue17 ? sampledTextureValue18.y : 0u);
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture4, textureSampler4), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue53 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue54 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue33 = (productValue53 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue34 = (productValue54 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue35 = (productValue53 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue33) : multiplyAddValue33;
                    float multiplyAddValue36 = (productValue54 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue34) : multiplyAddValue34;
                    bool comparisonValue22 = abs(multiplyAddValue35) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue36) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue35 : 0.0, comparisonValue23 ? multiplyAddValue36 : 0.0, 0.25);
                    float scalarValue24 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue10 = inversesqrt(scalarValue24);
                    comparisonValue12 = comparisonValue22 ? (inverseLengthValue10 * multiplyAddValue35) : 0.0;
                    comparisonValue13 = comparisonValue23 ? (inverseLengthValue10 * multiplyAddValue36) : 0.0;
                    productValue23 = inverseLengthValue10 * 0.25;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
#endif
                }
                else
                {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = reinterpretedBits10 ? uintBitsToFloat(0xffffffffu ) : 0.0;
                    comparisonValue13 = multiplyAddValue7;
                    productValue19 = productValue50;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = multiplyAddValue51;
                    comparisonValue13 = multiplyAddValue50;
                    productValue20 = productValue81;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = conditionValue8 ? uintBitsToFloat(0xffffffffu ) : 0.0;
                    comparisonValue13 = multiplyAddValue65;
                    productValue19 = productValue99;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = multiplyAddValue86;
                    comparisonValue13 = multiplyAddValue85;
                    productValue20 = productValue115;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = multiplyAddValue94;
                    comparisonValue13 = productValue99;
                    productValue19 = multiplyAddValue93;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = multiplyAddValue94;
                    comparisonValue13 = productValue99;
                    productValue20 = multiplyAddValue93;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = multiplyAddValue93;
                    comparisonValue13 = multiplyAddValue85;
                    productValue19 = productValue115;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = multiplyAddValue93;
                    comparisonValue13 = multiplyAddValue85;
                    productValue20 = productValue115;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = multiplyAddValue93;
                    comparisonValue13 = multiplyAddValue85;
                    productValue22 = productValue115;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = multiplyAddValue93;
                    comparisonValue13 = multiplyAddValue85;
                    productValue23 = productValue115;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue5 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue31 = fract(float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x);
                    float productValue32 = fract(float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y);
                    float comparisonValue1 = (((productValue31 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.y * 2.0) + (-1.0))) - (((sampledTextureValue5.w * 2.0) + (-1.0)) * ((productValue31 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue2 = (((productValue32 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.z * 2.0) + (-1.0))) - (((productValue32 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue5.x * 2.0) + (-1.0)));
                    float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue1;
                    float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue2;
                    float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue3, comparisonValue4, 0.25), vec3(comparisonValue3, comparisonValue4, 0.25)));
                    branchMergedValue3 = comparisonValue3 * inverseLengthValue1;
                    branchMergedValue4 = comparisonValue4 * inverseLengthValue1;
                    branchMergedValue5 = inverseLengthValue1 * 0.25;
#endif
                }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue30 = comparisonValue7;
                productValue16 = comparisonValue12;
                productValue15 = comparisonValue13;
                productValue14 = productValue19;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue30 = comparisonValue7;
                productValue17 = comparisonValue12;
                productValue16 = comparisonValue13;
                productValue15 = productValue20;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue35 = comparisonValue27;
                productValue16 = comparisonValue12;
                productValue15 = comparisonValue13;
                productValue14 = productValue19;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue34 = comparisonValue27;
                productValue17 = comparisonValue12;
                productValue16 = comparisonValue13;
                productValue15 = productValue20;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = comparisonValue27;
                productValue16 = comparisonValue12;
                productValue15 = comparisonValue13;
                productValue14 = productValue19;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue30 = comparisonValue27;
                productValue17 = comparisonValue12;
                productValue16 = comparisonValue13;
                productValue15 = productValue20;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue31 = comparisonValue27;
                productValue16 = comparisonValue12;
                productValue15 = comparisonValue13;
                productValue14 = productValue19;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue28 = comparisonValue27;
                productValue16 = comparisonValue12;
                productValue15 = comparisonValue13;
                productValue14 = productValue19;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue31 = comparisonValue27;
                productValue17 = comparisonValue12;
                productValue16 = comparisonValue13;
                productValue15 = productValue20;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue32 = comparisonValue27;
                productValue19 = comparisonValue12;
                productValue18 = comparisonValue13;
                productValue17 = productValue22;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue35 = comparisonValue27;
                productValue20 = comparisonValue12;
                productValue19 = comparisonValue13;
                productValue18 = productValue23;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
#endif
            }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue16 = productValue14;
            multiplyAddValue17 = productValue15;
            multiplyAddValue18 = productValue16;
            intermediateValue29 = intermediateValue30;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue20 = productValue15;
            multiplyAddValue21 = productValue16;
            multiplyAddValue22 = productValue17;
            intermediateValue29 = intermediateValue30;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue13 = productValue14;
            multiplyAddValue14 = productValue15;
            multiplyAddValue15 = productValue16;
            intermediateValue34 = intermediateValue35;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue17 = productValue15;
            multiplyAddValue18 = productValue16;
            multiplyAddValue19 = productValue17;
            intermediateValue33 = intermediateValue34;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue20 = productValue14;
            multiplyAddValue21 = productValue15;
            multiplyAddValue22 = productValue16;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue24 = productValue15;
            multiplyAddValue25 = productValue16;
            multiplyAddValue26 = productValue17;
            intermediateValue29 = intermediateValue30;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue17 = productValue14;
            multiplyAddValue18 = productValue15;
            multiplyAddValue19 = productValue16;
            intermediateValue30 = intermediateValue31;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue21 = productValue15;
            multiplyAddValue22 = productValue16;
            multiplyAddValue23 = productValue17;
            intermediateValue33 = intermediateValue34;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue20 = productValue14;
            multiplyAddValue21 = productValue15;
            multiplyAddValue22 = productValue16;
            intermediateValue27 = intermediateValue28;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue22 = productValue15;
            multiplyAddValue23 = productValue16;
            multiplyAddValue24 = productValue17;
            intermediateValue30 = intermediateValue31;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue17 = productValue17;
            multiplyAddValue18 = productValue18;
            multiplyAddValue19 = productValue19;
            intermediateValue31 = intermediateValue32;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue19 = productValue18;
            multiplyAddValue20 = productValue19;
            multiplyAddValue21 = productValue20;
            intermediateValue34 = intermediateValue35;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue4 = fract(productValue33);
                float scalarValue5 = fract(productValue34);
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
                if (abs(scalarValue5 + (-0.5)) < 0.0625)
                {
                    comparisonValue6 = ((scalarValue5 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue6 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue6 = sampledTextureValue7.x;
                float scalarValue7 = sampledTextureValue7.y;
                float scalarValue8 = sampledTextureValue7.z;
                float scalarValue9 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue ? scalarValue7 : scalarValue8;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue1 ? scalarValue7 : scalarValue6;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue37;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue16 = branchMergedValue;
            intermediateValue17 = branchMergedValue1;
            intermediateValue18 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue4 = fract(productValue33);
                float scalarValue5 = fract(productValue34);
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
                if (abs(scalarValue5 + (-0.5)) < 0.0625)
                {
                    comparisonValue6 = ((scalarValue5 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue6 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue6 = sampledTextureValue7.x;
                float scalarValue7 = sampledTextureValue7.y;
                float scalarValue8 = sampledTextureValue7.z;
                float scalarValue9 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue ? scalarValue7 : scalarValue8;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue1 ? scalarValue7 : scalarValue6;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue37;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue19 = branchMergedValue;
            intermediateValue20 = branchMergedValue1;
            intermediateValue21 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue4 = fract(productValue33);
                float scalarValue5 = fract(productValue34);
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
                if (abs(scalarValue5 + (-0.5)) < 0.0625)
                {
                    comparisonValue6 = ((scalarValue5 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue6 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue6 = sampledTextureValue7.x;
                float scalarValue7 = sampledTextureValue7.y;
                float scalarValue8 = sampledTextureValue7.z;
                float scalarValue9 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue ? scalarValue7 : scalarValue8;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue1 ? scalarValue7 : scalarValue6;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue37;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue22 = branchMergedValue;
            intermediateValue23 = branchMergedValue1;
            intermediateValue24 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue4 = fract(productValue33);
                float scalarValue5 = fract(productValue34);
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
                if (abs(scalarValue5 + (-0.5)) < 0.0625)
                {
                    comparisonValue6 = ((scalarValue5 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue6 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue6 = sampledTextureValue7.x;
                float scalarValue7 = sampledTextureValue7.y;
                float scalarValue8 = sampledTextureValue7.z;
                float scalarValue9 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue ? scalarValue7 : scalarValue8;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue1 ? scalarValue7 : scalarValue6;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue37;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue17 = branchMergedValue;
            intermediateValue18 = branchMergedValue1;
            intermediateValue19 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue4 = fract(productValue33);
                float scalarValue5 = fract(productValue34);
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
                if (abs(scalarValue5 + (-0.5)) < 0.0625)
                {
                    comparisonValue6 = ((scalarValue5 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue6 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue6 = sampledTextureValue7.x;
                float scalarValue7 = sampledTextureValue7.y;
                float scalarValue8 = sampledTextureValue7.z;
                float scalarValue9 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue ? scalarValue7 : scalarValue8;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue1 ? scalarValue7 : scalarValue6;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue37;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue20 = branchMergedValue;
            intermediateValue21 = branchMergedValue1;
            intermediateValue22 = branchMergedValue2;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue33 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue34 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue4 = fract(productValue33);
                float scalarValue5 = fract(productValue34);
                float comparisonValue5;
                if (abs(scalarValue4 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue4 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
                if (abs(scalarValue5 + (-0.5)) < 0.0625)
                {
                    comparisonValue6 = ((scalarValue5 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue6 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue6 = sampledTextureValue7.x;
                float scalarValue7 = sampledTextureValue7.y;
                float scalarValue8 = sampledTextureValue7.z;
                float scalarValue9 = sampledTextureValue7.w;
                float sumValue = fract(productValue33 + 0.5);
                float sumValue1 = fract(productValue34 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue6 : scalarValue9;
                intermediateValue[1u] = conditionValue ? scalarValue7 : scalarValue8;
                float productValue35 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue36 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue35 - productValue36;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue8 : scalarValue9;
                intermediateValue[1u] = conditionValue1 ? scalarValue7 : scalarValue6;
                float productValue37 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue37, 0.25), vec3(sumValue2, productValue37, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue37;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue23 = branchMergedValue;
            intermediateValue24 = branchMergedValue1;
            intermediateValue25 = branchMergedValue2;
#endif
        }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue25 = intermediateValue29 ? multiplyAddValue16 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue37 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue25, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue18, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue38 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue25, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue18, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue39 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue25, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue18, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue17) : 0.0) : 0.0);
        vec3 vectorValue5 = vec3(multiplyAddValue37, multiplyAddValue38, multiplyAddValue39);
        float scalarValue28 = rdDot3Precise(vectorValue5, vectorValue5);
        float inverseLengthValue14 = inversesqrt(scalarValue28);
        productValue4 = inverseLengthValue14 * multiplyAddValue39;
        productValue5 = inverseLengthValue14 * multiplyAddValue38;
        productValue6 = inverseLengthValue14 * multiplyAddValue37;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue26 = intermediateValue29 ? multiplyAddValue20 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue58 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue26, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue22, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue21) : 0.0) : 0.0);
        float multiplyAddValue59 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue26, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue22, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue21) : 0.0) : 0.0);
        float multiplyAddValue60 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue26, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue22, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue21) : 0.0) : 0.0);
        vec3 vectorValue7 = vec3(multiplyAddValue58, multiplyAddValue59, multiplyAddValue60);
        float scalarValue36 = rdDot3Precise(vectorValue7, vectorValue7);
        float inverseLengthValue19 = inversesqrt(scalarValue36);
        productValue5 = inverseLengthValue19 * multiplyAddValue60;
        productValue6 = inverseLengthValue19 * multiplyAddValue59;
        productValue7 = inverseLengthValue19 * multiplyAddValue58;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue30 = intermediateValue34 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue72 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue30, intermediateValue34 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue15, intermediateValue34 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue73 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue30, intermediateValue34 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue15, intermediateValue34 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue74 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue30, intermediateValue34 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue15, intermediateValue34 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue9 = vec3(multiplyAddValue72, multiplyAddValue73, multiplyAddValue74);
        float scalarValue47 = rdDot3Precise(vectorValue9, vectorValue9);
        float inverseLengthValue21 = inversesqrt(scalarValue47);
        productValue4 = inverseLengthValue21 * multiplyAddValue74;
        productValue5 = inverseLengthValue21 * multiplyAddValue73;
        productValue6 = inverseLengthValue21 * multiplyAddValue72;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue31 = intermediateValue33 ? multiplyAddValue17 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue90 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue31, intermediateValue33 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue19, intermediateValue33 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue91 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue31, intermediateValue33 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue19, intermediateValue33 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue92 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue31, intermediateValue33 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue19, intermediateValue33 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue18) : 0.0) : 0.0);
        vec3 vectorValue10 = vec3(multiplyAddValue90, multiplyAddValue91, multiplyAddValue92);
        float scalarValue48 = rdDot3Precise(vectorValue10, vectorValue10);
        float inverseLengthValue25 = inversesqrt(scalarValue48);
        productValue5 = inverseLengthValue25 * multiplyAddValue92;
        productValue6 = inverseLengthValue25 * multiplyAddValue91;
        productValue7 = inverseLengthValue25 * multiplyAddValue90;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue32 = intermediateValue26 ? multiplyAddValue20 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue104 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue32, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue22, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue21) : 0.0) : 0.0);
        float multiplyAddValue105 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue32, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue22, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue21) : 0.0) : 0.0);
        float multiplyAddValue106 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue32, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue22, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue21) : 0.0) : 0.0);
        vec3 vectorValue11 = vec3(multiplyAddValue104, multiplyAddValue105, multiplyAddValue106);
        float scalarValue49 = rdDot3Precise(vectorValue11, vectorValue11);
        float inverseLengthValue26 = inversesqrt(scalarValue49);
        productValue4 = inverseLengthValue26 * multiplyAddValue106;
        productValue5 = inverseLengthValue26 * multiplyAddValue105;
        productValue6 = inverseLengthValue26 * multiplyAddValue104;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue33 = intermediateValue29 ? multiplyAddValue24 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue117 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue33, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue26, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue25) : 0.0) : 0.0);
        float multiplyAddValue118 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue33, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue26, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue25) : 0.0) : 0.0);
        float multiplyAddValue119 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue33, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue26, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue25) : 0.0) : 0.0);
        vec3 vectorValue12 = vec3(multiplyAddValue117, multiplyAddValue118, multiplyAddValue119);
        float scalarValue50 = rdDot3Precise(vectorValue12, vectorValue12);
        float inverseLengthValue27 = inversesqrt(scalarValue50);
        productValue5 = inverseLengthValue27 * multiplyAddValue119;
        productValue6 = inverseLengthValue27 * multiplyAddValue118;
        productValue7 = inverseLengthValue27 * multiplyAddValue117;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue34 = intermediateValue30 ? multiplyAddValue17 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue126 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue34, intermediateValue30 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue19, intermediateValue30 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue127 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue34, intermediateValue30 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue19, intermediateValue30 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue128 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue34, intermediateValue30 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue19, intermediateValue30 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue18) : 0.0) : 0.0);
        vec3 vectorValue13 = vec3(multiplyAddValue126, multiplyAddValue127, multiplyAddValue128);
        float scalarValue51 = rdDot3Precise(vectorValue13, vectorValue13);
        float inverseLengthValue28 = inversesqrt(scalarValue51);
        productValue4 = inverseLengthValue28 * multiplyAddValue128;
        productValue5 = inverseLengthValue28 * multiplyAddValue127;
        productValue6 = inverseLengthValue28 * multiplyAddValue126;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue35 = intermediateValue33 ? multiplyAddValue21 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue135 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue35, intermediateValue33 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue23, intermediateValue33 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue22) : 0.0) : 0.0);
        float multiplyAddValue136 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue35, intermediateValue33 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue23, intermediateValue33 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue22) : 0.0) : 0.0);
        float multiplyAddValue137 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue35, intermediateValue33 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue23, intermediateValue33 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue22) : 0.0) : 0.0);
        vec3 vectorValue14 = vec3(multiplyAddValue135, multiplyAddValue136, multiplyAddValue137);
        float scalarValue52 = rdDot3Precise(vectorValue14, vectorValue14);
        float inverseLengthValue29 = inversesqrt(scalarValue52);
        productValue5 = inverseLengthValue29 * multiplyAddValue137;
        productValue6 = inverseLengthValue29 * multiplyAddValue136;
        productValue7 = inverseLengthValue29 * multiplyAddValue135;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue36 = intermediateValue27 ? multiplyAddValue20 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue153 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue36, intermediateValue27 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue22, intermediateValue27 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue21) : 0.0) : 0.0);
        float multiplyAddValue154 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue36, intermediateValue27 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue22, intermediateValue27 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue21) : 0.0) : 0.0);
        float multiplyAddValue155 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue36, intermediateValue27 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue22, intermediateValue27 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue21) : 0.0) : 0.0);
        vec3 vectorValue15 = vec3(multiplyAddValue153, multiplyAddValue154, multiplyAddValue155);
        float scalarValue56 = rdDot3Precise(vectorValue15, vectorValue15);
        float inverseLengthValue36 = inversesqrt(scalarValue56);
        productValue4 = inverseLengthValue36 * multiplyAddValue155;
        productValue5 = inverseLengthValue36 * multiplyAddValue154;
        productValue6 = inverseLengthValue36 * multiplyAddValue153;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue37 = intermediateValue30 ? multiplyAddValue22 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue167 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue37, intermediateValue30 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue24, intermediateValue30 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue23) : 0.0) : 0.0);
        float multiplyAddValue168 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue37, intermediateValue30 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue24, intermediateValue30 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue23) : 0.0) : 0.0);
        float multiplyAddValue169 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue37, intermediateValue30 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue24, intermediateValue30 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue23) : 0.0) : 0.0);
        vec3 vectorValue16 = vec3(multiplyAddValue167, multiplyAddValue168, multiplyAddValue169);
        float scalarValue58 = rdDot3Precise(vectorValue16, vectorValue16);
        float inverseLengthValue37 = inversesqrt(scalarValue58);
        productValue5 = inverseLengthValue37 * multiplyAddValue169;
        productValue6 = inverseLengthValue37 * multiplyAddValue168;
        productValue7 = inverseLengthValue37 * multiplyAddValue167;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue38 = intermediateValue31 ? multiplyAddValue17 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue176 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue38, intermediateValue31 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue19, intermediateValue31 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue177 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue38, intermediateValue31 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue19, intermediateValue31 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue178 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue38, intermediateValue31 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue19, intermediateValue31 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue18) : 0.0) : 0.0);
        vec3 vectorValue17 = vec3(multiplyAddValue176, multiplyAddValue177, multiplyAddValue178);
        float scalarValue59 = rdDot3Precise(vectorValue17, vectorValue17);
        float inverseLengthValue38 = inversesqrt(scalarValue59);
        productValue7 = inverseLengthValue38 * multiplyAddValue178;
        productValue8 = inverseLengthValue38 * multiplyAddValue177;
        productValue9 = inverseLengthValue38 * multiplyAddValue176;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue39 = intermediateValue34 ? multiplyAddValue19 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue25 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue25);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue26 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue26);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue27 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue27);
        float multiplyAddValue188 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue39, intermediateValue34 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue21, intermediateValue34 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue189 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue39, intermediateValue34 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue21, intermediateValue34 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue190 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue39, intermediateValue34 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue21, intermediateValue34 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue20) : 0.0) : 0.0);
        vec3 vectorValue19 = vec3(multiplyAddValue188, multiplyAddValue189, multiplyAddValue190);
        float scalarValue61 = rdDot3Precise(vectorValue19, vectorValue19);
        float inverseLengthValue43 = inversesqrt(scalarValue61);
        productValue8 = inverseLengthValue43 * multiplyAddValue190;
        productValue9 = inverseLengthValue43 * multiplyAddValue189;
        productValue10 = inverseLengthValue43 * multiplyAddValue188;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue16 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue17 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue18 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue5 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue16;
        float multiplyAddValue = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue18, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue17, inverseLengthValue5 * varyingTangent0.x));
        float multiplyAddValue1 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue18, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue17, inverseLengthValue5 * varyingTangent0.y));
        float multiplyAddValue2 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue18, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue17, inverseLengthValue5 * varyingTangent0.z));
        float inverseLengthValue6 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue9 = inverseLengthValue6 * multiplyAddValue;
        intermediateValue10 = inverseLengthValue6 * multiplyAddValue1;
        intermediateValue11 = inverseLengthValue6 * multiplyAddValue2;
    }
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue7 = inversesqrt(dot(vec3(intermediateValue9, intermediateValue10, intermediateValue11), vec3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue38 = inverseLengthValue7 * intermediateValue9;
    float productValue39 = inverseLengthValue7 * intermediateValue10;
    float productValue40 = inverseLengthValue7 * intermediateValue11;
    float quotientValue2 = 1.0 / ((abs(productValue39) + abs(productValue38)) + abs(productValue40));
    float productValue41 = quotientValue2 * productValue38;
    float productValue42 = quotientValue2 * productValue39;
    bool conditionValue2 = productValue40 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue13;
    float productValue17;
    float productValue18;
    if ((fragmentVectorConstants1.packedValues[28u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue43 = fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue13 = spvNClamp(productValue43, 0.0, 1.0);
        productValue17 = spvNClamp(((productValue43 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue43, 0.0, 1.0);
        productValue18 = spvNClamp((((productValue43 * productValue43) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue43, 0.0, 1.0);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue19 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue16 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        float multiplyAddValue44 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue20, inverseLengthValue16 * varyingTangent0.x));
        float multiplyAddValue45 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue20, inverseLengthValue16 * varyingTangent0.y));
        float multiplyAddValue46 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue20, inverseLengthValue16 * varyingTangent0.z));
        float inverseLengthValue17 = inversesqrt(dot(vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46), vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46)));
        intermediateValue12 = inverseLengthValue17 * multiplyAddValue44;
        intermediateValue13 = inverseLengthValue17 * multiplyAddValue45;
        intermediateValue14 = inverseLengthValue17 * multiplyAddValue46;
    }
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue18 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue72 = inverseLengthValue18 * intermediateValue12;
    float productValue73 = inverseLengthValue18 * intermediateValue13;
    float productValue74 = inverseLengthValue18 * intermediateValue14;
    float quotientValue4 = 1.0 / ((abs(productValue73) + abs(productValue72)) + abs(productValue74));
    float productValue75 = quotientValue4 * productValue72;
    float productValue76 = quotientValue4 * productValue73;
    bool conditionValue6 = productValue74 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue16;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[28u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue43 = fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue16 = spvNClamp(productValue43, 0.0, 1.0);
        productValue18 = spvNClamp(((productValue43 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue43, 0.0, 1.0);
        productValue19 = spvNClamp((((productValue43 * productValue43) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue43, 0.0, 1.0);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue19 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue16 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        float multiplyAddValue44 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue20, inverseLengthValue16 * varyingTangent0.x));
        float multiplyAddValue45 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue20, inverseLengthValue16 * varyingTangent0.y));
        float multiplyAddValue46 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue20, inverseLengthValue16 * varyingTangent0.z));
        float inverseLengthValue17 = inversesqrt(dot(vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46), vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46)));
        intermediateValue12 = inverseLengthValue17 * multiplyAddValue44;
        intermediateValue13 = inverseLengthValue17 * multiplyAddValue45;
        intermediateValue14 = inverseLengthValue17 * multiplyAddValue46;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue18 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue72 = inverseLengthValue18 * intermediateValue12;
    float productValue73 = inverseLengthValue18 * intermediateValue13;
    float productValue74 = inverseLengthValue18 * intermediateValue14;
    float quotientValue4 = 1.0 / ((abs(productValue73) + abs(productValue72)) + abs(productValue74));
    float productValue75 = quotientValue4 * productValue72;
    float productValue76 = quotientValue4 * productValue73;
    bool conditionValue6 = productValue74 < 0.0;
    float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue16;
    float productValue17;
    float productValue18;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue95 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue16 = spvNClamp(productValue95, 0.0, 1.0);
        productValue17 = spvNClamp(((productValue95 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue95, 0.0, 1.0);
        productValue18 = spvNClamp((((productValue95 * productValue95) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue95, 0.0, 1.0);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue22 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue23 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue24 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue22 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue22;
        float multiplyAddValue79 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue24, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue23, inverseLengthValue22 * varyingTangent0.x));
        float multiplyAddValue80 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue24, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue23, inverseLengthValue22 * varyingTangent0.y));
        float multiplyAddValue81 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue24, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue23, inverseLengthValue22 * varyingTangent0.z));
        float inverseLengthValue23 = inversesqrt(dot(vec3(multiplyAddValue79, multiplyAddValue80, multiplyAddValue81), vec3(multiplyAddValue79, multiplyAddValue80, multiplyAddValue81)));
        intermediateValue15 = inverseLengthValue23 * multiplyAddValue79;
        intermediateValue16 = inverseLengthValue23 * multiplyAddValue80;
        intermediateValue17 = inverseLengthValue23 * multiplyAddValue81;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue24 = inversesqrt(dot(vec3(intermediateValue15, intermediateValue16, intermediateValue17), vec3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue108 = inverseLengthValue24 * intermediateValue15;
    float productValue109 = inverseLengthValue24 * intermediateValue16;
    float productValue110 = inverseLengthValue24 * intermediateValue17;
    float quotientValue8 = 1.0 / ((abs(productValue109) + abs(productValue108)) + abs(productValue110));
    float productValue111 = quotientValue8 * productValue108;
    float productValue112 = quotientValue8 * productValue109;
    bool conditionValue10 = productValue110 < 0.0;
    float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue19;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue95 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue19 = spvNClamp(productValue95, 0.0, 1.0);
        productValue18 = spvNClamp(((productValue95 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue95, 0.0, 1.0);
        productValue19 = spvNClamp((((productValue95 * productValue95) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue95, 0.0, 1.0);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue16 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue17 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue18 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue5 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue16;
        float multiplyAddValue = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue18, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue17, inverseLengthValue5 * varyingTangent0.x));
        float multiplyAddValue1 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue18, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue17, inverseLengthValue5 * varyingTangent0.y));
        float multiplyAddValue2 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue18, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue17, inverseLengthValue5 * varyingTangent0.z));
        float inverseLengthValue6 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue9 = inverseLengthValue6 * multiplyAddValue;
        intermediateValue10 = inverseLengthValue6 * multiplyAddValue1;
        intermediateValue11 = inverseLengthValue6 * multiplyAddValue2;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue7 = inversesqrt(dot(vec3(intermediateValue9, intermediateValue10, intermediateValue11), vec3(intermediateValue9, intermediateValue10, intermediateValue11)));
    float productValue38 = inverseLengthValue7 * intermediateValue9;
    float productValue39 = inverseLengthValue7 * intermediateValue10;
    float productValue40 = inverseLengthValue7 * intermediateValue11;
    float quotientValue2 = 1.0 / ((abs(productValue39) + abs(productValue38)) + abs(productValue40));
    float productValue41 = quotientValue2 * productValue38;
    float productValue42 = quotientValue2 * productValue39;
    bool conditionValue2 = productValue40 < 0.0;
    float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue13;
    float productValue21;
    float productValue22;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue95 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue13 = spvNClamp(productValue95, 0.0, 1.0);
        productValue21 = spvNClamp(((productValue95 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue95, 0.0, 1.0);
        productValue22 = spvNClamp((((productValue95 * productValue95) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue95, 0.0, 1.0);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue19 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue16 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        float multiplyAddValue44 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue20, inverseLengthValue16 * varyingTangent0.x));
        float multiplyAddValue45 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue20, inverseLengthValue16 * varyingTangent0.y));
        float multiplyAddValue46 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue20, inverseLengthValue16 * varyingTangent0.z));
        float inverseLengthValue17 = inversesqrt(dot(vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46), vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46)));
        intermediateValue12 = inverseLengthValue17 * multiplyAddValue44;
        intermediateValue13 = inverseLengthValue17 * multiplyAddValue45;
        intermediateValue14 = inverseLengthValue17 * multiplyAddValue46;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue18 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue72 = inverseLengthValue18 * intermediateValue12;
    float productValue73 = inverseLengthValue18 * intermediateValue13;
    float productValue74 = inverseLengthValue18 * intermediateValue14;
    float quotientValue4 = 1.0 / ((abs(productValue73) + abs(productValue72)) + abs(productValue74));
    float productValue75 = quotientValue4 * productValue72;
    float productValue76 = quotientValue4 * productValue73;
    bool conditionValue6 = productValue74 < 0.0;
    float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue16;
    float productValue22;
    float productValue23;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue95 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue16 = spvNClamp(productValue95, 0.0, 1.0);
        productValue22 = spvNClamp(((productValue95 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue95, 0.0, 1.0);
        productValue23 = spvNClamp((((productValue95 * productValue95) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue95, 0.0, 1.0);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue19 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue16 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        float multiplyAddValue44 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue20, inverseLengthValue16 * varyingTangent0.x));
        float multiplyAddValue45 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue20, inverseLengthValue16 * varyingTangent0.y));
        float multiplyAddValue46 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue20, inverseLengthValue16 * varyingTangent0.z));
        float inverseLengthValue17 = inversesqrt(dot(vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46), vec3(multiplyAddValue44, multiplyAddValue45, multiplyAddValue46)));
        intermediateValue12 = inverseLengthValue17 * multiplyAddValue44;
        intermediateValue13 = inverseLengthValue17 * multiplyAddValue45;
        intermediateValue14 = inverseLengthValue17 * multiplyAddValue46;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue18 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue72 = inverseLengthValue18 * intermediateValue12;
    float productValue73 = inverseLengthValue18 * intermediateValue13;
    float productValue74 = inverseLengthValue18 * intermediateValue14;
    float quotientValue4 = 1.0 / ((abs(productValue73) + abs(productValue72)) + abs(productValue74));
    float productValue75 = quotientValue4 * productValue72;
    float productValue76 = quotientValue4 * productValue73;
    bool conditionValue6 = productValue74 < 0.0;
    float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue16;
    float productValue21;
    float productValue22;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue95 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue16 = spvNClamp(productValue95, 0.0, 1.0);
        productValue21 = spvNClamp(((productValue95 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue95, 0.0, 1.0);
        productValue22 = spvNClamp((((productValue95 * productValue95) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue95, 0.0, 1.0);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue22 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue23 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue24 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue22 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue22;
        float multiplyAddValue79 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue24, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue23, inverseLengthValue22 * varyingTangent0.x));
        float multiplyAddValue80 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue24, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue23, inverseLengthValue22 * varyingTangent0.y));
        float multiplyAddValue81 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue24, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue23, inverseLengthValue22 * varyingTangent0.z));
        float inverseLengthValue23 = inversesqrt(dot(vec3(multiplyAddValue79, multiplyAddValue80, multiplyAddValue81), vec3(multiplyAddValue79, multiplyAddValue80, multiplyAddValue81)));
        intermediateValue15 = inverseLengthValue23 * multiplyAddValue79;
        intermediateValue16 = inverseLengthValue23 * multiplyAddValue80;
        intermediateValue17 = inverseLengthValue23 * multiplyAddValue81;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue24 = inversesqrt(dot(vec3(intermediateValue15, intermediateValue16, intermediateValue17), vec3(intermediateValue15, intermediateValue16, intermediateValue17)));
    float productValue108 = inverseLengthValue24 * intermediateValue15;
    float productValue109 = inverseLengthValue24 * intermediateValue16;
    float productValue110 = inverseLengthValue24 * intermediateValue17;
    float quotientValue8 = 1.0 / ((abs(productValue109) + abs(productValue108)) + abs(productValue110));
    float productValue111 = quotientValue8 * productValue108;
    float productValue112 = quotientValue8 * productValue109;
    bool conditionValue10 = productValue110 < 0.0;
    float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue19;
    float productValue22;
    float productValue23;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue95 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue19 = spvNClamp(productValue95, 0.0, 1.0);
        productValue22 = spvNClamp(((productValue95 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue95, 0.0, 1.0);
        productValue23 = spvNClamp((((productValue95 * productValue95) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue95, 0.0, 1.0);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue17 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue18 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue30 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue17;
        float multiplyAddValue138 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue19, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue18, inverseLengthValue30 * varyingTangent0.x));
        float multiplyAddValue139 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue19, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue18, inverseLengthValue30 * varyingTangent0.y));
        float multiplyAddValue140 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue19, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue18, inverseLengthValue30 * varyingTangent0.z));
        float inverseLengthValue31 = inversesqrt(dot(vec3(multiplyAddValue138, multiplyAddValue139, multiplyAddValue140), vec3(multiplyAddValue138, multiplyAddValue139, multiplyAddValue140)));
        intermediateValue10 = inverseLengthValue31 * multiplyAddValue138;
        intermediateValue11 = inverseLengthValue31 * multiplyAddValue139;
        intermediateValue12 = inverseLengthValue31 * multiplyAddValue140;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue32 = inversesqrt(dot(vec3(intermediateValue10, intermediateValue11, intermediateValue12), vec3(intermediateValue10, intermediateValue11, intermediateValue12)));
    float productValue164 = inverseLengthValue32 * intermediateValue10;
    float productValue165 = inverseLengthValue32 * intermediateValue11;
    float productValue166 = inverseLengthValue32 * intermediateValue12;
    float quotientValue9 = 1.0 / ((abs(productValue165) + abs(productValue164)) + abs(productValue166));
    float productValue167 = quotientValue9 * productValue164;
    float productValue168 = quotientValue9 * productValue165;
    bool conditionValue11 = productValue166 < 0.0;
    float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue14;
    float productValue22;
    float productValue23;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue95 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue14 = spvNClamp(productValue95, 0.0, 1.0);
        productValue22 = spvNClamp(((productValue95 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue95, 0.0, 1.0);
        productValue23 = spvNClamp((((productValue95 * productValue95) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue95, 0.0, 1.0);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue20 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue22 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue33 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue20;
        float multiplyAddValue141 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue22, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue21, inverseLengthValue33 * varyingTangent0.x));
        float multiplyAddValue142 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue22, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue21, inverseLengthValue33 * varyingTangent0.y));
        float multiplyAddValue143 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue22, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue21, inverseLengthValue33 * varyingTangent0.z));
        float inverseLengthValue34 = inversesqrt(dot(vec3(multiplyAddValue141, multiplyAddValue142, multiplyAddValue143), vec3(multiplyAddValue141, multiplyAddValue142, multiplyAddValue143)));
        intermediateValue13 = inverseLengthValue34 * multiplyAddValue141;
        intermediateValue14 = inverseLengthValue34 * multiplyAddValue142;
        intermediateValue15 = inverseLengthValue34 * multiplyAddValue143;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue35 = inversesqrt(dot(vec3(intermediateValue13, intermediateValue14, intermediateValue15), vec3(intermediateValue13, intermediateValue14, intermediateValue15)));
    float productValue183 = inverseLengthValue35 * intermediateValue13;
    float productValue184 = inverseLengthValue35 * intermediateValue14;
    float productValue185 = inverseLengthValue35 * intermediateValue15;
    float quotientValue10 = 1.0 / ((abs(productValue184) + abs(productValue183)) + abs(productValue185));
    float productValue186 = quotientValue10 * productValue183;
    float productValue187 = quotientValue10 * productValue184;
    bool conditionValue12 = productValue185 < 0.0;
    float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue17;
    float productValue23;
    float productValue24;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue95 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue17 = spvNClamp(productValue95, 0.0, 1.0);
        productValue23 = spvNClamp(((productValue95 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue95, 0.0, 1.0);
        productValue24 = spvNClamp((((productValue95 * productValue95) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue95, 0.0, 1.0);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue20 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue22 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue33 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue20;
        float multiplyAddValue141 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue22, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue21, inverseLengthValue33 * varyingTangent0.x));
        float multiplyAddValue142 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue22, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue21, inverseLengthValue33 * varyingTangent0.y));
        float multiplyAddValue143 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue22, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue21, inverseLengthValue33 * varyingTangent0.z));
        float inverseLengthValue34 = inversesqrt(dot(vec3(multiplyAddValue141, multiplyAddValue142, multiplyAddValue143), vec3(multiplyAddValue141, multiplyAddValue142, multiplyAddValue143)));
        intermediateValue13 = inverseLengthValue34 * multiplyAddValue141;
        intermediateValue14 = inverseLengthValue34 * multiplyAddValue142;
        intermediateValue15 = inverseLengthValue34 * multiplyAddValue143;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue35 = inversesqrt(dot(vec3(intermediateValue13, intermediateValue14, intermediateValue15), vec3(intermediateValue13, intermediateValue14, intermediateValue15)));
    float productValue183 = inverseLengthValue35 * intermediateValue13;
    float productValue184 = inverseLengthValue35 * intermediateValue14;
    float productValue185 = inverseLengthValue35 * intermediateValue15;
    float quotientValue10 = 1.0 / ((abs(productValue184) + abs(productValue183)) + abs(productValue185));
    float productValue186 = quotientValue10 * productValue183;
    float productValue187 = quotientValue10 * productValue184;
    bool conditionValue12 = productValue185 < 0.0;
    float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue17;
    float productValue22;
    float productValue23;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue95 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue17 = spvNClamp(productValue95, 0.0, 1.0);
        productValue22 = spvNClamp(((productValue95 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue95, 0.0, 1.0);
        productValue23 = spvNClamp((((productValue95 * productValue95) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue95, 0.0, 1.0);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue23 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue24 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue25 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue40 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue23;
        float multiplyAddValue179 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue25, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue24, inverseLengthValue40 * varyingTangent0.x));
        float multiplyAddValue180 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue25, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue24, inverseLengthValue40 * varyingTangent0.y));
        float multiplyAddValue181 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue25, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue24, inverseLengthValue40 * varyingTangent0.z));
        float inverseLengthValue41 = inversesqrt(dot(vec3(multiplyAddValue179, multiplyAddValue180, multiplyAddValue181), vec3(multiplyAddValue179, multiplyAddValue180, multiplyAddValue181)));
        intermediateValue16 = inverseLengthValue41 * multiplyAddValue179;
        intermediateValue17 = inverseLengthValue41 * multiplyAddValue180;
        intermediateValue18 = inverseLengthValue41 * multiplyAddValue181;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue42 = inversesqrt(dot(vec3(intermediateValue16, intermediateValue17, intermediateValue18), vec3(intermediateValue16, intermediateValue17, intermediateValue18)));
    float productValue204 = inverseLengthValue42 * intermediateValue16;
    float productValue205 = inverseLengthValue42 * intermediateValue17;
    float productValue206 = inverseLengthValue42 * intermediateValue18;
    float quotientValue12 = 1.0 / ((abs(productValue205) + abs(productValue204)) + abs(productValue206));
    float productValue207 = quotientValue12 * productValue204;
    float productValue208 = quotientValue12 * productValue205;
    bool conditionValue14 = productValue206 < 0.0;
    float multiplyAddValue61 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue62 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue20;
    float productValue23;
    float productValue24;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue95 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue20 = spvNClamp(productValue95, 0.0, 1.0);
        productValue23 = spvNClamp(((productValue95 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue95, 0.0, 1.0);
        productValue24 = spvNClamp((((productValue95 * productValue95) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue95, 0.0, 1.0);
#endif
    }
    else
    {
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue4 = varyingNormal0.z;
        productValue5 = varyingNormal0.y;
        productValue6 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue7 = varyingNormal0.z;
        productValue8 = varyingNormal0.y;
        productValue9 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue8 = varyingNormal0.z;
        productValue9 = varyingNormal0.y;
        productValue10 = varyingNormal0.x;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue13 = fragmentVectorConstants1.packedValues[18u].x;
        productValue17 = fragmentVectorConstants1.packedValues[18u].y;
        productValue18 = fragmentVectorConstants1.packedValues[18u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue16 = fragmentVectorConstants1.packedValues[18u].x;
        productValue18 = fragmentVectorConstants1.packedValues[18u].y;
        productValue19 = fragmentVectorConstants1.packedValues[18u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue16 = fragmentVectorConstants1.packedValues[19u].x;
        productValue17 = fragmentVectorConstants1.packedValues[19u].y;
        productValue18 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue19 = fragmentVectorConstants1.packedValues[19u].x;
        productValue18 = fragmentVectorConstants1.packedValues[19u].y;
        productValue19 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue13 = fragmentVectorConstants1.packedValues[19u].x;
        productValue21 = fragmentVectorConstants1.packedValues[19u].y;
        productValue22 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue16 = fragmentVectorConstants1.packedValues[19u].x;
        productValue22 = fragmentVectorConstants1.packedValues[19u].y;
        productValue23 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue16 = fragmentVectorConstants1.packedValues[19u].x;
        productValue21 = fragmentVectorConstants1.packedValues[19u].y;
        productValue22 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue19 = fragmentVectorConstants1.packedValues[19u].x;
        productValue22 = fragmentVectorConstants1.packedValues[19u].y;
        productValue23 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue14 = fragmentVectorConstants1.packedValues[19u].x;
        productValue22 = fragmentVectorConstants1.packedValues[19u].y;
        productValue23 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue17 = fragmentVectorConstants1.packedValues[19u].x;
        productValue23 = fragmentVectorConstants1.packedValues[19u].y;
        productValue24 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue17 = fragmentVectorConstants1.packedValues[19u].x;
        productValue22 = fragmentVectorConstants1.packedValues[19u].y;
        productValue23 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue20 = fragmentVectorConstants1.packedValues[19u].x;
        productValue23 = fragmentVectorConstants1.packedValues[19u].y;
        productValue24 = fragmentVectorConstants1.packedValues[19u].z;
#endif
    }
#if (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits26 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits25.x);
    float reinterpretedBits27 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits25.y);
    float reinterpretedBits28 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits25.z);
    fragmentColor1.w = (reinterpretedBits16 < intermediateValue23) ? fma(intermediateValue23, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits16, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue6, productValue5, productValue4);
    float scalarValue29 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue29);
    float productValue55 = inverseLengthValue15 * productValue6;
    float productValue56 = inverseLengthValue15 * productValue5;
    float productValue57 = inverseLengthValue15 * productValue4;
    float quotientValue3 = 1.0 / (abs(productValue57) + (abs(productValue56) + abs(productValue55)));
    float productValue58 = quotientValue3 * productValue55;
    float productValue59 = quotientValue3 * productValue56;
    bool conditionValue5 = productValue57 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue58 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue59))) : productValue58;
    fragmentColor2.y = conditionValue5 ? (((productValue59 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue58))) : productValue59;
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue40 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue41 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits28, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits26, reinterpretedBits27 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits29.x))) + uintBitsToFloat(reinterpretedBits32.x)) / multiplyAddValue40, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits28, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits26, reinterpretedBits27 * uintBitsToFloat(reinterpretedBits33.x))) + uintBitsToFloat(reinterpretedBits36.x)) / multiplyAddValue41, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits29.y))) + uintBitsToFloat(reinterpretedBits32.y)) / multiplyAddValue40, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits28, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits26, reinterpretedBits27 * uintBitsToFloat(reinterpretedBits33.y))) + uintBitsToFloat(reinterpretedBits36.y)) / multiplyAddValue41, 0.5, 0.5);
    float reinterpretedBits37 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
    bool reinterpretedBits38 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits37 > 9.9999997473787516355514526367188e-05);
    float productValue60 = reinterpretedBits37 * reinterpretedBits37;
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits40 = (reinterpretedBits38 ? spvNMin(productValue60, 1.0) : uintBitsToFloat(reinterpretedBits39.x)) * 0.16666667163372039794921875;
    float multiplyAddValue42 = (reinterpretedBits38 ? spvNMin(fma(fma(productValue60, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue60, 1.0) : uintBitsToFloat(reinterpretedBits39.y)) * 0.16666667163372039794921875;
    float multiplyAddValue43 = (reinterpretedBits38 ? spvNMin(fma(productValue60 * productValue60, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue60, 1.0) : uintBitsToFloat(reinterpretedBits39.z)) * 0.16666667163372039794921875;
    float productValue61 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue42, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue43, reinterpretedBits40)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue42 / productValue61, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits40 / productValue61, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue43 / productValue61, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue61, 0.0, 1.0) * 255.0);
    uint reinterpretedBits41 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits41 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits41 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[113u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue25, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits26 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits25.x);
    float reinterpretedBits27 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits25.y);
    float reinterpretedBits28 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits25.z);
    fragmentColor1.w = (reinterpretedBits14 < intermediateValue23) ? fma(intermediateValue23, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits14, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue8 = vec3(productValue7, productValue6, productValue5);
    float scalarValue37 = rdDot3Precise(vectorValue8, vectorValue8);
    float inverseLengthValue20 = inversesqrt(scalarValue37);
    float productValue82 = inverseLengthValue20 * productValue7;
    float productValue83 = inverseLengthValue20 * productValue6;
    float productValue84 = inverseLengthValue20 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue84) + (abs(productValue83) + abs(productValue82)));
    float productValue85 = quotientValue5 * productValue82;
    float productValue86 = quotientValue5 * productValue83;
    bool conditionValue7 = productValue84 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue85 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue86))) : productValue85;
    fragmentColor2.y = conditionValue7 ? (((productValue86 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue85))) : productValue86;
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue40 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue41 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits28, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits26, reinterpretedBits27 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits29.x))) + uintBitsToFloat(reinterpretedBits32.x)) / multiplyAddValue40, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits28, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits26, reinterpretedBits27 * uintBitsToFloat(reinterpretedBits33.x))) + uintBitsToFloat(reinterpretedBits36.x)) / multiplyAddValue41, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits29.y))) + uintBitsToFloat(reinterpretedBits32.y)) / multiplyAddValue40, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits28, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits26, reinterpretedBits27 * uintBitsToFloat(reinterpretedBits33.y))) + uintBitsToFloat(reinterpretedBits36.y)) / multiplyAddValue41, 0.5, 0.5);
    float reinterpretedBits37 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
    bool reinterpretedBits38 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits37 > 9.9999997473787516355514526367188e-05);
    float productValue60 = reinterpretedBits37 * reinterpretedBits37;
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits40 = (reinterpretedBits38 ? spvNMin(productValue60, 1.0) : uintBitsToFloat(reinterpretedBits39.x)) * 0.16666667163372039794921875;
    float multiplyAddValue42 = (reinterpretedBits38 ? spvNMin(fma(fma(productValue60, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue60, 1.0) : uintBitsToFloat(reinterpretedBits39.y)) * 0.16666667163372039794921875;
    float multiplyAddValue43 = (reinterpretedBits38 ? spvNMin(fma(productValue60 * productValue60, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue60, 1.0) : uintBitsToFloat(reinterpretedBits39.z)) * 0.16666667163372039794921875;
    float productValue61 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue42, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue43, reinterpretedBits40)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue42 / productValue61, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits40 / productValue61, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue43 / productValue61, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue61, 0.0, 1.0) * 255.0);
    uint reinterpretedBits41 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits41 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits41 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[113u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue25, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits53 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits52.x);
    float reinterpretedBits54 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits52.y);
    float reinterpretedBits55 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits52.z);
    fragmentColor1.w = (reinterpretedBits17 < intermediateValue28) ? fma(intermediateValue28, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits17, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue6, productValue5, productValue4);
    float scalarValue29 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue29);
    float productValue55 = inverseLengthValue15 * productValue6;
    float productValue56 = inverseLengthValue15 * productValue5;
    float productValue57 = inverseLengthValue15 * productValue4;
    float quotientValue3 = 1.0 / (abs(productValue57) + (abs(productValue56) + abs(productValue55)));
    float productValue58 = quotientValue3 * productValue55;
    float productValue59 = quotientValue3 * productValue56;
    bool conditionValue5 = productValue57 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue58 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue59))) : productValue58;
    fragmentColor2.y = conditionValue5 ? (((productValue59 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue58))) : productValue59;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue75 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue76 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits55, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits13.x)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.x), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits39.x)) / multiplyAddValue76, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits13.y)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.y), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits39.y)) / multiplyAddValue76, 0.5, 0.5);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits57 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits56 > 9.9999997473787516355514526367188e-05);
    float productValue100 = reinterpretedBits56 * reinterpretedBits56;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits58 = (reinterpretedBits57 ? spvNMin(productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.x)) * 0.16666667163372039794921875;
    float multiplyAddValue77 = (reinterpretedBits57 ? spvNMin(fma(fma(productValue100, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.y)) * 0.16666667163372039794921875;
    float multiplyAddValue78 = (reinterpretedBits57 ? spvNMin(fma(productValue100 * productValue100, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.z)) * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue77, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue78, reinterpretedBits58)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue77 / productValue101, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits58 / productValue101, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue78 / productValue101, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0);
    uint reinterpretedBits59 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits59 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits59 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue30, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue29, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits53 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits52.x);
    float reinterpretedBits54 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits52.y);
    float reinterpretedBits55 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits52.z);
    fragmentColor1.w = (reinterpretedBits16 < intermediateValue27) ? fma(intermediateValue27, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits16, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue8 = vec3(productValue7, productValue6, productValue5);
    float scalarValue37 = rdDot3Precise(vectorValue8, vectorValue8);
    float inverseLengthValue20 = inversesqrt(scalarValue37);
    float productValue82 = inverseLengthValue20 * productValue7;
    float productValue83 = inverseLengthValue20 * productValue6;
    float productValue84 = inverseLengthValue20 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue84) + (abs(productValue83) + abs(productValue82)));
    float productValue85 = quotientValue5 * productValue82;
    float productValue86 = quotientValue5 * productValue83;
    bool conditionValue7 = productValue84 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue85 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue86))) : productValue85;
    fragmentColor2.y = conditionValue7 ? (((productValue86 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue85))) : productValue86;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue75 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue76 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits55, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits13.x)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.x), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits39.x)) / multiplyAddValue76, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits13.y)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.y), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits39.y)) / multiplyAddValue76, 0.5, 0.5);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits57 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits56 > 9.9999997473787516355514526367188e-05);
    float productValue100 = reinterpretedBits56 * reinterpretedBits56;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits58 = (reinterpretedBits57 ? spvNMin(productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.x)) * 0.16666667163372039794921875;
    float multiplyAddValue77 = (reinterpretedBits57 ? spvNMin(fma(fma(productValue100, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.y)) * 0.16666667163372039794921875;
    float multiplyAddValue78 = (reinterpretedBits57 ? spvNMin(fma(productValue100 * productValue100, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.z)) * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue77, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue78, reinterpretedBits58)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue77 / productValue101, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits58 / productValue101, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue78 / productValue101, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0);
    uint reinterpretedBits59 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits59 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits59 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue29, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue28, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits53 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits52.x);
    float reinterpretedBits54 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits52.y);
    float reinterpretedBits55 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits52.z);
    fragmentColor1.w = (reinterpretedBits19 < intermediateValue20) ? fma(intermediateValue20, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits19, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue6, productValue5, productValue4);
    float scalarValue29 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue29);
    float productValue55 = inverseLengthValue15 * productValue6;
    float productValue56 = inverseLengthValue15 * productValue5;
    float productValue57 = inverseLengthValue15 * productValue4;
    float quotientValue3 = 1.0 / (abs(productValue57) + (abs(productValue56) + abs(productValue55)));
    float productValue58 = quotientValue3 * productValue55;
    float productValue59 = quotientValue3 * productValue56;
    bool conditionValue5 = productValue57 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue58 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue59))) : productValue58;
    fragmentColor2.y = conditionValue5 ? (((productValue59 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue58))) : productValue59;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue75 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue76 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits55, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits13.x)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.x), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits39.x)) / multiplyAddValue76, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits13.y)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.y), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits39.y)) / multiplyAddValue76, 0.5, 0.5);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits57 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits56 > 9.9999997473787516355514526367188e-05);
    float productValue100 = reinterpretedBits56 * reinterpretedBits56;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits58 = (reinterpretedBits57 ? spvNMin(productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.x)) * 0.16666667163372039794921875;
    float multiplyAddValue77 = (reinterpretedBits57 ? spvNMin(fma(fma(productValue100, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.y)) * 0.16666667163372039794921875;
    float multiplyAddValue78 = (reinterpretedBits57 ? spvNMin(fma(productValue100 * productValue100, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.z)) * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue77, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue78, reinterpretedBits58)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue77 / productValue101, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits58 / productValue101, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue78 / productValue101, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0);
    uint reinterpretedBits59 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits59 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits59 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits53 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits52.x);
    float reinterpretedBits54 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits52.y);
    float reinterpretedBits55 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits52.z);
    fragmentColor1.w = (reinterpretedBits15 < intermediateValue23) ? fma(intermediateValue23, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits15, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue8 = vec3(productValue7, productValue6, productValue5);
    float scalarValue37 = rdDot3Precise(vectorValue8, vectorValue8);
    float inverseLengthValue20 = inversesqrt(scalarValue37);
    float productValue82 = inverseLengthValue20 * productValue7;
    float productValue83 = inverseLengthValue20 * productValue6;
    float productValue84 = inverseLengthValue20 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue84) + (abs(productValue83) + abs(productValue82)));
    float productValue85 = quotientValue5 * productValue82;
    float productValue86 = quotientValue5 * productValue83;
    bool conditionValue7 = productValue84 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue85 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue86))) : productValue85;
    fragmentColor2.y = conditionValue7 ? (((productValue86 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue85))) : productValue86;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue75 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue76 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits55, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits13.x)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.x), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits39.x)) / multiplyAddValue76, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits13.y)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.y), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits39.y)) / multiplyAddValue76, 0.5, 0.5);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits57 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits56 > 9.9999997473787516355514526367188e-05);
    float productValue100 = reinterpretedBits56 * reinterpretedBits56;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits58 = (reinterpretedBits57 ? spvNMin(productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.x)) * 0.16666667163372039794921875;
    float multiplyAddValue77 = (reinterpretedBits57 ? spvNMin(fma(fma(productValue100, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.y)) * 0.16666667163372039794921875;
    float multiplyAddValue78 = (reinterpretedBits57 ? spvNMin(fma(productValue100 * productValue100, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.z)) * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue77, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue78, reinterpretedBits58)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue77 / productValue101, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits58 / productValue101, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue78 / productValue101, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0);
    uint reinterpretedBits59 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits59 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits59 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue25, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits53 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits52.x);
    float reinterpretedBits54 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits52.y);
    float reinterpretedBits55 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits52.z);
    fragmentColor1.w = (reinterpretedBits23 < intermediateValue24) ? fma(intermediateValue24, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits23, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue6, productValue5, productValue4);
    float scalarValue29 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue29);
    float productValue55 = inverseLengthValue15 * productValue6;
    float productValue56 = inverseLengthValue15 * productValue5;
    float productValue57 = inverseLengthValue15 * productValue4;
    float quotientValue3 = 1.0 / (abs(productValue57) + (abs(productValue56) + abs(productValue55)));
    float productValue58 = quotientValue3 * productValue55;
    float productValue59 = quotientValue3 * productValue56;
    bool conditionValue5 = productValue57 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue58 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue59))) : productValue58;
    fragmentColor2.y = conditionValue5 ? (((productValue59 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue58))) : productValue59;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue75 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue76 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits55, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits13.x)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.x), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits39.x)) / multiplyAddValue76, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits13.y)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.y), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits39.y)) / multiplyAddValue76, 0.5, 0.5);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits57 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits56 > 9.9999997473787516355514526367188e-05);
    float productValue100 = reinterpretedBits56 * reinterpretedBits56;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits58 = (reinterpretedBits57 ? spvNMin(productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.x)) * 0.16666667163372039794921875;
    float multiplyAddValue77 = (reinterpretedBits57 ? spvNMin(fma(fma(productValue100, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.y)) * 0.16666667163372039794921875;
    float multiplyAddValue78 = (reinterpretedBits57 ? spvNMin(fma(productValue100 * productValue100, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.z)) * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue77, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue78, reinterpretedBits58)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue77 / productValue101, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits58 / productValue101, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue78 / productValue101, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0);
    uint reinterpretedBits59 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits59 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits59 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue26, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue25, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits53 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits52.x);
    float reinterpretedBits54 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits52.y);
    float reinterpretedBits55 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits52.z);
    fragmentColor1.w = (reinterpretedBits19 < intermediateValue27) ? fma(intermediateValue27, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits19, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue8 = vec3(productValue7, productValue6, productValue5);
    float scalarValue37 = rdDot3Precise(vectorValue8, vectorValue8);
    float inverseLengthValue20 = inversesqrt(scalarValue37);
    float productValue82 = inverseLengthValue20 * productValue7;
    float productValue83 = inverseLengthValue20 * productValue6;
    float productValue84 = inverseLengthValue20 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue84) + (abs(productValue83) + abs(productValue82)));
    float productValue85 = quotientValue5 * productValue82;
    float productValue86 = quotientValue5 * productValue83;
    bool conditionValue7 = productValue84 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue85 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue86))) : productValue85;
    fragmentColor2.y = conditionValue7 ? (((productValue86 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue85))) : productValue86;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue75 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue76 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits55, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits13.x)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.x), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits39.x)) / multiplyAddValue76, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits13.y)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.y), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits39.y)) / multiplyAddValue76, 0.5, 0.5);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits57 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits56 > 9.9999997473787516355514526367188e-05);
    float productValue100 = reinterpretedBits56 * reinterpretedBits56;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits58 = (reinterpretedBits57 ? spvNMin(productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.x)) * 0.16666667163372039794921875;
    float multiplyAddValue77 = (reinterpretedBits57 ? spvNMin(fma(fma(productValue100, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.y)) * 0.16666667163372039794921875;
    float multiplyAddValue78 = (reinterpretedBits57 ? spvNMin(fma(productValue100 * productValue100, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.z)) * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue77, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue78, reinterpretedBits58)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue77 / productValue101, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits58 / productValue101, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue78 / productValue101, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0);
    uint reinterpretedBits59 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits59 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits59 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue29, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue28, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits53 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits52.x);
    float reinterpretedBits54 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits52.y);
    float reinterpretedBits55 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits52.z);
    fragmentColor1.w = (reinterpretedBits21 < intermediateValue21) ? fma(intermediateValue21, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits21, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue6, productValue5, productValue4);
    float scalarValue29 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue29);
    float productValue55 = inverseLengthValue15 * productValue6;
    float productValue56 = inverseLengthValue15 * productValue5;
    float productValue57 = inverseLengthValue15 * productValue4;
    float quotientValue3 = 1.0 / (abs(productValue57) + (abs(productValue56) + abs(productValue55)));
    float productValue58 = quotientValue3 * productValue55;
    float productValue59 = quotientValue3 * productValue56;
    bool conditionValue5 = productValue57 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue58 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue59))) : productValue58;
    fragmentColor2.y = conditionValue5 ? (((productValue59 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue58))) : productValue59;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue75 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue76 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits55, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits13.x)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.x), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits39.x)) / multiplyAddValue76, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits13.y)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.y), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits39.y)) / multiplyAddValue76, 0.5, 0.5);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits57 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits56 > 9.9999997473787516355514526367188e-05);
    float productValue100 = reinterpretedBits56 * reinterpretedBits56;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits58 = (reinterpretedBits57 ? spvNMin(productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.x)) * 0.16666667163372039794921875;
    float multiplyAddValue77 = (reinterpretedBits57 ? spvNMin(fma(fma(productValue100, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.y)) * 0.16666667163372039794921875;
    float multiplyAddValue78 = (reinterpretedBits57 ? spvNMin(fma(productValue100 * productValue100, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.z)) * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue77, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue78, reinterpretedBits58)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue77 / productValue101, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits58 / productValue101, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue78 / productValue101, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0);
    uint reinterpretedBits59 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits59 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits59 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits53 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits52.x);
    float reinterpretedBits54 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits52.y);
    float reinterpretedBits55 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits52.z);
    fragmentColor1.w = (reinterpretedBits19 < intermediateValue24) ? fma(intermediateValue24, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits19, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue8 = vec3(productValue7, productValue6, productValue5);
    float scalarValue37 = rdDot3Precise(vectorValue8, vectorValue8);
    float inverseLengthValue20 = inversesqrt(scalarValue37);
    float productValue82 = inverseLengthValue20 * productValue7;
    float productValue83 = inverseLengthValue20 * productValue6;
    float productValue84 = inverseLengthValue20 * productValue5;
    float quotientValue5 = 1.0 / (abs(productValue84) + (abs(productValue83) + abs(productValue82)));
    float productValue85 = quotientValue5 * productValue82;
    float productValue86 = quotientValue5 * productValue83;
    bool conditionValue7 = productValue84 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue85 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue86))) : productValue85;
    fragmentColor2.y = conditionValue7 ? (((productValue86 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue85))) : productValue86;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue75 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue76 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits55, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits13.x)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.x), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits39.x)) / multiplyAddValue76, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits13.y)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.y), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits39.y)) / multiplyAddValue76, 0.5, 0.5);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits57 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits56 > 9.9999997473787516355514526367188e-05);
    float productValue100 = reinterpretedBits56 * reinterpretedBits56;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits58 = (reinterpretedBits57 ? spvNMin(productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.x)) * 0.16666667163372039794921875;
    float multiplyAddValue77 = (reinterpretedBits57 ? spvNMin(fma(fma(productValue100, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.y)) * 0.16666667163372039794921875;
    float multiplyAddValue78 = (reinterpretedBits57 ? spvNMin(fma(productValue100 * productValue100, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.z)) * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue77, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue78, reinterpretedBits58)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue77 / productValue101, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits58 / productValue101, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue78 / productValue101, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0);
    uint reinterpretedBits59 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits59 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits59 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue26, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue25, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits53 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits52.x);
    float reinterpretedBits54 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits52.y);
    float reinterpretedBits55 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits52.z);
    fragmentColor1.w = (reinterpretedBits22 < intermediateValue25) ? fma(intermediateValue25, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits22, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue18 = vec3(productValue9, productValue8, productValue7);
    float scalarValue60 = rdDot3Precise(vectorValue18, vectorValue18);
    float inverseLengthValue39 = inversesqrt(scalarValue60);
    float productValue196 = inverseLengthValue39 * productValue9;
    float productValue197 = inverseLengthValue39 * productValue8;
    float productValue198 = inverseLengthValue39 * productValue7;
    float quotientValue11 = 1.0 / (abs(productValue198) + (abs(productValue197) + abs(productValue196)));
    float productValue199 = quotientValue11 * productValue196;
    float productValue200 = quotientValue11 * productValue197;
    bool conditionValue13 = productValue198 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue13 ? (((productValue199 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue200))) : productValue199;
    fragmentColor2.y = conditionValue13 ? (((productValue200 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue199))) : productValue200;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue75 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue76 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits55, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits13.x)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.x), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits39.x)) / multiplyAddValue76, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits13.y)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.y), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits39.y)) / multiplyAddValue76, 0.5, 0.5);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits57 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits56 > 9.9999997473787516355514526367188e-05);
    float productValue100 = reinterpretedBits56 * reinterpretedBits56;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits58 = (reinterpretedBits57 ? spvNMin(productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.x)) * 0.16666667163372039794921875;
    float multiplyAddValue77 = (reinterpretedBits57 ? spvNMin(fma(fma(productValue100, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.y)) * 0.16666667163372039794921875;
    float multiplyAddValue78 = (reinterpretedBits57 ? spvNMin(fma(productValue100 * productValue100, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.z)) * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue77, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue78, reinterpretedBits58)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue77 / productValue101, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits58 / productValue101, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue78 / productValue101, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0);
    uint reinterpretedBits59 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits59 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits59 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue27, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue26, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits53 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits52.x);
    float reinterpretedBits54 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits52.y);
    float reinterpretedBits55 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits52.z);
    fragmentColor1.w = (reinterpretedBits20 < intermediateValue28) ? fma(intermediateValue28, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits20, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue20 = vec3(productValue10, productValue9, productValue8);
    float scalarValue62 = rdDot3Precise(vectorValue20, vectorValue20);
    float inverseLengthValue44 = inversesqrt(scalarValue62);
    float productValue214 = inverseLengthValue44 * productValue10;
    float productValue215 = inverseLengthValue44 * productValue9;
    float productValue216 = inverseLengthValue44 * productValue8;
    float quotientValue13 = 1.0 / (abs(productValue216) + (abs(productValue215) + abs(productValue214)));
    float productValue217 = quotientValue13 * productValue214;
    float productValue218 = quotientValue13 * productValue215;
    bool conditionValue15 = productValue216 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue15 ? (((productValue217 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue218))) : productValue217;
    fragmentColor2.y = conditionValue15 ? (((productValue218 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue217))) : productValue218;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits29 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue75 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits39 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue76 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits55, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits13.x)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.x), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits39.x)) / multiplyAddValue76, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits29.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits13.y)) / multiplyAddValue75, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits55, fma(uintBitsToFloat(reinterpretedBits33.y), reinterpretedBits53, reinterpretedBits54 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits39.y)) / multiplyAddValue76, 0.5, 0.5);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits57 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits56 > 9.9999997473787516355514526367188e-05);
    float productValue100 = reinterpretedBits56 * reinterpretedBits56;
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits58 = (reinterpretedBits57 ? spvNMin(productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.x)) * 0.16666667163372039794921875;
    float multiplyAddValue77 = (reinterpretedBits57 ? spvNMin(fma(fma(productValue100, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.y)) * 0.16666667163372039794921875;
    float multiplyAddValue78 = (reinterpretedBits57 ? spvNMin(fma(productValue100 * productValue100, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue100, 1.0) : uintBitsToFloat(reinterpretedBits25.z)) * 0.16666667163372039794921875;
    float productValue101 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue77, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue78, reinterpretedBits58)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue77 / productValue101, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits58 / productValue101, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue78 / productValue101, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue101, 0.0, 1.0) * 255.0);
    uint reinterpretedBits59 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits59 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits59 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue30, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue29, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue44 = intermediateValue13 * 0.16666667163372039794921875;
    float productValue45 = productValue17 * 0.16666667163372039794921875;
    float productValue46 = productValue18 * 0.16666667163372039794921875;
    float productValue47 = ceil(spvNClamp(spvNMax(spvNMax(productValue44, productValue46), spvNMax(productValue45, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue7, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue44 / productValue47, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue45 / productValue47, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue46 / productValue47, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue47, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue26) * fragmentVectorConstants1.packedValues[13u].w) + productValue26;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue27) * fragmentVectorConstants1.packedValues[13u].w) + productValue27;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue28) * fragmentVectorConstants1.packedValues[13u].w) + productValue28;
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue8 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue41 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue42))) : productValue41;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue41)) * ((productValue42 < 0.0) ? (-1.0) : 1.0)) : productValue42;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue77 = intermediateValue16 * 0.16666667163372039794921875;
    float productValue46 = productValue18 * 0.16666667163372039794921875;
    float productValue78 = productValue19 * 0.16666667163372039794921875;
    float productValue79 = ceil(spvNClamp(spvNMax(spvNMax(productValue77, productValue78), spvNMax(productValue46, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue10, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue77 / productValue79, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue46 / productValue79, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue78 / productValue79, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue79, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue69) * fragmentVectorConstants1.packedValues[13u].w) + productValue69;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue70) * fragmentVectorConstants1.packedValues[13u].w) + productValue70;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue71) * fragmentVectorConstants1.packedValues[13u].w) + productValue71;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue11 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue75 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue76))) : productValue75;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue75)) * ((productValue76 < 0.0) ? (-1.0) : 1.0)) : productValue76;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue77 = intermediateValue16 * 0.16666667163372039794921875;
    float productValue45 = productValue17 * 0.16666667163372039794921875;
    float productValue46 = productValue18 * 0.16666667163372039794921875;
    float productValue96 = ceil(spvNClamp(spvNMax(spvNMax(productValue77, productValue46), spvNMax(productValue45, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue10, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue77 / productValue96, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue45 / productValue96, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue46 / productValue96, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue96, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue90) * fragmentVectorConstants1.packedValues[14u].w) + productValue90;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue91) * fragmentVectorConstants1.packedValues[14u].w) + productValue91;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue92) * fragmentVectorConstants1.packedValues[14u].w) + productValue92;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue11 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue75 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue76))) : productValue75;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue75)) * ((productValue76 < 0.0) ? (-1.0) : 1.0)) : productValue76;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue62)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue62)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue113 = intermediateValue19 * 0.16666667163372039794921875;
    float productValue46 = productValue18 * 0.16666667163372039794921875;
    float productValue78 = productValue19 * 0.16666667163372039794921875;
    float productValue114 = ceil(spvNClamp(spvNMax(spvNMax(productValue113, productValue78), spvNMax(productValue46, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue113 / productValue114, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue46 / productValue114, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue78 / productValue114, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue114, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue105) * fragmentVectorConstants1.packedValues[14u].w) + productValue105;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue106) * fragmentVectorConstants1.packedValues[14u].w) + productValue106;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue107) * fragmentVectorConstants1.packedValues[14u].w) + productValue107;
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue14 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue10 ? (((productValue111 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue112))) : productValue111;
    fragmentColor2.y = conditionValue10 ? ((1.0 - abs(productValue111)) * ((productValue112 < 0.0) ? (-1.0) : 1.0)) : productValue112;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue62)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue62)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue44 = intermediateValue13 * 0.16666667163372039794921875;
    float productValue126 = productValue21 * 0.16666667163372039794921875;
    float productValue127 = productValue22 * 0.16666667163372039794921875;
    float productValue128 = ceil(spvNClamp(spvNMax(spvNMax(productValue44, productValue127), spvNMax(productValue126, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue7, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue44 / productValue128, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue126 / productValue128, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue127 / productValue128, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue128, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue123) * fragmentVectorConstants1.packedValues[14u].w) + productValue123;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue124) * fragmentVectorConstants1.packedValues[14u].w) + productValue124;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue125) * fragmentVectorConstants1.packedValues[14u].w) + productValue125;
    fragmentColor1.w = (intermediateValue5 > intermediateValue8) ? ((intermediateValue5 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue8 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue41 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue42))) : productValue41;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue41)) * ((productValue42 < 0.0) ? (-1.0) : 1.0)) : productValue42;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue62)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue62)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue77 = intermediateValue16 * 0.16666667163372039794921875;
    float productValue127 = productValue22 * 0.16666667163372039794921875;
    float productValue142 = productValue23 * 0.16666667163372039794921875;
    float productValue143 = ceil(spvNClamp(spvNMax(spvNMax(productValue77, productValue142), spvNMax(productValue127, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue10, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue77 / productValue143, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue127 / productValue143, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue142 / productValue143, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue143, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue139) * fragmentVectorConstants1.packedValues[14u].w) + productValue139;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue140) * fragmentVectorConstants1.packedValues[14u].w) + productValue140;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue141) * fragmentVectorConstants1.packedValues[14u].w) + productValue141;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue11 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue75 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue76))) : productValue75;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue75)) * ((productValue76 < 0.0) ? (-1.0) : 1.0)) : productValue76;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue62)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue62)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue77 = intermediateValue16 * 0.16666667163372039794921875;
    float productValue126 = productValue21 * 0.16666667163372039794921875;
    float productValue127 = productValue22 * 0.16666667163372039794921875;
    float productValue147 = ceil(spvNClamp(spvNMax(spvNMax(productValue77, productValue127), spvNMax(productValue126, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue10, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue77 / productValue147, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue126 / productValue147, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue127 / productValue147, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue147, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue144) * fragmentVectorConstants1.packedValues[14u].w) + productValue144;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue145) * fragmentVectorConstants1.packedValues[14u].w) + productValue145;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue146) * fragmentVectorConstants1.packedValues[14u].w) + productValue146;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue11 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue75 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue76))) : productValue75;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue75)) * ((productValue76 < 0.0) ? (-1.0) : 1.0)) : productValue76;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue62)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue62)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue113 = intermediateValue19 * 0.16666667163372039794921875;
    float productValue127 = productValue22 * 0.16666667163372039794921875;
    float productValue142 = productValue23 * 0.16666667163372039794921875;
    float productValue151 = ceil(spvNClamp(spvNMax(spvNMax(productValue113, productValue142), spvNMax(productValue127, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue12, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue113 / productValue151, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue127 / productValue151, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue142 / productValue151, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue151, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue148) * fragmentVectorConstants1.packedValues[14u].w) + productValue148;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue149) * fragmentVectorConstants1.packedValues[14u].w) + productValue149;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue150) * fragmentVectorConstants1.packedValues[14u].w) + productValue150;
    fragmentColor1.w = (intermediateValue11 > intermediateValue14) ? ((intermediateValue11 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue14 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue10 ? (((productValue111 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue112))) : productValue111;
    fragmentColor2.y = conditionValue10 ? ((1.0 - abs(productValue111)) * ((productValue112 < 0.0) ? (-1.0) : 1.0)) : productValue112;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue62)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue62)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue169 = intermediateValue14 * 0.16666667163372039794921875;
    float productValue127 = productValue22 * 0.16666667163372039794921875;
    float productValue142 = productValue23 * 0.16666667163372039794921875;
    float productValue170 = ceil(spvNClamp(spvNMax(spvNMax(productValue169, productValue142), spvNMax(productValue127, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue7, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue169 / productValue170, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue127 / productValue170, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue142 / productValue170, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue170, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue161) * fragmentVectorConstants1.packedValues[14u].w) + productValue161;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue162) * fragmentVectorConstants1.packedValues[14u].w) + productValue162;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue163) * fragmentVectorConstants1.packedValues[14u].w) + productValue163;
    fragmentColor1.w = (intermediateValue6 > intermediateValue9) ? ((intermediateValue6 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue9 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue11 ? (((productValue167 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue168))) : productValue167;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue167)) * ((productValue168 < 0.0) ? (-1.0) : 1.0)) : productValue168;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue62)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue62)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_OFF && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue188 = intermediateValue17 * 0.16666667163372039794921875;
    float productValue142 = productValue23 * 0.16666667163372039794921875;
    float productValue189 = productValue24 * 0.16666667163372039794921875;
    float productValue190 = ceil(spvNClamp(spvNMax(spvNMax(productValue188, productValue189), spvNMax(productValue142, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue11, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue10, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue188 / productValue190, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue142 / productValue190, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue189 / productValue190, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue190, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue180) * fragmentVectorConstants1.packedValues[14u].w) + productValue180;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue181) * fragmentVectorConstants1.packedValues[14u].w) + productValue181;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue182) * fragmentVectorConstants1.packedValues[14u].w) + productValue182;
    fragmentColor1.w = (intermediateValue9 > intermediateValue12) ? ((intermediateValue9 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue12 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue12 ? (((productValue186 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue187))) : productValue186;
    fragmentColor2.y = conditionValue12 ? ((1.0 - abs(productValue186)) * ((productValue187 < 0.0) ? (-1.0) : 1.0)) : productValue187;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue62)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue62)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue188 = intermediateValue17 * 0.16666667163372039794921875;
    float productValue127 = productValue22 * 0.16666667163372039794921875;
    float productValue142 = productValue23 * 0.16666667163372039794921875;
    float productValue192 = ceil(spvNClamp(spvNMax(spvNMax(productValue188, productValue142), spvNMax(productValue127, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue11, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue10, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue188 / productValue192, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue127 / productValue192, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue142 / productValue192, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue192, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue148) * fragmentVectorConstants1.packedValues[14u].w) + productValue148;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue149) * fragmentVectorConstants1.packedValues[14u].w) + productValue149;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue150) * fragmentVectorConstants1.packedValues[14u].w) + productValue150;
    fragmentColor1.w = (intermediateValue9 > intermediateValue12) ? ((intermediateValue9 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue12 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue12 ? (((productValue186 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue187))) : productValue186;
    fragmentColor2.y = conditionValue12 ? ((1.0 - abs(productValue186)) * ((productValue187 < 0.0) ? (-1.0) : 1.0)) : productValue187;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue62)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue62)) * 0.5;
#elif (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_COLOR_SECOND_TEXTURE == RD_ON && RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue209 = intermediateValue20 * 0.16666667163372039794921875;
    float productValue142 = productValue23 * 0.16666667163372039794921875;
    float productValue189 = productValue24 * 0.16666667163372039794921875;
    float productValue210 = ceil(spvNClamp(spvNMax(spvNMax(productValue209, productValue189), spvNMax(productValue142, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue14, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue13, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue209 / productValue210, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue142 / productValue210, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue189 / productValue210, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue210, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue201) * fragmentVectorConstants1.packedValues[14u].w) + productValue201;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue202) * fragmentVectorConstants1.packedValues[14u].w) + productValue202;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue203) * fragmentVectorConstants1.packedValues[14u].w) + productValue203;
    fragmentColor1.w = (intermediateValue12 > intermediateValue15) ? ((intermediateValue12 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue15 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue14 ? (((productValue207 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue208))) : productValue207;
    fragmentColor2.y = conditionValue14 ? ((1.0 - abs(productValue207)) * ((productValue208 < 0.0) ? (-1.0) : 1.0)) : productValue208;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue62)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue61) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue62)) * 0.5;
#endif
    discardIfRequested();
}
