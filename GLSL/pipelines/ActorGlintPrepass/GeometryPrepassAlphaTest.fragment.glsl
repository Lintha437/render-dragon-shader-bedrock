#version 460
#extension GL_GOOGLE_include_directive : require
// ActorGlintPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 17
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

#include "../../include/materials/ActorGlintPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float reinterpretedBits1 = sampledTextureValue9.x * uintBitsToFloat(reinterpretedBits.x);
    float reinterpretedBits2 = sampledTextureValue9.y * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits3 = sampledTextureValue9.z * uintBitsToFloat(reinterpretedBits.z);
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits8 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits4), -(inverseLengthValue8 * reinterpretedBits5), -(inverseLengthValue8 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits7.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits7.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits7.z)));
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits10 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[85u])) - reinterpretedBits9)) * (reinterpretedBits8 - reinterpretedBits9), 0.0, 1.0);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[24u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[86u]));
    float multiplyAddValue5 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits11.x)) / reinterpretedBits12) * reinterpretedBits12;
    float multiplyAddValue6 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits11.y)) / reinterpretedBits12) * reinterpretedBits12;
    float productValue40 = floor(multiplyAddValue6 * 0.25);
    float productValue41 = floor(multiplyAddValue6 * 0.5);
    float scalarValue9 = floor(multiplyAddValue6);
    if (((sampledTextureValue9.w * uintBitsToFloat(reinterpretedBits.w)) < 0.5) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[100u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue5 * 0.25), 0.5, (productValue40 * productValue40) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue5 * 0.5), 0.5, (productValue41 * productValue41) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue5), 0.5, (scalarValue9 * scalarValue9) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits10 * reinterpretedBits10) * fma(reinterpretedBits10, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue21.x;
    float scalarValue28 = sampledTextureValue21.y;
    float scalarValue29 = sampledTextureValue21.z;
    float scalarValue30 = sampledTextureValue21.w;
    bool productValue65 = ((1.0 - scalarValue30) * (scalarValue29 + (scalarValue28 + scalarValue27))) > 0.0;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float multiplyAddValue39 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue9.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue40 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue9.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float multiplyAddValue41 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue9.z, -scalarValue29) + scalarValue29) : scalarValue29;
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits8 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits4), -(inverseLengthValue8 * reinterpretedBits5), -(inverseLengthValue8 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits7.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits7.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits7.z)));
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits10 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[85u])) - reinterpretedBits9)) * (reinterpretedBits8 - reinterpretedBits9), 0.0, 1.0);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[24u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[86u]));
    float multiplyAddValue5 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits11.x)) / reinterpretedBits12) * reinterpretedBits12;
    float multiplyAddValue6 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits11.y)) / reinterpretedBits12) * reinterpretedBits12;
    float productValue40 = floor(multiplyAddValue6 * 0.25);
    float productValue41 = floor(multiplyAddValue6 * 0.5);
    float scalarValue9 = floor(multiplyAddValue6);
    if (((productValue65 ? (fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue9.w, -scalarValue30) + scalarValue30) : scalarValue30) < 0.5) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[100u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue5 * 0.25), 0.5, (productValue40 * productValue40) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue5 * 0.5), 0.5, (productValue41 * productValue41) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue5), 0.5, (scalarValue9 * scalarValue9) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits10 * reinterpretedBits10) * fma(reinterpretedBits10, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits44 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float reinterpretedBits45 = sampledTextureValue9.x * uintBitsToFloat(reinterpretedBits44.x);
    float reinterpretedBits46 = sampledTextureValue9.y * uintBitsToFloat(reinterpretedBits44.y);
    float reinterpretedBits47 = sampledTextureValue9.z * uintBitsToFloat(reinterpretedBits44.z);
    float reinterpretedBits48 = sampledTextureValue9.w * uintBitsToFloat(reinterpretedBits44.w);
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits49 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits4), -(inverseLengthValue8 * reinterpretedBits5), -(inverseLengthValue8 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits32.z)));
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits51 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits50)) * (reinterpretedBits49 - reinterpretedBits50), 0.0, 1.0);
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits53 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue47 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits52.x)) / reinterpretedBits53) * reinterpretedBits53;
    float multiplyAddValue48 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits52.y)) / reinterpretedBits53) * reinterpretedBits53;
    float productValue87 = floor(multiplyAddValue47 * 0.25);
    float productValue88 = floor(multiplyAddValue48 * 0.25);
    float productValue89 = floor(multiplyAddValue47 * 0.5);
    float productValue90 = floor(multiplyAddValue48 * 0.5);
    float scalarValue35 = floor(multiplyAddValue48);
    if ((reinterpretedBits48 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(productValue87, 0.5, (productValue88 * productValue88) * 0.75)), 0.25, fract(fma(productValue89, 0.5, (productValue90 * productValue90) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue47), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits51 * reinterpretedBits51) * fma(reinterpretedBits51, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue21.x;
    float scalarValue28 = sampledTextureValue21.y;
    float scalarValue29 = sampledTextureValue21.z;
    float scalarValue30 = sampledTextureValue21.w;
    bool productValue65 = ((1.0 - scalarValue30) * (scalarValue29 + (scalarValue28 + scalarValue27))) > 0.0;
    uvec4 reinterpretedBits44 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue68 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits44.x), sampledTextureValue9.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue69 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits44.y), sampledTextureValue9.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float multiplyAddValue70 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits44.z), sampledTextureValue9.z, -scalarValue29) + scalarValue29) : scalarValue29;
    float multiplyAddValue71 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits44.w), sampledTextureValue9.w, -scalarValue30) + scalarValue30) : scalarValue30;
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits49 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits4), -(inverseLengthValue8 * reinterpretedBits5), -(inverseLengthValue8 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits32.z)));
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits51 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits50)) * (reinterpretedBits49 - reinterpretedBits50), 0.0, 1.0);
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits53 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue47 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits52.x)) / reinterpretedBits53) * reinterpretedBits53;
    float multiplyAddValue48 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits52.y)) / reinterpretedBits53) * reinterpretedBits53;
    float productValue87 = floor(multiplyAddValue47 * 0.25);
    float productValue88 = floor(multiplyAddValue48 * 0.25);
    float productValue89 = floor(multiplyAddValue47 * 0.5);
    float productValue90 = floor(multiplyAddValue48 * 0.5);
    float scalarValue35 = floor(multiplyAddValue48);
    if ((multiplyAddValue71 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(productValue87, 0.5, (productValue88 * productValue88) * 0.75)), 0.25, fract(fma(productValue89, 0.5, (productValue90 * productValue90) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue47), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits51 * reinterpretedBits51) * fma(reinterpretedBits51, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits44 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float reinterpretedBits45 = sampledTextureValue9.x * uintBitsToFloat(reinterpretedBits44.x);
    float reinterpretedBits46 = sampledTextureValue9.y * uintBitsToFloat(reinterpretedBits44.y);
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits49 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits4), -(inverseLengthValue8 * reinterpretedBits5), -(inverseLengthValue8 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits32.z)));
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits51 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits50)) * (reinterpretedBits49 - reinterpretedBits50), 0.0, 1.0);
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits53 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue47 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits52.x)) / reinterpretedBits53) * reinterpretedBits53;
    float multiplyAddValue48 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits52.y)) / reinterpretedBits53) * reinterpretedBits53;
    float productValue88 = floor(multiplyAddValue48 * 0.25);
    float productValue90 = floor(multiplyAddValue48 * 0.5);
    float scalarValue35 = floor(multiplyAddValue48);
    if (((sampledTextureValue9.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[127u]))) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue47 * 0.25), 0.5, (productValue88 * productValue88) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue47 * 0.5), 0.5, (productValue90 * productValue90) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue47), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits51 * reinterpretedBits51) * fma(reinterpretedBits51, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue9 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue21 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue21.x;
    float scalarValue28 = sampledTextureValue21.y;
    float scalarValue30 = sampledTextureValue21.w;
    bool productValue139 = ((sampledTextureValue21.z + (scalarValue28 + scalarValue27)) * (1.0 - scalarValue30)) > 0.0;
    uvec4 reinterpretedBits44 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue87 = productValue139 ? (fma(uintBitsToFloat(reinterpretedBits44.x), sampledTextureValue9.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue88 = productValue139 ? (fma(uintBitsToFloat(reinterpretedBits44.y), sampledTextureValue9.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits49 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits4), -(inverseLengthValue8 * reinterpretedBits5), -(inverseLengthValue8 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits32.z)));
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits51 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits50)) * (reinterpretedBits49 - reinterpretedBits50), 0.0, 1.0);
    uvec4 reinterpretedBits52 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits53 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue47 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits52.x)) / reinterpretedBits53) * reinterpretedBits53;
    float multiplyAddValue48 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits52.y)) / reinterpretedBits53) * reinterpretedBits53;
    float productValue88 = floor(multiplyAddValue48 * 0.25);
    float productValue90 = floor(multiplyAddValue48 * 0.5);
    float scalarValue35 = floor(multiplyAddValue48);
    if (((productValue139 ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[127u])), sampledTextureValue9.w, -scalarValue30) + scalarValue30) : scalarValue30) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue47 * 0.25), 0.5, (productValue88 * productValue88) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue47 * 0.5), 0.5, (productValue90 * productValue90) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue47), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits51 * reinterpretedBits51) * fma(reinterpretedBits51, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue20 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue20.x;
    float scalarValue24 = sampledTextureValue20.y;
    float scalarValue25 = sampledTextureValue20.z;
    float scalarValue26 = sampledTextureValue20.w;
    float productValue53 = float((((scalarValue23 + scalarValue24) + scalarValue25) * (1.0 - scalarValue26)) > 0.0);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue71 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[31u].x;
    float productValue72 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[31u].y;
    float productValue73 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[31u].z;
    float productValue74 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[31u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue20 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue20.x;
    float scalarValue24 = sampledTextureValue20.y;
    float scalarValue25 = sampledTextureValue20.z;
    float scalarValue26 = sampledTextureValue20.w;
    float productValue53 = float((((scalarValue23 + scalarValue24) + scalarValue25) * (1.0 - scalarValue26)) > 0.0);
    float productValue98 = (productValue53 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[31u].x) - scalarValue23)) + scalarValue23;
    float productValue99 = (productValue53 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[31u].y) - scalarValue24)) + scalarValue24;
    float productValue100 = (productValue53 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[31u].z) - scalarValue25)) + scalarValue25;
    float productValue101 = (productValue53 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[31u].w) - scalarValue26)) + scalarValue26;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue71 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[31u].x;
    float productValue72 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[31u].y;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue20 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue20.x;
    float scalarValue24 = sampledTextureValue20.y;
    float scalarValue26 = sampledTextureValue20.w;
    float productValue128 = float((((scalarValue23 + scalarValue24) + sampledTextureValue20.z) * (1.0 - scalarValue26)) > 0.0);
    float productValue129 = (productValue128 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[31u].x) - scalarValue23)) + scalarValue23;
    float productValue130 = (productValue128 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[31u].y) - scalarValue24)) + scalarValue24;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#endif
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    float reinterpretedBits13 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float multiplyAddValue7 = fma(reinterpretedBits13, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue8 = fma(reinterpretedBits13, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue9 = fma(reinterpretedBits13, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[27u]);
    float reinterpretedBits17 = uintBitsToFloat(reinterpretedBits16.x);
    float reinterpretedBits18 = uintBitsToFloat(reinterpretedBits16.y);
    float reinterpretedBits21 = uintBitsToFloat(reinterpretedBits16.z);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[33u]);
    float multiplyAddValue10 = fma(sampledTextureValue10.x, reinterpretedBits17, sampledTextureValue11.x * reinterpretedBits17) * uintBitsToFloat(reinterpretedBits23.x);
    float multiplyAddValue11 = fma(sampledTextureValue10.y, reinterpretedBits18, sampledTextureValue11.y * reinterpretedBits18) * uintBitsToFloat(reinterpretedBits23.y);
    float multiplyAddValue22 = fma(sampledTextureValue10.z, reinterpretedBits21, sampledTextureValue11.z * reinterpretedBits21) * uintBitsToFloat(reinterpretedBits23.z);
    fragmentColor1.x = fma(multiplyAddValue10, multiplyAddValue10, fma(reinterpretedBits15, fma(-reinterpretedBits1, multiplyAddValue7, uintBitsToFloat(reinterpretedBits14.x)), reinterpretedBits1 * multiplyAddValue7));
    fragmentColor1.y = fma(multiplyAddValue11, multiplyAddValue11, fma(reinterpretedBits15, fma(-reinterpretedBits2, multiplyAddValue8, uintBitsToFloat(reinterpretedBits14.y)), reinterpretedBits2 * multiplyAddValue8));
    fragmentColor1.z = fma(multiplyAddValue22, multiplyAddValue22, fma(reinterpretedBits15, fma(-reinterpretedBits3, multiplyAddValue9, uintBitsToFloat(reinterpretedBits14.z)), reinterpretedBits3 * multiplyAddValue9));
    uint reinterpretedBits25 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[16u]))));
    bool comparisonValue7 = (reinterpretedBits25 & 16u) == 16u;
    bool comparisonValue8 = (reinterpretedBits25 & 4u) == 4u;
    bool comparisonValue9 = (reinterpretedBits25 & 8u) == 8u;
    float reinterpretedBits22;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if ((reinterpretedBits25 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits22 = ((reinterpretedBits25 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue16 = sampledTextureValue12.x;
        intermediateValue17 = sampledTextureValue12.z;
        intermediateValue18 = sampledTextureValue12.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    float reinterpretedBits13 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float multiplyAddValue7 = fma(reinterpretedBits13, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue8 = fma(reinterpretedBits13, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue9 = fma(reinterpretedBits13, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[27u]);
    float reinterpretedBits17 = uintBitsToFloat(reinterpretedBits16.x);
    float reinterpretedBits18 = uintBitsToFloat(reinterpretedBits16.y);
    float reinterpretedBits21 = uintBitsToFloat(reinterpretedBits16.z);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[33u]);
    float multiplyAddValue10 = fma(sampledTextureValue10.x, reinterpretedBits17, sampledTextureValue11.x * reinterpretedBits17) * uintBitsToFloat(reinterpretedBits23.x);
    float multiplyAddValue11 = fma(sampledTextureValue10.y, reinterpretedBits18, sampledTextureValue11.y * reinterpretedBits18) * uintBitsToFloat(reinterpretedBits23.y);
    float multiplyAddValue22 = fma(sampledTextureValue10.z, reinterpretedBits21, sampledTextureValue11.z * reinterpretedBits21) * uintBitsToFloat(reinterpretedBits23.z);
    fragmentColor1.x = fma(multiplyAddValue10, multiplyAddValue10, fma(reinterpretedBits15, fma(-multiplyAddValue39, multiplyAddValue7, uintBitsToFloat(reinterpretedBits14.x)), multiplyAddValue39 * multiplyAddValue7));
    fragmentColor1.y = fma(multiplyAddValue11, multiplyAddValue11, fma(reinterpretedBits15, fma(-multiplyAddValue40, multiplyAddValue8, uintBitsToFloat(reinterpretedBits14.y)), multiplyAddValue40 * multiplyAddValue8));
    fragmentColor1.z = fma(multiplyAddValue22, multiplyAddValue22, fma(reinterpretedBits15, fma(-multiplyAddValue41, multiplyAddValue9, uintBitsToFloat(reinterpretedBits14.z)), multiplyAddValue41 * multiplyAddValue9));
    uint reinterpretedBits25 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[16u]))));
    bool comparisonValue7 = (reinterpretedBits25 & 16u) == 16u;
    bool comparisonValue8 = (reinterpretedBits25 & 4u) == 4u;
    bool comparisonValue9 = (reinterpretedBits25 & 8u) == 8u;
    float reinterpretedBits19;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((reinterpretedBits25 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits19 = ((reinterpretedBits25 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue20 = sampledTextureValue12.x;
        intermediateValue21 = sampledTextureValue12.z;
        intermediateValue22 = sampledTextureValue12.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits54 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue49 = fma(reinterpretedBits48, fma(reinterpretedBits45, uintBitsToFloat(reinterpretedBits54.x), -reinterpretedBits45), reinterpretedBits45);
    float multiplyAddValue50 = fma(reinterpretedBits48, fma(reinterpretedBits46, uintBitsToFloat(reinterpretedBits54.y), -reinterpretedBits46), reinterpretedBits46);
    float multiplyAddValue51 = fma(reinterpretedBits48, fma(reinterpretedBits47, uintBitsToFloat(reinterpretedBits54.z), -reinterpretedBits47), reinterpretedBits47);
    float reinterpretedBits55 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue52 = fma(reinterpretedBits55, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue53 = fma(reinterpretedBits55, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue54 = fma(reinterpretedBits55, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits.x);
    float reinterpretedBits58 = uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits59 = uintBitsToFloat(reinterpretedBits.z);
    uvec4 reinterpretedBits60 = floatBitsToUint(fragmentVectorConstants1.packedValues[35u]);
    float multiplyAddValue55 = fma(sampledTextureValue10.x, reinterpretedBits57, sampledTextureValue11.x * reinterpretedBits57) * uintBitsToFloat(reinterpretedBits60.x);
    float multiplyAddValue56 = fma(sampledTextureValue10.y, reinterpretedBits58, sampledTextureValue11.y * reinterpretedBits58) * uintBitsToFloat(reinterpretedBits60.y);
    float multiplyAddValue57 = fma(sampledTextureValue10.z, reinterpretedBits59, sampledTextureValue11.z * reinterpretedBits59) * uintBitsToFloat(reinterpretedBits60.z);
    fragmentColor1.x = fma(multiplyAddValue55, multiplyAddValue55, fma(reinterpretedBits56, fma(-multiplyAddValue49, multiplyAddValue52, uintBitsToFloat(reinterpretedBits36.x)), multiplyAddValue49 * multiplyAddValue52));
    fragmentColor1.y = fma(multiplyAddValue56, multiplyAddValue56, fma(reinterpretedBits56, fma(-multiplyAddValue50, multiplyAddValue53, uintBitsToFloat(reinterpretedBits36.y)), multiplyAddValue50 * multiplyAddValue53));
    fragmentColor1.z = fma(multiplyAddValue57, multiplyAddValue57, fma(reinterpretedBits56, fma(-multiplyAddValue51, multiplyAddValue54, uintBitsToFloat(reinterpretedBits36.z)), multiplyAddValue51 * multiplyAddValue54));
    uint reinterpretedBits61 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits61 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits61 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits61 & 8u) == 8u;
    float reinterpretedBits24;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if ((reinterpretedBits61 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits24 = ((reinterpretedBits61 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue16 = sampledTextureValue12.x;
        intermediateValue17 = sampledTextureValue12.z;
        intermediateValue18 = sampledTextureValue12.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits54 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue72 = fma(multiplyAddValue71, fma(multiplyAddValue68, uintBitsToFloat(reinterpretedBits54.x), -multiplyAddValue68), multiplyAddValue68);
    float multiplyAddValue73 = fma(multiplyAddValue71, fma(multiplyAddValue69, uintBitsToFloat(reinterpretedBits54.y), -multiplyAddValue69), multiplyAddValue69);
    float multiplyAddValue74 = fma(multiplyAddValue71, fma(multiplyAddValue70, uintBitsToFloat(reinterpretedBits54.z), -multiplyAddValue70), multiplyAddValue70);
    float reinterpretedBits55 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue52 = fma(reinterpretedBits55, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue53 = fma(reinterpretedBits55, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue54 = fma(reinterpretedBits55, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits.x);
    float reinterpretedBits58 = uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits59 = uintBitsToFloat(reinterpretedBits.z);
    uvec4 reinterpretedBits60 = floatBitsToUint(fragmentVectorConstants1.packedValues[35u]);
    float multiplyAddValue55 = fma(sampledTextureValue10.x, reinterpretedBits57, sampledTextureValue11.x * reinterpretedBits57) * uintBitsToFloat(reinterpretedBits60.x);
    float multiplyAddValue56 = fma(sampledTextureValue10.y, reinterpretedBits58, sampledTextureValue11.y * reinterpretedBits58) * uintBitsToFloat(reinterpretedBits60.y);
    float multiplyAddValue57 = fma(sampledTextureValue10.z, reinterpretedBits59, sampledTextureValue11.z * reinterpretedBits59) * uintBitsToFloat(reinterpretedBits60.z);
    fragmentColor1.x = fma(multiplyAddValue55, multiplyAddValue55, fma(reinterpretedBits56, fma(-multiplyAddValue72, multiplyAddValue52, uintBitsToFloat(reinterpretedBits36.x)), multiplyAddValue72 * multiplyAddValue52));
    fragmentColor1.y = fma(multiplyAddValue56, multiplyAddValue56, fma(reinterpretedBits56, fma(-multiplyAddValue73, multiplyAddValue53, uintBitsToFloat(reinterpretedBits36.y)), multiplyAddValue73 * multiplyAddValue53));
    fragmentColor1.z = fma(multiplyAddValue57, multiplyAddValue57, fma(reinterpretedBits56, fma(-multiplyAddValue74, multiplyAddValue54, uintBitsToFloat(reinterpretedBits36.z)), multiplyAddValue74 * multiplyAddValue54));
    uint reinterpretedBits61 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits61 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits61 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits61 & 8u) == 8u;
    float reinterpretedBits20;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((reinterpretedBits61 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits20 = ((reinterpretedBits61 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue20 = sampledTextureValue12.x;
        intermediateValue21 = sampledTextureValue12.z;
        intermediateValue22 = sampledTextureValue12.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits54 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits70 = reinterpretedBits45 * uintBitsToFloat(reinterpretedBits54.x);
    float reinterpretedBits71 = reinterpretedBits45 * uintBitsToFloat(reinterpretedBits54.y);
    float reinterpretedBits72 = reinterpretedBits45 * uintBitsToFloat(reinterpretedBits54.z);
    float scalarValue41 = ceil(reinterpretedBits46);
    uvec4 reinterpretedBits73 = floatBitsToUint(fragmentVectorConstants1.packedValues[32u]);
    float multiplyAddValue78 = fma(scalarValue41, fma(reinterpretedBits46, uintBitsToFloat(reinterpretedBits73.x), -reinterpretedBits70), reinterpretedBits70);
    float multiplyAddValue79 = fma(scalarValue41, fma(reinterpretedBits46, uintBitsToFloat(reinterpretedBits73.y), -reinterpretedBits71), reinterpretedBits71);
    float multiplyAddValue80 = fma(scalarValue41, fma(reinterpretedBits46, uintBitsToFloat(reinterpretedBits73.z), -reinterpretedBits72), reinterpretedBits72);
    float reinterpretedBits55 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue52 = fma(reinterpretedBits55, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue53 = fma(reinterpretedBits55, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue54 = fma(reinterpretedBits55, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits.x);
    float reinterpretedBits58 = uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits59 = uintBitsToFloat(reinterpretedBits.z);
    uvec4 reinterpretedBits74 = floatBitsToUint(fragmentVectorConstants1.packedValues[36u]);
    float multiplyAddValue81 = fma(sampledTextureValue10.x, reinterpretedBits57, sampledTextureValue11.x * reinterpretedBits57) * uintBitsToFloat(reinterpretedBits74.x);
    float multiplyAddValue82 = fma(sampledTextureValue10.y, reinterpretedBits58, sampledTextureValue11.y * reinterpretedBits58) * uintBitsToFloat(reinterpretedBits74.y);
    float multiplyAddValue83 = fma(sampledTextureValue10.z, reinterpretedBits59, sampledTextureValue11.z * reinterpretedBits59) * uintBitsToFloat(reinterpretedBits74.z);
    fragmentColor1.x = fma(multiplyAddValue81, multiplyAddValue81, fma(reinterpretedBits56, fma(-multiplyAddValue78, multiplyAddValue52, uintBitsToFloat(reinterpretedBits36.x)), multiplyAddValue78 * multiplyAddValue52));
    fragmentColor1.y = fma(multiplyAddValue82, multiplyAddValue82, fma(reinterpretedBits56, fma(-multiplyAddValue79, multiplyAddValue53, uintBitsToFloat(reinterpretedBits36.y)), multiplyAddValue79 * multiplyAddValue53));
    fragmentColor1.z = fma(multiplyAddValue83, multiplyAddValue83, fma(reinterpretedBits56, fma(-multiplyAddValue80, multiplyAddValue54, uintBitsToFloat(reinterpretedBits36.z)), multiplyAddValue80 * multiplyAddValue54));
    uint reinterpretedBits61 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits61 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits61 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits61 & 8u) == 8u;
    float reinterpretedBits26;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if ((reinterpretedBits61 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits26 = ((reinterpretedBits61 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue17 = sampledTextureValue12.x;
        intermediateValue18 = sampledTextureValue12.z;
        intermediateValue19 = sampledTextureValue12.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits54 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits75 = multiplyAddValue87 * uintBitsToFloat(reinterpretedBits54.x);
    float reinterpretedBits76 = multiplyAddValue87 * uintBitsToFloat(reinterpretedBits54.y);
    float reinterpretedBits77 = multiplyAddValue87 * uintBitsToFloat(reinterpretedBits54.z);
    float scalarValue44 = ceil(multiplyAddValue88);
    uvec4 reinterpretedBits73 = floatBitsToUint(fragmentVectorConstants1.packedValues[32u]);
    float multiplyAddValue89 = fma(scalarValue44, fma(multiplyAddValue88, uintBitsToFloat(reinterpretedBits73.x), -reinterpretedBits75), reinterpretedBits75);
    float multiplyAddValue90 = fma(scalarValue44, fma(multiplyAddValue88, uintBitsToFloat(reinterpretedBits73.y), -reinterpretedBits76), reinterpretedBits76);
    float multiplyAddValue91 = fma(scalarValue44, fma(multiplyAddValue88, uintBitsToFloat(reinterpretedBits73.z), -reinterpretedBits77), reinterpretedBits77);
    float reinterpretedBits55 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue52 = fma(reinterpretedBits55, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue53 = fma(reinterpretedBits55, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue54 = fma(reinterpretedBits55, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits56 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    vec4 sampledTextureValue10 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue11 = texture(sampler2D(materialTexture2, textureSampler2), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits.x);
    float reinterpretedBits58 = uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits59 = uintBitsToFloat(reinterpretedBits.z);
    uvec4 reinterpretedBits74 = floatBitsToUint(fragmentVectorConstants1.packedValues[36u]);
    float multiplyAddValue81 = fma(sampledTextureValue10.x, reinterpretedBits57, sampledTextureValue11.x * reinterpretedBits57) * uintBitsToFloat(reinterpretedBits74.x);
    float multiplyAddValue82 = fma(sampledTextureValue10.y, reinterpretedBits58, sampledTextureValue11.y * reinterpretedBits58) * uintBitsToFloat(reinterpretedBits74.y);
    float multiplyAddValue83 = fma(sampledTextureValue10.z, reinterpretedBits59, sampledTextureValue11.z * reinterpretedBits59) * uintBitsToFloat(reinterpretedBits74.z);
    fragmentColor1.x = fma(multiplyAddValue81, multiplyAddValue81, fma(reinterpretedBits56, fma(-multiplyAddValue89, multiplyAddValue52, uintBitsToFloat(reinterpretedBits36.x)), multiplyAddValue89 * multiplyAddValue52));
    fragmentColor1.y = fma(multiplyAddValue82, multiplyAddValue82, fma(reinterpretedBits56, fma(-multiplyAddValue90, multiplyAddValue53, uintBitsToFloat(reinterpretedBits36.y)), multiplyAddValue90 * multiplyAddValue53));
    fragmentColor1.z = fma(multiplyAddValue83, multiplyAddValue83, fma(reinterpretedBits56, fma(-multiplyAddValue91, multiplyAddValue54, uintBitsToFloat(reinterpretedBits36.z)), multiplyAddValue91 * multiplyAddValue54));
    uint reinterpretedBits61 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue27 = (reinterpretedBits61 & 16u) == 16u;
    bool comparisonValue28 = (reinterpretedBits61 & 4u) == 4u;
    bool comparisonValue29 = (reinterpretedBits61 & 8u) == 8u;
    float reinterpretedBits24;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((reinterpretedBits61 & 1u) == 1u)
    {
        vec4 sampledTextureValue12 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits24 = ((reinterpretedBits61 & 2u) == 2u) ? sampledTextureValue12.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue20 = sampledTextureValue12.x;
        intermediateValue21 = sampledTextureValue12.z;
        intermediateValue22 = sampledTextureValue12.y;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[21u].x) / (fragmentVectorConstants1.packedValues[21u].y - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].x) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].y) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float productValue = floor(quotientValue1 * 0.25);
        float productValue1 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue1 * productValue1) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue * productValue) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)));
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[23u].x) / (fragmentVectorConstants1.packedValues[23u].y - fragmentVectorConstants1.packedValues[23u].x), 0.0, 1.0);
        float quotientValue6 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[26u].x) / fragmentVectorConstants1.packedValues[23u].z) * fragmentVectorConstants1.packedValues[23u].z;
        float quotientValue7 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[26u].y) / fragmentVectorConstants1.packedValues[23u].z) * fragmentVectorConstants1.packedValues[23u].z;
        float productValue75 = floor(quotientValue7 * 0.25);
        float productValue76 = floor(quotientValue7 * 0.5);
        float scalarValue33 = floor(quotientValue7);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue76 * productValue76) * 0.75) + (floor(quotientValue6 * 0.5) * 0.5)) + (fract(((productValue75 * productValue75) * 0.75) + (floor(quotientValue6 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue33 * scalarValue33) * 0.75) + (floor(quotientValue6) * 0.5)));
#endif
    }
    else
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
        intermediateValue17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
        intermediateValue21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits26 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        comparisonValue = false;
#endif
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue3;
    float productValue4;
    float productValue5;
    if (comparisonValue7 || (comparisonValue9 || comparisonValue8))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue4;
    float productValue5;
    float productValue6;
    if (comparisonValue7 || (comparisonValue9 || comparisonValue8))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue5;
    float productValue6;
    float productValue7;
    if (comparisonValue27 || (comparisonValue29 || comparisonValue28))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue6;
    float productValue7;
    float productValue8;
    if (comparisonValue27 || (comparisonValue29 || comparisonValue28))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue3;
    float productValue4;
    float productValue5;
    if (comparisonValue27 || (comparisonValue29 || comparisonValue28))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue4;
    float productValue5;
    float productValue6;
    if (comparisonValue27 || (comparisonValue29 || comparisonValue28))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((sampledTextureValue.w * fragmentVectorConstants1.packedValues[29u].w) < 0.5) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((((productValue53 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[29u].w) - scalarValue26)) + scalarValue26) < 0.5) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((productValue74 < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((productValue101 < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((sampledTextureValue.w * fragmentVectorConstants1.packedValues[31u].w) < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((((productValue128 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[31u].w) - scalarValue26)) + scalarValue26) < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#endif
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue12;
        float multiplyAddValue13;
        float multiplyAddValue14;
        bool intermediateValue22;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        bool intermediateValue26;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        bool intermediateValue22;
        if (comparisonValue28)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue19;
        float multiplyAddValue20;
        float multiplyAddValue21;
        bool intermediateValue26;
        if (comparisonValue28)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        bool intermediateValue23;
        if (comparisonValue28)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue17;
        float multiplyAddValue18;
        float multiplyAddValue19;
        bool intermediateValue26;
        if (comparisonValue28)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue2 = (sampledTextureValue.x * fragmentVectorConstants1.packedValues[29u].x) * ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue9 = (sampledTextureValue.y * fragmentVectorConstants1.packedValues[29u].y) * ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue10 = (sampledTextureValue.z * fragmentVectorConstants1.packedValues[29u].z) * ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue11 = (fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[33u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue12 = (fragmentVectorConstants1.packedValues[27u].y * fragmentVectorConstants1.packedValues[33u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue22 = (fragmentVectorConstants1.packedValues[27u].z * fragmentVectorConstants1.packedValues[33u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue1 = uint(int(fragmentVectorConstants1.packedValues[4u].x));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue3 = fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[26u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[32u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue3 = sampledTextureValue3.x;
        intermediateValue4 = sampledTextureValue3.y;
        intermediateValue5 = sampledTextureValue3.z;
        intermediateValue6 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[32u].x;
    }
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if ((scalarValue1 & 28u) == 0u)
    {
        intermediateValue7 = varyingNormal0.x;
        intermediateValue8 = varyingNormal0.y;
        intermediateValue9 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        if ((scalarValue1 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue54 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((productValue53 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[29u].x) - scalarValue23)) + scalarValue23);
    float productValue55 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((productValue53 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[29u].y) - scalarValue24)) + scalarValue24);
    float productValue56 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((productValue53 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[29u].z) - scalarValue25)) + scalarValue25);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue11 = (fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[33u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue12 = (fragmentVectorConstants1.packedValues[27u].y * fragmentVectorConstants1.packedValues[33u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue22 = (fragmentVectorConstants1.packedValues[27u].z * fragmentVectorConstants1.packedValues[33u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue1 = uint(int(fragmentVectorConstants1.packedValues[4u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue7 = fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[26u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[32u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue3.x;
        intermediateValue8 = sampledTextureValue3.y;
        intermediateValue9 = sampledTextureValue3.z;
        intermediateValue10 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[32u].x;
    }
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((scalarValue1 & 28u) == 0u)
    {
        intermediateValue11 = varyingNormal0.x;
        intermediateValue12 = varyingNormal0.y;
        intermediateValue13 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if ((scalarValue1 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue77 = ((((fragmentVectorConstants1.packedValues[4u].x * productValue71) - productValue71) * productValue74) + productValue71) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue78 = ((((fragmentVectorConstants1.packedValues[4u].y * productValue72) - productValue72) * productValue74) + productValue72) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue79 = ((((fragmentVectorConstants1.packedValues[4u].z * productValue73) - productValue73) * productValue74) + productValue73) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue80 = (fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[35u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue81 = (fragmentVectorConstants1.packedValues[29u].y * fragmentVectorConstants1.packedValues[35u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue82 = (fragmentVectorConstants1.packedValues[29u].z * fragmentVectorConstants1.packedValues[35u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue34 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if ((scalarValue34 & 1u) == 0u)
    {
        intermediateValue3 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[34u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue3 = sampledTextureValue3.x;
        intermediateValue4 = sampledTextureValue3.y;
        intermediateValue5 = sampledTextureValue3.z;
        intermediateValue6 = ((scalarValue34 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[34u].x;
    }
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if ((scalarValue34 & 28u) == 0u)
    {
        intermediateValue7 = varyingNormal0.x;
        intermediateValue8 = varyingNormal0.y;
        intermediateValue9 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue14;
        float intermediateValue15;
        float intermediateValue16;
        if ((scalarValue34 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue102 = ((((fragmentVectorConstants1.packedValues[4u].x * productValue98) - productValue98) * productValue101) + productValue98) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue103 = ((((fragmentVectorConstants1.packedValues[4u].y * productValue99) - productValue99) * productValue101) + productValue99) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue104 = ((((fragmentVectorConstants1.packedValues[4u].z * productValue100) - productValue100) * productValue101) + productValue100) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue80 = (fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[35u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue81 = (fragmentVectorConstants1.packedValues[29u].y * fragmentVectorConstants1.packedValues[35u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue82 = (fragmentVectorConstants1.packedValues[29u].z * fragmentVectorConstants1.packedValues[35u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue34 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue34 & 1u) == 0u)
    {
        intermediateValue7 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[34u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue3.x;
        intermediateValue8 = sampledTextureValue3.y;
        intermediateValue9 = sampledTextureValue3.z;
        intermediateValue10 = ((scalarValue34 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[34u].x;
    }
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((scalarValue34 & 28u) == 0u)
    {
        intermediateValue11 = varyingNormal0.x;
        intermediateValue12 = varyingNormal0.y;
        intermediateValue13 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if ((scalarValue34 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue107 = fragmentVectorConstants1.packedValues[4u].x * productValue71;
    float productValue108 = fragmentVectorConstants1.packedValues[4u].y * productValue71;
    float productValue109 = fragmentVectorConstants1.packedValues[4u].z * productValue71;
    float scalarValue38 = ceil(productValue72);
    float productValue110 = ((((fragmentVectorConstants1.packedValues[32u].x * productValue72) - productValue107) * scalarValue38) + productValue107) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue111 = ((((fragmentVectorConstants1.packedValues[32u].y * productValue72) - productValue108) * scalarValue38) + productValue108) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue112 = ((((fragmentVectorConstants1.packedValues[32u].z * productValue72) - productValue109) * scalarValue38) + productValue109) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue113 = (fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[36u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue114 = (fragmentVectorConstants1.packedValues[29u].y * fragmentVectorConstants1.packedValues[36u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue115 = (fragmentVectorConstants1.packedValues[29u].z * fragmentVectorConstants1.packedValues[36u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue34 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if ((scalarValue34 & 1u) == 0u)
    {
        intermediateValue4 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[34u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[35u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue4 = sampledTextureValue3.x;
        intermediateValue5 = sampledTextureValue3.y;
        intermediateValue6 = sampledTextureValue3.z;
        intermediateValue7 = ((scalarValue34 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[35u].x;
    }
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue34 & 28u) == 0u)
    {
        intermediateValue8 = varyingNormal0.x;
        intermediateValue9 = varyingNormal0.y;
        intermediateValue10 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue15;
        float intermediateValue16;
        float intermediateValue17;
        if ((scalarValue34 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue131 = fragmentVectorConstants1.packedValues[4u].x * productValue129;
    float productValue132 = fragmentVectorConstants1.packedValues[4u].y * productValue129;
    float productValue133 = fragmentVectorConstants1.packedValues[4u].z * productValue129;
    float scalarValue43 = ceil(productValue130);
    float productValue134 = ((((fragmentVectorConstants1.packedValues[32u].x * productValue130) - productValue131) * scalarValue43) + productValue131) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue135 = ((((fragmentVectorConstants1.packedValues[32u].y * productValue130) - productValue132) * scalarValue43) + productValue132) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue136 = ((((fragmentVectorConstants1.packedValues[32u].z * productValue130) - productValue133) * scalarValue43) + productValue133) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue113 = (fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[36u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue114 = (fragmentVectorConstants1.packedValues[29u].y * fragmentVectorConstants1.packedValues[36u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue115 = (fragmentVectorConstants1.packedValues[29u].z * fragmentVectorConstants1.packedValues[36u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    uint scalarValue34 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue34 & 1u) == 0u)
    {
        intermediateValue7 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[34u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[35u].x;
    }
    else
    {
        vec4 sampledTextureValue3 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue3.x;
        intermediateValue8 = sampledTextureValue3.y;
        intermediateValue9 = sampledTextureValue3.z;
        intermediateValue10 = ((scalarValue34 & 2u) != 0u) ? sampledTextureValue3.w : fragmentVectorConstants1.packedValues[35u].x;
    }
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((scalarValue34 & 28u) == 0u)
    {
        intermediateValue11 = varyingNormal0.x;
        intermediateValue12 = varyingNormal0.y;
        intermediateValue13 = varyingNormal0.z;
    }
    else
    {
        float intermediateValue18;
        float intermediateValue19;
        float intermediateValue20;
        if ((scalarValue34 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue12 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue13 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue22 = true;
        }
        else
        {
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue23;
            if (comparisonValue9)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue15 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue27;
            if (comparisonValue9)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue15 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue22 = true;
        }
        else
        {
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue23;
            if (comparisonValue29)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue19 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue20 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue21 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue27;
            if (comparisonValue29)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue15 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue23 = true;
        }
        else
        {
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue24;
            if (comparisonValue29)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue13 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue17 = fma(sampledTextureValue13.z, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue13.y, 2.0, -1.0);
            multiplyAddValue19 = fma(sampledTextureValue13.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue27;
            if (comparisonValue29)
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue1 & 8u) == 0u)
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue34 & 8u) == 0u)
#endif
            {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue42 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue43 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue16.x;
                float scalarValue12 = sampledTextureValue16.y;
                float scalarValue13 = sampledTextureValue16.z;
                float scalarValue14 = sampledTextureValue16.w;
                float multiplyAddValue23 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue24 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue24 > 0.5;
                bool conditionValue4 = multiplyAddValue23 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue11 : scalarValue14;
                float comparisonValue15 = conditionValue3 ? scalarValue12 : scalarValue13;
                float comparisonValue16 = conditionValue4 ? scalarValue13 : scalarValue14;
                float comparisonValue17 = conditionValue4 ? scalarValue12 : scalarValue11;
                float sumValue6 = multiplyAddValue23 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue23 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue24 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue24 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue15 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue15);
                intermediateValue23 = true;
                productValue15 = inverseLengthValue9 * comparisonValue18;
                productValue14 = inverseLengthValue9 * comparisonValue19;
                productValue13 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue18;
                if (comparisonValue7)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue42 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue43 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue16.x;
                float scalarValue12 = sampledTextureValue16.y;
                float scalarValue13 = sampledTextureValue16.z;
                float scalarValue14 = sampledTextureValue16.w;
                float multiplyAddValue23 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue24 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue24 > 0.5;
                bool conditionValue4 = multiplyAddValue23 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue11 : scalarValue14;
                float comparisonValue15 = conditionValue3 ? scalarValue12 : scalarValue13;
                float comparisonValue16 = conditionValue4 ? scalarValue13 : scalarValue14;
                float comparisonValue17 = conditionValue4 ? scalarValue12 : scalarValue11;
                float sumValue6 = multiplyAddValue23 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue23 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue24 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue24 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue15 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue15);
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
                if (comparisonValue7)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue42 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue43 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue16.x;
                float scalarValue12 = sampledTextureValue16.y;
                float scalarValue13 = sampledTextureValue16.z;
                float scalarValue14 = sampledTextureValue16.w;
                float multiplyAddValue23 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue24 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue24 > 0.5;
                bool conditionValue4 = multiplyAddValue23 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue11 : scalarValue14;
                float comparisonValue15 = conditionValue3 ? scalarValue12 : scalarValue13;
                float comparisonValue16 = conditionValue4 ? scalarValue13 : scalarValue14;
                float comparisonValue17 = conditionValue4 ? scalarValue12 : scalarValue11;
                float sumValue6 = multiplyAddValue23 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue23 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue24 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue24 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue15 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue15);
                intermediateValue23 = true;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue42 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue43 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue16.x;
                float scalarValue12 = sampledTextureValue16.y;
                float scalarValue13 = sampledTextureValue16.z;
                float scalarValue14 = sampledTextureValue16.w;
                float multiplyAddValue23 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue24 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue24 > 0.5;
                bool conditionValue4 = multiplyAddValue23 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue11 : scalarValue14;
                float comparisonValue15 = conditionValue3 ? scalarValue12 : scalarValue13;
                float comparisonValue16 = conditionValue4 ? scalarValue13 : scalarValue14;
                float comparisonValue17 = conditionValue4 ? scalarValue12 : scalarValue11;
                float sumValue6 = multiplyAddValue23 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue23 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue24 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue24 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue15 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue15);
                intermediateValue27 = true;
                productValue18 = inverseLengthValue9 * comparisonValue18;
                productValue17 = inverseLengthValue9 * comparisonValue19;
                productValue16 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue21;
                if (comparisonValue27)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue42 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue43 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue16.x;
                float scalarValue12 = sampledTextureValue16.y;
                float scalarValue13 = sampledTextureValue16.z;
                float scalarValue14 = sampledTextureValue16.w;
                float multiplyAddValue23 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue24 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue24 > 0.5;
                bool conditionValue4 = multiplyAddValue23 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue11 : scalarValue14;
                float comparisonValue15 = conditionValue3 ? scalarValue12 : scalarValue13;
                float comparisonValue16 = conditionValue4 ? scalarValue13 : scalarValue14;
                float comparisonValue17 = conditionValue4 ? scalarValue12 : scalarValue11;
                float sumValue6 = multiplyAddValue23 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue23 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue24 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue24 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue15 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue15);
                intermediateValue24 = true;
                productValue15 = inverseLengthValue9 * comparisonValue18;
                productValue14 = inverseLengthValue9 * comparisonValue19;
                productValue13 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue18;
                if (comparisonValue27)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue14 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue15 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue15.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue14 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue14 ? sampledTextureValue15.y : 0u);
                float productValue42 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue43 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue16 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue43 - 0.5) < 0.0625) ? (((productValue43 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue16.x;
                float scalarValue12 = sampledTextureValue16.y;
                float scalarValue13 = sampledTextureValue16.z;
                float scalarValue14 = sampledTextureValue16.w;
                float multiplyAddValue23 = fract(fma(varyingTexCoord0.x, comparisonValue10, 0.5));
                float multiplyAddValue24 = fract(fma(varyingTexCoord0.y, comparisonValue11, 0.5));
                bool conditionValue3 = multiplyAddValue24 > 0.5;
                bool conditionValue4 = multiplyAddValue23 > 0.5;
                float comparisonValue14 = conditionValue3 ? scalarValue11 : scalarValue14;
                float comparisonValue15 = conditionValue3 ? scalarValue12 : scalarValue13;
                float comparisonValue16 = conditionValue4 ? scalarValue13 : scalarValue14;
                float comparisonValue17 = conditionValue4 ? scalarValue12 : scalarValue11;
                float sumValue6 = multiplyAddValue23 - 0.083333335816860198974609375;
                float sumValue7 = multiplyAddValue23 + 0.083333335816860198974609375;
                float sumValue8 = multiplyAddValue24 - 0.083333335816860198974609375;
                float sumValue9 = multiplyAddValue24 + 0.083333335816860198974609375;
                uint sumValue10 = uint(int(spvNClamp(sumValue6 + sumValue6, 0.0, 1.0)));
                uint sumValue11 = uint(int(spvNClamp(sumValue7 + sumValue7, 0.0, 1.0)));
                uint sumValue12 = uint(int(spvNClamp(sumValue8 + sumValue8, 0.0, 1.0)));
                uint sumValue13 = uint(int(spvNClamp(sumValue9 + sumValue9, 0.0, 1.0)));
                float comparisonValue18 = ((sumValue10 == 1u) ? comparisonValue15 : ((sumValue10 == 0u) ? comparisonValue14 : 0.0)) - ((sumValue11 == 1u) ? comparisonValue15 : ((sumValue11 == 0u) ? comparisonValue14 : 0.0));
                float comparisonValue19 = ((sumValue12 == 1u) ? comparisonValue17 : ((sumValue12 == 0u) ? comparisonValue16 : 0.0)) - ((sumValue13 == 1u) ? comparisonValue17 : ((sumValue13 == 0u) ? comparisonValue16 : 0.0));
                vec3 vectorValue1 = vec3(comparisonValue18, comparisonValue19, 0.25);
                float scalarValue15 = rdDot3Precise(vectorValue1, vectorValue1);
                float inverseLengthValue9 = inversesqrt(scalarValue15);
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
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue1 & 16u) == 0u)
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue34 & 16u) == 0u)
#endif
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue16 = sampledTextureValue18.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue17 ? scalarValue16 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue17 ? sampledTextureValue18.y : 0u);
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue44 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue45 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue25 = (productValue44 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue26 = (productValue45 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue27 = (productValue44 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                    float multiplyAddValue28 = (productValue45 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue26) : multiplyAddValue26;
                    bool comparisonValue22 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue28) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue27 : 0.0, comparisonValue23 ? multiplyAddValue28 : 0.0, 0.25);
                    float scalarValue17 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue10 = inversesqrt(scalarValue17);
                    comparisonValue12 = comparisonValue22 ? (inverseLengthValue10 * multiplyAddValue27) : 0.0;
                    comparisonValue13 = comparisonValue23 ? (inverseLengthValue10 * multiplyAddValue28) : 0.0;
                    productValue18 = inverseLengthValue10 * 0.25;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue16 = sampledTextureValue18.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue17 ? scalarValue16 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue17 ? sampledTextureValue18.y : 0u);
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue44 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue45 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue25 = (productValue44 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue26 = (productValue45 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue27 = (productValue44 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                    float multiplyAddValue28 = (productValue45 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue26) : multiplyAddValue26;
                    bool comparisonValue22 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue28) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue27 : 0.0, comparisonValue23 ? multiplyAddValue28 : 0.0, 0.25);
                    float scalarValue17 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue10 = inversesqrt(scalarValue17);
                    comparisonValue12 = comparisonValue22 ? (inverseLengthValue10 * multiplyAddValue27) : 0.0;
                    comparisonValue13 = comparisonValue23 ? (inverseLengthValue10 * multiplyAddValue28) : 0.0;
                    productValue19 = inverseLengthValue10 * 0.25;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue16 = sampledTextureValue18.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue17 ? scalarValue16 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue17 ? sampledTextureValue18.y : 0u);
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue44 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue45 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue25 = (productValue44 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue26 = (productValue45 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue27 = (productValue44 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                    float multiplyAddValue28 = (productValue45 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue26) : multiplyAddValue26;
                    bool comparisonValue22 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue28) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue27 : 0.0, comparisonValue23 ? multiplyAddValue28 : 0.0, 0.25);
                    float scalarValue17 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue10 = inversesqrt(scalarValue17);
                    comparisonValue12 = comparisonValue22 ? (inverseLengthValue10 * multiplyAddValue27) : 0.0;
                    comparisonValue13 = comparisonValue23 ? (inverseLengthValue10 * multiplyAddValue28) : 0.0;
                    productValue20 = inverseLengthValue10 * 0.25;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue17 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue18 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue16 = sampledTextureValue18.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue17 ? scalarValue16 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue17 ? sampledTextureValue18.y : 0u);
                    vec4 sampledTextureValue19 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue44 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue45 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue25 = (productValue44 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue26 = (productValue45 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue19.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue27 = (productValue44 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.y, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                    float multiplyAddValue28 = (productValue45 >= 0.916666686534881591796875) ? (fma(sampledTextureValue19.z, 2.0, -1.0) + multiplyAddValue26) : multiplyAddValue26;
                    bool comparisonValue22 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue28) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue27 : 0.0, comparisonValue23 ? multiplyAddValue28 : 0.0, 0.25);
                    float scalarValue17 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue10 = inversesqrt(scalarValue17);
                    comparisonValue12 = comparisonValue22 ? (inverseLengthValue10 * multiplyAddValue27) : 0.0;
                    comparisonValue13 = comparisonValue23 ? (inverseLengthValue10 * multiplyAddValue28) : 0.0;
                    productValue21 = inverseLengthValue10 * 0.25;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    branchMergedValue3 = 0.0;
                    branchMergedValue4 = 0.0;
                    branchMergedValue5 = 1.0;
#endif
                }
                else
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = intermediateValue43;
                    comparisonValue13 = intermediateValue43;
                    productValue18 = intermediateValue43;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = intermediateValue47;
                    comparisonValue13 = intermediateValue47;
                    productValue19 = intermediateValue47;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = productValue87;
                    comparisonValue13 = productValue88;
                    productValue20 = productValue89;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = productValue87;
                    comparisonValue13 = productValue88;
                    productValue21 = productValue89;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = intermediateValue44;
                    comparisonValue13 = intermediateValue44;
                    productValue18 = intermediateValue44;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue5 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue23 = fract(float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x);
                    float productValue24 = fract(float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y);
                    float comparisonValue1 = (((productValue23 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.y * 2.0) + (-1.0))) - (((sampledTextureValue5.w * 2.0) + (-1.0)) * ((productValue23 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue2 = (((productValue24 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue5.z * 2.0) + (-1.0))) - (((productValue24 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue5.x * 2.0) + (-1.0)));
                    float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue1;
                    float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue2;
                    float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue3, comparisonValue4, 0.25), vec3(comparisonValue3, comparisonValue4, 0.25)));
                    branchMergedValue3 = comparisonValue3 * inverseLengthValue1;
                    branchMergedValue4 = comparisonValue4 * inverseLengthValue1;
                    branchMergedValue5 = inverseLengthValue1 * 0.25;
#endif
                }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue23 = comparisonValue7;
                productValue15 = comparisonValue12;
                productValue14 = comparisonValue13;
                productValue13 = productValue18;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = comparisonValue7;
                productValue16 = comparisonValue12;
                productValue15 = comparisonValue13;
                productValue14 = productValue19;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue23 = comparisonValue27;
                productValue17 = comparisonValue12;
                productValue16 = comparisonValue13;
                productValue15 = productValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = comparisonValue27;
                productValue18 = comparisonValue12;
                productValue17 = comparisonValue13;
                productValue16 = productValue21;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue24 = comparisonValue27;
                productValue15 = comparisonValue12;
                productValue14 = comparisonValue13;
                productValue13 = productValue18;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = comparisonValue27;
                productValue16 = comparisonValue12;
                productValue15 = comparisonValue13;
                productValue14 = productValue19;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
#endif
            }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue12 = productValue13;
            multiplyAddValue13 = productValue14;
            multiplyAddValue14 = productValue15;
            intermediateValue22 = intermediateValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue15 = productValue14;
            multiplyAddValue16 = productValue15;
            multiplyAddValue17 = productValue16;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue15 = productValue15;
            multiplyAddValue16 = productValue16;
            multiplyAddValue17 = productValue17;
            intermediateValue22 = intermediateValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue19 = productValue16;
            multiplyAddValue20 = productValue17;
            multiplyAddValue21 = productValue18;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue15 = productValue13;
            multiplyAddValue16 = productValue14;
            multiplyAddValue17 = productValue15;
            intermediateValue23 = intermediateValue24;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue17 = productValue14;
            multiplyAddValue18 = productValue15;
            multiplyAddValue19 = productValue16;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue2 = fract(productValue25);
                float scalarValue3 = fract(productValue26);
                float comparisonValue5;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
                if (abs(scalarValue3 + (-0.5)) < 0.0625)
                {
                    comparisonValue6 = ((scalarValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue6 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue4 = sampledTextureValue7.x;
                float scalarValue5 = sampledTextureValue7.y;
                float scalarValue6 = sampledTextureValue7.z;
                float scalarValue7 = sampledTextureValue7.w;
                float sumValue = fract(productValue25 + 0.5);
                float sumValue1 = fract(productValue26 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue ? scalarValue5 : scalarValue6;
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue27 - productValue28;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue1 ? scalarValue5 : scalarValue4;
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue29, 0.25), vec3(sumValue2, productValue29, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue29;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue14 = branchMergedValue;
            intermediateValue15 = branchMergedValue1;
            intermediateValue16 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue2 = fract(productValue25);
                float scalarValue3 = fract(productValue26);
                float comparisonValue5;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
                if (abs(scalarValue3 + (-0.5)) < 0.0625)
                {
                    comparisonValue6 = ((scalarValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue6 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue4 = sampledTextureValue7.x;
                float scalarValue5 = sampledTextureValue7.y;
                float scalarValue6 = sampledTextureValue7.z;
                float scalarValue7 = sampledTextureValue7.w;
                float sumValue = fract(productValue25 + 0.5);
                float sumValue1 = fract(productValue26 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue ? scalarValue5 : scalarValue6;
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue27 - productValue28;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue1 ? scalarValue5 : scalarValue4;
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue29, 0.25), vec3(sumValue2, productValue29, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue29;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue18 = branchMergedValue;
            intermediateValue19 = branchMergedValue1;
            intermediateValue20 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue6 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue6.x)))))) * varyingTexCoord0.x;
                float productValue26 = float(int(uint(int(float(int(sampledTextureValue6.y)))))) * varyingTexCoord0.y;
                float scalarValue2 = fract(productValue25);
                float scalarValue3 = fract(productValue26);
                float comparisonValue5;
                if (abs(scalarValue2 + (-0.5)) < 0.0625)
                {
                    comparisonValue5 = ((scalarValue2 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x;
                }
                else
                {
                    comparisonValue5 = varyingTexCoord0.x;
                }
                float comparisonValue6;
                if (abs(scalarValue3 + (-0.5)) < 0.0625)
                {
                    comparisonValue6 = ((scalarValue3 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y;
                }
                else
                {
                    comparisonValue6 = varyingTexCoord0.y;
                }
                vec4 sampledTextureValue7 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue4 = sampledTextureValue7.x;
                float scalarValue5 = sampledTextureValue7.y;
                float scalarValue6 = sampledTextureValue7.z;
                float scalarValue7 = sampledTextureValue7.w;
                float sumValue = fract(productValue25 + 0.5);
                float sumValue1 = fract(productValue26 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue ? scalarValue5 : scalarValue6;
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue27 - productValue28;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue1 ? scalarValue5 : scalarValue4;
                float productValue29 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue29, 0.25), vec3(sumValue2, productValue29, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue29;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue15 = branchMergedValue;
            intermediateValue16 = branchMergedValue1;
            intermediateValue17 = branchMergedValue2;
#endif
        }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue25 = intermediateValue22 ? multiplyAddValue12 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue29 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue25, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue14, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue13) : 0.0) : 0.0);
        float multiplyAddValue30 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue25, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue14, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue13) : 0.0) : 0.0);
        float multiplyAddValue31 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue25, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue14, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue13) : 0.0) : 0.0);
        vec3 vectorValue5 = vec3(multiplyAddValue29, multiplyAddValue30, multiplyAddValue31);
        float scalarValue21 = rdDot3Precise(vectorValue5, vectorValue5);
        float inverseLengthValue14 = inversesqrt(scalarValue21);
        productValue3 = inverseLengthValue14 * multiplyAddValue31;
        productValue4 = inverseLengthValue14 * multiplyAddValue30;
        productValue5 = inverseLengthValue14 * multiplyAddValue29;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue26 = intermediateValue26 ? multiplyAddValue15 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue42 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue26, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue17, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue43 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue26, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue17, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue44 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue26, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue17, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue16) : 0.0) : 0.0);
        vec3 vectorValue7 = vec3(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44);
        float scalarValue31 = rdDot3Precise(vectorValue7, vectorValue7);
        float inverseLengthValue19 = inversesqrt(scalarValue31);
        productValue4 = inverseLengthValue19 * multiplyAddValue44;
        productValue5 = inverseLengthValue19 * multiplyAddValue43;
        productValue6 = inverseLengthValue19 * multiplyAddValue42;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue30 = intermediateValue22 ? multiplyAddValue15 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue58 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue30, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue17, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue59 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue30, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue17, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue60 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue30, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue17, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue16) : 0.0) : 0.0);
        vec3 vectorValue9 = vec3(multiplyAddValue58, multiplyAddValue59, multiplyAddValue60);
        float scalarValue36 = rdDot3Precise(vectorValue9, vectorValue9);
        float inverseLengthValue21 = inversesqrt(scalarValue36);
        productValue5 = inverseLengthValue21 * multiplyAddValue60;
        productValue6 = inverseLengthValue21 * multiplyAddValue59;
        productValue7 = inverseLengthValue21 * multiplyAddValue58;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue31 = intermediateValue26 ? multiplyAddValue19 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue75 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue31, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue21, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue76 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue31, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue21, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue77 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue31, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue21, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue20) : 0.0) : 0.0);
        vec3 vectorValue11 = vec3(multiplyAddValue75, multiplyAddValue76, multiplyAddValue77);
        float scalarValue39 = rdDot3Precise(vectorValue11, vectorValue11);
        float inverseLengthValue26 = inversesqrt(scalarValue39);
        productValue6 = inverseLengthValue26 * multiplyAddValue77;
        productValue7 = inverseLengthValue26 * multiplyAddValue76;
        productValue8 = inverseLengthValue26 * multiplyAddValue75;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue32 = intermediateValue23 ? multiplyAddValue15 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue84 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue32, intermediateValue23 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue17, intermediateValue23 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue85 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue32, intermediateValue23 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue17, intermediateValue23 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue86 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue32, intermediateValue23 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue17, intermediateValue23 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue16) : 0.0) : 0.0);
        vec3 vectorValue13 = vec3(multiplyAddValue84, multiplyAddValue85, multiplyAddValue86);
        float scalarValue42 = rdDot3Precise(vectorValue13, vectorValue13);
        float inverseLengthValue28 = inversesqrt(scalarValue42);
        productValue3 = inverseLengthValue28 * multiplyAddValue86;
        productValue4 = inverseLengthValue28 * multiplyAddValue85;
        productValue5 = inverseLengthValue28 * multiplyAddValue84;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue33 = intermediateValue26 ? multiplyAddValue17 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue92 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue33, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue19, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue93 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue33, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue19, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue94 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue33, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue19, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue18) : 0.0) : 0.0);
        vec3 vectorValue14 = vec3(multiplyAddValue92, multiplyAddValue93, multiplyAddValue94);
        float scalarValue45 = rdDot3Precise(vectorValue14, vectorValue14);
        float inverseLengthValue29 = inversesqrt(scalarValue45);
        productValue4 = inverseLengthValue29 * multiplyAddValue94;
        productValue5 = inverseLengthValue29 * multiplyAddValue93;
        productValue6 = inverseLengthValue29 * multiplyAddValue92;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue14 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue5 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue14;
        float multiplyAddValue = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue16, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue15, inverseLengthValue5 * varyingTangent0.x));
        float multiplyAddValue1 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue16, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue15, inverseLengthValue5 * varyingTangent0.y));
        float multiplyAddValue2 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue16, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue15, inverseLengthValue5 * varyingTangent0.z));
        float inverseLengthValue6 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue7 = inverseLengthValue6 * multiplyAddValue;
        intermediateValue8 = inverseLengthValue6 * multiplyAddValue1;
        intermediateValue9 = inverseLengthValue6 * multiplyAddValue2;
    }
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue7 = inversesqrt(dot(vec3(intermediateValue7, intermediateValue8, intermediateValue9), vec3(intermediateValue7, intermediateValue8, intermediateValue9)));
    float productValue30 = inverseLengthValue7 * intermediateValue7;
    float productValue31 = inverseLengthValue7 * intermediateValue8;
    float productValue32 = inverseLengthValue7 * intermediateValue9;
    float quotientValue2 = 1.0 / ((abs(productValue31) + abs(productValue30)) + abs(productValue32));
    float productValue33 = quotientValue2 * productValue30;
    float productValue34 = quotientValue2 * productValue31;
    bool conditionValue2 = productValue32 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue11;
    float productValue14;
    float productValue15;
    if ((fragmentVectorConstants1.packedValues[28u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue35 = fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue11 = spvNClamp(productValue35, 0.0, 1.0);
        productValue14 = spvNClamp(((productValue35 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue35, 0.0, 1.0);
        productValue15 = spvNClamp((((productValue35 * productValue35) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue35, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue16 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        float multiplyAddValue36 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue19, inverseLengthValue16 * varyingTangent0.x));
        float multiplyAddValue37 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue19, inverseLengthValue16 * varyingTangent0.y));
        float multiplyAddValue38 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue19, inverseLengthValue16 * varyingTangent0.z));
        float inverseLengthValue17 = inversesqrt(dot(vec3(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38), vec3(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38)));
        intermediateValue11 = inverseLengthValue17 * multiplyAddValue36;
        intermediateValue12 = inverseLengthValue17 * multiplyAddValue37;
        intermediateValue13 = inverseLengthValue17 * multiplyAddValue38;
    }
    float sumValue3 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue4 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue5 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue18 = inversesqrt(dot(vec3(intermediateValue11, intermediateValue12, intermediateValue13), vec3(intermediateValue11, intermediateValue12, intermediateValue13)));
    float productValue57 = inverseLengthValue18 * intermediateValue11;
    float productValue58 = inverseLengthValue18 * intermediateValue12;
    float productValue59 = inverseLengthValue18 * intermediateValue13;
    float quotientValue4 = 1.0 / ((abs(productValue58) + abs(productValue57)) + abs(productValue59));
    float productValue60 = quotientValue4 * productValue57;
    float productValue61 = quotientValue4 * productValue58;
    bool conditionValue6 = productValue59 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue15;
    float productValue15;
    float productValue16;
    if ((fragmentVectorConstants1.packedValues[28u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue35 = fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue15 = spvNClamp(productValue35, 0.0, 1.0);
        productValue15 = spvNClamp(((productValue35 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue35, 0.0, 1.0);
        productValue16 = spvNClamp((((productValue35 * productValue35) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue35, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue14 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue5 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue14;
        float multiplyAddValue = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue16, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue15, inverseLengthValue5 * varyingTangent0.x));
        float multiplyAddValue1 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue16, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue15, inverseLengthValue5 * varyingTangent0.y));
        float multiplyAddValue2 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue16, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue15, inverseLengthValue5 * varyingTangent0.z));
        float inverseLengthValue6 = inversesqrt(dot(vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2), vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2)));
        intermediateValue7 = inverseLengthValue6 * multiplyAddValue;
        intermediateValue8 = inverseLengthValue6 * multiplyAddValue1;
        intermediateValue9 = inverseLengthValue6 * multiplyAddValue2;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue7 = inversesqrt(dot(vec3(intermediateValue7, intermediateValue8, intermediateValue9), vec3(intermediateValue7, intermediateValue8, intermediateValue9)));
    float productValue30 = inverseLengthValue7 * intermediateValue7;
    float productValue31 = inverseLengthValue7 * intermediateValue8;
    float productValue32 = inverseLengthValue7 * intermediateValue9;
    float quotientValue2 = 1.0 / ((abs(productValue31) + abs(productValue30)) + abs(productValue32));
    float productValue33 = quotientValue2 * productValue30;
    float productValue34 = quotientValue2 * productValue31;
    bool conditionValue2 = productValue32 < 0.0;
    float multiplyAddValue45 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue46 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue11;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[30u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue83 = fragmentVectorConstants1.packedValues[30u].x * fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue11 = spvNClamp(productValue83, 0.0, 1.0);
        productValue18 = spvNClamp(((productValue83 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue83, 0.0, 1.0);
        productValue19 = spvNClamp((((productValue83 * productValue83) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue83, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue16 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        float multiplyAddValue36 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue19, inverseLengthValue16 * varyingTangent0.x));
        float multiplyAddValue37 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue19, inverseLengthValue16 * varyingTangent0.y));
        float multiplyAddValue38 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue19, inverseLengthValue16 * varyingTangent0.z));
        float inverseLengthValue17 = inversesqrt(dot(vec3(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38), vec3(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38)));
        intermediateValue11 = inverseLengthValue17 * multiplyAddValue36;
        intermediateValue12 = inverseLengthValue17 * multiplyAddValue37;
        intermediateValue13 = inverseLengthValue17 * multiplyAddValue38;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue18 = inversesqrt(dot(vec3(intermediateValue11, intermediateValue12, intermediateValue13), vec3(intermediateValue11, intermediateValue12, intermediateValue13)));
    float productValue57 = inverseLengthValue18 * intermediateValue11;
    float productValue58 = inverseLengthValue18 * intermediateValue12;
    float productValue59 = inverseLengthValue18 * intermediateValue13;
    float quotientValue4 = 1.0 / ((abs(productValue58) + abs(productValue57)) + abs(productValue59));
    float productValue60 = quotientValue4 * productValue57;
    float productValue61 = quotientValue4 * productValue58;
    bool conditionValue6 = productValue59 < 0.0;
    float multiplyAddValue45 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue46 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue15;
    float productValue19;
    float productValue20;
    if ((fragmentVectorConstants1.packedValues[30u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue83 = fragmentVectorConstants1.packedValues[30u].x * fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue15 = spvNClamp(productValue83, 0.0, 1.0);
        productValue19 = spvNClamp(((productValue83 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue83, 0.0, 1.0);
        productValue20 = spvNClamp((((productValue83 * productValue83) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue83, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue15 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue17 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue23 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue15;
        float multiplyAddValue65 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue17, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue16, inverseLengthValue23 * varyingTangent0.x));
        float multiplyAddValue66 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue17, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue16, inverseLengthValue23 * varyingTangent0.y));
        float multiplyAddValue67 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue17, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue16, inverseLengthValue23 * varyingTangent0.z));
        float inverseLengthValue24 = inversesqrt(dot(vec3(multiplyAddValue65, multiplyAddValue66, multiplyAddValue67), vec3(multiplyAddValue65, multiplyAddValue66, multiplyAddValue67)));
        intermediateValue8 = inverseLengthValue24 * multiplyAddValue65;
        intermediateValue9 = inverseLengthValue24 * multiplyAddValue66;
        intermediateValue10 = inverseLengthValue24 * multiplyAddValue67;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue25 = inversesqrt(dot(vec3(intermediateValue8, intermediateValue9, intermediateValue10), vec3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue116 = inverseLengthValue25 * intermediateValue8;
    float productValue117 = inverseLengthValue25 * intermediateValue9;
    float productValue118 = inverseLengthValue25 * intermediateValue10;
    float quotientValue9 = 1.0 / ((abs(productValue117) + abs(productValue116)) + abs(productValue118));
    float productValue119 = quotientValue9 * productValue116;
    float productValue120 = quotientValue9 * productValue117;
    bool conditionValue9 = productValue118 < 0.0;
    float multiplyAddValue45 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue46 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue12;
    float productValue19;
    float productValue20;
    if ((fragmentVectorConstants1.packedValues[30u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue83 = fragmentVectorConstants1.packedValues[30u].x * fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue12 = spvNClamp(productValue83, 0.0, 1.0);
        productValue19 = spvNClamp(((productValue83 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue83, 0.0, 1.0);
        productValue20 = spvNClamp((((productValue83 * productValue83) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue83, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue8 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue8.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue8.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue8.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue16 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue18;
        float multiplyAddValue36 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue19, inverseLengthValue16 * varyingTangent0.x));
        float multiplyAddValue37 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue19, inverseLengthValue16 * varyingTangent0.y));
        float multiplyAddValue38 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue20, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue19, inverseLengthValue16 * varyingTangent0.z));
        float inverseLengthValue17 = inversesqrt(dot(vec3(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38), vec3(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38)));
        intermediateValue11 = inverseLengthValue17 * multiplyAddValue36;
        intermediateValue12 = inverseLengthValue17 * multiplyAddValue37;
        intermediateValue13 = inverseLengthValue17 * multiplyAddValue38;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue18 = inversesqrt(dot(vec3(intermediateValue11, intermediateValue12, intermediateValue13), vec3(intermediateValue11, intermediateValue12, intermediateValue13)));
    float productValue57 = inverseLengthValue18 * intermediateValue11;
    float productValue58 = inverseLengthValue18 * intermediateValue12;
    float productValue59 = inverseLengthValue18 * intermediateValue13;
    float quotientValue4 = 1.0 / ((abs(productValue58) + abs(productValue57)) + abs(productValue59));
    float productValue60 = quotientValue4 * productValue57;
    float productValue61 = quotientValue4 * productValue58;
    bool conditionValue6 = productValue59 < 0.0;
    float multiplyAddValue45 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue46 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue15;
    float productValue20;
    float productValue21;
    if ((fragmentVectorConstants1.packedValues[30u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue83 = fragmentVectorConstants1.packedValues[30u].x * fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue15 = spvNClamp(productValue83, 0.0, 1.0);
        productValue20 = spvNClamp(((productValue83 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue83, 0.0, 1.0);
        productValue21 = spvNClamp((((productValue83 * productValue83) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue83, 0.0, 1.0);
#endif
    }
    else
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue3 = varyingNormal0.z;
        productValue4 = varyingNormal0.y;
        productValue5 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue4 = varyingNormal0.z;
        productValue5 = varyingNormal0.y;
        productValue6 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue6 = varyingNormal0.z;
        productValue7 = varyingNormal0.y;
        productValue8 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue11 = fragmentVectorConstants1.packedValues[18u].x;
        productValue14 = fragmentVectorConstants1.packedValues[18u].y;
        productValue15 = fragmentVectorConstants1.packedValues[18u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue15 = fragmentVectorConstants1.packedValues[18u].x;
        productValue15 = fragmentVectorConstants1.packedValues[18u].y;
        productValue16 = fragmentVectorConstants1.packedValues[18u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue11 = fragmentVectorConstants1.packedValues[19u].x;
        productValue18 = fragmentVectorConstants1.packedValues[19u].y;
        productValue19 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue15 = fragmentVectorConstants1.packedValues[19u].x;
        productValue19 = fragmentVectorConstants1.packedValues[19u].y;
        productValue20 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue12 = fragmentVectorConstants1.packedValues[19u].x;
        productValue19 = fragmentVectorConstants1.packedValues[19u].y;
        productValue20 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue15 = fragmentVectorConstants1.packedValues[19u].x;
        productValue20 = fragmentVectorConstants1.packedValues[19u].y;
        productValue21 = fragmentVectorConstants1.packedValues[19u].z;
#endif
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits28 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits27.x);
    float reinterpretedBits29 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits27.y);
    float reinterpretedBits30 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits27.z);
    fragmentColor1.w = (reinterpretedBits22 < intermediateValue16) ? fma(intermediateValue16, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits22, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue5, productValue4, productValue3);
    float scalarValue22 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue22);
    float productValue46 = inverseLengthValue15 * productValue5;
    float productValue47 = inverseLengthValue15 * productValue4;
    float productValue48 = inverseLengthValue15 * productValue3;
    float quotientValue3 = 1.0 / (abs(productValue48) + (abs(productValue47) + abs(productValue46)));
    float productValue49 = quotientValue3 * productValue46;
    float productValue50 = quotientValue3 * productValue47;
    bool conditionValue5 = productValue48 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue49 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue50))) : productValue49;
    fragmentColor2.y = conditionValue5 ? (((productValue50 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue49))) : productValue50;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue32 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits30, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits28, reinterpretedBits29 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits34.x)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits30, fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits28, reinterpretedBits29 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits38.x)) / multiplyAddValue33, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits34.y)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits30, fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits28, reinterpretedBits29 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits38.y)) / multiplyAddValue33, 0.5, 0.5);
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
    bool reinterpretedBits40 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits39 > 9.9999997473787516355514526367188e-05);
    float productValue51 = reinterpretedBits39 * reinterpretedBits39;
    uvec4 reinterpretedBits41 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits42 = (reinterpretedBits40 ? spvNMin(productValue51, 1.0) : uintBitsToFloat(reinterpretedBits41.x)) * 0.16666667163372039794921875;
    float multiplyAddValue34 = (reinterpretedBits40 ? spvNMin(fma(fma(productValue51, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue51, 1.0) : uintBitsToFloat(reinterpretedBits41.y)) * 0.16666667163372039794921875;
    float multiplyAddValue35 = (reinterpretedBits40 ? spvNMin(fma(productValue51 * productValue51, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue51, 1.0) : uintBitsToFloat(reinterpretedBits41.z)) * 0.16666667163372039794921875;
    float productValue52 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue34, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue35, reinterpretedBits42)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue34 / productValue52, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits42 / productValue52, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue35 / productValue52, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue52, 0.0, 1.0) * 255.0);
    uint reinterpretedBits43 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits43 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits43 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[113u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue18, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue17, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits28 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits27.x);
    float reinterpretedBits29 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits27.y);
    float reinterpretedBits30 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits27.z);
    fragmentColor1.w = (reinterpretedBits19 < intermediateValue20) ? fma(intermediateValue20, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits19, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue8 = vec3(productValue6, productValue5, productValue4);
    float scalarValue32 = rdDot3Precise(vectorValue8, vectorValue8);
    float inverseLengthValue20 = inversesqrt(scalarValue32);
    float productValue66 = inverseLengthValue20 * productValue6;
    float productValue67 = inverseLengthValue20 * productValue5;
    float productValue68 = inverseLengthValue20 * productValue4;
    float quotientValue5 = 1.0 / (abs(productValue68) + (abs(productValue67) + abs(productValue66)));
    float productValue69 = quotientValue5 * productValue66;
    float productValue70 = quotientValue5 * productValue67;
    bool conditionValue7 = productValue68 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue69 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue70))) : productValue69;
    fragmentColor2.y = conditionValue7 ? (((productValue70 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue69))) : productValue70;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue32 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits30, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits28, reinterpretedBits29 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.x))) + uintBitsToFloat(reinterpretedBits34.x)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits30, fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits28, reinterpretedBits29 * uintBitsToFloat(reinterpretedBits35.x))) + uintBitsToFloat(reinterpretedBits38.x)) / multiplyAddValue33, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits31.y))) + uintBitsToFloat(reinterpretedBits34.y)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits30, fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits28, reinterpretedBits29 * uintBitsToFloat(reinterpretedBits35.y))) + uintBitsToFloat(reinterpretedBits38.y)) / multiplyAddValue33, 0.5, 0.5);
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
    bool reinterpretedBits40 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits39 > 9.9999997473787516355514526367188e-05);
    float productValue51 = reinterpretedBits39 * reinterpretedBits39;
    uvec4 reinterpretedBits41 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits42 = (reinterpretedBits40 ? spvNMin(productValue51, 1.0) : uintBitsToFloat(reinterpretedBits41.x)) * 0.16666667163372039794921875;
    float multiplyAddValue34 = (reinterpretedBits40 ? spvNMin(fma(fma(productValue51, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue51, 1.0) : uintBitsToFloat(reinterpretedBits41.y)) * 0.16666667163372039794921875;
    float multiplyAddValue35 = (reinterpretedBits40 ? spvNMin(fma(productValue51 * productValue51, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue51, 1.0) : uintBitsToFloat(reinterpretedBits41.z)) * 0.16666667163372039794921875;
    float productValue52 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue34, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue35, reinterpretedBits42)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue34 / productValue52, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits42 / productValue52, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue35 / productValue52, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue52, 0.0, 1.0) * 255.0);
    uint reinterpretedBits43 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits43 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits43 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[113u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits62 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits63 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits62.x);
    float reinterpretedBits64 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits62.y);
    float reinterpretedBits65 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits62.z);
    fragmentColor1.w = (reinterpretedBits24 < intermediateValue16) ? fma(intermediateValue16, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits24, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue10 = vec3(productValue7, productValue6, productValue5);
    float scalarValue37 = rdDot3Precise(vectorValue10, vectorValue10);
    float inverseLengthValue22 = inversesqrt(scalarValue37);
    float productValue91 = inverseLengthValue22 * productValue7;
    float productValue92 = inverseLengthValue22 * productValue6;
    float productValue93 = inverseLengthValue22 * productValue5;
    float quotientValue8 = 1.0 / (abs(productValue93) + (abs(productValue92) + abs(productValue91)));
    float productValue94 = quotientValue8 * productValue91;
    float productValue95 = quotientValue8 * productValue92;
    bool conditionValue8 = productValue93 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue8 ? (((productValue94 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue95))) : productValue94;
    fragmentColor2.y = conditionValue8 ? (((productValue95 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue94))) : productValue95;
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue61 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits41 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue62 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits65, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits34.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits33.x))) + uintBitsToFloat(reinterpretedBits14.x)) / multiplyAddValue61, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits38.x), reinterpretedBits65, fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(reinterpretedBits37.x))) + uintBitsToFloat(reinterpretedBits41.x)) / multiplyAddValue62, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits34.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits33.y))) + uintBitsToFloat(reinterpretedBits14.y)) / multiplyAddValue61, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits38.y), reinterpretedBits65, fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(reinterpretedBits37.y))) + uintBitsToFloat(reinterpretedBits41.y)) / multiplyAddValue62, 0.5, 0.5);
    float reinterpretedBits66 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
    bool reinterpretedBits67 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits66 > 9.9999997473787516355514526367188e-05);
    float productValue96 = reinterpretedBits66 * reinterpretedBits66;
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits68 = (reinterpretedBits67 ? spvNMin(productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.x)) * 0.16666667163372039794921875;
    float multiplyAddValue63 = (reinterpretedBits67 ? spvNMin(fma(fma(productValue96, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.y)) * 0.16666667163372039794921875;
    float multiplyAddValue64 = (reinterpretedBits67 ? spvNMin(fma(productValue96 * productValue96, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.z)) * 0.16666667163372039794921875;
    float productValue97 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue63, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue64, reinterpretedBits68)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue63 / productValue97, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits68 / productValue97, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue64 / productValue97, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue97, 0.0, 1.0) * 255.0);
    uint reinterpretedBits69 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits69 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits69 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[121u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue18, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue17, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits62 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits63 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits62.x);
    float reinterpretedBits64 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits62.y);
    float reinterpretedBits65 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits62.z);
    fragmentColor1.w = (reinterpretedBits20 < intermediateValue20) ? fma(intermediateValue20, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits20, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue12 = vec3(productValue8, productValue7, productValue6);
    float scalarValue40 = rdDot3Precise(vectorValue12, vectorValue12);
    float inverseLengthValue27 = inversesqrt(scalarValue40);
    float productValue123 = inverseLengthValue27 * productValue8;
    float productValue124 = inverseLengthValue27 * productValue7;
    float productValue125 = inverseLengthValue27 * productValue6;
    float quotientValue10 = 1.0 / (abs(productValue125) + (abs(productValue124) + abs(productValue123)));
    float productValue126 = quotientValue10 * productValue123;
    float productValue127 = quotientValue10 * productValue124;
    bool conditionValue10 = productValue125 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue10 ? (((productValue126 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue127))) : productValue126;
    fragmentColor2.y = conditionValue10 ? (((productValue127 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue126))) : productValue127;
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue61 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits41 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue62 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits65, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits34.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits33.x))) + uintBitsToFloat(reinterpretedBits14.x)) / multiplyAddValue61, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits38.x), reinterpretedBits65, fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(reinterpretedBits37.x))) + uintBitsToFloat(reinterpretedBits41.x)) / multiplyAddValue62, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits34.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits33.y))) + uintBitsToFloat(reinterpretedBits14.y)) / multiplyAddValue61, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits38.y), reinterpretedBits65, fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(reinterpretedBits37.y))) + uintBitsToFloat(reinterpretedBits41.y)) / multiplyAddValue62, 0.5, 0.5);
    float reinterpretedBits66 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
    bool reinterpretedBits67 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits66 > 9.9999997473787516355514526367188e-05);
    float productValue96 = reinterpretedBits66 * reinterpretedBits66;
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits68 = (reinterpretedBits67 ? spvNMin(productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.x)) * 0.16666667163372039794921875;
    float multiplyAddValue63 = (reinterpretedBits67 ? spvNMin(fma(fma(productValue96, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.y)) * 0.16666667163372039794921875;
    float multiplyAddValue64 = (reinterpretedBits67 ? spvNMin(fma(productValue96 * productValue96, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.z)) * 0.16666667163372039794921875;
    float productValue97 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue63, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue64, reinterpretedBits68)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue63 / productValue97, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits68 / productValue97, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue64 / productValue97, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue97, 0.0, 1.0) * 255.0);
    uint reinterpretedBits69 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits69 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits69 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[121u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits62 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits63 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits62.x);
    float reinterpretedBits64 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits62.y);
    float reinterpretedBits65 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits62.z);
    fragmentColor1.w = (reinterpretedBits26 < intermediateValue17) ? fma(intermediateValue17, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits26, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue5, productValue4, productValue3);
    float scalarValue22 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue22);
    float productValue46 = inverseLengthValue15 * productValue5;
    float productValue47 = inverseLengthValue15 * productValue4;
    float productValue48 = inverseLengthValue15 * productValue3;
    float quotientValue3 = 1.0 / (abs(productValue48) + (abs(productValue47) + abs(productValue46)));
    float productValue49 = quotientValue3 * productValue46;
    float productValue50 = quotientValue3 * productValue47;
    bool conditionValue5 = productValue48 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue49 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue50))) : productValue49;
    fragmentColor2.y = conditionValue5 ? (((productValue50 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue49))) : productValue50;
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue61 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits41 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue62 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits65, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits34.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits33.x))) + uintBitsToFloat(reinterpretedBits14.x)) / multiplyAddValue61, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits38.x), reinterpretedBits65, fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(reinterpretedBits37.x))) + uintBitsToFloat(reinterpretedBits41.x)) / multiplyAddValue62, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits34.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits33.y))) + uintBitsToFloat(reinterpretedBits14.y)) / multiplyAddValue61, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits38.y), reinterpretedBits65, fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(reinterpretedBits37.y))) + uintBitsToFloat(reinterpretedBits41.y)) / multiplyAddValue62, 0.5, 0.5);
    float reinterpretedBits66 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
    bool reinterpretedBits67 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits66 > 9.9999997473787516355514526367188e-05);
    float productValue96 = reinterpretedBits66 * reinterpretedBits66;
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits68 = (reinterpretedBits67 ? spvNMin(productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.x)) * 0.16666667163372039794921875;
    float multiplyAddValue63 = (reinterpretedBits67 ? spvNMin(fma(fma(productValue96, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.y)) * 0.16666667163372039794921875;
    float multiplyAddValue64 = (reinterpretedBits67 ? spvNMin(fma(productValue96 * productValue96, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.z)) * 0.16666667163372039794921875;
    float productValue97 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue63, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue64, reinterpretedBits68)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue63 / productValue97, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits68 / productValue97, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue64 / productValue97, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue97, 0.0, 1.0) * 255.0);
    uint reinterpretedBits69 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits69 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits69 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[121u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue19, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue18, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits62 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits63 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits62.x);
    float reinterpretedBits64 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits62.y);
    float reinterpretedBits65 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits62.z);
    fragmentColor1.w = (reinterpretedBits24 < intermediateValue20) ? fma(intermediateValue20, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits24, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue8 = vec3(productValue6, productValue5, productValue4);
    float scalarValue32 = rdDot3Precise(vectorValue8, vectorValue8);
    float inverseLengthValue20 = inversesqrt(scalarValue32);
    float productValue66 = inverseLengthValue20 * productValue6;
    float productValue67 = inverseLengthValue20 * productValue5;
    float productValue68 = inverseLengthValue20 * productValue4;
    float quotientValue5 = 1.0 / (abs(productValue68) + (abs(productValue67) + abs(productValue66)));
    float productValue69 = quotientValue5 * productValue66;
    float productValue70 = quotientValue5 * productValue67;
    bool conditionValue7 = productValue68 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue7 ? (((productValue69 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue70))) : productValue69;
    fragmentColor2.y = conditionValue7 ? (((productValue70 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue69))) : productValue70;
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue61 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits41 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue62 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits65, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits34.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits33.x))) + uintBitsToFloat(reinterpretedBits14.x)) / multiplyAddValue61, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits38.x), reinterpretedBits65, fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(reinterpretedBits37.x))) + uintBitsToFloat(reinterpretedBits41.x)) / multiplyAddValue62, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits34.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits33.y))) + uintBitsToFloat(reinterpretedBits14.y)) / multiplyAddValue61, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits38.y), reinterpretedBits65, fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits63, reinterpretedBits64 * uintBitsToFloat(reinterpretedBits37.y))) + uintBitsToFloat(reinterpretedBits41.y)) / multiplyAddValue62, 0.5, 0.5);
    float reinterpretedBits66 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
    bool reinterpretedBits67 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits66 > 9.9999997473787516355514526367188e-05);
    float productValue96 = reinterpretedBits66 * reinterpretedBits66;
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits68 = (reinterpretedBits67 ? spvNMin(productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.x)) * 0.16666667163372039794921875;
    float multiplyAddValue63 = (reinterpretedBits67 ? spvNMin(fma(fma(productValue96, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.y)) * 0.16666667163372039794921875;
    float multiplyAddValue64 = (reinterpretedBits67 ? spvNMin(fma(productValue96 * productValue96, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue96, 1.0) : uintBitsToFloat(reinterpretedBits27.z)) * 0.16666667163372039794921875;
    float productValue97 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue63, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue64, reinterpretedBits68)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue63 / productValue97, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits68 / productValue97, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue64 / productValue97, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue97, 0.0, 1.0) * 255.0);
    uint reinterpretedBits69 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits69 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits69 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[121u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue36 = intermediateValue11 * 0.16666667163372039794921875;
    float productValue37 = productValue14 * 0.16666667163372039794921875;
    float productValue38 = productValue15 * 0.16666667163372039794921875;
    float productValue39 = ceil(spvNClamp(spvNMax(spvNMax(productValue36, productValue38), spvNMax(productValue37, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue36 / productValue39, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue37 / productValue39, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue38 / productValue39, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue39, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[13u].x - productValue2) * fragmentVectorConstants1.packedValues[13u].w) + productValue2) + (productValue11 * productValue11);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[13u].y - productValue9) * fragmentVectorConstants1.packedValues[13u].w) + productValue9) + (productValue12 * productValue12);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[13u].z - productValue10) * fragmentVectorConstants1.packedValues[13u].w) + productValue10) + (productValue22 * productValue22);
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue33 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue34))) : productValue33;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue33)) * ((productValue34 < 0.0) ? (-1.0) : 1.0)) : productValue34;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue62 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue38 = productValue15 * 0.16666667163372039794921875;
    float productValue63 = productValue16 * 0.16666667163372039794921875;
    float productValue64 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue63), spvNMax(productValue38, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue64, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue38 / productValue64, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue63 / productValue64, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue64, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[13u].x - productValue54) * fragmentVectorConstants1.packedValues[13u].w) + productValue54) + (productValue11 * productValue11);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[13u].y - productValue55) * fragmentVectorConstants1.packedValues[13u].w) + productValue55) + (productValue12 * productValue12);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[13u].z - productValue56) * fragmentVectorConstants1.packedValues[13u].w) + productValue56) + (productValue22 * productValue22);
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue36 = intermediateValue11 * 0.16666667163372039794921875;
    float productValue84 = productValue18 * 0.16666667163372039794921875;
    float productValue85 = productValue19 * 0.16666667163372039794921875;
    float productValue86 = ceil(spvNClamp(spvNMax(spvNMax(productValue36, productValue85), spvNMax(productValue84, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue36 / productValue86, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue84 / productValue86, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue85 / productValue86, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue86, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[30u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[14u].x - productValue77) * fragmentVectorConstants1.packedValues[14u].w) + productValue77) + (productValue80 * productValue80);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[14u].y - productValue78) * fragmentVectorConstants1.packedValues[14u].w) + productValue78) + (productValue81 * productValue81);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[14u].z - productValue79) * fragmentVectorConstants1.packedValues[14u].w) + productValue79) + (productValue82 * productValue82);
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue33 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue34))) : productValue33;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue33)) * ((productValue34 < 0.0) ? (-1.0) : 1.0)) : productValue34;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue45) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue46)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue45) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue46)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue62 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue85 = productValue19 * 0.16666667163372039794921875;
    float productValue105 = productValue20 * 0.16666667163372039794921875;
    float productValue106 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue105), spvNMax(productValue85, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue106, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue85 / productValue106, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue105 / productValue106, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue106, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[30u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[14u].x - productValue102) * fragmentVectorConstants1.packedValues[14u].w) + productValue102) + (productValue80 * productValue80);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[14u].y - productValue103) * fragmentVectorConstants1.packedValues[14u].w) + productValue103) + (productValue81 * productValue81);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[14u].z - productValue104) * fragmentVectorConstants1.packedValues[14u].w) + productValue104) + (productValue82 * productValue82);
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue45) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue46)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue45) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue46)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue121 = intermediateValue12 * 0.16666667163372039794921875;
    float productValue85 = productValue19 * 0.16666667163372039794921875;
    float productValue105 = productValue20 * 0.16666667163372039794921875;
    float productValue122 = ceil(spvNClamp(spvNMax(spvNMax(productValue121, productValue105), spvNMax(productValue85, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue121 / productValue122, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue85 / productValue122, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue105 / productValue122, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue122, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[30u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[14u].x - productValue110) * fragmentVectorConstants1.packedValues[14u].w) + productValue110) + (productValue113 * productValue113);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[14u].y - productValue111) * fragmentVectorConstants1.packedValues[14u].w) + productValue111) + (productValue114 * productValue114);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[14u].z - productValue112) * fragmentVectorConstants1.packedValues[14u].w) + productValue112) + (productValue115 * productValue115);
    fragmentColor1.w = (intermediateValue4 > intermediateValue7) ? ((intermediateValue4 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue7 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue9 ? (((productValue119 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue120))) : productValue119;
    fragmentColor2.y = conditionValue9 ? ((1.0 - abs(productValue119)) * ((productValue120 < 0.0) ? (-1.0) : 1.0)) : productValue120;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue45) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue46)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue45) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue46)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue62 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue105 = productValue20 * 0.16666667163372039794921875;
    float productValue137 = productValue21 * 0.16666667163372039794921875;
    float productValue138 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue137), spvNMax(productValue105, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue138, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue105 / productValue138, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue137 / productValue138, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue138, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[30u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = (((fragmentVectorConstants1.packedValues[14u].x - productValue134) * fragmentVectorConstants1.packedValues[14u].w) + productValue134) + (productValue113 * productValue113);
    fragmentColor1.y = (((fragmentVectorConstants1.packedValues[14u].y - productValue135) * fragmentVectorConstants1.packedValues[14u].w) + productValue135) + (productValue114 * productValue114);
    fragmentColor1.z = (((fragmentVectorConstants1.packedValues[14u].z - productValue136) * fragmentVectorConstants1.packedValues[14u].w) + productValue136) + (productValue115 * productValue115);
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue45) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue46)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue45) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue46)) * 0.5;
#endif
    discardIfRequested();
}
