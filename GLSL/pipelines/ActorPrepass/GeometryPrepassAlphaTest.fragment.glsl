#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
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
#if (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE2_FLOAT_2 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION2_FLOAT_7 1
#endif

#include "../../include/materials/ActorPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
    float reinterpretedBits1 = sampledTextureValue7.x * uintBitsToFloat(reinterpretedBits.x);
    float reinterpretedBits2 = sampledTextureValue7.y * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits3 = sampledTextureValue7.z * uintBitsToFloat(reinterpretedBits.z);
    float reinterpretedBits4 = sampledTextureValue7.w * uintBitsToFloat(reinterpretedBits.w);
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits10 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits9.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits9.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits9.z)));
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits12 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[85u])) - reinterpretedBits11)) * (reinterpretedBits10 - reinterpretedBits11), 0.0, 1.0);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[24u]);
    float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[86u]));
    float multiplyAddValue5 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits13.x)) / reinterpretedBits17) * reinterpretedBits17;
    float multiplyAddValue6 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits13.y)) / reinterpretedBits17) * reinterpretedBits17;
    float productValue39 = floor(multiplyAddValue6 * 0.25);
    float productValue40 = floor(multiplyAddValue6 * 0.5);
    float scalarValue9 = floor(multiplyAddValue6);
    if ((fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u])), fma(reinterpretedBits4, reinterpretedBits5, -reinterpretedBits4), reinterpretedBits4) < 0.5) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[100u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue5 * 0.25), 0.5, (productValue39 * productValue39) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue5 * 0.5), 0.5, (productValue40 * productValue40) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue5), 0.5, (scalarValue9 * scalarValue9) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits12 * reinterpretedBits12) * fma(reinterpretedBits12, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue17.x;
    float scalarValue28 = sampledTextureValue17.y;
    float scalarValue29 = sampledTextureValue17.z;
    float scalarValue30 = sampledTextureValue17.w;
    bool productValue65 = ((1.0 - scalarValue30) * (scalarValue29 + (scalarValue28 + scalarValue27))) > 0.0;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
    float multiplyAddValue39 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue7.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue40 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue7.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float multiplyAddValue41 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue7.z, -scalarValue29) + scalarValue29) : scalarValue29;
    float multiplyAddValue42 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue7.w, -scalarValue30) + scalarValue30) : scalarValue30;
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits10 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits9.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits9.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits9.z)));
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits12 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[85u])) - reinterpretedBits11)) * (reinterpretedBits10 - reinterpretedBits11), 0.0, 1.0);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[24u]);
    float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[86u]));
    float multiplyAddValue5 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits13.x)) / reinterpretedBits17) * reinterpretedBits17;
    float multiplyAddValue6 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits13.y)) / reinterpretedBits17) * reinterpretedBits17;
    float productValue39 = floor(multiplyAddValue6 * 0.25);
    float productValue40 = floor(multiplyAddValue6 * 0.5);
    float scalarValue9 = floor(multiplyAddValue6);
    if ((fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u])), fma(multiplyAddValue42, reinterpretedBits5, -multiplyAddValue42), multiplyAddValue42) < 0.5) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[100u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue5 * 0.25), 0.5, (productValue39 * productValue39) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue5 * 0.5), 0.5, (productValue40 * productValue40) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue5), 0.5, (scalarValue9 * scalarValue9) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits12 * reinterpretedBits12) * fma(reinterpretedBits12, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float reinterpretedBits44 = sampledTextureValue7.x * uintBitsToFloat(reinterpretedBits43.x);
    float reinterpretedBits45 = sampledTextureValue7.y * uintBitsToFloat(reinterpretedBits43.y);
    float reinterpretedBits46 = sampledTextureValue7.z * uintBitsToFloat(reinterpretedBits43.z);
    float reinterpretedBits47 = sampledTextureValue7.w * uintBitsToFloat(reinterpretedBits43.w);
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    float multiplyAddValue46 = rdDot4Precise2(vec4(reinterpretedBits44, reinterpretedBits45, reinterpretedBits46, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u])), fma(reinterpretedBits47, reinterpretedBits5, -reinterpretedBits47), reinterpretedBits47)), vec4(1.0));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits10 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits9.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits9.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits9.z)));
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits49 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits48)) * (reinterpretedBits10 - reinterpretedBits48), 0.0, 1.0);
    uvec4 reinterpretedBits50 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits51 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue47 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits50.x)) / reinterpretedBits51) * reinterpretedBits51;
    float multiplyAddValue48 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits50.y)) / reinterpretedBits51) * reinterpretedBits51;
    float productValue93 = floor(multiplyAddValue48 * 0.25);
    float productValue94 = floor(multiplyAddValue48 * 0.5);
    float scalarValue34 = floor(multiplyAddValue48);
    if ((multiplyAddValue46 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue47 * 0.25), 0.5, (productValue93 * productValue93) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue47 * 0.5), 0.5, (productValue94 * productValue94) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue47), 0.5, (scalarValue34 * scalarValue34) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits49 * reinterpretedBits49) * fma(reinterpretedBits49, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue17.x;
    float scalarValue28 = sampledTextureValue17.y;
    float scalarValue29 = sampledTextureValue17.z;
    float scalarValue30 = sampledTextureValue17.w;
    bool productValue65 = ((1.0 - scalarValue30) * (scalarValue29 + (scalarValue28 + scalarValue27))) > 0.0;
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float multiplyAddValue57 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits43.x), sampledTextureValue7.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue58 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits43.y), sampledTextureValue7.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float multiplyAddValue59 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits43.z), sampledTextureValue7.z, -scalarValue29) + scalarValue29) : scalarValue29;
    float multiplyAddValue60 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits43.w), sampledTextureValue7.w, -scalarValue30) + scalarValue30) : scalarValue30;
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    float multiplyAddValue61 = rdDot4Precise2(vec4(multiplyAddValue57, multiplyAddValue58, multiplyAddValue59, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u])), fma(multiplyAddValue60, reinterpretedBits5, -multiplyAddValue60), multiplyAddValue60)), vec4(1.0));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits10 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits9.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits9.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits9.z)));
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits49 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits48)) * (reinterpretedBits10 - reinterpretedBits48), 0.0, 1.0);
    uvec4 reinterpretedBits50 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits51 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue47 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits50.x)) / reinterpretedBits51) * reinterpretedBits51;
    float multiplyAddValue48 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits50.y)) / reinterpretedBits51) * reinterpretedBits51;
    float productValue93 = floor(multiplyAddValue48 * 0.25);
    float productValue94 = floor(multiplyAddValue48 * 0.5);
    float scalarValue34 = floor(multiplyAddValue48);
    if ((multiplyAddValue61 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue47 * 0.25), 0.5, (productValue93 * productValue93) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue47 * 0.5), 0.5, (productValue94 * productValue94) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue47), 0.5, (scalarValue34 * scalarValue34) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits49 * reinterpretedBits49) * fma(reinterpretedBits49, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float reinterpretedBits44 = sampledTextureValue7.x * uintBitsToFloat(reinterpretedBits43.x);
    float reinterpretedBits45 = sampledTextureValue7.y * uintBitsToFloat(reinterpretedBits43.y);
    float reinterpretedBits46 = sampledTextureValue7.z * uintBitsToFloat(reinterpretedBits43.z);
    float reinterpretedBits47 = sampledTextureValue7.w * uintBitsToFloat(reinterpretedBits43.w);
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    float multiplyAddValue65 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u])), fma(reinterpretedBits47, reinterpretedBits5, -reinterpretedBits47), reinterpretedBits47);
    float reinterpretedBits21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits10 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits9.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits9.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits9.z)));
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits49 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits48)) * (reinterpretedBits10 - reinterpretedBits48), 0.0, 1.0);
    uvec4 reinterpretedBits50 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits51 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue47 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits50.x)) / reinterpretedBits51) * reinterpretedBits51;
    float multiplyAddValue48 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits50.y)) / reinterpretedBits51) * reinterpretedBits51;
    float productValue93 = floor(multiplyAddValue48 * 0.25);
    float productValue94 = floor(multiplyAddValue48 * 0.5);
    float scalarValue34 = floor(multiplyAddValue48);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue47 * 0.25), 0.5, (productValue93 * productValue93) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue47 * 0.5), 0.5, (productValue94 * productValue94) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue47), 0.5, (scalarValue34 * scalarValue34) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits49 * reinterpretedBits49) * fma(reinterpretedBits49, -2.0, 3.0)))) || ((multiplyAddValue65 < reinterpretedBits21) || ((1.0 - reinterpretedBits21) < multiplyAddValue65)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue17.x;
    float scalarValue28 = sampledTextureValue17.y;
    float scalarValue29 = sampledTextureValue17.z;
    float scalarValue30 = sampledTextureValue17.w;
    bool productValue65 = ((1.0 - scalarValue30) * (scalarValue29 + (scalarValue28 + scalarValue27))) > 0.0;
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float multiplyAddValue57 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits43.x), sampledTextureValue7.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue58 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits43.y), sampledTextureValue7.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float multiplyAddValue59 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits43.z), sampledTextureValue7.z, -scalarValue29) + scalarValue29) : scalarValue29;
    float multiplyAddValue60 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits43.w), sampledTextureValue7.w, -scalarValue30) + scalarValue30) : scalarValue30;
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    float multiplyAddValue71 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u])), fma(multiplyAddValue60, reinterpretedBits5, -multiplyAddValue60), multiplyAddValue60);
    float reinterpretedBits21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits9 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits10 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits9.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits9.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits9.z)));
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits49 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits48)) * (reinterpretedBits10 - reinterpretedBits48), 0.0, 1.0);
    uvec4 reinterpretedBits50 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits51 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue47 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits50.x)) / reinterpretedBits51) * reinterpretedBits51;
    float multiplyAddValue48 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits50.y)) / reinterpretedBits51) * reinterpretedBits51;
    float productValue93 = floor(multiplyAddValue48 * 0.25);
    float productValue94 = floor(multiplyAddValue48 * 0.5);
    float scalarValue34 = floor(multiplyAddValue48);
    if (((multiplyAddValue71 < reinterpretedBits21) || ((1.0 - reinterpretedBits21) < multiplyAddValue71)) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue47 * 0.25), 0.5, (productValue93 * productValue93) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue47 * 0.5), 0.5, (productValue94 * productValue94) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue47), 0.5, (scalarValue34 * scalarValue34) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits49 * reinterpretedBits49) * fma(reinterpretedBits49, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float reinterpretedBits56 = sampledTextureValue7.x * uintBitsToFloat(reinterpretedBits55.x);
    float reinterpretedBits57 = sampledTextureValue7.y * uintBitsToFloat(reinterpretedBits55.y);
    float reinterpretedBits58 = sampledTextureValue7.z * uintBitsToFloat(reinterpretedBits55.z);
    float reinterpretedBits59 = sampledTextureValue7.w * uintBitsToFloat(reinterpretedBits55.w);
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits63 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)) * (reinterpretedBits61 - reinterpretedBits62), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue122 = floor(multiplyAddValue75 * 0.25);
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue124 = floor(multiplyAddValue75 * 0.5);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float scalarValue42 = floor(multiplyAddValue76);
    if ((fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u])), fma(reinterpretedBits59, reinterpretedBits60, -reinterpretedBits59), reinterpretedBits59) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(productValue122, 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(productValue124, 0.5, (productValue125 * productValue125) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits63 * reinterpretedBits63) * fma(reinterpretedBits63, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue17.x;
    float scalarValue28 = sampledTextureValue17.y;
    float scalarValue29 = sampledTextureValue17.z;
    float scalarValue30 = sampledTextureValue17.w;
    bool productValue65 = ((1.0 - scalarValue30) * (scalarValue29 + (scalarValue28 + scalarValue27))) > 0.0;
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float multiplyAddValue90 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.x), sampledTextureValue7.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue91 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.y), sampledTextureValue7.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float multiplyAddValue92 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.z), sampledTextureValue7.z, -scalarValue29) + scalarValue29) : scalarValue29;
    float multiplyAddValue93 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.w), sampledTextureValue7.w, -scalarValue30) + scalarValue30) : scalarValue30;
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits63 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)) * (reinterpretedBits61 - reinterpretedBits62), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue122 = floor(multiplyAddValue75 * 0.25);
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue124 = floor(multiplyAddValue75 * 0.5);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float scalarValue42 = floor(multiplyAddValue76);
    if ((fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u])), fma(multiplyAddValue93, reinterpretedBits60, -multiplyAddValue93), multiplyAddValue93) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(productValue122, 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(productValue124, 0.5, (productValue125 * productValue125) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits63 * reinterpretedBits63) * fma(reinterpretedBits63, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float reinterpretedBits56 = sampledTextureValue7.x * uintBitsToFloat(reinterpretedBits55.x);
    float reinterpretedBits57 = sampledTextureValue7.y * uintBitsToFloat(reinterpretedBits55.y);
    float reinterpretedBits58 = sampledTextureValue7.z * uintBitsToFloat(reinterpretedBits55.z);
    float reinterpretedBits59 = sampledTextureValue7.w * uintBitsToFloat(reinterpretedBits55.w);
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float multiplyAddValue106 = rdDot4Precise2(vec4(reinterpretedBits56, reinterpretedBits57, reinterpretedBits58, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u])), fma(reinterpretedBits59, reinterpretedBits60, -reinterpretedBits59), reinterpretedBits59)), vec4(1.0));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits63 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)) * (reinterpretedBits61 - reinterpretedBits62), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue124 = floor(multiplyAddValue75 * 0.5);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float multiplyAddValue101 = fract(fma(productValue124, 0.5, (productValue125 * productValue125) * 0.75));
    float multiplyAddValue102 = fma(fract(fma(floor(multiplyAddValue75 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, multiplyAddValue101);
    float scalarValue42 = floor(multiplyAddValue76);
    if ((multiplyAddValue106 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(multiplyAddValue102, 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits63 * reinterpretedBits63) * fma(reinterpretedBits63, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue17.x;
    float scalarValue28 = sampledTextureValue17.y;
    float scalarValue29 = sampledTextureValue17.z;
    float scalarValue30 = sampledTextureValue17.w;
    bool productValue65 = ((1.0 - scalarValue30) * (scalarValue29 + (scalarValue28 + scalarValue27))) > 0.0;
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float multiplyAddValue90 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.x), sampledTextureValue7.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue91 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.y), sampledTextureValue7.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float multiplyAddValue92 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.z), sampledTextureValue7.z, -scalarValue29) + scalarValue29) : scalarValue29;
    float multiplyAddValue93 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.w), sampledTextureValue7.w, -scalarValue30) + scalarValue30) : scalarValue30;
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float multiplyAddValue100 = rdDot4Precise2(vec4(multiplyAddValue90, multiplyAddValue91, multiplyAddValue92, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u])), fma(multiplyAddValue93, reinterpretedBits60, -multiplyAddValue93), multiplyAddValue93)), vec4(1.0));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits63 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)) * (reinterpretedBits61 - reinterpretedBits62), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue124 = floor(multiplyAddValue75 * 0.5);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float multiplyAddValue101 = fract(fma(productValue124, 0.5, (productValue125 * productValue125) * 0.75));
    float multiplyAddValue102 = fma(fract(fma(floor(multiplyAddValue75 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, multiplyAddValue101);
    float scalarValue42 = floor(multiplyAddValue76);
    if ((multiplyAddValue100 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(multiplyAddValue102, 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits63 * reinterpretedBits63) * fma(reinterpretedBits63, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float reinterpretedBits56 = sampledTextureValue7.x * uintBitsToFloat(reinterpretedBits55.x);
    float reinterpretedBits57 = sampledTextureValue7.y * uintBitsToFloat(reinterpretedBits55.y);
    float reinterpretedBits58 = sampledTextureValue7.z * uintBitsToFloat(reinterpretedBits55.z);
    float reinterpretedBits59 = sampledTextureValue7.w * uintBitsToFloat(reinterpretedBits55.w);
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float multiplyAddValue110 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u])), fma(reinterpretedBits59, reinterpretedBits60, -reinterpretedBits59), reinterpretedBits59);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits63 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)) * (reinterpretedBits61 - reinterpretedBits62), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue122 = floor(multiplyAddValue75 * 0.25);
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue124 = floor(multiplyAddValue75 * 0.5);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float scalarValue42 = floor(multiplyAddValue76);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(productValue122, 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(productValue124, 0.5, (productValue125 * productValue125) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits63 * reinterpretedBits63) * fma(reinterpretedBits63, -2.0, 3.0)))) || ((multiplyAddValue110 < reinterpretedBits11) || ((1.0 - reinterpretedBits11) < multiplyAddValue110)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue17.x;
    float scalarValue28 = sampledTextureValue17.y;
    float scalarValue29 = sampledTextureValue17.z;
    float scalarValue30 = sampledTextureValue17.w;
    bool productValue65 = ((1.0 - scalarValue30) * (scalarValue29 + (scalarValue28 + scalarValue27))) > 0.0;
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float multiplyAddValue90 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.x), sampledTextureValue7.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue91 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.y), sampledTextureValue7.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float multiplyAddValue92 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.z), sampledTextureValue7.z, -scalarValue29) + scalarValue29) : scalarValue29;
    float multiplyAddValue93 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.w), sampledTextureValue7.w, -scalarValue30) + scalarValue30) : scalarValue30;
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float multiplyAddValue114 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u])), fma(multiplyAddValue93, reinterpretedBits60, -multiplyAddValue93), multiplyAddValue93);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits63 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)) * (reinterpretedBits61 - reinterpretedBits62), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue122 = floor(multiplyAddValue75 * 0.25);
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue124 = floor(multiplyAddValue75 * 0.5);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float scalarValue42 = floor(multiplyAddValue76);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(productValue122, 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(productValue124, 0.5, (productValue125 * productValue125) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits63 * reinterpretedBits63) * fma(reinterpretedBits63, -2.0, 3.0)))) || ((multiplyAddValue114 < reinterpretedBits11) || ((1.0 - reinterpretedBits11) < multiplyAddValue114)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float reinterpretedBits56 = sampledTextureValue7.x * uintBitsToFloat(reinterpretedBits55.x);
    float reinterpretedBits57 = sampledTextureValue7.y * uintBitsToFloat(reinterpretedBits55.y);
    float reinterpretedBits76 = sampledTextureValue7.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[123u]));
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits63 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)) * (reinterpretedBits61 - reinterpretedBits62), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float scalarValue42 = floor(multiplyAddValue76);
    if ((fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u])), fma(reinterpretedBits76, reinterpretedBits60, -reinterpretedBits76), reinterpretedBits76) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue75 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue75 * 0.5), 0.5, (productValue125 * productValue125) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits63 * reinterpretedBits63) * fma(reinterpretedBits63, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue17.x;
    float scalarValue28 = sampledTextureValue17.y;
    float scalarValue30 = sampledTextureValue17.w;
    bool productValue170 = ((sampledTextureValue17.z + (scalarValue28 + scalarValue27)) * (1.0 - scalarValue30)) > 0.0;
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float multiplyAddValue127 = productValue170 ? (fma(uintBitsToFloat(reinterpretedBits55.x), sampledTextureValue7.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue128 = productValue170 ? (fma(uintBitsToFloat(reinterpretedBits55.y), sampledTextureValue7.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float multiplyAddValue129 = productValue170 ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[123u])), sampledTextureValue7.w, -scalarValue30) + scalarValue30) : scalarValue30;
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits63 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)) * (reinterpretedBits61 - reinterpretedBits62), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float scalarValue42 = floor(multiplyAddValue76);
    if ((fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u])), fma(multiplyAddValue129, reinterpretedBits60, -multiplyAddValue129), multiplyAddValue129) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue75 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue75 * 0.5), 0.5, (productValue125 * productValue125) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits63 * reinterpretedBits63) * fma(reinterpretedBits63, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float reinterpretedBits56 = sampledTextureValue7.x * uintBitsToFloat(reinterpretedBits55.x);
    float reinterpretedBits57 = sampledTextureValue7.y * uintBitsToFloat(reinterpretedBits55.y);
    float reinterpretedBits59 = sampledTextureValue7.w * uintBitsToFloat(reinterpretedBits55.w);
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float multiplyAddValue136 = rdDot4Precise2(vec4(reinterpretedBits56, reinterpretedBits57, sampledTextureValue7.z * uintBitsToFloat(reinterpretedBits55.z), fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u])), fma(reinterpretedBits59, reinterpretedBits60, -reinterpretedBits59), reinterpretedBits59)), vec4(1.0));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits84 = spvNClamp((reinterpretedBits61 - reinterpretedBits62) * (1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float scalarValue42 = floor(multiplyAddValue76);
    if ((multiplyAddValue136 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue75 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue75 * 0.5), 0.5, (productValue125 * productValue125) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits84 * reinterpretedBits84) * fma(reinterpretedBits84, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue17.x;
    float scalarValue28 = sampledTextureValue17.y;
    float scalarValue29 = sampledTextureValue17.z;
    float scalarValue30 = sampledTextureValue17.w;
    bool productValue65 = ((1.0 - scalarValue30) * (scalarValue29 + (scalarValue28 + scalarValue27))) > 0.0;
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float multiplyAddValue90 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.x), sampledTextureValue7.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue91 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.y), sampledTextureValue7.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float multiplyAddValue93 = productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.w), sampledTextureValue7.w, -scalarValue30) + scalarValue30) : scalarValue30;
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float multiplyAddValue143 = rdDot4Precise2(vec4(multiplyAddValue90, multiplyAddValue91, productValue65 ? (fma(uintBitsToFloat(reinterpretedBits55.z), sampledTextureValue7.z, -scalarValue29) + scalarValue29) : scalarValue29, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u])), fma(multiplyAddValue93, reinterpretedBits60, -multiplyAddValue93), multiplyAddValue93)), vec4(1.0));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits84 = spvNClamp((reinterpretedBits61 - reinterpretedBits62) * (1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float scalarValue42 = floor(multiplyAddValue76);
    if ((multiplyAddValue143 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue75 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue75 * 0.5), 0.5, (productValue125 * productValue125) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits84 * reinterpretedBits84) * fma(reinterpretedBits84, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float reinterpretedBits56 = sampledTextureValue7.x * uintBitsToFloat(reinterpretedBits55.x);
    float reinterpretedBits57 = sampledTextureValue7.y * uintBitsToFloat(reinterpretedBits55.y);
    float reinterpretedBits76 = sampledTextureValue7.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[123u]));
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float multiplyAddValue150 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u])), fma(reinterpretedBits76, reinterpretedBits60, -reinterpretedBits76), reinterpretedBits76);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits63 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)) * (reinterpretedBits61 - reinterpretedBits62), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float scalarValue42 = floor(multiplyAddValue76);
    if (((multiplyAddValue150 < reinterpretedBits11) || ((1.0 - reinterpretedBits11) < multiplyAddValue150)) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue75 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue75 * 0.5), 0.5, (productValue125 * productValue125) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits63 * reinterpretedBits63) * fma(reinterpretedBits63, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue17 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue27 = sampledTextureValue17.x;
    float scalarValue28 = sampledTextureValue17.y;
    float scalarValue30 = sampledTextureValue17.w;
    bool productValue170 = ((sampledTextureValue17.z + (scalarValue28 + scalarValue27)) * (1.0 - scalarValue30)) > 0.0;
    uvec4 reinterpretedBits55 = floatBitsToUint(fragmentVectorConstants1.packedValues[30u]);
    float multiplyAddValue127 = productValue170 ? (fma(uintBitsToFloat(reinterpretedBits55.x), sampledTextureValue7.x, -scalarValue27) + scalarValue27) : scalarValue27;
    float multiplyAddValue128 = productValue170 ? (fma(uintBitsToFloat(reinterpretedBits55.y), sampledTextureValue7.y, -scalarValue28) + scalarValue28) : scalarValue28;
    float multiplyAddValue129 = productValue170 ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[123u])), sampledTextureValue7.w, -scalarValue30) + scalarValue30) : scalarValue30;
    float reinterpretedBits60 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u]));
    float multiplyAddValue154 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u])), fma(multiplyAddValue129, reinterpretedBits60, -multiplyAddValue129), multiplyAddValue129);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits8 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits6, reinterpretedBits7, reinterpretedBits8);
    float scalarValue8 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue8 = inversesqrt(scalarValue8);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits61 = rdDot3Precise(vec3(-(inverseLengthValue8 * reinterpretedBits6), -(inverseLengthValue8 * reinterpretedBits7), -(inverseLengthValue8 * reinterpretedBits8)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits31.z)));
    float reinterpretedBits62 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[92u]));
    float reinterpretedBits63 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[93u])) - reinterpretedBits62)) * (reinterpretedBits61 - reinterpretedBits62), 0.0, 1.0);
    uvec4 reinterpretedBits64 = floatBitsToUint(fragmentVectorConstants1.packedValues[26u]);
    float reinterpretedBits65 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[94u]));
    float multiplyAddValue75 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.x)) / reinterpretedBits65) * reinterpretedBits65;
    float multiplyAddValue76 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits64.y)) / reinterpretedBits65) * reinterpretedBits65;
    float productValue123 = floor(multiplyAddValue76 * 0.25);
    float productValue125 = floor(multiplyAddValue76 * 0.5);
    float scalarValue42 = floor(multiplyAddValue76);
    if (((multiplyAddValue154 < reinterpretedBits11) || ((1.0 - reinterpretedBits11) < multiplyAddValue154)) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue75 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue75 * 0.5), 0.5, (productValue125 * productValue125) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue75), 0.5, (scalarValue42 * scalarValue42) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits63 * reinterpretedBits63) * fma(reinterpretedBits63, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.w * fragmentVectorConstants1.packedValues[28u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue16.x;
    float scalarValue24 = sampledTextureValue16.y;
    float scalarValue25 = sampledTextureValue16.z;
    float scalarValue26 = sampledTextureValue16.w;
    float productValue52 = float((((scalarValue23 + scalarValue24) + scalarValue25) * (1.0 - scalarValue26)) > 0.0);
    float productValue53 = (productValue52 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[28u].w) - scalarValue26)) + scalarValue26;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue71 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[29u].x;
    float productValue72 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[29u].y;
    float productValue73 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[29u].z;
    float productValue74 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[29u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue16.x;
    float scalarValue24 = sampledTextureValue16.y;
    float scalarValue25 = sampledTextureValue16.z;
    float scalarValue26 = sampledTextureValue16.w;
    float productValue52 = float((((scalarValue23 + scalarValue24) + scalarValue25) * (1.0 - scalarValue26)) > 0.0);
    float productValue84 = (productValue52 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[29u].x) - scalarValue23)) + scalarValue23;
    float productValue85 = (productValue52 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[29u].y) - scalarValue24)) + scalarValue24;
    float productValue86 = (productValue52 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[29u].z) - scalarValue25)) + scalarValue25;
    float productValue87 = (productValue52 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[29u].w) - scalarValue26)) + scalarValue26;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue74 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[29u].w;
    float productValue102 = (((fragmentVectorConstants1.packedValues[13u].w * productValue74) - productValue74) * fragmentVectorConstants1.packedValues[32u].x) + productValue74;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue16.x;
    float scalarValue24 = sampledTextureValue16.y;
    float scalarValue25 = sampledTextureValue16.z;
    float scalarValue26 = sampledTextureValue16.w;
    float productValue52 = float((((scalarValue23 + scalarValue24) + scalarValue25) * (1.0 - scalarValue26)) > 0.0);
    float productValue87 = (productValue52 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[29u].w) - scalarValue26)) + scalarValue26;
    float productValue107 = (((productValue87 * fragmentVectorConstants1.packedValues[13u].w) - productValue87) * fragmentVectorConstants1.packedValues[32u].x) + productValue87;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue112 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x;
    float productValue113 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y;
    float productValue114 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z;
    float productValue115 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue16.x;
    float scalarValue24 = sampledTextureValue16.y;
    float scalarValue25 = sampledTextureValue16.z;
    float scalarValue26 = sampledTextureValue16.w;
    float productValue52 = float((((scalarValue23 + scalarValue24) + scalarValue25) * (1.0 - scalarValue26)) > 0.0);
    float productValue128 = (productValue52 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x) - scalarValue23)) + scalarValue23;
    float productValue129 = (productValue52 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y) - scalarValue24)) + scalarValue24;
    float productValue130 = (productValue52 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z) - scalarValue25)) + scalarValue25;
    float productValue131 = (productValue52 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) - scalarValue26)) + scalarValue26;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue112 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x;
    float productValue113 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y;
    float productValue114 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z;
    float productValue115 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w;
    float productValue140 = (((fragmentVectorConstants1.packedValues[14u].w * productValue115) - productValue115) * fragmentVectorConstants1.packedValues[33u].x) + productValue115;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue16.x;
    float scalarValue24 = sampledTextureValue16.y;
    float scalarValue25 = sampledTextureValue16.z;
    float scalarValue26 = sampledTextureValue16.w;
    float productValue52 = float((((scalarValue23 + scalarValue24) + scalarValue25) * (1.0 - scalarValue26)) > 0.0);
    float productValue128 = (productValue52 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x) - scalarValue23)) + scalarValue23;
    float productValue129 = (productValue52 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y) - scalarValue24)) + scalarValue24;
    float productValue130 = (productValue52 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z) - scalarValue25)) + scalarValue25;
    float productValue131 = (productValue52 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) - scalarValue26)) + scalarValue26;
    float productValue142 = (((productValue131 * fragmentVectorConstants1.packedValues[14u].w) - productValue131) * fragmentVectorConstants1.packedValues[33u].x) + productValue131;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue112 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x;
    float productValue113 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y;
    float productValue115 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue16.x;
    float scalarValue24 = sampledTextureValue16.y;
    float scalarValue26 = sampledTextureValue16.w;
    float productValue158 = float((((scalarValue23 + scalarValue24) + sampledTextureValue16.z) * (1.0 - scalarValue26)) > 0.0);
    float productValue159 = (productValue158 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x) - scalarValue23)) + scalarValue23;
    float productValue160 = (productValue158 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y) - scalarValue24)) + scalarValue24;
    float productValue161 = (productValue158 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) - scalarValue26)) + scalarValue26;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue16.x;
    float scalarValue24 = sampledTextureValue16.y;
    float scalarValue25 = sampledTextureValue16.z;
    float scalarValue26 = sampledTextureValue16.w;
    float productValue52 = float((((scalarValue23 + scalarValue24) + scalarValue25) * (1.0 - scalarValue26)) > 0.0);
    float productValue128 = (productValue52 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x) - scalarValue23)) + scalarValue23;
    float productValue129 = (productValue52 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y) - scalarValue24)) + scalarValue24;
    float productValue131 = (productValue52 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) - scalarValue26)) + scalarValue26;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue112 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x;
    float productValue113 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y;
    float productValue115 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w;
    float productValue184 = (((fragmentVectorConstants1.packedValues[14u].w * productValue115) - productValue115) * fragmentVectorConstants1.packedValues[34u].x) + productValue115;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue16 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue23 = sampledTextureValue16.x;
    float scalarValue24 = sampledTextureValue16.y;
    float scalarValue26 = sampledTextureValue16.w;
    float productValue158 = float((((scalarValue23 + scalarValue24) + sampledTextureValue16.z) * (1.0 - scalarValue26)) > 0.0);
    float productValue159 = (productValue158 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[30u].x) - scalarValue23)) + scalarValue23;
    float productValue160 = (productValue158 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[30u].y) - scalarValue24)) + scalarValue24;
    float productValue161 = (productValue158 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[30u].w) - scalarValue26)) + scalarValue26;
    float productValue186 = (((productValue161 * fragmentVectorConstants1.packedValues[14u].w) - productValue161) * fragmentVectorConstants1.packedValues[34u].x) + productValue161;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[27u].x != 0.0)
#endif
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    float reinterpretedBits21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float multiplyAddValue7 = fma(reinterpretedBits21, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue8 = fma(reinterpretedBits21, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue22 = fma(reinterpretedBits21, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    fragmentColor1.x = fma(reinterpretedBits5, fma(-reinterpretedBits1, multiplyAddValue7, uintBitsToFloat(reinterpretedBits24.x)), reinterpretedBits1 * multiplyAddValue7);
    fragmentColor1.y = fma(reinterpretedBits5, fma(-reinterpretedBits2, multiplyAddValue8, uintBitsToFloat(reinterpretedBits24.y)), reinterpretedBits2 * multiplyAddValue8);
    fragmentColor1.z = fma(reinterpretedBits5, fma(-reinterpretedBits3, multiplyAddValue22, uintBitsToFloat(reinterpretedBits24.z)), reinterpretedBits3 * multiplyAddValue22);
    uint reinterpretedBits25 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[16u]))));
    bool comparisonValue7 = (reinterpretedBits25 & 16u) == 16u;
    bool comparisonValue8 = (reinterpretedBits25 & 4u) == 4u;
    bool comparisonValue9 = (reinterpretedBits25 & 8u) == 8u;
    float reinterpretedBits18;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((reinterpretedBits25 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits18 = ((reinterpretedBits25 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue14 = sampledTextureValue8.x;
        intermediateValue15 = sampledTextureValue8.z;
        intermediateValue16 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    float reinterpretedBits21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float multiplyAddValue7 = fma(reinterpretedBits21, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue8 = fma(reinterpretedBits21, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue22 = fma(reinterpretedBits21, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    fragmentColor1.x = fma(reinterpretedBits5, fma(-multiplyAddValue39, multiplyAddValue7, uintBitsToFloat(reinterpretedBits24.x)), multiplyAddValue39 * multiplyAddValue7);
    fragmentColor1.y = fma(reinterpretedBits5, fma(-multiplyAddValue40, multiplyAddValue8, uintBitsToFloat(reinterpretedBits24.y)), multiplyAddValue40 * multiplyAddValue8);
    fragmentColor1.z = fma(reinterpretedBits5, fma(-multiplyAddValue41, multiplyAddValue22, uintBitsToFloat(reinterpretedBits24.z)), multiplyAddValue41 * multiplyAddValue22);
    uint reinterpretedBits25 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[16u]))));
    bool comparisonValue7 = (reinterpretedBits25 & 16u) == 16u;
    bool comparisonValue8 = (reinterpretedBits25 & 4u) == 4u;
    bool comparisonValue9 = (reinterpretedBits25 & 8u) == 8u;
    float reinterpretedBits14;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((reinterpretedBits25 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits14 = ((reinterpretedBits25 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue20 = sampledTextureValue8.x;
        intermediateValue21 = sampledTextureValue8.z;
        intermediateValue22 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue49 = fma(reinterpretedBits11, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue50 = fma(reinterpretedBits11, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue51 = fma(reinterpretedBits11, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    fragmentColor1.x = fma(reinterpretedBits5, fma(-reinterpretedBits44, multiplyAddValue49, uintBitsToFloat(reinterpretedBits24.x)), reinterpretedBits44 * multiplyAddValue49);
    fragmentColor1.y = fma(reinterpretedBits5, fma(-reinterpretedBits45, multiplyAddValue50, uintBitsToFloat(reinterpretedBits24.y)), reinterpretedBits45 * multiplyAddValue50);
    fragmentColor1.z = fma(reinterpretedBits5, fma(-reinterpretedBits46, multiplyAddValue51, uintBitsToFloat(reinterpretedBits24.z)), reinterpretedBits46 * multiplyAddValue51);
    uint reinterpretedBits25 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[16u]))));
    bool comparisonValue7 = (reinterpretedBits25 & 16u) == 16u;
    bool comparisonValue8 = (reinterpretedBits25 & 4u) == 4u;
    bool comparisonValue9 = (reinterpretedBits25 & 8u) == 8u;
    float reinterpretedBits18;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if ((reinterpretedBits25 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits18 = ((reinterpretedBits25 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue16 = sampledTextureValue8.x;
        intermediateValue17 = sampledTextureValue8.z;
        intermediateValue18 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue49 = fma(reinterpretedBits11, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue50 = fma(reinterpretedBits11, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue51 = fma(reinterpretedBits11, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    fragmentColor1.x = fma(reinterpretedBits5, fma(-multiplyAddValue57, multiplyAddValue49, uintBitsToFloat(reinterpretedBits24.x)), multiplyAddValue57 * multiplyAddValue49);
    fragmentColor1.y = fma(reinterpretedBits5, fma(-multiplyAddValue58, multiplyAddValue50, uintBitsToFloat(reinterpretedBits24.y)), multiplyAddValue58 * multiplyAddValue50);
    fragmentColor1.z = fma(reinterpretedBits5, fma(-multiplyAddValue59, multiplyAddValue51, uintBitsToFloat(reinterpretedBits24.z)), multiplyAddValue59 * multiplyAddValue51);
    uint reinterpretedBits25 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[16u]))));
    bool comparisonValue7 = (reinterpretedBits25 & 16u) == 16u;
    bool comparisonValue8 = (reinterpretedBits25 & 4u) == 4u;
    bool comparisonValue9 = (reinterpretedBits25 & 8u) == 8u;
    float reinterpretedBits14;
    float intermediateValue22;
    float intermediateValue23;
    float intermediateValue24;
    if ((reinterpretedBits25 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits14 = ((reinterpretedBits25 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue22 = sampledTextureValue8.x;
        intermediateValue23 = sampledTextureValue8.z;
        intermediateValue24 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue49 = fma(reinterpretedBits11, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue50 = fma(reinterpretedBits11, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue51 = fma(reinterpretedBits11, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    fragmentColor1.x = fma(reinterpretedBits5, fma(-reinterpretedBits44, multiplyAddValue49, uintBitsToFloat(reinterpretedBits24.x)), reinterpretedBits44 * multiplyAddValue49);
    fragmentColor1.y = fma(reinterpretedBits5, fma(-reinterpretedBits45, multiplyAddValue50, uintBitsToFloat(reinterpretedBits24.y)), reinterpretedBits45 * multiplyAddValue50);
    fragmentColor1.z = fma(reinterpretedBits5, fma(-reinterpretedBits46, multiplyAddValue51, uintBitsToFloat(reinterpretedBits24.z)), reinterpretedBits46 * multiplyAddValue51);
    uint reinterpretedBits25 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[16u]))));
    bool comparisonValue7 = (reinterpretedBits25 & 16u) == 16u;
    bool comparisonValue8 = (reinterpretedBits25 & 4u) == 4u;
    bool comparisonValue9 = (reinterpretedBits25 & 8u) == 8u;
    float reinterpretedBits19;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((reinterpretedBits25 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits19 = ((reinterpretedBits25 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue14 = sampledTextureValue8.x;
        intermediateValue15 = sampledTextureValue8.z;
        intermediateValue16 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue49 = fma(reinterpretedBits11, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue50 = fma(reinterpretedBits11, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue51 = fma(reinterpretedBits11, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    fragmentColor1.x = fma(reinterpretedBits5, fma(-multiplyAddValue57, multiplyAddValue49, uintBitsToFloat(reinterpretedBits24.x)), multiplyAddValue57 * multiplyAddValue49);
    fragmentColor1.y = fma(reinterpretedBits5, fma(-multiplyAddValue58, multiplyAddValue50, uintBitsToFloat(reinterpretedBits24.y)), multiplyAddValue58 * multiplyAddValue50);
    fragmentColor1.z = fma(reinterpretedBits5, fma(-multiplyAddValue59, multiplyAddValue51, uintBitsToFloat(reinterpretedBits24.z)), multiplyAddValue59 * multiplyAddValue51);
    uint reinterpretedBits25 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[16u]))));
    bool comparisonValue7 = (reinterpretedBits25 & 16u) == 16u;
    bool comparisonValue8 = (reinterpretedBits25 & 4u) == 4u;
    bool comparisonValue9 = (reinterpretedBits25 & 8u) == 8u;
    float reinterpretedBits15;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((reinterpretedBits25 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits15 = ((reinterpretedBits25 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue20 = sampledTextureValue8.x;
        intermediateValue21 = sampledTextureValue8.z;
        intermediateValue22 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue77 = fma(reinterpretedBits59, fma(reinterpretedBits56, uintBitsToFloat(reinterpretedBits66.x), -reinterpretedBits56), reinterpretedBits56);
    float multiplyAddValue78 = fma(reinterpretedBits59, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits66.y), -reinterpretedBits57), reinterpretedBits57);
    float multiplyAddValue79 = fma(reinterpretedBits59, fma(reinterpretedBits58, uintBitsToFloat(reinterpretedBits66.z), -reinterpretedBits58), reinterpretedBits58);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue77, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue77 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue78, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue78 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue79, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue79 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits19;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits19 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue14 = sampledTextureValue8.x;
        intermediateValue15 = sampledTextureValue8.z;
        intermediateValue16 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue94 = fma(multiplyAddValue93, fma(multiplyAddValue90, uintBitsToFloat(reinterpretedBits66.x), -multiplyAddValue90), multiplyAddValue90);
    float multiplyAddValue95 = fma(multiplyAddValue93, fma(multiplyAddValue91, uintBitsToFloat(reinterpretedBits66.y), -multiplyAddValue91), multiplyAddValue91);
    float multiplyAddValue96 = fma(multiplyAddValue93, fma(multiplyAddValue92, uintBitsToFloat(reinterpretedBits66.z), -multiplyAddValue92), multiplyAddValue92);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue94, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue94 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue95, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue95 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue96, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue96 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits15;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits15 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue20 = sampledTextureValue8.x;
        intermediateValue21 = sampledTextureValue8.z;
        intermediateValue22 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue77 = fma(reinterpretedBits59, fma(reinterpretedBits56, uintBitsToFloat(reinterpretedBits66.x), -reinterpretedBits56), reinterpretedBits56);
    float multiplyAddValue78 = fma(reinterpretedBits59, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits66.y), -reinterpretedBits57), reinterpretedBits57);
    float multiplyAddValue79 = fma(reinterpretedBits59, fma(reinterpretedBits58, uintBitsToFloat(reinterpretedBits66.z), -reinterpretedBits58), reinterpretedBits58);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue77, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue77 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue78, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue78 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue79, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue79 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits19;
    float intermediateValue16;
    float intermediateValue17;
    float intermediateValue18;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits19 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue16 = sampledTextureValue8.x;
        intermediateValue17 = sampledTextureValue8.z;
        intermediateValue18 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue94 = fma(multiplyAddValue93, fma(multiplyAddValue90, uintBitsToFloat(reinterpretedBits66.x), -multiplyAddValue90), multiplyAddValue90);
    float multiplyAddValue95 = fma(multiplyAddValue93, fma(multiplyAddValue91, uintBitsToFloat(reinterpretedBits66.y), -multiplyAddValue91), multiplyAddValue91);
    float multiplyAddValue96 = fma(multiplyAddValue93, fma(multiplyAddValue92, uintBitsToFloat(reinterpretedBits66.z), -multiplyAddValue92), multiplyAddValue92);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue94, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue94 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue95, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue95 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue96, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue96 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits15;
    float intermediateValue22;
    float intermediateValue23;
    float intermediateValue24;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits15 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue22 = sampledTextureValue8.x;
        intermediateValue23 = sampledTextureValue8.z;
        intermediateValue24 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue77 = fma(reinterpretedBits59, fma(reinterpretedBits56, uintBitsToFloat(reinterpretedBits66.x), -reinterpretedBits56), reinterpretedBits56);
    float multiplyAddValue78 = fma(reinterpretedBits59, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits66.y), -reinterpretedBits57), reinterpretedBits57);
    float multiplyAddValue79 = fma(reinterpretedBits59, fma(reinterpretedBits58, uintBitsToFloat(reinterpretedBits66.z), -reinterpretedBits58), reinterpretedBits58);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue77, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue77 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue78, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue78 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue79, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue79 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits20;
    float intermediateValue14;
    float intermediateValue15;
    float intermediateValue16;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits20 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue14 = sampledTextureValue8.x;
        intermediateValue15 = sampledTextureValue8.z;
        intermediateValue16 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue94 = fma(multiplyAddValue93, fma(multiplyAddValue90, uintBitsToFloat(reinterpretedBits66.x), -multiplyAddValue90), multiplyAddValue90);
    float multiplyAddValue95 = fma(multiplyAddValue93, fma(multiplyAddValue91, uintBitsToFloat(reinterpretedBits66.y), -multiplyAddValue91), multiplyAddValue91);
    float multiplyAddValue96 = fma(multiplyAddValue93, fma(multiplyAddValue92, uintBitsToFloat(reinterpretedBits66.z), -multiplyAddValue92), multiplyAddValue92);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue94, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue94 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue95, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue95 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue96, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue96 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits16;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits16 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue20 = sampledTextureValue8.x;
        intermediateValue21 = sampledTextureValue8.z;
        intermediateValue22 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits77 = reinterpretedBits56 * uintBitsToFloat(reinterpretedBits66.x);
    float reinterpretedBits78 = reinterpretedBits56 * uintBitsToFloat(reinterpretedBits66.y);
    float reinterpretedBits79 = reinterpretedBits56 * uintBitsToFloat(reinterpretedBits66.z);
    float scalarValue52 = ceil(reinterpretedBits57);
    uvec4 reinterpretedBits80 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue121 = fma(scalarValue52, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits80.x), -reinterpretedBits77), reinterpretedBits77);
    float multiplyAddValue122 = fma(scalarValue52, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits80.y), -reinterpretedBits78), reinterpretedBits78);
    float multiplyAddValue123 = fma(scalarValue52, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits80.z), -reinterpretedBits79), reinterpretedBits79);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue121, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue121 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue122, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue122 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue123, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue123 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits22;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits22 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue15 = sampledTextureValue8.x;
        intermediateValue16 = sampledTextureValue8.z;
        intermediateValue17 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits81 = multiplyAddValue127 * uintBitsToFloat(reinterpretedBits66.x);
    float reinterpretedBits82 = multiplyAddValue127 * uintBitsToFloat(reinterpretedBits66.y);
    float reinterpretedBits83 = multiplyAddValue127 * uintBitsToFloat(reinterpretedBits66.z);
    float scalarValue54 = ceil(multiplyAddValue128);
    uvec4 reinterpretedBits80 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue130 = fma(scalarValue54, fma(multiplyAddValue128, uintBitsToFloat(reinterpretedBits80.x), -reinterpretedBits81), reinterpretedBits81);
    float multiplyAddValue131 = fma(scalarValue54, fma(multiplyAddValue128, uintBitsToFloat(reinterpretedBits80.y), -reinterpretedBits82), reinterpretedBits82);
    float multiplyAddValue132 = fma(scalarValue54, fma(multiplyAddValue128, uintBitsToFloat(reinterpretedBits80.z), -reinterpretedBits83), reinterpretedBits83);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue130, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue130 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue131, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue131 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue132, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue132 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits19;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits19 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue20 = sampledTextureValue8.x;
        intermediateValue21 = sampledTextureValue8.z;
        intermediateValue22 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits77 = reinterpretedBits56 * uintBitsToFloat(reinterpretedBits66.x);
    float reinterpretedBits78 = reinterpretedBits56 * uintBitsToFloat(reinterpretedBits66.y);
    float reinterpretedBits79 = reinterpretedBits56 * uintBitsToFloat(reinterpretedBits66.z);
    float scalarValue52 = ceil(reinterpretedBits57);
    uvec4 reinterpretedBits80 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue121 = fma(scalarValue52, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits80.x), -reinterpretedBits77), reinterpretedBits77);
    float multiplyAddValue122 = fma(scalarValue52, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits80.y), -reinterpretedBits78), reinterpretedBits78);
    float multiplyAddValue123 = fma(scalarValue52, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits80.z), -reinterpretedBits79), reinterpretedBits79);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue121, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue121 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue122, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue122 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue123, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue123 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits22;
    float intermediateValue17;
    float intermediateValue18;
    float intermediateValue19;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits22 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue17 = sampledTextureValue8.x;
        intermediateValue18 = sampledTextureValue8.z;
        intermediateValue19 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits85 = multiplyAddValue90 * uintBitsToFloat(reinterpretedBits66.x);
    float reinterpretedBits86 = multiplyAddValue90 * uintBitsToFloat(reinterpretedBits66.y);
    float reinterpretedBits87 = multiplyAddValue90 * uintBitsToFloat(reinterpretedBits66.z);
    float scalarValue58 = ceil(multiplyAddValue91);
    uvec4 reinterpretedBits80 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue144 = fma(scalarValue58, fma(multiplyAddValue91, uintBitsToFloat(reinterpretedBits80.x), -reinterpretedBits85), reinterpretedBits85);
    float multiplyAddValue145 = fma(scalarValue58, fma(multiplyAddValue91, uintBitsToFloat(reinterpretedBits80.y), -reinterpretedBits86), reinterpretedBits86);
    float multiplyAddValue146 = fma(scalarValue58, fma(multiplyAddValue91, uintBitsToFloat(reinterpretedBits80.z), -reinterpretedBits87), reinterpretedBits87);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue144, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue144 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue145, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue145 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue146, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue146 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits19;
    float intermediateValue23;
    float intermediateValue24;
    float intermediateValue25;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits19 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue23 = sampledTextureValue8.x;
        intermediateValue24 = sampledTextureValue8.z;
        intermediateValue25 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits77 = reinterpretedBits56 * uintBitsToFloat(reinterpretedBits66.x);
    float reinterpretedBits78 = reinterpretedBits56 * uintBitsToFloat(reinterpretedBits66.y);
    float reinterpretedBits79 = reinterpretedBits56 * uintBitsToFloat(reinterpretedBits66.z);
    float scalarValue52 = ceil(reinterpretedBits57);
    uvec4 reinterpretedBits80 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue121 = fma(scalarValue52, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits80.x), -reinterpretedBits77), reinterpretedBits77);
    float multiplyAddValue122 = fma(scalarValue52, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits80.y), -reinterpretedBits78), reinterpretedBits78);
    float multiplyAddValue123 = fma(scalarValue52, fma(reinterpretedBits57, uintBitsToFloat(reinterpretedBits80.z), -reinterpretedBits79), reinterpretedBits79);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue121, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue121 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue122, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue122 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue123, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue123 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits23;
    float intermediateValue15;
    float intermediateValue16;
    float intermediateValue17;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits23 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue15 = sampledTextureValue8.x;
        intermediateValue16 = sampledTextureValue8.z;
        intermediateValue17 = sampledTextureValue8.y;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        isFragmentDiscarded = true;
    }
    uvec4 reinterpretedBits66 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits81 = multiplyAddValue127 * uintBitsToFloat(reinterpretedBits66.x);
    float reinterpretedBits82 = multiplyAddValue127 * uintBitsToFloat(reinterpretedBits66.y);
    float reinterpretedBits83 = multiplyAddValue127 * uintBitsToFloat(reinterpretedBits66.z);
    float scalarValue54 = ceil(multiplyAddValue128);
    uvec4 reinterpretedBits80 = floatBitsToUint(fragmentVectorConstants1.packedValues[31u]);
    float multiplyAddValue130 = fma(scalarValue54, fma(multiplyAddValue128, uintBitsToFloat(reinterpretedBits80.x), -reinterpretedBits81), reinterpretedBits81);
    float multiplyAddValue131 = fma(scalarValue54, fma(multiplyAddValue128, uintBitsToFloat(reinterpretedBits80.y), -reinterpretedBits82), reinterpretedBits82);
    float multiplyAddValue132 = fma(scalarValue54, fma(multiplyAddValue128, uintBitsToFloat(reinterpretedBits80.z), -reinterpretedBits83), reinterpretedBits83);
    float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float multiplyAddValue80 = fma(reinterpretedBits48, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue81 = fma(reinterpretedBits48, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue82 = fma(reinterpretedBits48, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    fragmentColor1.x = fma(reinterpretedBits60, fma(-multiplyAddValue130, multiplyAddValue80, uintBitsToFloat(reinterpretedBits35.x)), multiplyAddValue130 * multiplyAddValue80);
    fragmentColor1.y = fma(reinterpretedBits60, fma(-multiplyAddValue131, multiplyAddValue81, uintBitsToFloat(reinterpretedBits35.y)), multiplyAddValue131 * multiplyAddValue81);
    fragmentColor1.z = fma(reinterpretedBits60, fma(-multiplyAddValue132, multiplyAddValue82, uintBitsToFloat(reinterpretedBits35.z)), multiplyAddValue132 * multiplyAddValue82);
    uint reinterpretedBits67 = uint(int(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[20u]))));
    bool comparisonValue31 = (reinterpretedBits67 & 16u) == 16u;
    bool comparisonValue32 = (reinterpretedBits67 & 4u) == 4u;
    bool comparisonValue33 = (reinterpretedBits67 & 8u) == 8u;
    float reinterpretedBits20;
    float intermediateValue20;
    float intermediateValue21;
    float intermediateValue22;
    if ((reinterpretedBits67 & 1u) == 1u)
    {
        vec4 sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        reinterpretedBits20 = ((reinterpretedBits67 & 2u) == 2u) ? sampledTextureValue8.w : uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue20 = sampledTextureValue8.x;
        intermediateValue21 = sampledTextureValue8.z;
        intermediateValue22 = sampledTextureValue8.y;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[21u].x) / (fragmentVectorConstants1.packedValues[21u].y - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].x) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].y) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float productValue1 = floor(quotientValue1 * 0.25);
        float productValue2 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue2 * productValue2) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue1 * productValue1) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)));
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[22u].x) / (fragmentVectorConstants1.packedValues[22u].y - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
        float quotientValue6 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float quotientValue7 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float productValue75 = floor(quotientValue7 * 0.25);
        float productValue76 = floor(quotientValue7 * 0.5);
        float scalarValue33 = floor(quotientValue7);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue76 * productValue76) * 0.75) + (floor(quotientValue6 * 0.5) * 0.5)) + (fract(((productValue75 * productValue75) * 0.75) + (floor(quotientValue6 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue33 * scalarValue33) * 0.75) + (floor(quotientValue6) * 0.5)));
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[23u].x) / (fragmentVectorConstants1.packedValues[23u].y - fragmentVectorConstants1.packedValues[23u].x), 0.0, 1.0);
        float quotientValue9 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[26u].x) / fragmentVectorConstants1.packedValues[23u].z) * fragmentVectorConstants1.packedValues[23u].z;
        float quotientValue10 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[26u].y) / fragmentVectorConstants1.packedValues[23u].z) * fragmentVectorConstants1.packedValues[23u].z;
        float productValue116 = floor(quotientValue10 * 0.25);
        float productValue117 = floor(quotientValue10 * 0.5);
        float scalarValue39 = floor(quotientValue10);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue117 * productValue117) * 0.75) + (floor(quotientValue9 * 0.5) * 0.5)) + (fract(((productValue116 * productValue116) * 0.75) + (floor(quotientValue9 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue39 * scalarValue39) * 0.75) + (floor(quotientValue9) * 0.5)));
#endif
    }
    else
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
        intermediateValue15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
        intermediateValue16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
        intermediateValue21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
        intermediateValue17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
        intermediateValue23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
        intermediateValue15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[120u]));
        intermediateValue21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[136u]));
        intermediateValue20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[124u]));
        intermediateValue21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue18 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits19 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue24 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue25 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits23 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        reinterpretedBits20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[140u]));
        intermediateValue20 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[128u]));
        intermediateValue21 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[132u]));
        intermediateValue22 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        comparisonValue = false;
#endif
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue3;
    float productValue4;
    float productValue5;
    if (comparisonValue7 || (comparisonValue9 || comparisonValue8))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue4;
    float productValue5;
    float productValue6;
    if (comparisonValue7 || (comparisonValue9 || comparisonValue8))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue5;
    float productValue6;
    float productValue7;
    if (comparisonValue7 || (comparisonValue9 || comparisonValue8))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue5;
    float productValue6;
    float productValue7;
    if (comparisonValue31 || (comparisonValue33 || comparisonValue32))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue6;
    float productValue7;
    float productValue8;
    if (comparisonValue31 || (comparisonValue33 || comparisonValue32))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue3;
    float productValue4;
    float productValue5;
    if (comparisonValue31 || (comparisonValue33 || comparisonValue32))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue4;
    float productValue5;
    float productValue6;
    if (comparisonValue31 || (comparisonValue33 || comparisonValue32))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((((((fragmentVectorConstants1.packedValues[13u].w * productValue) - productValue) * fragmentVectorConstants1.packedValues[31u].x) + productValue) < 0.5) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((((((productValue53 * fragmentVectorConstants1.packedValues[13u].w) - productValue53) * fragmentVectorConstants1.packedValues[31u].x) + productValue53) < 0.5) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((dot(vec4(productValue71, productValue72, productValue73, (((fragmentVectorConstants1.packedValues[13u].w * productValue74) - productValue74) * fragmentVectorConstants1.packedValues[32u].x) + productValue74), vec4(1.0)) < fragmentVectorConstants1.packedValues[20u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((dot(vec4(productValue84, productValue85, productValue86, (((productValue87 * fragmentVectorConstants1.packedValues[13u].w) - productValue87) * fragmentVectorConstants1.packedValues[32u].x) + productValue87), vec4(1.0)) < fragmentVectorConstants1.packedValues[20u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((productValue102 < fragmentVectorConstants1.packedValues[20u].x) || (productValue102 > (1.0 - fragmentVectorConstants1.packedValues[20u].x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((productValue107 < fragmentVectorConstants1.packedValues[20u].x) || (productValue107 > (1.0 - fragmentVectorConstants1.packedValues[20u].x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((((((fragmentVectorConstants1.packedValues[14u].w * productValue115) - productValue115) * fragmentVectorConstants1.packedValues[33u].x) + productValue115) < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((((((productValue131 * fragmentVectorConstants1.packedValues[14u].w) - productValue131) * fragmentVectorConstants1.packedValues[33u].x) + productValue131) < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((dot(vec4(productValue112, productValue113, productValue114, (((fragmentVectorConstants1.packedValues[14u].w * productValue115) - productValue115) * fragmentVectorConstants1.packedValues[33u].x) + productValue115), vec4(1.0)) < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((dot(vec4(productValue128, productValue129, productValue130, (((productValue131 * fragmentVectorConstants1.packedValues[14u].w) - productValue131) * fragmentVectorConstants1.packedValues[33u].x) + productValue131), vec4(1.0)) < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((productValue140 < fragmentVectorConstants1.packedValues[21u].x) || (productValue140 > (1.0 - fragmentVectorConstants1.packedValues[21u].x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((productValue142 < fragmentVectorConstants1.packedValues[21u].x) || (productValue142 > (1.0 - fragmentVectorConstants1.packedValues[21u].x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((((((fragmentVectorConstants1.packedValues[14u].w * productValue115) - productValue115) * fragmentVectorConstants1.packedValues[34u].x) + productValue115) < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((((((productValue161 * fragmentVectorConstants1.packedValues[14u].w) - productValue161) * fragmentVectorConstants1.packedValues[34u].x) + productValue161) < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((dot(vec4(productValue112, productValue113, sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z, (((fragmentVectorConstants1.packedValues[14u].w * productValue115) - productValue115) * fragmentVectorConstants1.packedValues[34u].x) + productValue115), vec4(1.0)) < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    if ((dot(vec4(productValue128, productValue129, (productValue52 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[30u].z) - scalarValue25)) + scalarValue25, (((productValue131 * fragmentVectorConstants1.packedValues[14u].w) - productValue131) * fragmentVectorConstants1.packedValues[34u].x) + productValue131), vec4(1.0)) < fragmentVectorConstants1.packedValues[21u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((productValue184 < fragmentVectorConstants1.packedValues[21u].x) || (productValue184 > (1.0 - fragmentVectorConstants1.packedValues[21u].x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    if (((productValue186 < fragmentVectorConstants1.packedValues[21u].x) || (productValue186 > (1.0 - fragmentVectorConstants1.packedValues[21u].x))) || comparisonValue)
#endif
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue9;
        float multiplyAddValue10;
        float multiplyAddValue11;
        bool intermediateValue20;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue26;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue10;
        float multiplyAddValue11;
        float multiplyAddValue12;
        bool intermediateValue22;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue14;
        float multiplyAddValue15;
        float multiplyAddValue16;
        bool intermediateValue28;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue10;
        float multiplyAddValue11;
        float multiplyAddValue12;
        bool intermediateValue20;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue14;
        float multiplyAddValue15;
        float multiplyAddValue16;
        bool intermediateValue26;
        if (comparisonValue8)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue12;
        float multiplyAddValue13;
        float multiplyAddValue14;
        bool intermediateValue20;
        if (comparisonValue32)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue16;
        float multiplyAddValue17;
        float multiplyAddValue18;
        bool intermediateValue26;
        if (comparisonValue32)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        bool intermediateValue22;
        if (comparisonValue32)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue19;
        float multiplyAddValue20;
        float multiplyAddValue21;
        bool intermediateValue28;
        if (comparisonValue32)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue20;
        if (comparisonValue32)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue17;
        float multiplyAddValue18;
        float multiplyAddValue19;
        bool intermediateValue26;
        if (comparisonValue32)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue12;
        float multiplyAddValue13;
        float multiplyAddValue14;
        bool intermediateValue21;
        if (comparisonValue32)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue15;
        float multiplyAddValue16;
        float multiplyAddValue17;
        bool intermediateValue26;
        if (comparisonValue32)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue23;
        if (comparisonValue32)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue16;
        float multiplyAddValue17;
        float multiplyAddValue18;
        bool intermediateValue29;
        if (comparisonValue32)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        float multiplyAddValue13;
        float multiplyAddValue14;
        float multiplyAddValue15;
        bool intermediateValue21;
        if (comparisonValue32)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue9 = (sampledTextureValue.x * fragmentVectorConstants1.packedValues[28u].x) * ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue10 = (sampledTextureValue.y * fragmentVectorConstants1.packedValues[28u].y) * ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue11 = (sampledTextureValue.z * fragmentVectorConstants1.packedValues[28u].z) * ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue1 = uint(int(fragmentVectorConstants1.packedValues[4u].x));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue3 = fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[26u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[32u].x;
    }
    else
    {
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue3 = sampledTextureValue1.x;
        intermediateValue4 = sampledTextureValue1.y;
        intermediateValue5 = sampledTextureValue1.z;
        intermediateValue6 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[32u].x;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue54 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((productValue52 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[28u].x) - scalarValue23)) + scalarValue23);
    float productValue55 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((productValue52 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[28u].y) - scalarValue24)) + scalarValue24);
    float productValue56 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((productValue52 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[28u].z) - scalarValue25)) + scalarValue25);
    uint scalarValue1 = uint(int(fragmentVectorConstants1.packedValues[4u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue7 = fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[26u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[32u].x;
    }
    else
    {
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue1.x;
        intermediateValue8 = sampledTextureValue1.y;
        intermediateValue9 = sampledTextureValue1.z;
        intermediateValue10 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[32u].x;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue77 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue71;
    float productValue78 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue72;
    float productValue79 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue73;
    uint scalarValue1 = uint(int(fragmentVectorConstants1.packedValues[4u].x));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue3 = fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[33u].x;
    }
    else
    {
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue3 = sampledTextureValue1.x;
        intermediateValue4 = sampledTextureValue1.y;
        intermediateValue5 = sampledTextureValue1.z;
        intermediateValue6 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[33u].x;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue88 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue84;
    float productValue89 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue85;
    float productValue90 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue86;
    uint scalarValue1 = uint(int(fragmentVectorConstants1.packedValues[4u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue7 = fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[33u].x;
    }
    else
    {
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue1.x;
        intermediateValue8 = sampledTextureValue1.y;
        intermediateValue9 = sampledTextureValue1.z;
        intermediateValue10 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[33u].x;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue103 = (sampledTextureValue.x * fragmentVectorConstants1.packedValues[29u].x) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue104 = (sampledTextureValue.y * fragmentVectorConstants1.packedValues[29u].y) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue105 = (sampledTextureValue.z * fragmentVectorConstants1.packedValues[29u].z) * ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue1 = uint(int(fragmentVectorConstants1.packedValues[4u].x));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue3 = fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[33u].x;
    }
    else
    {
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue3 = sampledTextureValue1.x;
        intermediateValue4 = sampledTextureValue1.y;
        intermediateValue5 = sampledTextureValue1.z;
        intermediateValue6 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[33u].x;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue108 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((productValue52 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[29u].x) - scalarValue23)) + scalarValue23);
    float productValue109 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((productValue52 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[29u].y) - scalarValue24)) + scalarValue24);
    float productValue110 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((productValue52 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[29u].z) - scalarValue25)) + scalarValue25);
    uint scalarValue1 = uint(int(fragmentVectorConstants1.packedValues[4u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue1 & 1u) == 0u)
    {
        intermediateValue7 = fragmentVectorConstants1.packedValues[30u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[33u].x;
    }
    else
    {
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue1.x;
        intermediateValue8 = sampledTextureValue1.y;
        intermediateValue9 = sampledTextureValue1.z;
        intermediateValue10 = ((scalarValue1 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[33u].x;
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
    float productValue118 = ((((fragmentVectorConstants1.packedValues[4u].x * productValue112) - productValue112) * productValue115) + productValue112) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue119 = ((((fragmentVectorConstants1.packedValues[4u].y * productValue113) - productValue113) * productValue115) + productValue113) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue120 = ((((fragmentVectorConstants1.packedValues[4u].z * productValue114) - productValue114) * productValue115) + productValue114) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue40 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue3;
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    if ((scalarValue40 & 1u) == 0u)
    {
        intermediateValue3 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue4 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[34u].x;
    }
    else
    {
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue3 = sampledTextureValue1.x;
        intermediateValue4 = sampledTextureValue1.y;
        intermediateValue5 = sampledTextureValue1.z;
        intermediateValue6 = ((scalarValue40 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[34u].x;
    }
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    if ((scalarValue40 & 28u) == 0u)
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
        if ((scalarValue40 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue132 = ((((fragmentVectorConstants1.packedValues[4u].x * productValue128) - productValue128) * productValue131) + productValue128) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue133 = ((((fragmentVectorConstants1.packedValues[4u].y * productValue129) - productValue129) * productValue131) + productValue129) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue134 = ((((fragmentVectorConstants1.packedValues[4u].z * productValue130) - productValue130) * productValue131) + productValue130) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue40 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue40 & 1u) == 0u)
    {
        intermediateValue7 = fragmentVectorConstants1.packedValues[31u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[34u].x;
    }
    else
    {
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue1.x;
        intermediateValue8 = sampledTextureValue1.y;
        intermediateValue9 = sampledTextureValue1.z;
        intermediateValue10 = ((scalarValue40 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[34u].x;
    }
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((scalarValue40 & 28u) == 0u)
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
        if ((scalarValue40 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue145 = fragmentVectorConstants1.packedValues[4u].x * productValue112;
    float productValue146 = fragmentVectorConstants1.packedValues[4u].y * productValue112;
    float productValue147 = fragmentVectorConstants1.packedValues[4u].z * productValue112;
    float scalarValue50 = ceil(productValue113);
    float productValue148 = ((((fragmentVectorConstants1.packedValues[31u].x * productValue113) - productValue145) * scalarValue50) + productValue145) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue149 = ((((fragmentVectorConstants1.packedValues[31u].y * productValue113) - productValue146) * scalarValue50) + productValue146) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue150 = ((((fragmentVectorConstants1.packedValues[31u].z * productValue113) - productValue147) * scalarValue50) + productValue147) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue40 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue4;
    float intermediateValue5;
    float intermediateValue6;
    float intermediateValue7;
    if ((scalarValue40 & 1u) == 0u)
    {
        intermediateValue4 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue5 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue6 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue7 = fragmentVectorConstants1.packedValues[35u].x;
    }
    else
    {
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue4 = sampledTextureValue1.x;
        intermediateValue5 = sampledTextureValue1.y;
        intermediateValue6 = sampledTextureValue1.z;
        intermediateValue7 = ((scalarValue40 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[35u].x;
    }
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue40 & 28u) == 0u)
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
        if ((scalarValue40 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue162 = fragmentVectorConstants1.packedValues[4u].x * productValue159;
    float productValue163 = fragmentVectorConstants1.packedValues[4u].y * productValue159;
    float productValue164 = fragmentVectorConstants1.packedValues[4u].z * productValue159;
    float scalarValue51 = ceil(productValue160);
    float productValue165 = ((((fragmentVectorConstants1.packedValues[31u].x * productValue160) - productValue162) * scalarValue51) + productValue162) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue166 = ((((fragmentVectorConstants1.packedValues[31u].y * productValue160) - productValue163) * scalarValue51) + productValue163) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue167 = ((((fragmentVectorConstants1.packedValues[31u].z * productValue160) - productValue164) * scalarValue51) + productValue164) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue40 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue7;
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    if ((scalarValue40 & 1u) == 0u)
    {
        intermediateValue7 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue8 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[35u].x;
    }
    else
    {
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue7 = sampledTextureValue1.x;
        intermediateValue8 = sampledTextureValue1.y;
        intermediateValue9 = sampledTextureValue1.z;
        intermediateValue10 = ((scalarValue40 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[35u].x;
    }
    float intermediateValue11;
    float intermediateValue12;
    float intermediateValue13;
    if ((scalarValue40 & 28u) == 0u)
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
        if ((scalarValue40 & 4u) == 0u)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
        isFragmentDiscarded = true;
    }
    float productValue171 = fragmentVectorConstants1.packedValues[4u].x * productValue128;
    float productValue172 = fragmentVectorConstants1.packedValues[4u].y * productValue128;
    float productValue173 = fragmentVectorConstants1.packedValues[4u].z * productValue128;
    float scalarValue57 = ceil(productValue129);
    float productValue174 = ((((fragmentVectorConstants1.packedValues[31u].x * productValue129) - productValue171) * scalarValue57) + productValue171) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue175 = ((((fragmentVectorConstants1.packedValues[31u].y * productValue129) - productValue172) * scalarValue57) + productValue172) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue176 = ((((fragmentVectorConstants1.packedValues[31u].z * productValue129) - productValue173) * scalarValue57) + productValue173) * ((fragmentVectorConstants1.packedValues[22u].x * (varyingColor0.z + (-1.0))) + 1.0);
    uint scalarValue40 = uint(int(fragmentVectorConstants1.packedValues[5u].x));
    float intermediateValue8;
    float intermediateValue9;
    float intermediateValue10;
    float intermediateValue11;
    if ((scalarValue40 & 1u) == 0u)
    {
        intermediateValue8 = fragmentVectorConstants1.packedValues[32u].x;
        intermediateValue9 = fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue10 = fragmentVectorConstants1.packedValues[33u].x;
        intermediateValue11 = fragmentVectorConstants1.packedValues[35u].x;
    }
    else
    {
        vec4 sampledTextureValue1 = texture(sampler2D(mersTextureTexture, mersTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
        intermediateValue8 = sampledTextureValue1.x;
        intermediateValue9 = sampledTextureValue1.y;
        intermediateValue10 = sampledTextureValue1.z;
        intermediateValue11 = ((scalarValue40 & 2u) != 0u) ? sampledTextureValue1.w : fragmentVectorConstants1.packedValues[35u].x;
    }
    float intermediateValue12;
    float intermediateValue13;
    float intermediateValue14;
    if ((scalarValue40 & 28u) == 0u)
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
        if ((scalarValue40 & 4u) == 0u)
#endif
        {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue9 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue10 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue20 = true;
        }
        else
        {
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue21;
            if (comparisonValue9)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue27;
            if (comparisonValue9)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue10 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue12 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue22 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue23;
            if (comparisonValue9)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue14 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue28 = true;
        }
        else
        {
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue29;
            if (comparisonValue9)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue10 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue11 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue12 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue20 = true;
        }
        else
        {
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue21;
            if (comparisonValue9)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue14 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue27;
            if (comparisonValue9)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue12 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue13 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue20 = true;
        }
        else
        {
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue21;
            if (comparisonValue33)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue16 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue27;
            if (comparisonValue33)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue15 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue22 = true;
        }
        else
        {
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue23;
            if (comparisonValue33)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue19 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue20 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue21 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue28 = true;
        }
        else
        {
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue29;
            if (comparisonValue33)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue20 = true;
        }
        else
        {
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue21;
            if (comparisonValue33)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue17 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue19 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue16;
            float productValue17;
            float productValue18;
            bool intermediateValue27;
            if (comparisonValue33)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue12 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue13 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue21 = true;
        }
        else
        {
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue22;
            if (comparisonValue33)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue15 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue16 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue27;
            if (comparisonValue33)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue23 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue24;
            if (comparisonValue33)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue16 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue29 = true;
        }
        else
        {
            float productValue15;
            float productValue16;
            float productValue17;
            bool intermediateValue30;
            if (comparisonValue33)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue13 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue14 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue15 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue21 = true;
        }
        else
        {
            float productValue13;
            float productValue14;
            float productValue15;
            bool intermediateValue22;
            if (comparisonValue33)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            vec4 sampledTextureValue9 = texture(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            multiplyAddValue16 = fma(sampledTextureValue9.z, 2.0, -1.0);
            multiplyAddValue17 = fma(sampledTextureValue9.y, 2.0, -1.0);
            multiplyAddValue18 = fma(sampledTextureValue9.x, 2.0, -1.0);
            intermediateValue26 = true;
        }
        else
        {
            float productValue14;
            float productValue15;
            float productValue16;
            bool intermediateValue27;
            if (comparisonValue33)
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue1 & 8u) == 0u)
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            float branchMergedValue;
            float branchMergedValue1;
            float branchMergedValue2;
            if ((scalarValue40 & 8u) == 0u)
#endif
            {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
                intermediateValue21 = true;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
                intermediateValue29 = true;
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
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
                intermediateValue21 = true;
                productValue17 = inverseLengthValue9 * comparisonValue18;
                productValue16 = inverseLengthValue9 * comparisonValue19;
                productValue15 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue20;
                if (comparisonValue31)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
                if (comparisonValue31)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
                if (comparisonValue31)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
                intermediateValue29 = true;
                productValue18 = inverseLengthValue9 * comparisonValue18;
                productValue17 = inverseLengthValue9 * comparisonValue19;
                productValue16 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue21;
                if (comparisonValue31)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
                intermediateValue22 = true;
                productValue15 = inverseLengthValue9 * comparisonValue18;
                productValue14 = inverseLengthValue9 * comparisonValue19;
                productValue13 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue18;
                if (comparisonValue31)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
                if (comparisonValue31)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
                productValue16 = inverseLengthValue9 * comparisonValue18;
                productValue15 = inverseLengthValue9 * comparisonValue19;
                productValue14 = inverseLengthValue9 * 0.25;
            }
            else
            {
                float comparisonValue12;
                float comparisonValue13;
                float productValue19;
                if (comparisonValue31)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                bool sampledTextureValue10 = uint(textureQueryLevels(materialTexture3)) > 0u;
                uvec2 sampledTextureValue11 = uvec2(textureSize(materialTexture3, int(0u)));
                uint scalarValue10 = sampledTextureValue11.x;
                float comparisonValue10 = rdEvaluateFloatExpression2(sampledTextureValue10 ? scalarValue10 : 0u);
                float comparisonValue11 = rdEvaluateFloatExpression2(sampledTextureValue10 ? sampledTextureValue11.y : 0u);
                float productValue41 = fract(comparisonValue10 * varyingTexCoord0.x);
                float productValue42 = fract(comparisonValue11 * varyingTexCoord0.y);
                vec4 sampledTextureValue12 = textureGather(sampler2D(materialTexture3, textureSampler3), vec2((abs(productValue41 - 0.5) < 0.0625) ? (((productValue41 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.x) : varyingTexCoord0.x, (abs(productValue42 - 0.5) < 0.0625) ? (((productValue42 > 0.5) ? 3.814697265625e-06 : (-3.814697265625e-06)) + varyingTexCoord0.y) : varyingTexCoord0.y));
                float scalarValue11 = sampledTextureValue12.x;
                float scalarValue12 = sampledTextureValue12.y;
                float scalarValue13 = sampledTextureValue12.z;
                float scalarValue14 = sampledTextureValue12.w;
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
                if (comparisonValue31)
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue1 & 16u) == 0u)
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
                float branchMergedValue3;
                float branchMergedValue4;
                float branchMergedValue5;
                if ((scalarValue40 & 16u) == 0u)
#endif
                {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue16 = sampledTextureValue14.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue13 ? scalarValue16 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue13 ? sampledTextureValue14.y : 0u);
                    vec4 sampledTextureValue15 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue43 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue44 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue25 = (productValue43 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue26 = (productValue44 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue27 = (productValue43 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.y, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                    float multiplyAddValue28 = (productValue44 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.z, 2.0, -1.0) + multiplyAddValue26) : multiplyAddValue26;
                    bool comparisonValue22 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue28) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue27 : 0.0, comparisonValue23 ? multiplyAddValue28 : 0.0, 0.25);
                    float scalarValue17 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue10 = inversesqrt(scalarValue17);
                    comparisonValue12 = comparisonValue22 ? (inverseLengthValue10 * multiplyAddValue27) : 0.0;
                    comparisonValue13 = comparisonValue23 ? (inverseLengthValue10 * multiplyAddValue28) : 0.0;
                    productValue18 = inverseLengthValue10 * 0.25;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue16 = sampledTextureValue14.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue13 ? scalarValue16 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue13 ? sampledTextureValue14.y : 0u);
                    vec4 sampledTextureValue15 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue43 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue44 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue25 = (productValue43 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue26 = (productValue44 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue27 = (productValue43 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.y, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                    float multiplyAddValue28 = (productValue44 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.z, 2.0, -1.0) + multiplyAddValue26) : multiplyAddValue26;
                    bool comparisonValue22 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue28) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue27 : 0.0, comparisonValue23 ? multiplyAddValue28 : 0.0, 0.25);
                    float scalarValue17 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue10 = inversesqrt(scalarValue17);
                    comparisonValue12 = comparisonValue22 ? (inverseLengthValue10 * multiplyAddValue27) : 0.0;
                    comparisonValue13 = comparisonValue23 ? (inverseLengthValue10 * multiplyAddValue28) : 0.0;
                    productValue19 = inverseLengthValue10 * 0.25;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue16 = sampledTextureValue14.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue13 ? scalarValue16 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue13 ? sampledTextureValue14.y : 0u);
                    vec4 sampledTextureValue15 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue43 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue44 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue25 = (productValue43 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue26 = (productValue44 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue27 = (productValue43 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.y, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                    float multiplyAddValue28 = (productValue44 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.z, 2.0, -1.0) + multiplyAddValue26) : multiplyAddValue26;
                    bool comparisonValue22 = abs(multiplyAddValue27) >= 0.004999999888241291046142578125;
                    bool comparisonValue23 = abs(multiplyAddValue28) >= 0.004999999888241291046142578125;
                    vec3 comparisonValue24 = vec3(comparisonValue22 ? multiplyAddValue27 : 0.0, comparisonValue23 ? multiplyAddValue28 : 0.0, 0.25);
                    float scalarValue17 = rdDot3Precise(comparisonValue24, comparisonValue24);
                    float inverseLengthValue10 = inversesqrt(scalarValue17);
                    comparisonValue12 = comparisonValue22 ? (inverseLengthValue10 * multiplyAddValue27) : 0.0;
                    comparisonValue13 = comparisonValue23 ? (inverseLengthValue10 * multiplyAddValue28) : 0.0;
                    productValue20 = inverseLengthValue10 * 0.25;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
                    bool sampledTextureValue13 = uint(textureQueryLevels(materialTexture3)) > 0u;
                    uvec2 sampledTextureValue14 = uvec2(textureSize(materialTexture3, int(0u)));
                    uint scalarValue16 = sampledTextureValue14.x;
                    float comparisonValue20 = rdEvaluateFloatExpression2(sampledTextureValue13 ? scalarValue16 : 0u);
                    float comparisonValue21 = rdEvaluateFloatExpression2(sampledTextureValue13 ? sampledTextureValue14.y : 0u);
                    vec4 sampledTextureValue15 = textureLod(sampler2D(materialTexture3, textureSampler3), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue43 = fract(comparisonValue20 * varyingTexCoord0.x);
                    float productValue44 = fract(comparisonValue21 * varyingTexCoord0.y);
                    float multiplyAddValue25 = (productValue43 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.w, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue26 = (productValue44 <= 0.083333335816860198974609375) ? (-fma(sampledTextureValue15.x, 2.0, -1.0)) : 0.0;
                    float multiplyAddValue27 = (productValue43 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.y, 2.0, -1.0) + multiplyAddValue25) : multiplyAddValue25;
                    float multiplyAddValue28 = (productValue44 >= 0.916666686534881591796875) ? (fma(sampledTextureValue15.z, 2.0, -1.0) + multiplyAddValue26) : multiplyAddValue26;
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
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = intermediateValue41;
                    comparisonValue13 = intermediateValue41;
                    productValue18 = intermediateValue41;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = intermediateValue47;
                    comparisonValue13 = intermediateValue47;
                    productValue19 = intermediateValue47;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = intermediateValue43;
                    comparisonValue13 = intermediateValue43;
                    productValue19 = intermediateValue43;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = intermediateValue49;
                    comparisonValue13 = intermediateValue49;
                    productValue20 = intermediateValue49;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = productValue122;
                    comparisonValue13 = productValue123;
                    productValue20 = productValue124;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = productValue122;
                    comparisonValue13 = productValue123;
                    productValue21 = productValue124;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = multiplyAddValue102;
                    comparisonValue13 = multiplyAddValue101;
                    productValue20 = productValue124;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = multiplyAddValue102;
                    comparisonValue13 = multiplyAddValue101;
                    productValue21 = productValue124;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = intermediateValue42;
                    comparisonValue13 = intermediateValue42;
                    productValue18 = intermediateValue42;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = intermediateValue44;
                    comparisonValue13 = intermediateValue44;
                    productValue19 = intermediateValue44;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                    comparisonValue12 = intermediateValue50;
                    comparisonValue13 = intermediateValue50;
                    productValue20 = intermediateValue50;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                    uvec2 sampledTextureValue2 = uvec2(textureSize(normalTextureTexture, int(0u)));
                    vec4 sampledTextureValue3 = textureLod(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y), 0.0);
                    float productValue22 = fract(float(int(uint(int(float(int(sampledTextureValue2.x)))))) * varyingTexCoord0.x);
                    float productValue23 = fract(float(int(uint(int(float(int(sampledTextureValue2.y)))))) * varyingTexCoord0.y);
                    float comparisonValue1 = (((productValue22 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.y * 2.0) + (-1.0))) - (((sampledTextureValue3.w * 2.0) + (-1.0)) * ((productValue22 > 0.083333335816860198974609375) ? 0.0 : 1.0));
                    float comparisonValue2 = (((productValue23 < 0.916666686534881591796875) ? 0.0 : 1.0) * ((sampledTextureValue3.z * 2.0) + (-1.0))) - (((productValue23 > 0.083333335816860198974609375) ? 0.0 : 1.0) * ((sampledTextureValue3.x * 2.0) + (-1.0)));
                    float comparisonValue3 = ((abs(comparisonValue1) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue1;
                    float comparisonValue4 = ((abs(comparisonValue2) < 0.004999999888241291046142578125) ? 0.0 : 1.0) * comparisonValue2;
                    float inverseLengthValue1 = inversesqrt(dot(vec3(comparisonValue3, comparisonValue4, 0.25), vec3(comparisonValue3, comparisonValue4, 0.25)));
                    branchMergedValue3 = comparisonValue3 * inverseLengthValue1;
                    branchMergedValue4 = comparisonValue4 * inverseLengthValue1;
                    branchMergedValue5 = inverseLengthValue1 * 0.25;
#endif
                }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue21 = comparisonValue7;
                productValue15 = comparisonValue12;
                productValue14 = comparisonValue13;
                productValue13 = productValue18;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = comparisonValue7;
                productValue16 = comparisonValue12;
                productValue15 = comparisonValue13;
                productValue14 = productValue19;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue23 = comparisonValue7;
                productValue16 = comparisonValue12;
                productValue15 = comparisonValue13;
                productValue14 = productValue19;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue29 = comparisonValue7;
                productValue17 = comparisonValue12;
                productValue16 = comparisonValue13;
                productValue15 = productValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue21 = comparisonValue31;
                productValue17 = comparisonValue12;
                productValue16 = comparisonValue13;
                productValue15 = productValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = comparisonValue31;
                productValue18 = comparisonValue12;
                productValue17 = comparisonValue13;
                productValue16 = productValue21;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue23 = comparisonValue31;
                productValue17 = comparisonValue12;
                productValue16 = comparisonValue13;
                productValue15 = productValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue29 = comparisonValue31;
                productValue18 = comparisonValue12;
                productValue17 = comparisonValue13;
                productValue16 = productValue21;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue22 = comparisonValue31;
                productValue15 = comparisonValue12;
                productValue14 = comparisonValue13;
                productValue13 = productValue18;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue27 = comparisonValue31;
                productValue16 = comparisonValue12;
                productValue15 = comparisonValue13;
                productValue14 = productValue19;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue24 = comparisonValue31;
                productValue16 = comparisonValue12;
                productValue15 = comparisonValue13;
                productValue14 = productValue19;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
                intermediateValue30 = comparisonValue31;
                productValue17 = comparisonValue12;
                productValue16 = comparisonValue13;
                productValue15 = productValue20;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
                branchMergedValue = branchMergedValue3;
                branchMergedValue1 = branchMergedValue4;
                branchMergedValue2 = branchMergedValue5;
#endif
            }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue9 = productValue13;
            multiplyAddValue10 = productValue14;
            multiplyAddValue11 = productValue15;
            intermediateValue20 = intermediateValue21;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue13 = productValue14;
            multiplyAddValue14 = productValue15;
            multiplyAddValue15 = productValue16;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue10 = productValue14;
            multiplyAddValue11 = productValue15;
            multiplyAddValue12 = productValue16;
            intermediateValue22 = intermediateValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue14 = productValue15;
            multiplyAddValue15 = productValue16;
            multiplyAddValue16 = productValue17;
            intermediateValue28 = intermediateValue29;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue10 = productValue13;
            multiplyAddValue11 = productValue14;
            multiplyAddValue12 = productValue15;
            intermediateValue20 = intermediateValue21;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue14 = productValue14;
            multiplyAddValue15 = productValue15;
            multiplyAddValue16 = productValue16;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue12 = productValue15;
            multiplyAddValue13 = productValue16;
            multiplyAddValue14 = productValue17;
            intermediateValue20 = intermediateValue21;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue16 = productValue16;
            multiplyAddValue17 = productValue17;
            multiplyAddValue18 = productValue18;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue15 = productValue15;
            multiplyAddValue16 = productValue16;
            multiplyAddValue17 = productValue17;
            intermediateValue22 = intermediateValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue19 = productValue16;
            multiplyAddValue20 = productValue17;
            multiplyAddValue21 = productValue18;
            intermediateValue28 = intermediateValue29;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue13 = productValue15;
            multiplyAddValue14 = productValue16;
            multiplyAddValue15 = productValue17;
            intermediateValue20 = intermediateValue21;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue17 = productValue16;
            multiplyAddValue18 = productValue17;
            multiplyAddValue19 = productValue18;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue12 = productValue13;
            multiplyAddValue13 = productValue14;
            multiplyAddValue14 = productValue15;
            intermediateValue21 = intermediateValue22;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue15 = productValue14;
            multiplyAddValue16 = productValue15;
            multiplyAddValue17 = productValue16;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue13 = productValue14;
            multiplyAddValue14 = productValue15;
            multiplyAddValue15 = productValue16;
            intermediateValue23 = intermediateValue24;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue16 = productValue15;
            multiplyAddValue17 = productValue16;
            multiplyAddValue18 = productValue17;
            intermediateValue29 = intermediateValue30;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue13 = productValue13;
            multiplyAddValue14 = productValue14;
            multiplyAddValue15 = productValue15;
            intermediateValue21 = intermediateValue22;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
            multiplyAddValue16 = productValue14;
            multiplyAddValue17 = productValue15;
            multiplyAddValue18 = productValue16;
            intermediateValue26 = intermediateValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue24 = float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x;
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue2 = fract(productValue24);
                float scalarValue3 = fract(productValue25);
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
                vec4 sampledTextureValue5 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue4 = sampledTextureValue5.x;
                float scalarValue5 = sampledTextureValue5.y;
                float scalarValue6 = sampledTextureValue5.z;
                float scalarValue7 = sampledTextureValue5.w;
                float sumValue = fract(productValue24 + 0.5);
                float sumValue1 = fract(productValue25 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue ? scalarValue5 : scalarValue6;
                float productValue26 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue26 - productValue27;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue1 ? scalarValue5 : scalarValue4;
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue28, 0.25), vec3(sumValue2, productValue28, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue28;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue14 = branchMergedValue;
            intermediateValue15 = branchMergedValue1;
            intermediateValue16 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue24 = float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x;
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue2 = fract(productValue24);
                float scalarValue3 = fract(productValue25);
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
                vec4 sampledTextureValue5 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue4 = sampledTextureValue5.x;
                float scalarValue5 = sampledTextureValue5.y;
                float scalarValue6 = sampledTextureValue5.z;
                float scalarValue7 = sampledTextureValue5.w;
                float sumValue = fract(productValue24 + 0.5);
                float sumValue1 = fract(productValue25 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue ? scalarValue5 : scalarValue6;
                float productValue26 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue26 - productValue27;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue1 ? scalarValue5 : scalarValue4;
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue28, 0.25), vec3(sumValue2, productValue28, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue28;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue18 = branchMergedValue;
            intermediateValue19 = branchMergedValue1;
            intermediateValue20 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue24 = float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x;
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue2 = fract(productValue24);
                float scalarValue3 = fract(productValue25);
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
                vec4 sampledTextureValue5 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue4 = sampledTextureValue5.x;
                float scalarValue5 = sampledTextureValue5.y;
                float scalarValue6 = sampledTextureValue5.z;
                float scalarValue7 = sampledTextureValue5.w;
                float sumValue = fract(productValue24 + 0.5);
                float sumValue1 = fract(productValue25 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue ? scalarValue5 : scalarValue6;
                float productValue26 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue26 - productValue27;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue1 ? scalarValue5 : scalarValue4;
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue28, 0.25), vec3(sumValue2, productValue28, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue28;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue15 = branchMergedValue;
            intermediateValue16 = branchMergedValue1;
            intermediateValue17 = branchMergedValue2;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
            else
            {
                uvec2 sampledTextureValue4 = uvec2(textureSize(normalTextureTexture, int(0u)));
                float productValue24 = float(int(uint(int(float(int(sampledTextureValue4.x)))))) * varyingTexCoord0.x;
                float productValue25 = float(int(uint(int(float(int(sampledTextureValue4.y)))))) * varyingTexCoord0.y;
                float scalarValue2 = fract(productValue24);
                float scalarValue3 = fract(productValue25);
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
                vec4 sampledTextureValue5 = textureGather(sampler2D(normalTextureTexture, normalTextureSampler), vec2(comparisonValue5, comparisonValue6));
                float scalarValue4 = sampledTextureValue5.x;
                float scalarValue5 = sampledTextureValue5.y;
                float scalarValue6 = sampledTextureValue5.z;
                float scalarValue7 = sampledTextureValue5.w;
                float sumValue = fract(productValue24 + 0.5);
                float sumValue1 = fract(productValue25 + 0.5);
                bool conditionValue = sumValue1 > 0.5;
                float intermediateValue[2];
                intermediateValue[0u] = conditionValue ? scalarValue4 : scalarValue7;
                intermediateValue[1u] = conditionValue ? scalarValue5 : scalarValue6;
                float productValue26 = intermediateValue[uint(int(spvNClamp((sumValue + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))];
                float productValue27 = intermediateValue[uint(int(spvNClamp((sumValue + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float sumValue2 = productValue26 - productValue27;
                bool conditionValue1 = sumValue > 0.5;
                intermediateValue[0u] = conditionValue1 ? scalarValue6 : scalarValue7;
                intermediateValue[1u] = conditionValue1 ? scalarValue5 : scalarValue4;
                float productValue28 = intermediateValue[uint(int(spvNClamp((sumValue1 + (-0.083333335816860198974609375)) * 2.0, 0.0, 1.0)))] - intermediateValue[uint(int(spvNClamp((sumValue1 + 0.083333335816860198974609375) * 2.0, 0.0, 1.0)))];
                float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue2, productValue28, 0.25), vec3(sumValue2, productValue28, 0.25)));
                branchMergedValue = inverseLengthValue2 * sumValue2;
                branchMergedValue1 = inverseLengthValue2 * productValue28;
                branchMergedValue2 = inverseLengthValue2 * 0.25;
            }
            intermediateValue19 = branchMergedValue;
            intermediateValue20 = branchMergedValue1;
            intermediateValue21 = branchMergedValue2;
#endif
        }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue25 = intermediateValue20 ? multiplyAddValue9 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue29 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue25, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue11, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue10) : 0.0) : 0.0);
        float multiplyAddValue30 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue25, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue11, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue10) : 0.0) : 0.0);
        float multiplyAddValue31 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue25, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue11, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue10) : 0.0) : 0.0);
        vec3 vectorValue5 = vec3(multiplyAddValue29, multiplyAddValue30, multiplyAddValue31);
        float scalarValue21 = rdDot3Precise(vectorValue5, vectorValue5);
        float inverseLengthValue14 = inversesqrt(scalarValue21);
        productValue3 = inverseLengthValue14 * multiplyAddValue31;
        productValue4 = inverseLengthValue14 * multiplyAddValue30;
        productValue5 = inverseLengthValue14 * multiplyAddValue29;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue26 = intermediateValue26 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue43 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue26, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue15, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue44 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue26, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue15, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue45 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue26, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue15, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue7 = vec3(multiplyAddValue43, multiplyAddValue44, multiplyAddValue45);
        float scalarValue31 = rdDot3Precise(vectorValue7, vectorValue7);
        float inverseLengthValue19 = inversesqrt(scalarValue31);
        productValue4 = inverseLengthValue19 * multiplyAddValue45;
        productValue5 = inverseLengthValue19 * multiplyAddValue44;
        productValue6 = inverseLengthValue19 * multiplyAddValue43;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue27 = intermediateValue22 ? multiplyAddValue10 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue52 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue27, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue12, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue53 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue27, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue12, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue54 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue27, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue12, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue11) : 0.0) : 0.0);
        vec3 vectorValue9 = vec3(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54);
        float scalarValue35 = rdDot3Precise(vectorValue9, vectorValue9);
        float inverseLengthValue21 = inversesqrt(scalarValue35);
        productValue4 = inverseLengthValue21 * multiplyAddValue54;
        productValue5 = inverseLengthValue21 * multiplyAddValue53;
        productValue6 = inverseLengthValue21 * multiplyAddValue52;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue28 = intermediateValue28 ? multiplyAddValue14 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue62 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue28, intermediateValue28 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue16, intermediateValue28 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue15) : 0.0) : 0.0);
        float multiplyAddValue63 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue28, intermediateValue28 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue16, intermediateValue28 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue15) : 0.0) : 0.0);
        float multiplyAddValue64 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue28, intermediateValue28 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue16, intermediateValue28 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue15) : 0.0) : 0.0);
        vec3 vectorValue10 = vec3(multiplyAddValue62, multiplyAddValue63, multiplyAddValue64);
        float scalarValue36 = rdDot3Precise(vectorValue10, vectorValue10);
        float inverseLengthValue22 = inversesqrt(scalarValue36);
        productValue5 = inverseLengthValue22 * multiplyAddValue64;
        productValue6 = inverseLengthValue22 * multiplyAddValue63;
        productValue7 = inverseLengthValue22 * multiplyAddValue62;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue29 = intermediateValue20 ? multiplyAddValue10 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue66 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue29, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue12, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue67 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue29, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue12, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue11) : 0.0) : 0.0);
        float multiplyAddValue68 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue29, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue12, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue11) : 0.0) : 0.0);
        vec3 vectorValue12 = vec3(multiplyAddValue66, multiplyAddValue67, multiplyAddValue68);
        float scalarValue38 = rdDot3Precise(vectorValue12, vectorValue12);
        float inverseLengthValue24 = inversesqrt(scalarValue38);
        productValue3 = inverseLengthValue24 * multiplyAddValue68;
        productValue4 = inverseLengthValue24 * multiplyAddValue67;
        productValue5 = inverseLengthValue24 * multiplyAddValue66;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue30 = intermediateValue26 ? multiplyAddValue14 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue72 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue30, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue16, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue15) : 0.0) : 0.0);
        float multiplyAddValue73 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue30, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue16, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue15) : 0.0) : 0.0);
        float multiplyAddValue74 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue30, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue16, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue15) : 0.0) : 0.0);
        vec3 vectorValue13 = vec3(multiplyAddValue72, multiplyAddValue73, multiplyAddValue74);
        float scalarValue41 = rdDot3Precise(vectorValue13, vectorValue13);
        float inverseLengthValue25 = inversesqrt(scalarValue41);
        productValue4 = inverseLengthValue25 * multiplyAddValue74;
        productValue5 = inverseLengthValue25 * multiplyAddValue73;
        productValue6 = inverseLengthValue25 * multiplyAddValue72;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue34 = intermediateValue20 ? multiplyAddValue12 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue83 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue34, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue14, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue13) : 0.0) : 0.0);
        float multiplyAddValue84 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue34, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue14, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue13) : 0.0) : 0.0);
        float multiplyAddValue85 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue34, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue14, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue13) : 0.0) : 0.0);
        vec3 vectorValue14 = vec3(multiplyAddValue83, multiplyAddValue84, multiplyAddValue85);
        float scalarValue43 = rdDot3Precise(vectorValue14, vectorValue14);
        float inverseLengthValue26 = inversesqrt(scalarValue43);
        productValue5 = inverseLengthValue26 * multiplyAddValue85;
        productValue6 = inverseLengthValue26 * multiplyAddValue84;
        productValue7 = inverseLengthValue26 * multiplyAddValue83;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue35 = intermediateValue26 ? multiplyAddValue16 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue97 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue35, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue18, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue98 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue35, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue18, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue99 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue35, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue18, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue17) : 0.0) : 0.0);
        vec3 vectorValue15 = vec3(multiplyAddValue97, multiplyAddValue98, multiplyAddValue99);
        float scalarValue44 = rdDot3Precise(vectorValue15, vectorValue15);
        float inverseLengthValue27 = inversesqrt(scalarValue44);
        productValue6 = inverseLengthValue27 * multiplyAddValue99;
        productValue7 = inverseLengthValue27 * multiplyAddValue98;
        productValue8 = inverseLengthValue27 * multiplyAddValue97;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue37 = intermediateValue22 ? multiplyAddValue15 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue107 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue37, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue17, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue108 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue37, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue17, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue109 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue37, intermediateValue22 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue17, intermediateValue22 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue16) : 0.0) : 0.0);
        vec3 vectorValue18 = vec3(multiplyAddValue107, multiplyAddValue108, multiplyAddValue109);
        float scalarValue47 = rdDot3Precise(vectorValue18, vectorValue18);
        float inverseLengthValue30 = inversesqrt(scalarValue47);
        productValue5 = inverseLengthValue30 * multiplyAddValue109;
        productValue6 = inverseLengthValue30 * multiplyAddValue108;
        productValue7 = inverseLengthValue30 * multiplyAddValue107;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue36 = intermediateValue28 ? multiplyAddValue19 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue103 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue36, intermediateValue28 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue21, intermediateValue28 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue104 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue36, intermediateValue28 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue21, intermediateValue28 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue20) : 0.0) : 0.0);
        float multiplyAddValue105 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue36, intermediateValue28 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue21, intermediateValue28 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue20) : 0.0) : 0.0);
        vec3 vectorValue17 = vec3(multiplyAddValue103, multiplyAddValue104, multiplyAddValue105);
        float scalarValue46 = rdDot3Precise(vectorValue17, vectorValue17);
        float inverseLengthValue29 = inversesqrt(scalarValue46);
        productValue6 = inverseLengthValue29 * multiplyAddValue105;
        productValue7 = inverseLengthValue29 * multiplyAddValue104;
        productValue8 = inverseLengthValue29 * multiplyAddValue103;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue38 = intermediateValue20 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue111 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue38, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue15, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue112 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue38, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue15, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue113 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue38, intermediateValue20 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue15, intermediateValue20 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue19 = vec3(multiplyAddValue111, multiplyAddValue112, multiplyAddValue113);
        float scalarValue48 = rdDot3Precise(vectorValue19, vectorValue19);
        float inverseLengthValue31 = inversesqrt(scalarValue48);
        productValue5 = inverseLengthValue31 * multiplyAddValue113;
        productValue6 = inverseLengthValue31 * multiplyAddValue112;
        productValue7 = inverseLengthValue31 * multiplyAddValue111;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue39 = intermediateValue26 ? multiplyAddValue17 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue115 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue39, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue19, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue116 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue39, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue19, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue18) : 0.0) : 0.0);
        float multiplyAddValue117 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue39, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue19, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue18) : 0.0) : 0.0);
        vec3 vectorValue20 = vec3(multiplyAddValue115, multiplyAddValue116, multiplyAddValue117);
        float scalarValue49 = rdDot3Precise(vectorValue20, vectorValue20);
        float inverseLengthValue32 = inversesqrt(scalarValue49);
        productValue6 = inverseLengthValue32 * multiplyAddValue117;
        productValue7 = inverseLengthValue32 * multiplyAddValue116;
        productValue8 = inverseLengthValue32 * multiplyAddValue115;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue40 = intermediateValue21 ? multiplyAddValue12 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue124 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue40, intermediateValue21 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue14, intermediateValue21 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue13) : 0.0) : 0.0);
        float multiplyAddValue125 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue40, intermediateValue21 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue14, intermediateValue21 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue13) : 0.0) : 0.0);
        float multiplyAddValue126 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue40, intermediateValue21 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue14, intermediateValue21 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue13) : 0.0) : 0.0);
        vec3 vectorValue21 = vec3(multiplyAddValue124, multiplyAddValue125, multiplyAddValue126);
        float scalarValue53 = rdDot3Precise(vectorValue21, vectorValue21);
        float inverseLengthValue36 = inversesqrt(scalarValue53);
        productValue3 = inverseLengthValue36 * multiplyAddValue126;
        productValue4 = inverseLengthValue36 * multiplyAddValue125;
        productValue5 = inverseLengthValue36 * multiplyAddValue124;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue41 = intermediateValue26 ? multiplyAddValue15 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue133 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue41, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue17, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue134 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue41, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue17, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue16) : 0.0) : 0.0);
        float multiplyAddValue135 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue41, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue17, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue16) : 0.0) : 0.0);
        vec3 vectorValue22 = vec3(multiplyAddValue133, multiplyAddValue134, multiplyAddValue135);
        float scalarValue55 = rdDot3Precise(vectorValue22, vectorValue22);
        float inverseLengthValue37 = inversesqrt(scalarValue55);
        productValue4 = inverseLengthValue37 * multiplyAddValue135;
        productValue5 = inverseLengthValue37 * multiplyAddValue134;
        productValue6 = inverseLengthValue37 * multiplyAddValue133;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue42 = intermediateValue23 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue137 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue42, intermediateValue23 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue15, intermediateValue23 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue138 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue42, intermediateValue23 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue15, intermediateValue23 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue139 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue42, intermediateValue23 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue15, intermediateValue23 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue23 = vec3(multiplyAddValue137, multiplyAddValue138, multiplyAddValue139);
        float scalarValue56 = rdDot3Precise(vectorValue23, vectorValue23);
        float inverseLengthValue38 = inversesqrt(scalarValue56);
        productValue4 = inverseLengthValue38 * multiplyAddValue139;
        productValue5 = inverseLengthValue38 * multiplyAddValue138;
        productValue6 = inverseLengthValue38 * multiplyAddValue137;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue43 = intermediateValue29 ? multiplyAddValue16 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue147 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue43, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue18, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue148 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue43, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue18, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue149 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue43, intermediateValue29 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue18, intermediateValue29 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue17) : 0.0) : 0.0);
        vec3 vectorValue24 = vec3(multiplyAddValue147, multiplyAddValue148, multiplyAddValue149);
        float scalarValue59 = rdDot3Precise(vectorValue24, vectorValue24);
        float inverseLengthValue42 = inversesqrt(scalarValue59);
        productValue5 = inverseLengthValue42 * multiplyAddValue149;
        productValue6 = inverseLengthValue42 * multiplyAddValue148;
        productValue7 = inverseLengthValue42 * multiplyAddValue147;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue44 = intermediateValue21 ? multiplyAddValue13 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue151 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue44, intermediateValue21 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue15, intermediateValue21 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue152 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue44, intermediateValue21 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue15, intermediateValue21 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue14) : 0.0) : 0.0);
        float multiplyAddValue153 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue44, intermediateValue21 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue15, intermediateValue21 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue14) : 0.0) : 0.0);
        vec3 vectorValue25 = vec3(multiplyAddValue151, multiplyAddValue152, multiplyAddValue153);
        float scalarValue60 = rdDot3Precise(vectorValue25, vectorValue25);
        float inverseLengthValue43 = inversesqrt(scalarValue60);
        productValue3 = inverseLengthValue43 * multiplyAddValue153;
        productValue4 = inverseLengthValue43 * multiplyAddValue152;
        productValue5 = inverseLengthValue43 * multiplyAddValue151;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
        float comparisonValue35 = intermediateValue26 ? multiplyAddValue16 : 1.0;
        vec3 vectorValue2 = vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z);
        float scalarValue18 = rdDot3Precise(vectorValue2, vectorValue2);
        float inverseLengthValue11 = inversesqrt(scalarValue18);
        vec3 vectorValue3 = vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z);
        float scalarValue19 = rdDot3Precise(vectorValue3, vectorValue3);
        float inverseLengthValue12 = inversesqrt(scalarValue19);
        vec3 vectorValue4 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
        float scalarValue20 = rdDot3Precise(vectorValue4, vectorValue4);
        float inverseLengthValue13 = inversesqrt(scalarValue20);
        float multiplyAddValue97 = fma(inverseLengthValue13 * varyingNormal0.x, comparisonValue35, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.x, multiplyAddValue18, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.x) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue98 = fma(inverseLengthValue13 * varyingNormal0.y, comparisonValue35, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.y, multiplyAddValue18, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.y) * multiplyAddValue17) : 0.0) : 0.0);
        float multiplyAddValue99 = fma(inverseLengthValue13 * varyingNormal0.z, comparisonValue35, intermediateValue26 ? fma(inverseLengthValue11 * varyingTangent0.z, multiplyAddValue18, intermediateValue26 ? ((inverseLengthValue12 * varyingBitangent0.z) * multiplyAddValue17) : 0.0) : 0.0);
        vec3 vectorValue15 = vec3(multiplyAddValue97, multiplyAddValue98, multiplyAddValue99);
        float scalarValue44 = rdDot3Precise(vectorValue15, vectorValue15);
        float inverseLengthValue27 = inversesqrt(scalarValue44);
        productValue4 = inverseLengthValue27 * multiplyAddValue99;
        productValue5 = inverseLengthValue27 * multiplyAddValue98;
        productValue6 = inverseLengthValue27 * multiplyAddValue97;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue14 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float productValue29 = inverseLengthValue7 * intermediateValue7;
    float productValue30 = inverseLengthValue7 * intermediateValue8;
    float productValue31 = inverseLengthValue7 * intermediateValue9;
    float quotientValue2 = 1.0 / ((abs(productValue30) + abs(productValue29)) + abs(productValue31));
    float productValue32 = quotientValue2 * productValue29;
    float productValue33 = quotientValue2 * productValue30;
    bool conditionValue2 = productValue31 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue11;
    float productValue12;
    float productValue13;
    if ((fragmentVectorConstants1.packedValues[27u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue34 = fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue11 = spvNClamp(productValue34, 0.0, 1.0);
        productValue12 = spvNClamp(((productValue34 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue34, 0.0, 1.0);
        productValue13 = spvNClamp((((productValue34 * productValue34) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue34, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float productValue13;
    float productValue14;
    if ((fragmentVectorConstants1.packedValues[27u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue34 = fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue15 = spvNClamp(productValue34, 0.0, 1.0);
        productValue13 = spvNClamp(((productValue34 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue34, 0.0, 1.0);
        productValue14 = spvNClamp((((productValue34 * productValue34) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue34, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue14 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float productValue29 = inverseLengthValue7 * intermediateValue7;
    float productValue30 = inverseLengthValue7 * intermediateValue8;
    float productValue31 = inverseLengthValue7 * intermediateValue9;
    float quotientValue2 = 1.0 / ((abs(productValue30) + abs(productValue29)) + abs(productValue31));
    float productValue32 = quotientValue2 * productValue29;
    float productValue33 = quotientValue2 * productValue30;
    bool conditionValue2 = productValue31 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue11;
    float productValue15;
    float productValue16;
    if ((fragmentVectorConstants1.packedValues[28u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue80 = fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue11 = spvNClamp(productValue80, 0.0, 1.0);
        productValue15 = spvNClamp(((productValue80 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue80, 0.0, 1.0);
        productValue16 = spvNClamp((((productValue80 * productValue80) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue80, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float productValue16;
    float productValue17;
    if ((fragmentVectorConstants1.packedValues[28u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue80 = fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue15 = spvNClamp(productValue80, 0.0, 1.0);
        productValue16 = spvNClamp(((productValue80 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue80, 0.0, 1.0);
        productValue17 = spvNClamp((((productValue80 * productValue80) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue80, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue14 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float productValue29 = inverseLengthValue7 * intermediateValue7;
    float productValue30 = inverseLengthValue7 * intermediateValue8;
    float productValue31 = inverseLengthValue7 * intermediateValue9;
    float quotientValue2 = 1.0 / ((abs(productValue30) + abs(productValue29)) + abs(productValue31));
    float productValue32 = quotientValue2 * productValue29;
    float productValue33 = quotientValue2 * productValue30;
    bool conditionValue2 = productValue31 < 0.0;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue4 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue11;
    float productValue13;
    float productValue14;
    if ((fragmentVectorConstants1.packedValues[28u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue80 = fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue11 = spvNClamp(productValue80, 0.0, 1.0);
        productValue13 = spvNClamp(((productValue80 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue80, 0.0, 1.0);
        productValue14 = spvNClamp((((productValue80 * productValue80) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue80, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float productValue14;
    float productValue15;
    if ((fragmentVectorConstants1.packedValues[28u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue80 = fragmentVectorConstants1.packedValues[28u].x * fragmentVectorConstants1.packedValues[28u].x;
        intermediateValue15 = spvNClamp(productValue80, 0.0, 1.0);
        productValue14 = spvNClamp(((productValue80 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue80, 0.0, 1.0);
        productValue15 = spvNClamp((((productValue80 * productValue80) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue80, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue14 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float productValue29 = inverseLengthValue7 * intermediateValue7;
    float productValue30 = inverseLengthValue7 * intermediateValue8;
    float productValue31 = inverseLengthValue7 * intermediateValue9;
    float quotientValue2 = 1.0 / ((abs(productValue30) + abs(productValue29)) + abs(productValue31));
    float productValue32 = quotientValue2 * productValue29;
    float productValue33 = quotientValue2 * productValue30;
    bool conditionValue2 = productValue31 < 0.0;
    float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue11;
    float productValue15;
    float productValue16;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue121 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue11 = spvNClamp(productValue121, 0.0, 1.0);
        productValue15 = spvNClamp(((productValue121 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue121, 0.0, 1.0);
        productValue16 = spvNClamp((((productValue121 * productValue121) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue121, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue15;
    float productValue16;
    float productValue17;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue121 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue15 = spvNClamp(productValue121, 0.0, 1.0);
        productValue16 = spvNClamp(((productValue121 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue121, 0.0, 1.0);
        productValue17 = spvNClamp((((productValue121 * productValue121) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue121, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue14 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue15 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float productValue29 = inverseLengthValue7 * intermediateValue7;
    float productValue30 = inverseLengthValue7 * intermediateValue8;
    float productValue31 = inverseLengthValue7 * intermediateValue9;
    float quotientValue2 = 1.0 / ((abs(productValue30) + abs(productValue29)) + abs(productValue31));
    float productValue32 = quotientValue2 * productValue29;
    float productValue33 = quotientValue2 * productValue30;
    bool conditionValue2 = productValue31 < 0.0;
    float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue11;
    float productValue16;
    float productValue17;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue121 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue11 = spvNClamp(productValue121, 0.0, 1.0);
        productValue16 = spvNClamp(((productValue121 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue121, 0.0, 1.0);
        productValue17 = spvNClamp((((productValue121 * productValue121) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue121, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue15;
    float productValue17;
    float productValue18;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue121 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue15 = spvNClamp(productValue121, 0.0, 1.0);
        productValue17 = spvNClamp(((productValue121 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue121, 0.0, 1.0);
        productValue18 = spvNClamp((((productValue121 * productValue121) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue121, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue15 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue17 = (sampledTextureValue6.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue33 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue15;
        float multiplyAddValue118 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue17, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue16, inverseLengthValue33 * varyingTangent0.x));
        float multiplyAddValue119 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue17, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue16, inverseLengthValue33 * varyingTangent0.y));
        float multiplyAddValue120 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue17, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue16, inverseLengthValue33 * varyingTangent0.z));
        float inverseLengthValue34 = inversesqrt(dot(vec3(multiplyAddValue118, multiplyAddValue119, multiplyAddValue120), vec3(multiplyAddValue118, multiplyAddValue119, multiplyAddValue120)));
        intermediateValue8 = inverseLengthValue34 * multiplyAddValue118;
        intermediateValue9 = inverseLengthValue34 * multiplyAddValue119;
        intermediateValue10 = inverseLengthValue34 * multiplyAddValue120;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue35 = inversesqrt(dot(vec3(intermediateValue8, intermediateValue9, intermediateValue10), vec3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue151 = inverseLengthValue35 * intermediateValue8;
    float productValue152 = inverseLengthValue35 * intermediateValue9;
    float productValue153 = inverseLengthValue35 * intermediateValue10;
    float quotientValue12 = 1.0 / ((abs(productValue152) + abs(productValue151)) + abs(productValue153));
    float productValue154 = quotientValue12 * productValue151;
    float productValue155 = quotientValue12 * productValue152;
    bool conditionValue10 = productValue153 < 0.0;
    float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue12;
    float productValue17;
    float productValue18;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue121 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue12 = spvNClamp(productValue121, 0.0, 1.0);
        productValue17 = spvNClamp(((productValue121 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue121, 0.0, 1.0);
        productValue18 = spvNClamp((((productValue121 * productValue121) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue121, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue15;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue121 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue15 = spvNClamp(productValue121, 0.0, 1.0);
        productValue18 = spvNClamp(((productValue121 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue121, 0.0, 1.0);
        productValue19 = spvNClamp((((productValue121 * productValue121) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue121, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue19 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue21 = (sampledTextureValue6.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue39 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue19;
        float multiplyAddValue140 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue20, inverseLengthValue39 * varyingTangent0.x));
        float multiplyAddValue141 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue20, inverseLengthValue39 * varyingTangent0.y));
        float multiplyAddValue142 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue21, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue20, inverseLengthValue39 * varyingTangent0.z));
        float inverseLengthValue40 = inversesqrt(dot(vec3(multiplyAddValue140, multiplyAddValue141, multiplyAddValue142), vec3(multiplyAddValue140, multiplyAddValue141, multiplyAddValue142)));
        intermediateValue12 = inverseLengthValue40 * multiplyAddValue140;
        intermediateValue13 = inverseLengthValue40 * multiplyAddValue141;
        intermediateValue14 = inverseLengthValue40 * multiplyAddValue142;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue41 = inversesqrt(dot(vec3(intermediateValue12, intermediateValue13, intermediateValue14), vec3(intermediateValue12, intermediateValue13, intermediateValue14)));
    float productValue177 = inverseLengthValue41 * intermediateValue12;
    float productValue178 = inverseLengthValue41 * intermediateValue13;
    float productValue179 = inverseLengthValue41 * intermediateValue14;
    float quotientValue13 = 1.0 / ((abs(productValue178) + abs(productValue177)) + abs(productValue179));
    float productValue180 = quotientValue13 * productValue177;
    float productValue181 = quotientValue13 * productValue178;
    bool conditionValue11 = productValue179 < 0.0;
    float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue16;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue121 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue16 = spvNClamp(productValue121, 0.0, 1.0);
        productValue18 = spvNClamp(((productValue121 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue121, 0.0, 1.0);
        productValue19 = spvNClamp((((productValue121 * productValue121) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue121, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue15 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue16 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue17 = (sampledTextureValue6.z * 2.0) + (-1.0);
        }
        float inverseLengthValue3 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
        float inverseLengthValue4 = inversesqrt(dot(vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z), vec3(varyingBitangent0.x, varyingBitangent0.y, varyingBitangent0.z)));
        float inverseLengthValue33 = inversesqrt(dot(vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z), vec3(varyingTangent0.x, varyingTangent0.y, varyingTangent0.z))) * intermediateValue15;
        float multiplyAddValue118 = fma(inverseLengthValue3 * varyingNormal0.x, intermediateValue17, fma(inverseLengthValue4 * varyingBitangent0.x, intermediateValue16, inverseLengthValue33 * varyingTangent0.x));
        float multiplyAddValue119 = fma(inverseLengthValue3 * varyingNormal0.y, intermediateValue17, fma(inverseLengthValue4 * varyingBitangent0.y, intermediateValue16, inverseLengthValue33 * varyingTangent0.y));
        float multiplyAddValue120 = fma(inverseLengthValue3 * varyingNormal0.z, intermediateValue17, fma(inverseLengthValue4 * varyingBitangent0.z, intermediateValue16, inverseLengthValue33 * varyingTangent0.z));
        float inverseLengthValue34 = inversesqrt(dot(vec3(multiplyAddValue118, multiplyAddValue119, multiplyAddValue120), vec3(multiplyAddValue118, multiplyAddValue119, multiplyAddValue120)));
        intermediateValue8 = inverseLengthValue34 * multiplyAddValue118;
        intermediateValue9 = inverseLengthValue34 * multiplyAddValue119;
        intermediateValue10 = inverseLengthValue34 * multiplyAddValue120;
    }
    float sumValue15 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[20u].x;
    float sumValue16 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[20u].y;
    float sumValue17 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[20u].z;
    float inverseLengthValue35 = inversesqrt(dot(vec3(intermediateValue8, intermediateValue9, intermediateValue10), vec3(intermediateValue8, intermediateValue9, intermediateValue10)));
    float productValue151 = inverseLengthValue35 * intermediateValue8;
    float productValue152 = inverseLengthValue35 * intermediateValue9;
    float productValue153 = inverseLengthValue35 * intermediateValue10;
    float quotientValue12 = 1.0 / ((abs(productValue152) + abs(productValue151)) + abs(productValue153));
    float productValue154 = quotientValue12 * productValue151;
    float productValue155 = quotientValue12 * productValue152;
    bool conditionValue10 = productValue153 < 0.0;
    float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue12;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue121 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue12 = spvNClamp(productValue121, 0.0, 1.0);
        productValue18 = spvNClamp(((productValue121 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue121, 0.0, 1.0);
        productValue19 = spvNClamp((((productValue121 * productValue121) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue121, 0.0, 1.0);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        else
        {
            vec4 sampledTextureValue6 = texture(sampler2D(normalTextureTexture, normalTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
            intermediateValue18 = (sampledTextureValue6.x * 2.0) + (-1.0);
            intermediateValue19 = (sampledTextureValue6.y * 2.0) + (-1.0);
            intermediateValue20 = (sampledTextureValue6.z * 2.0) + (-1.0);
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
    float multiplyAddValue69 = fma(fragmentVectorConstants1.packedValues[12u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].w;
    float multiplyAddValue70 = fma(fragmentVectorConstants1.packedValues[17u].w, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].w, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].w)) + fragmentVectorConstants1.packedValues[18u].w;
    float intermediateValue15;
    float productValue19;
    float productValue20;
    if ((fragmentVectorConstants1.packedValues[29u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[19u].x + fragmentVectorConstants1.packedValues[19u].y) + fragmentVectorConstants1.packedValues[19u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue121 = fragmentVectorConstants1.packedValues[29u].x * fragmentVectorConstants1.packedValues[29u].x;
        intermediateValue15 = spvNClamp(productValue121, 0.0, 1.0);
        productValue19 = spvNClamp(((productValue121 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue121, 0.0, 1.0);
        productValue20 = spvNClamp((((productValue121 * productValue121) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue121, 0.0, 1.0);
#endif
    }
    else
    {
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue3 = varyingNormal0.z;
        productValue4 = varyingNormal0.y;
        productValue5 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue4 = varyingNormal0.z;
        productValue5 = varyingNormal0.y;
        productValue6 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue5 = varyingNormal0.z;
        productValue6 = varyingNormal0.y;
        productValue7 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
        productValue6 = varyingNormal0.z;
        productValue7 = varyingNormal0.y;
        productValue8 = varyingNormal0.x;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue11 = fragmentVectorConstants1.packedValues[18u].x;
        productValue12 = fragmentVectorConstants1.packedValues[18u].y;
        productValue13 = fragmentVectorConstants1.packedValues[18u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue15 = fragmentVectorConstants1.packedValues[18u].x;
        productValue13 = fragmentVectorConstants1.packedValues[18u].y;
        productValue14 = fragmentVectorConstants1.packedValues[18u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue11 = fragmentVectorConstants1.packedValues[18u].x;
        productValue15 = fragmentVectorConstants1.packedValues[18u].y;
        productValue16 = fragmentVectorConstants1.packedValues[18u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue15 = fragmentVectorConstants1.packedValues[18u].x;
        productValue16 = fragmentVectorConstants1.packedValues[18u].y;
        productValue17 = fragmentVectorConstants1.packedValues[18u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue11 = fragmentVectorConstants1.packedValues[18u].x;
        productValue13 = fragmentVectorConstants1.packedValues[18u].y;
        productValue14 = fragmentVectorConstants1.packedValues[18u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue15 = fragmentVectorConstants1.packedValues[18u].x;
        productValue14 = fragmentVectorConstants1.packedValues[18u].y;
        productValue15 = fragmentVectorConstants1.packedValues[18u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue11 = fragmentVectorConstants1.packedValues[19u].x;
        productValue15 = fragmentVectorConstants1.packedValues[19u].y;
        productValue16 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue15 = fragmentVectorConstants1.packedValues[19u].x;
        productValue16 = fragmentVectorConstants1.packedValues[19u].y;
        productValue17 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue11 = fragmentVectorConstants1.packedValues[19u].x;
        productValue16 = fragmentVectorConstants1.packedValues[19u].y;
        productValue17 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue15 = fragmentVectorConstants1.packedValues[19u].x;
        productValue17 = fragmentVectorConstants1.packedValues[19u].y;
        productValue18 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue12 = fragmentVectorConstants1.packedValues[19u].x;
        productValue17 = fragmentVectorConstants1.packedValues[19u].y;
        productValue18 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue15 = fragmentVectorConstants1.packedValues[19u].x;
        productValue18 = fragmentVectorConstants1.packedValues[19u].y;
        productValue19 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue16 = fragmentVectorConstants1.packedValues[19u].x;
        productValue18 = fragmentVectorConstants1.packedValues[19u].y;
        productValue19 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue12 = fragmentVectorConstants1.packedValues[19u].x;
        productValue18 = fragmentVectorConstants1.packedValues[19u].y;
        productValue19 = fragmentVectorConstants1.packedValues[19u].z;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
        intermediateValue15 = fragmentVectorConstants1.packedValues[19u].x;
        productValue19 = fragmentVectorConstants1.packedValues[19u].y;
        productValue20 = fragmentVectorConstants1.packedValues[19u].z;
#endif
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits27 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits26.x);
    float reinterpretedBits28 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits26.y);
    float reinterpretedBits29 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits26.z);
    fragmentColor1.w = (reinterpretedBits18 < intermediateValue14) ? fma(intermediateValue14, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits18, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue5, productValue4, productValue3);
    float scalarValue22 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue22);
    float productValue45 = inverseLengthValue15 * productValue5;
    float productValue46 = inverseLengthValue15 * productValue4;
    float productValue47 = inverseLengthValue15 * productValue3;
    float quotientValue3 = 1.0 / (abs(productValue47) + (abs(productValue46) + abs(productValue45)));
    float productValue48 = quotientValue3 * productValue45;
    float productValue49 = quotientValue3 * productValue46;
    bool conditionValue5 = productValue47 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue48 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue49))) : productValue48;
    fragmentColor2.y = conditionValue5 ? (((productValue49 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue48))) : productValue49;
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue32 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits29, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.x))) + uintBitsToFloat(reinterpretedBits33.x)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.x))) + uintBitsToFloat(reinterpretedBits37.x)) / multiplyAddValue33, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.y))) + uintBitsToFloat(reinterpretedBits33.y)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.y))) + uintBitsToFloat(reinterpretedBits37.y)) / multiplyAddValue33, 0.5, 0.5);
    float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
    bool reinterpretedBits39 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits38 > 9.9999997473787516355514526367188e-05);
    float productValue50 = reinterpretedBits38 * reinterpretedBits38;
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits41 = (reinterpretedBits39 ? spvNMin(productValue50, 1.0) : uintBitsToFloat(reinterpretedBits40.x)) * 0.16666667163372039794921875;
    float multiplyAddValue34 = (reinterpretedBits39 ? spvNMin(fma(fma(productValue50, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : uintBitsToFloat(reinterpretedBits40.y)) * 0.16666667163372039794921875;
    float multiplyAddValue35 = (reinterpretedBits39 ? spvNMin(fma(productValue50 * productValue50, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : uintBitsToFloat(reinterpretedBits40.z)) * 0.16666667163372039794921875;
    float productValue51 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue34, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue35, reinterpretedBits41)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue34 / productValue51, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits41 / productValue51, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue35 / productValue51, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue51, 0.0, 1.0) * 255.0);
    uint reinterpretedBits42 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits42 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits42 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[109u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits27 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits26.x);
    float reinterpretedBits28 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits26.y);
    float reinterpretedBits29 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits26.z);
    fragmentColor1.w = (reinterpretedBits14 < intermediateValue20) ? fma(intermediateValue20, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits14, 0.4980392158031463623046875, 0.4980392158031463623046875);
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
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue32 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits29, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.x))) + uintBitsToFloat(reinterpretedBits33.x)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.x))) + uintBitsToFloat(reinterpretedBits37.x)) / multiplyAddValue33, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.y))) + uintBitsToFloat(reinterpretedBits33.y)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.y))) + uintBitsToFloat(reinterpretedBits37.y)) / multiplyAddValue33, 0.5, 0.5);
    float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
    bool reinterpretedBits39 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits38 > 9.9999997473787516355514526367188e-05);
    float productValue50 = reinterpretedBits38 * reinterpretedBits38;
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits41 = (reinterpretedBits39 ? spvNMin(productValue50, 1.0) : uintBitsToFloat(reinterpretedBits40.x)) * 0.16666667163372039794921875;
    float multiplyAddValue34 = (reinterpretedBits39 ? spvNMin(fma(fma(productValue50, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : uintBitsToFloat(reinterpretedBits40.y)) * 0.16666667163372039794921875;
    float multiplyAddValue35 = (reinterpretedBits39 ? spvNMin(fma(productValue50 * productValue50, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue50, 1.0) : uintBitsToFloat(reinterpretedBits40.z)) * 0.16666667163372039794921875;
    float productValue51 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue34, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue35, reinterpretedBits41)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue34 / productValue51, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits41 / productValue51, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue35 / productValue51, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue51, 0.0, 1.0) * 255.0);
    uint reinterpretedBits42 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits42 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits42 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[109u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits27 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits26.x);
    float reinterpretedBits28 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits26.y);
    float reinterpretedBits29 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits26.z);
    fragmentColor1.w = (reinterpretedBits18 < intermediateValue16) ? fma(intermediateValue16, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits18, 0.4980392158031463623046875, 0.4980392158031463623046875);
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
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue32 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits29, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.x))) + uintBitsToFloat(reinterpretedBits33.x)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.x))) + uintBitsToFloat(reinterpretedBits37.x)) / multiplyAddValue33, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.y))) + uintBitsToFloat(reinterpretedBits33.y)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.y))) + uintBitsToFloat(reinterpretedBits37.y)) / multiplyAddValue33, 0.5, 0.5);
    float reinterpretedBits52 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
    bool reinterpretedBits53 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits52 > 9.9999997473787516355514526367188e-05);
    float productValue95 = reinterpretedBits52 * reinterpretedBits52;
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits54 = (reinterpretedBits53 ? spvNMin(productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.x)) * 0.16666667163372039794921875;
    float multiplyAddValue55 = (reinterpretedBits53 ? spvNMin(fma(fma(productValue95, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.y)) * 0.16666667163372039794921875;
    float multiplyAddValue56 = (reinterpretedBits53 ? spvNMin(fma(productValue95 * productValue95, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.z)) * 0.16666667163372039794921875;
    float productValue96 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue55, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue56, reinterpretedBits54)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue55 / productValue96, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits54 / productValue96, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue56 / productValue96, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue96, 0.0, 1.0) * 255.0);
    uint reinterpretedBits42 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits42 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits42 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[113u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue18, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue17, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits27 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits26.x);
    float reinterpretedBits28 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits26.y);
    float reinterpretedBits29 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits26.z);
    fragmentColor1.w = (reinterpretedBits14 < intermediateValue22) ? fma(intermediateValue22, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits14, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue11 = vec3(productValue7, productValue6, productValue5);
    float scalarValue37 = rdDot3Precise(vectorValue11, vectorValue11);
    float inverseLengthValue23 = inversesqrt(scalarValue37);
    float productValue97 = inverseLengthValue23 * productValue7;
    float productValue98 = inverseLengthValue23 * productValue6;
    float productValue99 = inverseLengthValue23 * productValue5;
    float quotientValue8 = 1.0 / (abs(productValue99) + (abs(productValue98) + abs(productValue97)));
    float productValue100 = quotientValue8 * productValue97;
    float productValue101 = quotientValue8 * productValue98;
    bool conditionValue8 = productValue99 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue8 ? (((productValue100 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue101))) : productValue100;
    fragmentColor2.y = conditionValue8 ? (((productValue101 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue100))) : productValue101;
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue32 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits29, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.x))) + uintBitsToFloat(reinterpretedBits33.x)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.x))) + uintBitsToFloat(reinterpretedBits37.x)) / multiplyAddValue33, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.y))) + uintBitsToFloat(reinterpretedBits33.y)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.y))) + uintBitsToFloat(reinterpretedBits37.y)) / multiplyAddValue33, 0.5, 0.5);
    float reinterpretedBits52 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
    bool reinterpretedBits53 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits52 > 9.9999997473787516355514526367188e-05);
    float productValue95 = reinterpretedBits52 * reinterpretedBits52;
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits54 = (reinterpretedBits53 ? spvNMin(productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.x)) * 0.16666667163372039794921875;
    float multiplyAddValue55 = (reinterpretedBits53 ? spvNMin(fma(fma(productValue95, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.y)) * 0.16666667163372039794921875;
    float multiplyAddValue56 = (reinterpretedBits53 ? spvNMin(fma(productValue95 * productValue95, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.z)) * 0.16666667163372039794921875;
    float productValue96 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue55, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue56, reinterpretedBits54)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue55 / productValue96, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits54 / productValue96, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue56 / productValue96, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue96, 0.0, 1.0) * 255.0);
    uint reinterpretedBits42 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits42 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits42 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[113u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits27 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits26.x);
    float reinterpretedBits28 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits26.y);
    float reinterpretedBits29 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits26.z);
    fragmentColor1.w = (reinterpretedBits19 < intermediateValue14) ? fma(intermediateValue14, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits19, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue5, productValue4, productValue3);
    float scalarValue22 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue22);
    float productValue45 = inverseLengthValue15 * productValue5;
    float productValue46 = inverseLengthValue15 * productValue4;
    float productValue47 = inverseLengthValue15 * productValue3;
    float quotientValue3 = 1.0 / (abs(productValue47) + (abs(productValue46) + abs(productValue45)));
    float productValue48 = quotientValue3 * productValue45;
    float productValue49 = quotientValue3 * productValue46;
    bool conditionValue5 = productValue47 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue48 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue49))) : productValue48;
    fragmentColor2.y = conditionValue5 ? (((productValue49 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue48))) : productValue49;
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue32 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits29, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.x))) + uintBitsToFloat(reinterpretedBits33.x)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.x))) + uintBitsToFloat(reinterpretedBits37.x)) / multiplyAddValue33, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.y))) + uintBitsToFloat(reinterpretedBits33.y)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.y))) + uintBitsToFloat(reinterpretedBits37.y)) / multiplyAddValue33, 0.5, 0.5);
    float reinterpretedBits52 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
    bool reinterpretedBits53 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits52 > 9.9999997473787516355514526367188e-05);
    float productValue95 = reinterpretedBits52 * reinterpretedBits52;
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits54 = (reinterpretedBits53 ? spvNMin(productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.x)) * 0.16666667163372039794921875;
    float multiplyAddValue55 = (reinterpretedBits53 ? spvNMin(fma(fma(productValue95, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.y)) * 0.16666667163372039794921875;
    float multiplyAddValue56 = (reinterpretedBits53 ? spvNMin(fma(productValue95 * productValue95, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.z)) * 0.16666667163372039794921875;
    float productValue96 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue55, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue56, reinterpretedBits54)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue55 / productValue96, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits54 / productValue96, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue56 / productValue96, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue96, 0.0, 1.0) * 255.0);
    uint reinterpretedBits42 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits42 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits42 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[113u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits27 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits26.x);
    float reinterpretedBits28 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits26.y);
    float reinterpretedBits29 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits26.z);
    fragmentColor1.w = (reinterpretedBits15 < intermediateValue20) ? fma(intermediateValue20, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits15, 0.4980392158031463623046875, 0.4980392158031463623046875);
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
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue32 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits35 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits29, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits32.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.x))) + uintBitsToFloat(reinterpretedBits33.x)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.x), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.x), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.x))) + uintBitsToFloat(reinterpretedBits37.x)) / multiplyAddValue33, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits32.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits31.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits30.y))) + uintBitsToFloat(reinterpretedBits33.y)) / multiplyAddValue32, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits36.y), reinterpretedBits29, fma(uintBitsToFloat(reinterpretedBits35.y), reinterpretedBits27, reinterpretedBits28 * uintBitsToFloat(reinterpretedBits34.y))) + uintBitsToFloat(reinterpretedBits37.y)) / multiplyAddValue33, 0.5, 0.5);
    float reinterpretedBits52 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[112u]));
    bool reinterpretedBits53 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits52 > 9.9999997473787516355514526367188e-05);
    float productValue95 = reinterpretedBits52 * reinterpretedBits52;
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits54 = (reinterpretedBits53 ? spvNMin(productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.x)) * 0.16666667163372039794921875;
    float multiplyAddValue55 = (reinterpretedBits53 ? spvNMin(fma(fma(productValue95, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.y)) * 0.16666667163372039794921875;
    float multiplyAddValue56 = (reinterpretedBits53 ? spvNMin(fma(productValue95 * productValue95, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue95, 1.0) : uintBitsToFloat(reinterpretedBits40.z)) * 0.16666667163372039794921875;
    float productValue96 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue55, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue56, reinterpretedBits54)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue55 / productValue96, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits54 / productValue96, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue56 / productValue96, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue96, 0.0, 1.0) * 255.0);
    uint reinterpretedBits42 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits42 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits42 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[113u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
    fragmentColor1.w = (reinterpretedBits19 < intermediateValue14) ? fma(intermediateValue14, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits19, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue11 = vec3(productValue7, productValue6, productValue5);
    float scalarValue37 = rdDot3Precise(vectorValue11, vectorValue11);
    float inverseLengthValue23 = inversesqrt(scalarValue37);
    float productValue97 = inverseLengthValue23 * productValue7;
    float productValue98 = inverseLengthValue23 * productValue6;
    float productValue99 = inverseLengthValue23 * productValue5;
    float quotientValue8 = 1.0 / (abs(productValue99) + (abs(productValue98) + abs(productValue97)));
    float productValue100 = quotientValue8 * productValue97;
    float productValue101 = quotientValue8 * productValue98;
    bool conditionValue8 = productValue99 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue8 ? (((productValue100 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue101))) : productValue100;
    fragmentColor2.y = conditionValue8 ? (((productValue101 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue100))) : productValue101;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
    fragmentColor1.w = (reinterpretedBits15 < intermediateValue20) ? fma(intermediateValue20, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits15, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue16 = vec3(productValue8, productValue7, productValue6);
    float scalarValue45 = rdDot3Precise(vectorValue16, vectorValue16);
    float inverseLengthValue28 = inversesqrt(scalarValue45);
    float productValue135 = inverseLengthValue28 * productValue8;
    float productValue136 = inverseLengthValue28 * productValue7;
    float productValue137 = inverseLengthValue28 * productValue6;
    float quotientValue11 = 1.0 / (abs(productValue137) + (abs(productValue136) + abs(productValue135)));
    float productValue138 = quotientValue11 * productValue135;
    float productValue139 = quotientValue11 * productValue136;
    bool conditionValue9 = productValue137 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue9 ? (((productValue138 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue139))) : productValue138;
    fragmentColor2.y = conditionValue9 ? (((productValue139 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue138))) : productValue139;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
    fragmentColor1.w = (reinterpretedBits19 < intermediateValue16) ? fma(intermediateValue16, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits19, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue11 = vec3(productValue7, productValue6, productValue5);
    float scalarValue37 = rdDot3Precise(vectorValue11, vectorValue11);
    float inverseLengthValue23 = inversesqrt(scalarValue37);
    float productValue97 = inverseLengthValue23 * productValue7;
    float productValue98 = inverseLengthValue23 * productValue6;
    float productValue99 = inverseLengthValue23 * productValue5;
    float quotientValue8 = 1.0 / (abs(productValue99) + (abs(productValue98) + abs(productValue97)));
    float productValue100 = quotientValue8 * productValue97;
    float productValue101 = quotientValue8 * productValue98;
    bool conditionValue8 = productValue99 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue8 ? (((productValue100 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue101))) : productValue100;
    fragmentColor2.y = conditionValue8 ? (((productValue101 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue100))) : productValue101;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue18, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue17, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
    fragmentColor1.w = (reinterpretedBits15 < intermediateValue22) ? fma(intermediateValue22, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits15, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue16 = vec3(productValue8, productValue7, productValue6);
    float scalarValue45 = rdDot3Precise(vectorValue16, vectorValue16);
    float inverseLengthValue28 = inversesqrt(scalarValue45);
    float productValue135 = inverseLengthValue28 * productValue8;
    float productValue136 = inverseLengthValue28 * productValue7;
    float productValue137 = inverseLengthValue28 * productValue6;
    float quotientValue11 = 1.0 / (abs(productValue137) + (abs(productValue136) + abs(productValue135)));
    float productValue138 = quotientValue11 * productValue135;
    float productValue139 = quotientValue11 * productValue136;
    bool conditionValue9 = productValue137 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue9 ? (((productValue138 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue139))) : productValue138;
    fragmentColor2.y = conditionValue9 ? (((productValue139 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue138))) : productValue139;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue23, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
    fragmentColor1.w = (reinterpretedBits20 < intermediateValue14) ? fma(intermediateValue14, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits20, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue11 = vec3(productValue7, productValue6, productValue5);
    float scalarValue37 = rdDot3Precise(vectorValue11, vectorValue11);
    float inverseLengthValue23 = inversesqrt(scalarValue37);
    float productValue97 = inverseLengthValue23 * productValue7;
    float productValue98 = inverseLengthValue23 * productValue6;
    float productValue99 = inverseLengthValue23 * productValue5;
    float quotientValue8 = 1.0 / (abs(productValue99) + (abs(productValue98) + abs(productValue97)));
    float productValue100 = quotientValue8 * productValue97;
    float productValue101 = quotientValue8 * productValue98;
    bool conditionValue8 = productValue99 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue8 ? (((productValue100 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue101))) : productValue100;
    fragmentColor2.y = conditionValue8 ? (((productValue101 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue100))) : productValue101;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue15, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
    fragmentColor1.w = (reinterpretedBits16 < intermediateValue20) ? fma(intermediateValue20, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits16, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue16 = vec3(productValue8, productValue7, productValue6);
    float scalarValue45 = rdDot3Precise(vectorValue16, vectorValue16);
    float inverseLengthValue28 = inversesqrt(scalarValue45);
    float productValue135 = inverseLengthValue28 * productValue8;
    float productValue136 = inverseLengthValue28 * productValue7;
    float productValue137 = inverseLengthValue28 * productValue6;
    float quotientValue11 = 1.0 / (abs(productValue137) + (abs(productValue136) + abs(productValue135)));
    float productValue138 = quotientValue11 * productValue135;
    float productValue139 = quotientValue11 * productValue136;
    bool conditionValue9 = productValue137 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue9 ? (((productValue138 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue139))) : productValue138;
    fragmentColor2.y = conditionValue9 ? (((productValue139 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue138))) : productValue139;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
    fragmentColor1.w = (reinterpretedBits22 < intermediateValue15) ? fma(intermediateValue15, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits22, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue5, productValue4, productValue3);
    float scalarValue22 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue22);
    float productValue45 = inverseLengthValue15 * productValue5;
    float productValue46 = inverseLengthValue15 * productValue4;
    float productValue47 = inverseLengthValue15 * productValue3;
    float quotientValue3 = 1.0 / (abs(productValue47) + (abs(productValue46) + abs(productValue45)));
    float productValue48 = quotientValue3 * productValue45;
    float productValue49 = quotientValue3 * productValue46;
    bool conditionValue5 = productValue47 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue48 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue49))) : productValue48;
    fragmentColor2.y = conditionValue5 ? (((productValue49 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue48))) : productValue49;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue17, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
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
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
    fragmentColor1.w = (reinterpretedBits22 < intermediateValue17) ? fma(intermediateValue17, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits22, 0.4980392158031463623046875, 0.4980392158031463623046875);
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
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue19, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue18, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
    fragmentColor1.w = (reinterpretedBits19 < intermediateValue23) ? fma(intermediateValue23, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits19, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue11 = vec3(productValue7, productValue6, productValue5);
    float scalarValue37 = rdDot3Precise(vectorValue11, vectorValue11);
    float inverseLengthValue23 = inversesqrt(scalarValue37);
    float productValue97 = inverseLengthValue23 * productValue7;
    float productValue98 = inverseLengthValue23 * productValue6;
    float productValue99 = inverseLengthValue23 * productValue5;
    float quotientValue8 = 1.0 / (abs(productValue99) + (abs(productValue98) + abs(productValue97)));
    float productValue100 = quotientValue8 * productValue97;
    float productValue101 = quotientValue8 * productValue98;
    bool conditionValue8 = productValue99 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue8 ? (((productValue100 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue101))) : productValue100;
    fragmentColor2.y = conditionValue8 ? (((productValue101 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue100))) : productValue101;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue25, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue24, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
    fragmentColor1.w = (reinterpretedBits23 < intermediateValue15) ? fma(intermediateValue15, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits23, 0.4980392158031463623046875, 0.4980392158031463623046875);
    vec3 vectorValue6 = vec3(productValue5, productValue4, productValue3);
    float scalarValue22 = rdDot3Precise(vectorValue6, vectorValue6);
    float inverseLengthValue15 = inversesqrt(scalarValue22);
    float productValue45 = inverseLengthValue15 * productValue5;
    float productValue46 = inverseLengthValue15 * productValue4;
    float productValue47 = inverseLengthValue15 * productValue3;
    float quotientValue3 = 1.0 / (abs(productValue47) + (abs(productValue46) + abs(productValue45)));
    float productValue48 = quotientValue3 * productValue45;
    float productValue49 = quotientValue3 * productValue46;
    bool conditionValue5 = productValue47 < 0.0;
    float sumValue14 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue5 ? (((productValue48 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue49))) : productValue48;
    fragmentColor2.y = conditionValue5 ? (((productValue49 >= 0.0) ? sumValue14 : (-1.0)) * (1.0 - abs(productValue48))) : productValue49;
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue17, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue16, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits68 = floatBitsToUint(fragmentVectorConstants1.packedValues[20u]);
    float reinterpretedBits69 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits68.x);
    float reinterpretedBits70 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits68.y);
    float reinterpretedBits71 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits68.z);
    fragmentColor1.w = (reinterpretedBits20 < intermediateValue20) ? fma(intermediateValue20, 0.4980392158031463623046875, 0.501960813999176025390625) : fma(-reinterpretedBits20, 0.4980392158031463623046875, 0.4980392158031463623046875);
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
    uvec4 reinterpretedBits32 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits30 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits33 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float multiplyAddValue86 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue87 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), reinterpretedBits71, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits33.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.x), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.x), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.x))) + uintBitsToFloat(reinterpretedBits40.x)) / multiplyAddValue87, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits33.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits30.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits32.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue86, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits37.y), reinterpretedBits71, fma(uintBitsToFloat(reinterpretedBits34.y), reinterpretedBits69, reinterpretedBits70 * uintBitsToFloat(reinterpretedBits36.y))) + uintBitsToFloat(reinterpretedBits40.y)) / multiplyAddValue87, 0.5, 0.5);
    float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[116u]));
    bool reinterpretedBits73 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[77u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[78u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits72 > 9.9999997473787516355514526367188e-05);
    float productValue126 = reinterpretedBits72 * reinterpretedBits72;
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits74 = (reinterpretedBits73 ? spvNMin(productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.x)) * 0.16666667163372039794921875;
    float multiplyAddValue88 = (reinterpretedBits73 ? spvNMin(fma(fma(productValue126, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.y)) * 0.16666667163372039794921875;
    float multiplyAddValue89 = (reinterpretedBits73 ? spvNMin(fma(productValue126 * productValue126, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue126, 1.0) : uintBitsToFloat(reinterpretedBits26.z)) * 0.16666667163372039794921875;
    float productValue127 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue88, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue89, reinterpretedBits74)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = uint(spvNClamp(multiplyAddValue88 / productValue127, 0.0, 1.0) * 255.0) + (uint(spvNClamp(reinterpretedBits74 / productValue127, 0.0, 1.0) * 255.0) * 256u);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue89 / productValue127, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue127, 0.0, 1.0) * 255.0);
    uint reinterpretedBits75 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[79u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits75 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits75 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[117u])), 0.0, 1.0) * 255.0));
    fragmentColor0.x = uint(spvNClamp(intermediateValue22, 0.0, 1.0) * 255.0) + (uint(spvNClamp(intermediateValue21, 0.0, 1.0) * 255.0) * 256u);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue35 = intermediateValue11 * 0.16666667163372039794921875;
    float productValue36 = productValue12 * 0.16666667163372039794921875;
    float productValue37 = productValue13 * 0.16666667163372039794921875;
    float productValue38 = ceil(spvNClamp(spvNMax(spvNMax(productValue35, productValue37), spvNMax(productValue36, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue35 / productValue38, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue36 / productValue38, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue37 / productValue38, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue38, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[27u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue9) * fragmentVectorConstants1.packedValues[13u].w) + productValue9;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue10) * fragmentVectorConstants1.packedValues[13u].w) + productValue10;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue11) * fragmentVectorConstants1.packedValues[13u].w) + productValue11;
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue32 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue33))) : productValue32;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue32)) * ((productValue33 < 0.0) ? (-1.0) : 1.0)) : productValue33;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue62 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue37 = productValue13 * 0.16666667163372039794921875;
    float productValue63 = productValue14 * 0.16666667163372039794921875;
    float productValue64 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue63), spvNMax(productValue37, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue64, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue37 / productValue64, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue63 / productValue64, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue64, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[27u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue54) * fragmentVectorConstants1.packedValues[13u].w) + productValue54;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue55) * fragmentVectorConstants1.packedValues[13u].w) + productValue55;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue56) * fragmentVectorConstants1.packedValues[13u].w) + productValue56;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue35 = intermediateValue11 * 0.16666667163372039794921875;
    float productValue81 = productValue15 * 0.16666667163372039794921875;
    float productValue82 = productValue16 * 0.16666667163372039794921875;
    float productValue83 = ceil(spvNClamp(spvNMax(spvNMax(productValue35, productValue82), spvNMax(productValue81, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue35 / productValue83, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue81 / productValue83, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue82 / productValue83, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue83, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue77) * fragmentVectorConstants1.packedValues[13u].w) + productValue77;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue78) * fragmentVectorConstants1.packedValues[13u].w) + productValue78;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue79) * fragmentVectorConstants1.packedValues[13u].w) + productValue79;
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue32 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue33))) : productValue32;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue32)) * ((productValue33 < 0.0) ? (-1.0) : 1.0)) : productValue33;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue62 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue82 = productValue16 * 0.16666667163372039794921875;
    float productValue91 = productValue17 * 0.16666667163372039794921875;
    float productValue92 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue91), spvNMax(productValue82, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue92, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue82 / productValue92, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue91 / productValue92, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue92, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue88) * fragmentVectorConstants1.packedValues[13u].w) + productValue88;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue89) * fragmentVectorConstants1.packedValues[13u].w) + productValue89;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue90) * fragmentVectorConstants1.packedValues[13u].w) + productValue90;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue35 = intermediateValue11 * 0.16666667163372039794921875;
    float productValue37 = productValue13 * 0.16666667163372039794921875;
    float productValue63 = productValue14 * 0.16666667163372039794921875;
    float productValue106 = ceil(spvNClamp(spvNMax(spvNMax(productValue35, productValue63), spvNMax(productValue37, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue35 / productValue106, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue37 / productValue106, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue63 / productValue106, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue106, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue103) * fragmentVectorConstants1.packedValues[13u].w) + productValue103;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue104) * fragmentVectorConstants1.packedValues[13u].w) + productValue104;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue105) * fragmentVectorConstants1.packedValues[13u].w) + productValue105;
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue32 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue33))) : productValue32;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue32)) * ((productValue33 < 0.0) ? (-1.0) : 1.0)) : productValue33;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue62 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue63 = productValue14 * 0.16666667163372039794921875;
    float productValue81 = productValue15 * 0.16666667163372039794921875;
    float productValue111 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue81), spvNMax(productValue63, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue111, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue63 / productValue111, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue81 / productValue111, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue111, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[28u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue108) * fragmentVectorConstants1.packedValues[13u].w) + productValue108;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue109) * fragmentVectorConstants1.packedValues[13u].w) + productValue109;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue110) * fragmentVectorConstants1.packedValues[13u].w) + productValue110;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue4)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue3) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue5, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue4, sumValue3 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue4)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue35 = intermediateValue11 * 0.16666667163372039794921875;
    float productValue81 = productValue15 * 0.16666667163372039794921875;
    float productValue82 = productValue16 * 0.16666667163372039794921875;
    float productValue83 = ceil(spvNClamp(spvNMax(spvNMax(productValue35, productValue82), spvNMax(productValue81, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue35 / productValue83, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue81 / productValue83, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue82 / productValue83, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue83, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue118) * fragmentVectorConstants1.packedValues[14u].w) + productValue118;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue119) * fragmentVectorConstants1.packedValues[14u].w) + productValue119;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue120) * fragmentVectorConstants1.packedValues[14u].w) + productValue120;
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue32 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue33))) : productValue32;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue32)) * ((productValue33 < 0.0) ? (-1.0) : 1.0)) : productValue33;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue70)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue70)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue62 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue82 = productValue16 * 0.16666667163372039794921875;
    float productValue91 = productValue17 * 0.16666667163372039794921875;
    float productValue92 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue91), spvNMax(productValue82, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue92, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue82 / productValue92, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue91 / productValue92, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue92, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue132) * fragmentVectorConstants1.packedValues[14u].w) + productValue132;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue133) * fragmentVectorConstants1.packedValues[14u].w) + productValue133;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue134) * fragmentVectorConstants1.packedValues[14u].w) + productValue134;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue70)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue70)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue35 = intermediateValue11 * 0.16666667163372039794921875;
    float productValue82 = productValue16 * 0.16666667163372039794921875;
    float productValue91 = productValue17 * 0.16666667163372039794921875;
    float productValue141 = ceil(spvNClamp(spvNMax(spvNMax(productValue35, productValue91), spvNMax(productValue82, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue4, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue35 / productValue141, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue82 / productValue141, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue91 / productValue141, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue141, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue118) * fragmentVectorConstants1.packedValues[14u].w) + productValue118;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue119) * fragmentVectorConstants1.packedValues[14u].w) + productValue119;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue120) * fragmentVectorConstants1.packedValues[14u].w) + productValue120;
    fragmentColor1.w = (intermediateValue3 > intermediateValue6) ? ((intermediateValue3 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue6 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue2 ? (((productValue32 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue33))) : productValue32;
    fragmentColor2.y = conditionValue2 ? ((1.0 - abs(productValue32)) * ((productValue33 < 0.0) ? (-1.0) : 1.0)) : productValue33;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue70)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue70)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue62 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue91 = productValue17 * 0.16666667163372039794921875;
    float productValue143 = productValue18 * 0.16666667163372039794921875;
    float productValue144 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue143), spvNMax(productValue91, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue144, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue91 / productValue144, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue143 / productValue144, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue144, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue132) * fragmentVectorConstants1.packedValues[14u].w) + productValue132;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue133) * fragmentVectorConstants1.packedValues[14u].w) + productValue133;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue134) * fragmentVectorConstants1.packedValues[14u].w) + productValue134;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue70)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue70)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue156 = intermediateValue12 * 0.16666667163372039794921875;
    float productValue91 = productValue17 * 0.16666667163372039794921875;
    float productValue143 = productValue18 * 0.16666667163372039794921875;
    float productValue157 = ceil(spvNClamp(spvNMax(spvNMax(productValue156, productValue143), spvNMax(productValue91, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue156 / productValue157, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue91 / productValue157, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue143 / productValue157, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue157, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue148) * fragmentVectorConstants1.packedValues[14u].w) + productValue148;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue149) * fragmentVectorConstants1.packedValues[14u].w) + productValue149;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue150) * fragmentVectorConstants1.packedValues[14u].w) + productValue150;
    fragmentColor1.w = (intermediateValue4 > intermediateValue7) ? ((intermediateValue4 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue7 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue10 ? (((productValue154 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue155))) : productValue154;
    fragmentColor2.y = conditionValue10 ? ((1.0 - abs(productValue154)) * ((productValue155 < 0.0) ? (-1.0) : 1.0)) : productValue155;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue70)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue70)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue62 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue143 = productValue18 * 0.16666667163372039794921875;
    float productValue168 = productValue19 * 0.16666667163372039794921875;
    float productValue169 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue168), spvNMax(productValue143, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue169, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue143 / productValue169, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue168 / productValue169, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue169, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue165) * fragmentVectorConstants1.packedValues[14u].w) + productValue165;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue166) * fragmentVectorConstants1.packedValues[14u].w) + productValue166;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue167) * fragmentVectorConstants1.packedValues[14u].w) + productValue167;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue70)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue70)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue182 = intermediateValue16 * 0.16666667163372039794921875;
    float productValue143 = productValue18 * 0.16666667163372039794921875;
    float productValue168 = productValue19 * 0.16666667163372039794921875;
    float productValue183 = ceil(spvNClamp(spvNMax(spvNMax(productValue182, productValue168), spvNMax(productValue143, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue10, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue182 / productValue183, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue143 / productValue183, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue168 / productValue183, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue183, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue174) * fragmentVectorConstants1.packedValues[14u].w) + productValue174;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue175) * fragmentVectorConstants1.packedValues[14u].w) + productValue175;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue176) * fragmentVectorConstants1.packedValues[14u].w) + productValue176;
    fragmentColor1.w = (intermediateValue8 > intermediateValue11) ? ((intermediateValue8 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue11 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue11 ? (((productValue180 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue181))) : productValue180;
    fragmentColor2.y = conditionValue11 ? ((1.0 - abs(productValue180)) * ((productValue181 < 0.0) ? (-1.0) : 1.0)) : productValue181;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue70)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue70)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue156 = intermediateValue12 * 0.16666667163372039794921875;
    float productValue143 = productValue18 * 0.16666667163372039794921875;
    float productValue168 = productValue19 * 0.16666667163372039794921875;
    float productValue185 = ceil(spvNClamp(spvNMax(spvNMax(productValue156, productValue168), spvNMax(productValue143, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue6, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue5, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue156 / productValue185, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue143 / productValue185, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue168 / productValue185, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue185, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue148) * fragmentVectorConstants1.packedValues[14u].w) + productValue148;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue149) * fragmentVectorConstants1.packedValues[14u].w) + productValue149;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue150) * fragmentVectorConstants1.packedValues[14u].w) + productValue150;
    fragmentColor1.w = (intermediateValue4 > intermediateValue7) ? ((intermediateValue4 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue7 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue10 ? (((productValue154 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue155))) : productValue154;
    fragmentColor2.y = conditionValue10 ? ((1.0 - abs(productValue154)) * ((productValue155 < 0.0) ? (-1.0) : 1.0)) : productValue155;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue70)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue70)) * 0.5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue62 = intermediateValue15 * 0.16666667163372039794921875;
    float productValue168 = productValue19 * 0.16666667163372039794921875;
    float productValue187 = productValue20 * 0.16666667163372039794921875;
    float productValue188 = ceil(spvNClamp(spvNMax(spvNMax(productValue62, productValue187), spvNMax(productValue168, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[19u].w * 255.0)) << 8u;
    fragmentColor0.x = ((uint(spvNClamp(intermediateValue9, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(intermediateValue8, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.y = ((uint(spvNClamp(productValue62 / productValue188, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue168 / productValue188, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue187 / productValue188, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue188, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[29u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[14u].x - productValue165) * fragmentVectorConstants1.packedValues[14u].w) + productValue165;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[14u].y - productValue166) * fragmentVectorConstants1.packedValues[14u].w) + productValue166;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[14u].z - productValue167) * fragmentVectorConstants1.packedValues[14u].w) + productValue167;
    fragmentColor1.w = (intermediateValue7 > intermediateValue10) ? ((intermediateValue7 * 0.4980392158031463623046875) + 0.501960813999176025390625) : (0.4980392158031463623046875 - (intermediateValue10 * 0.4980392158031463623046875));
    fragmentColor2.x = conditionValue6 ? (((productValue60 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue61))) : productValue60;
    fragmentColor2.y = conditionValue6 ? ((1.0 - abs(productValue60)) * ((productValue61 < 0.0) ? (-1.0) : 1.0)) : productValue61;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[12u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].x) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].x, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].x, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].x)) + fragmentVectorConstants1.packedValues[18u].x) / multiplyAddValue70)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[12u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[10u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[13u].y) / multiplyAddValue69) - ((fma(fragmentVectorConstants1.packedValues[17u].y, sumValue17, fma(fragmentVectorConstants1.packedValues[16u].y, sumValue16, sumValue15 * fragmentVectorConstants1.packedValues[15u].y)) + fragmentVectorConstants1.packedValues[18u].y) / multiplyAddValue70)) * 0.5;
#endif
    discardIfRequested();
}
