#version 460
#extension GL_GOOGLE_include_directive : require
// ActorTintPrepass / GeometryPrepassAlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ActorTintPrepass/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[27u]);
    float reinterpretedBits1 = sampledTextureValue2.x * uintBitsToFloat(reinterpretedBits.x);
    float reinterpretedBits2 = sampledTextureValue2.y * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits3 = sampledTextureValue2.z * uintBitsToFloat(reinterpretedBits.z);
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.w;
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue3 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue2 = inversesqrt(scalarValue3);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits8 = rdDot3Precise(vec3(-(inverseLengthValue2 * reinterpretedBits4), -(inverseLengthValue2 * reinterpretedBits5), -(inverseLengthValue2 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits7.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits7.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits7.z)));
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits10 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[85u])) - reinterpretedBits9)) * (reinterpretedBits8 - reinterpretedBits9), 0.0, 1.0);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[24u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[86u]));
    float multiplyAddValue2 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits11.x)) / reinterpretedBits12) * reinterpretedBits12;
    float multiplyAddValue3 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits11.y)) / reinterpretedBits12) * reinterpretedBits12;
    float productValue25 = floor(multiplyAddValue3 * 0.25);
    float productValue26 = floor(multiplyAddValue3 * 0.5);
    float scalarValue4 = floor(multiplyAddValue3);
    if (((spvNMax(sampledTextureValue2.w * uintBitsToFloat(reinterpretedBits.w), 0.0) + scalarValue2) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[100u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue2 * 0.25), 0.5, (productValue25 * productValue25) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue2 * 0.5), 0.5, (productValue26 * productValue26) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue2), 0.5, (scalarValue4 * scalarValue4) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits10 * reinterpretedBits10) * fma(reinterpretedBits10, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue3.x;
    float scalarValue10 = sampledTextureValue3.y;
    float scalarValue11 = sampledTextureValue3.z;
    float scalarValue2 = sampledTextureValue3.w;
    bool productValue44 = ((1.0 - scalarValue2) * (scalarValue11 + (scalarValue10 + scalarValue9))) > 0.0;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[27u]);
    float multiplyAddValue14 = productValue44 ? (fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue2.x, -scalarValue9) + scalarValue9) : scalarValue9;
    float multiplyAddValue15 = productValue44 ? (fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue2.y, -scalarValue10) + scalarValue10) : scalarValue10;
    float multiplyAddValue16 = productValue44 ? (fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue2.z, -scalarValue11) + scalarValue11) : scalarValue11;
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue3 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue2 = inversesqrt(scalarValue3);
    uvec4 reinterpretedBits7 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits8 = rdDot3Precise(vec3(-(inverseLengthValue2 * reinterpretedBits4), -(inverseLengthValue2 * reinterpretedBits5), -(inverseLengthValue2 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits7.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits7.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits7.z)));
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float reinterpretedBits10 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[85u])) - reinterpretedBits9)) * (reinterpretedBits8 - reinterpretedBits9), 0.0, 1.0);
    uvec4 reinterpretedBits11 = floatBitsToUint(fragmentVectorConstants1.packedValues[24u]);
    float reinterpretedBits12 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[86u]));
    float multiplyAddValue2 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits11.x)) / reinterpretedBits12) * reinterpretedBits12;
    float multiplyAddValue3 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits11.y)) / reinterpretedBits12) * reinterpretedBits12;
    float productValue25 = floor(multiplyAddValue3 * 0.25);
    float productValue26 = floor(multiplyAddValue3 * 0.5);
    float scalarValue4 = floor(multiplyAddValue3);
    if (((scalarValue2 + spvNMax(productValue44 ? (fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue2.w, -scalarValue2) + scalarValue2) : scalarValue2, 0.0)) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[76u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[100u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue2 * 0.25), 0.5, (productValue25 * productValue25) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue2 * 0.5), 0.5, (productValue26 * productValue26) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue2), 0.5, (scalarValue4 * scalarValue4) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits10 * reinterpretedBits10) * fma(reinterpretedBits10, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
    float reinterpretedBits34 = sampledTextureValue2.x * uintBitsToFloat(reinterpretedBits13.x);
    float reinterpretedBits35 = sampledTextureValue2.y * uintBitsToFloat(reinterpretedBits13.y);
    float reinterpretedBits36 = sampledTextureValue2.z * uintBitsToFloat(reinterpretedBits13.z);
    float reinterpretedBits37 = sampledTextureValue2.w * uintBitsToFloat(reinterpretedBits13.w);
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.w;
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue3 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue2 = inversesqrt(scalarValue3);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits38 = rdDot3Precise(vec3(-(inverseLengthValue2 * reinterpretedBits4), -(inverseLengthValue2 * reinterpretedBits5), -(inverseLengthValue2 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits22.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits22.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits22.z)));
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits40 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits39)) * (reinterpretedBits38 - reinterpretedBits39), 0.0, 1.0);
    uvec4 reinterpretedBits41 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits42 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue22 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits41.x)) / reinterpretedBits42) * reinterpretedBits42;
    float multiplyAddValue23 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits41.y)) / reinterpretedBits42) * reinterpretedBits42;
    float productValue61 = floor(multiplyAddValue23 * 0.25);
    float productValue62 = floor(multiplyAddValue23 * 0.5);
    float scalarValue13 = floor(multiplyAddValue23);
    if (((spvNMax(reinterpretedBits37 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0) + scalarValue2) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue22 * 0.25), 0.5, (productValue61 * productValue61) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue22 * 0.5), 0.5, (productValue62 * productValue62) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue22), 0.5, (scalarValue13 * scalarValue13) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits40 * reinterpretedBits40) * fma(reinterpretedBits40, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue3.x;
    float scalarValue10 = sampledTextureValue3.y;
    float scalarValue11 = sampledTextureValue3.z;
    float scalarValue2 = sampledTextureValue3.w;
    bool productValue44 = ((1.0 - scalarValue2) * (scalarValue11 + (scalarValue10 + scalarValue9))) > 0.0;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
    float multiplyAddValue37 = productValue44 ? (fma(uintBitsToFloat(reinterpretedBits13.x), sampledTextureValue2.x, -scalarValue9) + scalarValue9) : scalarValue9;
    float multiplyAddValue38 = productValue44 ? (fma(uintBitsToFloat(reinterpretedBits13.y), sampledTextureValue2.y, -scalarValue10) + scalarValue10) : scalarValue10;
    float multiplyAddValue39 = productValue44 ? (fma(uintBitsToFloat(reinterpretedBits13.z), sampledTextureValue2.z, -scalarValue11) + scalarValue11) : scalarValue11;
    float multiplyAddValue40 = productValue44 ? (fma(uintBitsToFloat(reinterpretedBits13.w), sampledTextureValue2.w, -scalarValue2) + scalarValue2) : scalarValue2;
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue3 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue2 = inversesqrt(scalarValue3);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits38 = rdDot3Precise(vec3(-(inverseLengthValue2 * reinterpretedBits4), -(inverseLengthValue2 * reinterpretedBits5), -(inverseLengthValue2 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits22.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits22.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits22.z)));
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits40 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits39)) * (reinterpretedBits38 - reinterpretedBits39), 0.0, 1.0);
    uvec4 reinterpretedBits41 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits42 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue22 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits41.x)) / reinterpretedBits42) * reinterpretedBits42;
    float multiplyAddValue23 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits41.y)) / reinterpretedBits42) * reinterpretedBits42;
    float productValue61 = floor(multiplyAddValue23 * 0.25);
    float productValue62 = floor(multiplyAddValue23 * 0.5);
    float scalarValue13 = floor(multiplyAddValue23);
    if (((scalarValue2 + spvNMax(multiplyAddValue40 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0)) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue22 * 0.25), 0.5, (productValue61 * productValue61) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue22 * 0.5), 0.5, (productValue62 * productValue62) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue22), 0.5, (scalarValue13 * scalarValue13) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits40 * reinterpretedBits40) * fma(reinterpretedBits40, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
    float reinterpretedBits34 = sampledTextureValue2.x * uintBitsToFloat(reinterpretedBits13.x);
    float reinterpretedBits35 = sampledTextureValue2.y * uintBitsToFloat(reinterpretedBits13.y);
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue3.w;
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue3 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue2 = inversesqrt(scalarValue3);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits38 = rdDot3Precise(vec3(-(inverseLengthValue2 * reinterpretedBits4), -(inverseLengthValue2 * reinterpretedBits5), -(inverseLengthValue2 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits22.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits22.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits22.z)));
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits40 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits39)) * (reinterpretedBits38 - reinterpretedBits39), 0.0, 1.0);
    uvec4 reinterpretedBits41 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits42 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue22 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits41.x)) / reinterpretedBits42) * reinterpretedBits42;
    float multiplyAddValue23 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits41.y)) / reinterpretedBits42) * reinterpretedBits42;
    float productValue61 = floor(multiplyAddValue23 * 0.25);
    float productValue62 = floor(multiplyAddValue23 * 0.5);
    float scalarValue13 = floor(multiplyAddValue23);
    if (((spvNMax(sampledTextureValue2.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[115u])), 0.0) + scalarValue2) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue22 * 0.25), 0.5, (productValue61 * productValue61) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue22 * 0.5), 0.5, (productValue62 * productValue62) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue22), 0.5, (scalarValue13 * scalarValue13) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits40 * reinterpretedBits40) * fma(reinterpretedBits40, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture2, textureSampler2), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue9 = sampledTextureValue3.x;
    float scalarValue10 = sampledTextureValue3.y;
    float scalarValue11 = sampledTextureValue3.z;
    float scalarValue2 = sampledTextureValue3.w;
    bool productValue100 = ((scalarValue11 + (scalarValue10 + scalarValue9)) * (1.0 - scalarValue2)) > 0.0;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
    float multiplyAddValue53 = productValue100 ? (fma(uintBitsToFloat(reinterpretedBits13.x), sampledTextureValue2.x, -scalarValue9) + scalarValue9) : scalarValue9;
    float multiplyAddValue54 = productValue100 ? (fma(uintBitsToFloat(reinterpretedBits13.y), sampledTextureValue2.y, -scalarValue10) + scalarValue10) : scalarValue10;
    float reinterpretedBits4 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits4, reinterpretedBits5, reinterpretedBits6);
    float scalarValue3 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue2 = inversesqrt(scalarValue3);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits38 = rdDot3Precise(vec3(-(inverseLengthValue2 * reinterpretedBits4), -(inverseLengthValue2 * reinterpretedBits5), -(inverseLengthValue2 * reinterpretedBits6)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits22.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits22.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits22.z)));
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[88u]));
    float reinterpretedBits40 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[89u])) - reinterpretedBits39)) * (reinterpretedBits38 - reinterpretedBits39), 0.0, 1.0);
    uvec4 reinterpretedBits41 = floatBitsToUint(fragmentVectorConstants1.packedValues[25u]);
    float reinterpretedBits42 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[90u]));
    float multiplyAddValue22 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits41.x)) / reinterpretedBits42) * reinterpretedBits42;
    float multiplyAddValue23 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits41.y)) / reinterpretedBits42) * reinterpretedBits42;
    float productValue61 = floor(multiplyAddValue23 * 0.25);
    float productValue62 = floor(multiplyAddValue23 * 0.5);
    float scalarValue13 = floor(multiplyAddValue23);
    if (((scalarValue2 + spvNMax(productValue100 ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[115u])), sampledTextureValue2.w, -scalarValue2) + scalarValue2) : scalarValue2, 0.0)) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue22 * 0.25), 0.5, (productValue61 * productValue61) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue22 * 0.5), 0.5, (productValue62 * productValue62) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue22), 0.5, (scalarValue13 * scalarValue13) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits40 * reinterpretedBits40) * fma(reinterpretedBits40, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * fragmentVectorConstants1.packedValues[27u].x;
    float productValue1 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[27u].y;
    float productValue2 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[27u].z;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[21u].x) / (fragmentVectorConstants1.packedValues[21u].y - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].x) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].y) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float productValue3 = floor(quotientValue1 * 0.25);
        float productValue4 = floor(quotientValue1 * 0.5);
        float scalarValue1 = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue4 * productValue4) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue3 * productValue3) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue1 * scalarValue1) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((scalarValue + spvNMax(0.0, sampledTextureValue.w * fragmentVectorConstants1.packedValues[27u].w)) < fragmentVectorConstants1.packedValues[19u].x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue1.x;
    float scalarValue7 = sampledTextureValue1.y;
    float scalarValue8 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue34 = float((((scalarValue6 + scalarValue7) + scalarValue8) * (1.0 - scalarValue)) > 0.0);
    float productValue35 = (productValue34 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[27u].x) - scalarValue6)) + scalarValue6;
    float productValue36 = (productValue34 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[27u].y) - scalarValue7)) + scalarValue7;
    float productValue37 = (productValue34 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[27u].z) - scalarValue8)) + scalarValue8;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[25u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[21u].x) / (fragmentVectorConstants1.packedValues[21u].y - fragmentVectorConstants1.packedValues[21u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].x) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[24u].y) / fragmentVectorConstants1.packedValues[21u].z) * fragmentVectorConstants1.packedValues[21u].z;
        float productValue3 = floor(quotientValue1 * 0.25);
        float productValue4 = floor(quotientValue1 * 0.5);
        float scalarValue1 = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue4 * productValue4) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue3 * productValue3) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue1 * scalarValue1) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((scalarValue + spvNMax(0.0, (productValue34 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[27u].w) - scalarValue)) + scalarValue)) < fragmentVectorConstants1.packedValues[19u].x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue45 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[28u].x;
    float productValue46 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[28u].y;
    float productValue47 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[28u].z;
    float productValue48 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[28u].w;
    float productValue49 = (((productValue45 * fragmentVectorConstants1.packedValues[4u].x) - productValue45) * productValue48) + productValue45;
    float productValue50 = (((productValue46 * fragmentVectorConstants1.packedValues[4u].y) - productValue46) * productValue48) + productValue46;
    float productValue51 = (((productValue47 * fragmentVectorConstants1.packedValues[4u].z) - productValue47) * productValue48) + productValue47;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[22u].x) / (fragmentVectorConstants1.packedValues[22u].y - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
        float quotientValue4 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float quotientValue5 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float productValue52 = floor(quotientValue5 * 0.25);
        float productValue53 = floor(quotientValue5 * 0.5);
        float scalarValue12 = floor(quotientValue5);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue53 * productValue53) * 0.75) + (floor(quotientValue4 * 0.5) * 0.5)) + (fract(((productValue52 * productValue52) * 0.75) + (floor(quotientValue4 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue12 * scalarValue12) * 0.75) + (floor(quotientValue4) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((scalarValue + spvNMax(0.0, productValue48 * fragmentVectorConstants1.packedValues[4u].w)) < fragmentVectorConstants1.packedValues[20u].x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue1.x;
    float scalarValue7 = sampledTextureValue1.y;
    float scalarValue8 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue34 = float((((scalarValue6 + scalarValue7) + scalarValue8) * (1.0 - scalarValue)) > 0.0);
    float productValue65 = (productValue34 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[28u].x) - scalarValue6)) + scalarValue6;
    float productValue66 = (productValue34 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[28u].y) - scalarValue7)) + scalarValue7;
    float productValue67 = (productValue34 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[28u].z) - scalarValue8)) + scalarValue8;
    float productValue68 = (productValue34 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[28u].w) - scalarValue)) + scalarValue;
    float productValue69 = (((productValue65 * fragmentVectorConstants1.packedValues[4u].x) - productValue65) * productValue68) + productValue65;
    float productValue70 = (((productValue66 * fragmentVectorConstants1.packedValues[4u].y) - productValue66) * productValue68) + productValue66;
    float productValue71 = (((productValue67 * fragmentVectorConstants1.packedValues[4u].z) - productValue67) * productValue68) + productValue67;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[22u].x) / (fragmentVectorConstants1.packedValues[22u].y - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
        float quotientValue4 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float quotientValue5 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float productValue52 = floor(quotientValue5 * 0.25);
        float productValue53 = floor(quotientValue5 * 0.5);
        float scalarValue12 = floor(quotientValue5);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue53 * productValue53) * 0.75) + (floor(quotientValue4 * 0.5) * 0.5)) + (fract(((productValue52 * productValue52) * 0.75) + (floor(quotientValue4 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue12 * scalarValue12) * 0.75) + (floor(quotientValue4) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((spvNMax(0.0, productValue68 * fragmentVectorConstants1.packedValues[4u].w) + scalarValue) < fragmentVectorConstants1.packedValues[20u].x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue45 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[28u].x;
    float productValue46 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[28u].y;
    float productValue77 = fragmentVectorConstants1.packedValues[4u].x * productValue45;
    float productValue78 = fragmentVectorConstants1.packedValues[4u].y * productValue45;
    float productValue79 = fragmentVectorConstants1.packedValues[4u].z * productValue45;
    float scalarValue14 = ceil(productValue46);
    float productValue80 = (((productValue46 * fragmentVectorConstants1.packedValues[29u].x) - productValue77) * scalarValue14) + productValue77;
    float productValue81 = (((productValue46 * fragmentVectorConstants1.packedValues[29u].y) - productValue78) * scalarValue14) + productValue78;
    float productValue82 = (((productValue46 * fragmentVectorConstants1.packedValues[29u].z) - productValue79) * scalarValue14) + productValue79;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[22u].x) / (fragmentVectorConstants1.packedValues[22u].y - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
        float quotientValue4 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float quotientValue5 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float productValue52 = floor(quotientValue5 * 0.25);
        float productValue53 = floor(quotientValue5 * 0.5);
        float scalarValue12 = floor(quotientValue5);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue53 * productValue53) * 0.75) + (floor(quotientValue4 * 0.5) * 0.5)) + (fract(((productValue52 * productValue52) * 0.75) + (floor(quotientValue4 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue12 * scalarValue12) * 0.75) + (floor(quotientValue4) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((scalarValue + spvNMax(0.0, sampledTextureValue.w * fragmentVectorConstants1.packedValues[28u].w)) < fragmentVectorConstants1.packedValues[20u].x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue6 = sampledTextureValue1.x;
    float scalarValue7 = sampledTextureValue1.y;
    float scalarValue8 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue34 = float((((scalarValue6 + scalarValue7) + scalarValue8) * (1.0 - scalarValue)) > 0.0);
    float productValue65 = (productValue34 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[28u].x) - scalarValue6)) + scalarValue6;
    float productValue66 = (productValue34 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[28u].y) - scalarValue7)) + scalarValue7;
    float productValue88 = productValue65 * fragmentVectorConstants1.packedValues[4u].x;
    float productValue89 = productValue65 * fragmentVectorConstants1.packedValues[4u].y;
    float productValue90 = productValue65 * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue15 = ceil(productValue66);
    float productValue91 = (((productValue66 * fragmentVectorConstants1.packedValues[29u].x) - productValue88) * scalarValue15) + productValue88;
    float productValue92 = (((productValue66 * fragmentVectorConstants1.packedValues[29u].y) - productValue89) * scalarValue15) + productValue89;
    float productValue93 = (((productValue66 * fragmentVectorConstants1.packedValues[29u].z) - productValue90) * scalarValue15) + productValue90;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[26u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[22u].x) / (fragmentVectorConstants1.packedValues[22u].y - fragmentVectorConstants1.packedValues[22u].x), 0.0, 1.0);
        float quotientValue4 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].x) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float quotientValue5 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[25u].y) / fragmentVectorConstants1.packedValues[22u].z) * fragmentVectorConstants1.packedValues[22u].z;
        float productValue52 = floor(quotientValue5 * 0.25);
        float productValue53 = floor(quotientValue5 * 0.5);
        float scalarValue12 = floor(quotientValue5);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue53 * productValue53) * 0.75) + (floor(quotientValue4 * 0.5) * 0.5)) + (fract(((productValue52 * productValue52) * 0.75) + (floor(quotientValue4 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue12 * scalarValue12) * 0.75) + (floor(quotientValue4) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((spvNMax(0.0, (productValue34 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[28u].w) - scalarValue)) + scalarValue) + scalarValue) < fragmentVectorConstants1.packedValues[20u].x))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
    float multiplyAddValue4 = fma(scalarValue2, fma(sampledTextureValue3.x, uintBitsToFloat(reinterpretedBits13.x), -reinterpretedBits1), reinterpretedBits1);
    float multiplyAddValue5 = fma(scalarValue2, fma(sampledTextureValue3.y, uintBitsToFloat(reinterpretedBits13.y), -reinterpretedBits2), reinterpretedBits2);
    float multiplyAddValue6 = fma(scalarValue2, fma(sampledTextureValue3.z, uintBitsToFloat(reinterpretedBits13.z), -reinterpretedBits3), reinterpretedBits3);
    float reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float multiplyAddValue7 = fma(reinterpretedBits14, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue8 = fma(reinterpretedBits14, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue9 = fma(reinterpretedBits14, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits15 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    fragmentColor1.x = fma(reinterpretedBits16, fma(-multiplyAddValue4, multiplyAddValue7, uintBitsToFloat(reinterpretedBits15.x)), multiplyAddValue4 * multiplyAddValue7);
    fragmentColor1.y = fma(reinterpretedBits16, fma(-multiplyAddValue5, multiplyAddValue8, uintBitsToFloat(reinterpretedBits15.y)), multiplyAddValue5 * multiplyAddValue8);
    fragmentColor1.z = fma(reinterpretedBits16, fma(-multiplyAddValue6, multiplyAddValue9, uintBitsToFloat(reinterpretedBits15.z)), multiplyAddValue6 * multiplyAddValue9);
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits18 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits17.x);
    float reinterpretedBits19 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits17.y);
    float reinterpretedBits20 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits17.z);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue5 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue5);
    float productValue27 = inverseLengthValue3 * varyingNormal0.x;
    float productValue28 = inverseLengthValue3 * varyingNormal0.y;
    float productValue29 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue3 = 1.0 / (abs(productValue29) + (abs(productValue28) + abs(productValue27)));
    float productValue30 = quotientValue3 * productValue27;
    float productValue31 = quotientValue3 * productValue28;
    bool conditionValue1 = productValue29 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue31)) * ((productValue30 >= 0.0) ? sumValue3 : (-1.0))) : productValue30;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue30)) * ((productValue31 >= 0.0) ? sumValue3 : (-1.0))) : productValue31;
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue10 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u]));
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue11 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits20, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u])), reinterpretedBits18, reinterpretedBits19 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits23.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits22.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits21.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue10, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits27.x), reinterpretedBits20, fma(uintBitsToFloat(reinterpretedBits26.x), reinterpretedBits18, reinterpretedBits19 * uintBitsToFloat(reinterpretedBits25.x))) + uintBitsToFloat(reinterpretedBits28.x)) / multiplyAddValue11, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits23.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits22.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits21.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue10, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits27.y), reinterpretedBits20, fma(uintBitsToFloat(reinterpretedBits26.y), reinterpretedBits18, reinterpretedBits19 * uintBitsToFloat(reinterpretedBits25.y))) + uintBitsToFloat(reinterpretedBits28.y)) / multiplyAddValue11, 0.5, 0.5);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u]));
    bool reinterpretedBits30 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[69u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[70u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits29 > 9.9999997473787516355514526367188e-05);
    float productValue32 = reinterpretedBits29 * reinterpretedBits29;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits32 = (reinterpretedBits30 ? spvNMin(productValue32, 1.0) : uintBitsToFloat(reinterpretedBits31.x)) * 0.16666667163372039794921875;
    float multiplyAddValue12 = (reinterpretedBits30 ? spvNMin(fma(fma(productValue32, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue32, 1.0) : uintBitsToFloat(reinterpretedBits31.y)) * 0.16666667163372039794921875;
    float multiplyAddValue13 = (reinterpretedBits30 ? spvNMin(fma(productValue32 * productValue32, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue32, 1.0) : uintBitsToFloat(reinterpretedBits31.z)) * 0.16666667163372039794921875;
    float productValue33 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue12, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue13, reinterpretedBits32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(reinterpretedBits32 / productValue33, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue12 / productValue33, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue13 / productValue33, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue33, 0.0, 1.0) * 255.0);
    uint reinterpretedBits33 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits33 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits33 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[105u])), 0.0, 1.0) * 255.0));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[28u]);
    float multiplyAddValue17 = fma(scalarValue2, fma(scalarValue9, uintBitsToFloat(reinterpretedBits13.x), -multiplyAddValue14), multiplyAddValue14);
    float multiplyAddValue18 = fma(scalarValue2, fma(scalarValue10, uintBitsToFloat(reinterpretedBits13.y), -multiplyAddValue15), multiplyAddValue15);
    float multiplyAddValue19 = fma(scalarValue2, fma(scalarValue11, uintBitsToFloat(reinterpretedBits13.z), -multiplyAddValue16), multiplyAddValue16);
    float reinterpretedBits14 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[80u]));
    float multiplyAddValue7 = fma(reinterpretedBits14, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue8 = fma(reinterpretedBits14, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue9 = fma(reinterpretedBits14, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits15 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float reinterpretedBits16 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    fragmentColor1.x = fma(reinterpretedBits16, fma(-multiplyAddValue17, multiplyAddValue7, uintBitsToFloat(reinterpretedBits15.x)), multiplyAddValue17 * multiplyAddValue7);
    fragmentColor1.y = fma(reinterpretedBits16, fma(-multiplyAddValue18, multiplyAddValue8, uintBitsToFloat(reinterpretedBits15.y)), multiplyAddValue18 * multiplyAddValue8);
    fragmentColor1.z = fma(reinterpretedBits16, fma(-multiplyAddValue19, multiplyAddValue9, uintBitsToFloat(reinterpretedBits15.z)), multiplyAddValue19 * multiplyAddValue9);
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits18 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits17.x);
    float reinterpretedBits19 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits17.y);
    float reinterpretedBits20 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits17.z);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue5 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue5);
    float productValue27 = inverseLengthValue3 * varyingNormal0.x;
    float productValue28 = inverseLengthValue3 * varyingNormal0.y;
    float productValue29 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue3 = 1.0 / (abs(productValue29) + (abs(productValue28) + abs(productValue27)));
    float productValue30 = quotientValue3 * productValue27;
    float productValue31 = quotientValue3 * productValue28;
    bool conditionValue1 = productValue29 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue31)) * ((productValue30 >= 0.0) ? sumValue3 : (-1.0))) : productValue30;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue30)) * ((productValue31 >= 0.0) ? sumValue3 : (-1.0))) : productValue31;
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits22 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue10 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u]));
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue11 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])), reinterpretedBits20, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u])), reinterpretedBits18, reinterpretedBits19 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits23.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits22.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits21.x))) + uintBitsToFloat(reinterpretedBits24.x)) / multiplyAddValue10, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits27.x), reinterpretedBits20, fma(uintBitsToFloat(reinterpretedBits26.x), reinterpretedBits18, reinterpretedBits19 * uintBitsToFloat(reinterpretedBits25.x))) + uintBitsToFloat(reinterpretedBits28.x)) / multiplyAddValue11, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits23.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits22.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits21.y))) + uintBitsToFloat(reinterpretedBits24.y)) / multiplyAddValue10, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits27.y), reinterpretedBits20, fma(uintBitsToFloat(reinterpretedBits26.y), reinterpretedBits18, reinterpretedBits19 * uintBitsToFloat(reinterpretedBits25.y))) + uintBitsToFloat(reinterpretedBits28.y)) / multiplyAddValue11, 0.5, 0.5);
    float reinterpretedBits29 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[104u]));
    bool reinterpretedBits30 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[69u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[70u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits29 > 9.9999997473787516355514526367188e-05);
    float productValue32 = reinterpretedBits29 * reinterpretedBits29;
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits32 = (reinterpretedBits30 ? spvNMin(productValue32, 1.0) : uintBitsToFloat(reinterpretedBits31.x)) * 0.16666667163372039794921875;
    float multiplyAddValue12 = (reinterpretedBits30 ? spvNMin(fma(fma(productValue32, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue32, 1.0) : uintBitsToFloat(reinterpretedBits31.y)) * 0.16666667163372039794921875;
    float multiplyAddValue13 = (reinterpretedBits30 ? spvNMin(fma(productValue32 * productValue32, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue32, 1.0) : uintBitsToFloat(reinterpretedBits31.z)) * 0.16666667163372039794921875;
    float productValue33 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue12, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue13, reinterpretedBits32)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(reinterpretedBits32 / productValue33, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue12 / productValue33, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue13 / productValue33, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue33, 0.0, 1.0) * 255.0);
    uint reinterpretedBits33 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits33 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits33 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[105u])), 0.0, 1.0) * 255.0));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue24 = fma(reinterpretedBits37, fma(reinterpretedBits34, uintBitsToFloat(reinterpretedBits43.x), -reinterpretedBits34), reinterpretedBits34);
    float multiplyAddValue25 = fma(reinterpretedBits37, fma(reinterpretedBits35, uintBitsToFloat(reinterpretedBits43.y), -reinterpretedBits35), reinterpretedBits35);
    float multiplyAddValue26 = fma(reinterpretedBits37, fma(reinterpretedBits36, uintBitsToFloat(reinterpretedBits43.z), -reinterpretedBits36), reinterpretedBits36);
    uvec4 reinterpretedBits44 = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float multiplyAddValue27 = fma(scalarValue2, fma(sampledTextureValue3.x, uintBitsToFloat(reinterpretedBits44.x), -multiplyAddValue24), multiplyAddValue24);
    float multiplyAddValue28 = fma(scalarValue2, fma(sampledTextureValue3.y, uintBitsToFloat(reinterpretedBits44.y), -multiplyAddValue25), multiplyAddValue25);
    float multiplyAddValue29 = fma(scalarValue2, fma(sampledTextureValue3.z, uintBitsToFloat(reinterpretedBits44.z), -multiplyAddValue26), multiplyAddValue26);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue30 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue31 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue32 = fma(reinterpretedBits9, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits45 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    fragmentColor1.x = fma(reinterpretedBits45, fma(-multiplyAddValue27, multiplyAddValue30, uintBitsToFloat(reinterpretedBits26.x)), multiplyAddValue27 * multiplyAddValue30);
    fragmentColor1.y = fma(reinterpretedBits45, fma(-multiplyAddValue28, multiplyAddValue31, uintBitsToFloat(reinterpretedBits26.y)), multiplyAddValue28 * multiplyAddValue31);
    fragmentColor1.z = fma(reinterpretedBits45, fma(-multiplyAddValue29, multiplyAddValue32, uintBitsToFloat(reinterpretedBits26.z)), multiplyAddValue29 * multiplyAddValue32);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits47 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits46.x);
    float reinterpretedBits48 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits46.y);
    float reinterpretedBits49 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits46.z);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue5 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue5);
    float productValue27 = inverseLengthValue3 * varyingNormal0.x;
    float productValue28 = inverseLengthValue3 * varyingNormal0.y;
    float productValue29 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue3 = 1.0 / (abs(productValue29) + (abs(productValue28) + abs(productValue27)));
    float productValue30 = quotientValue3 * productValue27;
    float productValue31 = quotientValue3 * productValue28;
    bool conditionValue1 = productValue29 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue31)) * ((productValue30 >= 0.0) ? sumValue3 : (-1.0))) : productValue30;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue30)) * ((productValue31 >= 0.0) ? sumValue3 : (-1.0))) : productValue31;
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits15 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue34 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits49, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits24.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits23.x))) + uintBitsToFloat(reinterpretedBits15.x)) / multiplyAddValue33, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.x), reinterpretedBits49, fma(uintBitsToFloat(reinterpretedBits25.x), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(reinterpretedBits27.x))) + uintBitsToFloat(reinterpretedBits31.x)) / multiplyAddValue34, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits24.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits23.y))) + uintBitsToFloat(reinterpretedBits15.y)) / multiplyAddValue33, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.y), reinterpretedBits49, fma(uintBitsToFloat(reinterpretedBits25.y), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(reinterpretedBits27.y))) + uintBitsToFloat(reinterpretedBits31.y)) / multiplyAddValue34, 0.5, 0.5);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
    bool reinterpretedBits51 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits50 > 9.9999997473787516355514526367188e-05);
    float productValue63 = reinterpretedBits50 * reinterpretedBits50;
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits52 = (reinterpretedBits51 ? spvNMin(productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.x)) * 0.16666667163372039794921875;
    float multiplyAddValue35 = (reinterpretedBits51 ? spvNMin(fma(fma(productValue63, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.y)) * 0.16666667163372039794921875;
    float multiplyAddValue36 = (reinterpretedBits51 ? spvNMin(fma(productValue63 * productValue63, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.z)) * 0.16666667163372039794921875;
    float productValue64 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue35, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue36, reinterpretedBits52)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(reinterpretedBits52 / productValue64, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue35 / productValue64, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue36 / productValue64, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue64, 0.0, 1.0) * 255.0);
    uint reinterpretedBits53 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits53 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits53 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[109u])), 0.0, 1.0) * 255.0));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue41 = fma(multiplyAddValue40, fma(multiplyAddValue37, uintBitsToFloat(reinterpretedBits43.x), -multiplyAddValue37), multiplyAddValue37);
    float multiplyAddValue42 = fma(multiplyAddValue40, fma(multiplyAddValue38, uintBitsToFloat(reinterpretedBits43.y), -multiplyAddValue38), multiplyAddValue38);
    float multiplyAddValue43 = fma(multiplyAddValue40, fma(multiplyAddValue39, uintBitsToFloat(reinterpretedBits43.z), -multiplyAddValue39), multiplyAddValue39);
    uvec4 reinterpretedBits44 = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float multiplyAddValue44 = fma(scalarValue2, fma(scalarValue9, uintBitsToFloat(reinterpretedBits44.x), -multiplyAddValue41), multiplyAddValue41);
    float multiplyAddValue45 = fma(scalarValue2, fma(scalarValue10, uintBitsToFloat(reinterpretedBits44.y), -multiplyAddValue42), multiplyAddValue42);
    float multiplyAddValue46 = fma(scalarValue2, fma(scalarValue11, uintBitsToFloat(reinterpretedBits44.z), -multiplyAddValue43), multiplyAddValue43);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue30 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue31 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue32 = fma(reinterpretedBits9, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits45 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    fragmentColor1.x = fma(reinterpretedBits45, fma(-multiplyAddValue44, multiplyAddValue30, uintBitsToFloat(reinterpretedBits26.x)), multiplyAddValue44 * multiplyAddValue30);
    fragmentColor1.y = fma(reinterpretedBits45, fma(-multiplyAddValue45, multiplyAddValue31, uintBitsToFloat(reinterpretedBits26.y)), multiplyAddValue45 * multiplyAddValue31);
    fragmentColor1.z = fma(reinterpretedBits45, fma(-multiplyAddValue46, multiplyAddValue32, uintBitsToFloat(reinterpretedBits26.z)), multiplyAddValue46 * multiplyAddValue32);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits47 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits46.x);
    float reinterpretedBits48 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits46.y);
    float reinterpretedBits49 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits46.z);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue5 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue5);
    float productValue27 = inverseLengthValue3 * varyingNormal0.x;
    float productValue28 = inverseLengthValue3 * varyingNormal0.y;
    float productValue29 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue3 = 1.0 / (abs(productValue29) + (abs(productValue28) + abs(productValue27)));
    float productValue30 = quotientValue3 * productValue27;
    float productValue31 = quotientValue3 * productValue28;
    bool conditionValue1 = productValue29 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue31)) * ((productValue30 >= 0.0) ? sumValue3 : (-1.0))) : productValue30;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue30)) * ((productValue31 >= 0.0) ? sumValue3 : (-1.0))) : productValue31;
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits15 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue34 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits49, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits24.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits23.x))) + uintBitsToFloat(reinterpretedBits15.x)) / multiplyAddValue33, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.x), reinterpretedBits49, fma(uintBitsToFloat(reinterpretedBits25.x), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(reinterpretedBits27.x))) + uintBitsToFloat(reinterpretedBits31.x)) / multiplyAddValue34, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits24.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits23.y))) + uintBitsToFloat(reinterpretedBits15.y)) / multiplyAddValue33, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.y), reinterpretedBits49, fma(uintBitsToFloat(reinterpretedBits25.y), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(reinterpretedBits27.y))) + uintBitsToFloat(reinterpretedBits31.y)) / multiplyAddValue34, 0.5, 0.5);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
    bool reinterpretedBits51 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits50 > 9.9999997473787516355514526367188e-05);
    float productValue63 = reinterpretedBits50 * reinterpretedBits50;
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits52 = (reinterpretedBits51 ? spvNMin(productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.x)) * 0.16666667163372039794921875;
    float multiplyAddValue35 = (reinterpretedBits51 ? spvNMin(fma(fma(productValue63, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.y)) * 0.16666667163372039794921875;
    float multiplyAddValue36 = (reinterpretedBits51 ? spvNMin(fma(productValue63 * productValue63, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.z)) * 0.16666667163372039794921875;
    float productValue64 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue35, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue36, reinterpretedBits52)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(reinterpretedBits52 / productValue64, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue35 / productValue64, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue36 / productValue64, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue64, 0.0, 1.0) * 255.0);
    uint reinterpretedBits53 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits53 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits53 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[109u])), 0.0, 1.0) * 255.0));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits54 = reinterpretedBits34 * uintBitsToFloat(reinterpretedBits43.x);
    float reinterpretedBits55 = reinterpretedBits34 * uintBitsToFloat(reinterpretedBits43.y);
    float reinterpretedBits56 = reinterpretedBits34 * uintBitsToFloat(reinterpretedBits43.z);
    float scalarValue16 = ceil(reinterpretedBits35);
    uvec4 reinterpretedBits44 = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits44.x);
    float reinterpretedBits58 = uintBitsToFloat(reinterpretedBits44.y);
    float reinterpretedBits59 = uintBitsToFloat(reinterpretedBits44.z);
    float multiplyAddValue47 = fma(scalarValue16, fma(reinterpretedBits35, reinterpretedBits57, -reinterpretedBits54), reinterpretedBits54);
    float multiplyAddValue48 = fma(scalarValue16, fma(reinterpretedBits35, reinterpretedBits58, -reinterpretedBits55), reinterpretedBits55);
    float multiplyAddValue49 = fma(scalarValue16, fma(reinterpretedBits35, reinterpretedBits59, -reinterpretedBits56), reinterpretedBits56);
    float multiplyAddValue50 = fma(scalarValue2, fma(sampledTextureValue3.x, reinterpretedBits57, -multiplyAddValue47), multiplyAddValue47);
    float multiplyAddValue51 = fma(scalarValue2, fma(sampledTextureValue3.y, reinterpretedBits58, -multiplyAddValue48), multiplyAddValue48);
    float multiplyAddValue52 = fma(scalarValue2, fma(sampledTextureValue3.z, reinterpretedBits59, -multiplyAddValue49), multiplyAddValue49);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue30 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue31 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue32 = fma(reinterpretedBits9, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits45 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    fragmentColor1.x = fma(reinterpretedBits45, fma(-multiplyAddValue50, multiplyAddValue30, uintBitsToFloat(reinterpretedBits26.x)), multiplyAddValue50 * multiplyAddValue30);
    fragmentColor1.y = fma(reinterpretedBits45, fma(-multiplyAddValue51, multiplyAddValue31, uintBitsToFloat(reinterpretedBits26.y)), multiplyAddValue51 * multiplyAddValue31);
    fragmentColor1.z = fma(reinterpretedBits45, fma(-multiplyAddValue52, multiplyAddValue32, uintBitsToFloat(reinterpretedBits26.z)), multiplyAddValue52 * multiplyAddValue32);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits47 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits46.x);
    float reinterpretedBits48 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits46.y);
    float reinterpretedBits49 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits46.z);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue5 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue5);
    float productValue27 = inverseLengthValue3 * varyingNormal0.x;
    float productValue28 = inverseLengthValue3 * varyingNormal0.y;
    float productValue29 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue3 = 1.0 / (abs(productValue29) + (abs(productValue28) + abs(productValue27)));
    float productValue30 = quotientValue3 * productValue27;
    float productValue31 = quotientValue3 * productValue28;
    bool conditionValue1 = productValue29 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue31)) * ((productValue30 >= 0.0) ? sumValue3 : (-1.0))) : productValue30;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue30)) * ((productValue31 >= 0.0) ? sumValue3 : (-1.0))) : productValue31;
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits15 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue34 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits49, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits24.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits23.x))) + uintBitsToFloat(reinterpretedBits15.x)) / multiplyAddValue33, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.x), reinterpretedBits49, fma(uintBitsToFloat(reinterpretedBits25.x), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(reinterpretedBits27.x))) + uintBitsToFloat(reinterpretedBits31.x)) / multiplyAddValue34, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits24.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits23.y))) + uintBitsToFloat(reinterpretedBits15.y)) / multiplyAddValue33, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.y), reinterpretedBits49, fma(uintBitsToFloat(reinterpretedBits25.y), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(reinterpretedBits27.y))) + uintBitsToFloat(reinterpretedBits31.y)) / multiplyAddValue34, 0.5, 0.5);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
    bool reinterpretedBits51 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits50 > 9.9999997473787516355514526367188e-05);
    float productValue63 = reinterpretedBits50 * reinterpretedBits50;
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits52 = (reinterpretedBits51 ? spvNMin(productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.x)) * 0.16666667163372039794921875;
    float multiplyAddValue35 = (reinterpretedBits51 ? spvNMin(fma(fma(productValue63, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.y)) * 0.16666667163372039794921875;
    float multiplyAddValue36 = (reinterpretedBits51 ? spvNMin(fma(productValue63 * productValue63, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.z)) * 0.16666667163372039794921875;
    float productValue64 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue35, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue36, reinterpretedBits52)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(reinterpretedBits52 / productValue64, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue35 / productValue64, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue36 / productValue64, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue64, 0.0, 1.0) * 255.0);
    uint reinterpretedBits53 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits53 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits53 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[109u])), 0.0, 1.0) * 255.0));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits60 = multiplyAddValue53 * uintBitsToFloat(reinterpretedBits43.x);
    float reinterpretedBits61 = multiplyAddValue53 * uintBitsToFloat(reinterpretedBits43.y);
    float reinterpretedBits62 = multiplyAddValue53 * uintBitsToFloat(reinterpretedBits43.z);
    float scalarValue17 = ceil(multiplyAddValue54);
    uvec4 reinterpretedBits44 = floatBitsToUint(fragmentVectorConstants1.packedValues[29u]);
    float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits44.x);
    float reinterpretedBits58 = uintBitsToFloat(reinterpretedBits44.y);
    float reinterpretedBits59 = uintBitsToFloat(reinterpretedBits44.z);
    float multiplyAddValue55 = fma(scalarValue17, fma(multiplyAddValue54, reinterpretedBits57, -reinterpretedBits60), reinterpretedBits60);
    float multiplyAddValue56 = fma(scalarValue17, fma(multiplyAddValue54, reinterpretedBits58, -reinterpretedBits61), reinterpretedBits61);
    float multiplyAddValue57 = fma(scalarValue17, fma(multiplyAddValue54, reinterpretedBits59, -reinterpretedBits62), reinterpretedBits62);
    float multiplyAddValue58 = fma(scalarValue2, fma(scalarValue9, reinterpretedBits57, -multiplyAddValue55), multiplyAddValue55);
    float multiplyAddValue59 = fma(scalarValue2, fma(scalarValue10, reinterpretedBits58, -multiplyAddValue56), multiplyAddValue56);
    float multiplyAddValue60 = fma(scalarValue2, fma(scalarValue11, reinterpretedBits59, -multiplyAddValue57), multiplyAddValue57);
    float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[84u]));
    float multiplyAddValue30 = fma(reinterpretedBits9, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue31 = fma(reinterpretedBits9, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue32 = fma(reinterpretedBits9, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits26 = floatBitsToUint(fragmentVectorConstants1.packedValues[13u]);
    float reinterpretedBits45 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[55u]));
    fragmentColor1.x = fma(reinterpretedBits45, fma(-multiplyAddValue58, multiplyAddValue30, uintBitsToFloat(reinterpretedBits26.x)), multiplyAddValue58 * multiplyAddValue30);
    fragmentColor1.y = fma(reinterpretedBits45, fma(-multiplyAddValue59, multiplyAddValue31, uintBitsToFloat(reinterpretedBits26.y)), multiplyAddValue59 * multiplyAddValue31);
    fragmentColor1.z = fma(reinterpretedBits45, fma(-multiplyAddValue60, multiplyAddValue32, uintBitsToFloat(reinterpretedBits26.z)), multiplyAddValue60 * multiplyAddValue32);
    uvec4 reinterpretedBits46 = floatBitsToUint(fragmentVectorConstants1.packedValues[19u]);
    float reinterpretedBits47 = varyingTexCoord4.x - uintBitsToFloat(reinterpretedBits46.x);
    float reinterpretedBits48 = varyingTexCoord4.y - uintBitsToFloat(reinterpretedBits46.y);
    float reinterpretedBits49 = varyingTexCoord4.z - uintBitsToFloat(reinterpretedBits46.z);
    vec3 vectorValue1 = vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z);
    float scalarValue5 = rdDot3Precise(vectorValue1, vectorValue1);
    float inverseLengthValue3 = inversesqrt(scalarValue5);
    float productValue27 = inverseLengthValue3 * varyingNormal0.x;
    float productValue28 = inverseLengthValue3 * varyingNormal0.y;
    float productValue29 = inverseLengthValue3 * varyingNormal0.z;
    float quotientValue3 = 1.0 / (abs(productValue29) + (abs(productValue28) + abs(productValue27)));
    float productValue30 = quotientValue3 * productValue27;
    float productValue31 = quotientValue3 * productValue28;
    bool conditionValue1 = productValue29 < 0.0;
    float sumValue3 = 2.0 - 1.0;
    fragmentColor2.x = conditionValue1 ? ((1.0 - abs(productValue31)) * ((productValue30 >= 0.0) ? sumValue3 : (-1.0))) : productValue30;
    fragmentColor2.y = conditionValue1 ? ((1.0 - abs(productValue30)) * ((productValue31 >= 0.0) ? sumValue3 : (-1.0))) : productValue31;
    uvec4 reinterpretedBits23 = floatBitsToUint(fragmentVectorConstants1.packedValues[10u]);
    uvec4 reinterpretedBits21 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    uvec4 reinterpretedBits24 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits15 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue33 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[47u])), varyingTexCoord3.z, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u])), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[43u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[51u]));
    uvec4 reinterpretedBits27 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    uvec4 reinterpretedBits25 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    uvec4 reinterpretedBits28 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    uvec4 reinterpretedBits31 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue34 = fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[67u])), reinterpretedBits49, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[59u])), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[63u])))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    fragmentColor2.z = fma((fma(uintBitsToFloat(reinterpretedBits24.x), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.x), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits23.x))) + uintBitsToFloat(reinterpretedBits15.x)) / multiplyAddValue33, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.x), reinterpretedBits49, fma(uintBitsToFloat(reinterpretedBits25.x), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(reinterpretedBits27.x))) + uintBitsToFloat(reinterpretedBits31.x)) / multiplyAddValue34, 0.5, 0.5);
    fragmentColor2.w = fma((fma(uintBitsToFloat(reinterpretedBits24.y), varyingTexCoord3.z, fma(uintBitsToFloat(reinterpretedBits21.y), varyingTexCoord3.x, varyingTexCoord3.y * uintBitsToFloat(reinterpretedBits23.y))) + uintBitsToFloat(reinterpretedBits15.y)) / multiplyAddValue33, 0.5, 0.5) - fma((fma(uintBitsToFloat(reinterpretedBits28.y), reinterpretedBits49, fma(uintBitsToFloat(reinterpretedBits25.y), reinterpretedBits47, reinterpretedBits48 * uintBitsToFloat(reinterpretedBits27.y))) + uintBitsToFloat(reinterpretedBits31.y)) / multiplyAddValue34, 0.5, 0.5);
    float reinterpretedBits50 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[108u]));
    bool reinterpretedBits51 = (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[73u])) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u]))) + uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[74u]))) < 9.9999997473787516355514526367188e-05) && (reinterpretedBits50 > 9.9999997473787516355514526367188e-05);
    float productValue63 = reinterpretedBits50 * reinterpretedBits50;
    uvec4 reinterpretedBits17 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits52 = (reinterpretedBits51 ? spvNMin(productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.x)) * 0.16666667163372039794921875;
    float multiplyAddValue35 = (reinterpretedBits51 ? spvNMin(fma(fma(productValue63, 0.60000002384185791015625, 0.4000000059604644775390625), 0.60000002384185791015625, 0.4000000059604644775390625) * productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.y)) * 0.16666667163372039794921875;
    float multiplyAddValue36 = (reinterpretedBits51 ? spvNMin(fma(productValue63 * productValue63, 0.60000002384185791015625, 0.4000000059604644775390625) * productValue63, 1.0) : uintBitsToFloat(reinterpretedBits17.z)) * 0.16666667163372039794921875;
    float productValue64 = ceil(spvNMin(spvNMax(spvNMax(multiplyAddValue35, 0.0039215688593685626983642578125), spvNMax(multiplyAddValue36, reinterpretedBits52)), 1.0) * 255.0) * 0.0039215688593685626983642578125;
    fragmentColor0.y = (uint(spvNClamp(reinterpretedBits52 / productValue64, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(multiplyAddValue35 / productValue64, 0.0, 1.0) * 255.0);
    fragmentColor0.z = (uint(spvNClamp(multiplyAddValue36 / productValue64, 0.0, 1.0) * 255.0) * 256u) + uint(spvNClamp(productValue64, 0.0, 1.0) * 255.0);
    uint reinterpretedBits53 = uint(floor(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[75u])) * 255.0));
    fragmentColor0.w = (((reinterpretedBits53 & 2u) != 0u) ? 512u : 0u) + ((((reinterpretedBits53 & 1u) != 0u) ? 256u : 0u) + uint(spvNClamp(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[109u])), 0.0, 1.0) * 255.0));
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue5 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[28u].x * sampledTextureValue1.x) - productValue) * scalarValue) + productValue);
    float productValue6 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[28u].y * sampledTextureValue1.y) - productValue1) * scalarValue) + productValue1);
    float productValue7 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[28u].z * sampledTextureValue1.z) - productValue2) * scalarValue) + productValue2);
    float sumValue = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[18u].x;
    float sumValue1 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[18u].y;
    float sumValue2 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[18u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue8 = inverseLengthValue1 * varyingNormal0.x;
    float productValue9 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue9) + abs(productValue8)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue8;
    float productValue12 = quotientValue2 * productValue9;
    bool conditionValue = productValue10 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[15u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[14u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[16u].w;
    float intermediateValue3;
    float productValue14;
    float productValue15;
    if ((fragmentVectorConstants1.packedValues[26u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[17u].x + fragmentVectorConstants1.packedValues[17u].y) + fragmentVectorConstants1.packedValues[17u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue13 = fragmentVectorConstants1.packedValues[26u].x * fragmentVectorConstants1.packedValues[26u].x;
        intermediateValue3 = spvNClamp(productValue13, 0.0, 1.0);
        productValue14 = spvNClamp(((productValue13 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue13, 0.0, 1.0);
        productValue15 = spvNClamp((((productValue13 * productValue13) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue13, 0.0, 1.0);
    }
    else
    {
        intermediateValue3 = fragmentVectorConstants1.packedValues[17u].x;
        productValue14 = fragmentVectorConstants1.packedValues[17u].y;
        productValue15 = fragmentVectorConstants1.packedValues[17u].z;
    }
    float productValue17 = intermediateValue3 * 0.16666667163372039794921875;
    float productValue22 = productValue14 * 0.16666667163372039794921875;
    float productValue23 = productValue15 * 0.16666667163372039794921875;
    float productValue24 = ceil(spvNClamp(spvNMax(spvNMax(productValue17, productValue23), spvNMax(productValue22, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[17u].w * 255.0)) << 8u;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue38 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[28u].x * scalarValue6) - productValue35) * scalarValue) + productValue35);
    float productValue39 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[28u].y * scalarValue7) - productValue36) * scalarValue) + productValue36);
    float productValue40 = ((fragmentVectorConstants1.packedValues[20u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[28u].z * scalarValue8) - productValue37) * scalarValue) + productValue37);
    float sumValue = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[18u].x;
    float sumValue1 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[18u].y;
    float sumValue2 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[18u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue8 = inverseLengthValue1 * varyingNormal0.x;
    float productValue9 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue9) + abs(productValue8)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue8;
    float productValue12 = quotientValue2 * productValue9;
    bool conditionValue = productValue10 < 0.0;
    float multiplyAddValue = fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].w;
    float multiplyAddValue1 = fma(fragmentVectorConstants1.packedValues[15u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[14u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[13u].w)) + fragmentVectorConstants1.packedValues[16u].w;
    float intermediateValue6;
    float productValue15;
    float productValue16;
    if ((fragmentVectorConstants1.packedValues[26u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[17u].x + fragmentVectorConstants1.packedValues[17u].y) + fragmentVectorConstants1.packedValues[17u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue13 = fragmentVectorConstants1.packedValues[26u].x * fragmentVectorConstants1.packedValues[26u].x;
        intermediateValue6 = spvNClamp(productValue13, 0.0, 1.0);
        productValue15 = spvNClamp(((productValue13 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue13, 0.0, 1.0);
        productValue16 = spvNClamp((((productValue13 * productValue13) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue13, 0.0, 1.0);
    }
    else
    {
        intermediateValue6 = fragmentVectorConstants1.packedValues[17u].x;
        productValue15 = fragmentVectorConstants1.packedValues[17u].y;
        productValue16 = fragmentVectorConstants1.packedValues[17u].z;
    }
    float productValue41 = intermediateValue6 * 0.16666667163372039794921875;
    float productValue23 = productValue15 * 0.16666667163372039794921875;
    float productValue42 = productValue16 * 0.16666667163372039794921875;
    float productValue43 = ceil(spvNClamp(spvNMax(spvNMax(productValue41, productValue42), spvNMax(productValue23, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue = uint(floor(fragmentVectorConstants1.packedValues[17u].w * 255.0)) << 8u;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue54 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[29u].x * sampledTextureValue1.x) - productValue49) * scalarValue) + productValue49);
    float productValue55 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[29u].y * sampledTextureValue1.y) - productValue50) * scalarValue) + productValue50);
    float productValue56 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[29u].z * sampledTextureValue1.z) - productValue51) * scalarValue) + productValue51);
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue8 = inverseLengthValue1 * varyingNormal0.x;
    float productValue9 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue9) + abs(productValue8)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue8;
    float productValue12 = quotientValue2 * productValue9;
    bool conditionValue = productValue10 < 0.0;
    float multiplyAddValue20 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue21 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue6, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue3;
    float productValue18;
    float productValue19;
    if ((fragmentVectorConstants1.packedValues[27u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue57 = fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue3 = spvNClamp(productValue57, 0.0, 1.0);
        productValue18 = spvNClamp(((productValue57 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue57, 0.0, 1.0);
        productValue19 = spvNClamp((((productValue57 * productValue57) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue57, 0.0, 1.0);
    }
    else
    {
        intermediateValue3 = fragmentVectorConstants1.packedValues[18u].x;
        productValue18 = fragmentVectorConstants1.packedValues[18u].y;
        productValue19 = fragmentVectorConstants1.packedValues[18u].z;
    }
    float productValue17 = intermediateValue3 * 0.16666667163372039794921875;
    float productValue58 = productValue18 * 0.16666667163372039794921875;
    float productValue59 = productValue19 * 0.16666667163372039794921875;
    float productValue60 = ceil(spvNClamp(spvNMax(spvNMax(productValue17, productValue59), spvNMax(productValue58, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue72 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[29u].x * scalarValue6) - productValue69) * scalarValue) + productValue69);
    float productValue73 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[29u].y * scalarValue7) - productValue70) * scalarValue) + productValue70);
    float productValue74 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[29u].z * scalarValue8) - productValue71) * scalarValue) + productValue71);
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue8 = inverseLengthValue1 * varyingNormal0.x;
    float productValue9 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue9) + abs(productValue8)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue8;
    float productValue12 = quotientValue2 * productValue9;
    bool conditionValue = productValue10 < 0.0;
    float multiplyAddValue20 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue21 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue6, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue6;
    float productValue19;
    float productValue20;
    if ((fragmentVectorConstants1.packedValues[27u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue57 = fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue6 = spvNClamp(productValue57, 0.0, 1.0);
        productValue19 = spvNClamp(((productValue57 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue57, 0.0, 1.0);
        productValue20 = spvNClamp((((productValue57 * productValue57) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue57, 0.0, 1.0);
    }
    else
    {
        intermediateValue6 = fragmentVectorConstants1.packedValues[18u].x;
        productValue19 = fragmentVectorConstants1.packedValues[18u].y;
        productValue20 = fragmentVectorConstants1.packedValues[18u].z;
    }
    float productValue41 = intermediateValue6 * 0.16666667163372039794921875;
    float productValue59 = productValue19 * 0.16666667163372039794921875;
    float productValue75 = productValue20 * 0.16666667163372039794921875;
    float productValue76 = ceil(spvNClamp(spvNMax(spvNMax(productValue41, productValue75), spvNMax(productValue59, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue83 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((sampledTextureValue1.x * fragmentVectorConstants1.packedValues[29u].x) - productValue80) * scalarValue) + productValue80);
    float productValue84 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((sampledTextureValue1.y * fragmentVectorConstants1.packedValues[29u].y) - productValue81) * scalarValue) + productValue81);
    float productValue85 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((sampledTextureValue1.z * fragmentVectorConstants1.packedValues[29u].z) - productValue82) * scalarValue) + productValue82);
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue8 = inverseLengthValue1 * varyingNormal0.x;
    float productValue9 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue9) + abs(productValue8)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue8;
    float productValue12 = quotientValue2 * productValue9;
    bool conditionValue = productValue10 < 0.0;
    float multiplyAddValue20 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue21 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue6, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue4;
    float productValue19;
    float productValue20;
    if ((fragmentVectorConstants1.packedValues[27u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue57 = fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue4 = spvNClamp(productValue57, 0.0, 1.0);
        productValue19 = spvNClamp(((productValue57 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue57, 0.0, 1.0);
        productValue20 = spvNClamp((((productValue57 * productValue57) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue57, 0.0, 1.0);
    }
    else
    {
        intermediateValue4 = fragmentVectorConstants1.packedValues[18u].x;
        productValue19 = fragmentVectorConstants1.packedValues[18u].y;
        productValue20 = fragmentVectorConstants1.packedValues[18u].z;
    }
    float productValue86 = intermediateValue4 * 0.16666667163372039794921875;
    float productValue59 = productValue19 * 0.16666667163372039794921875;
    float productValue75 = productValue20 * 0.16666667163372039794921875;
    float productValue87 = ceil(spvNClamp(spvNMax(spvNMax(productValue86, productValue75), spvNMax(productValue59, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue94 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[29u].x * scalarValue6) - productValue91) * scalarValue) + productValue91);
    float productValue95 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[29u].y * scalarValue7) - productValue92) * scalarValue) + productValue92);
    float productValue96 = ((fragmentVectorConstants1.packedValues[21u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[29u].z * scalarValue8) - productValue93) * scalarValue) + productValue93);
    float sumValue4 = varyingTexCoord4.x - fragmentVectorConstants1.packedValues[19u].x;
    float sumValue5 = varyingTexCoord4.y - fragmentVectorConstants1.packedValues[19u].y;
    float sumValue6 = varyingTexCoord4.z - fragmentVectorConstants1.packedValues[19u].z;
    float inverseLengthValue1 = inversesqrt(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z)));
    float productValue8 = inverseLengthValue1 * varyingNormal0.x;
    float productValue9 = inverseLengthValue1 * varyingNormal0.y;
    float productValue10 = inverseLengthValue1 * varyingNormal0.z;
    float quotientValue2 = 1.0 / ((abs(productValue9) + abs(productValue8)) + abs(productValue10));
    float productValue11 = quotientValue2 * productValue8;
    float productValue12 = quotientValue2 * productValue9;
    bool conditionValue = productValue10 < 0.0;
    float multiplyAddValue20 = fma(fragmentVectorConstants1.packedValues[11u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].w;
    float multiplyAddValue21 = fma(fragmentVectorConstants1.packedValues[16u].w, sumValue6, fma(fragmentVectorConstants1.packedValues[15u].w, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[14u].w)) + fragmentVectorConstants1.packedValues[17u].w;
    float intermediateValue7;
    float productValue20;
    float productValue21;
    if ((fragmentVectorConstants1.packedValues[27u].x > 9.9999997473787516355514526367188e-05) && (((fragmentVectorConstants1.packedValues[18u].x + fragmentVectorConstants1.packedValues[18u].y) + fragmentVectorConstants1.packedValues[18u].z) < 9.9999997473787516355514526367188e-05))
    {
        float productValue57 = fragmentVectorConstants1.packedValues[27u].x * fragmentVectorConstants1.packedValues[27u].x;
        intermediateValue7 = spvNClamp(productValue57, 0.0, 1.0);
        productValue20 = spvNClamp(((productValue57 * 0.36000001430511474609375) + 0.63999998569488525390625) * productValue57, 0.0, 1.0);
        productValue21 = spvNClamp((((productValue57 * productValue57) * 0.60000002384185791015625) + 0.4000000059604644775390625) * productValue57, 0.0, 1.0);
    }
    else
    {
        intermediateValue7 = fragmentVectorConstants1.packedValues[18u].x;
        productValue20 = fragmentVectorConstants1.packedValues[18u].y;
        productValue21 = fragmentVectorConstants1.packedValues[18u].z;
    }
    float productValue97 = intermediateValue7 * 0.16666667163372039794921875;
    float productValue75 = productValue20 * 0.16666667163372039794921875;
    float productValue98 = productValue21 * 0.16666667163372039794921875;
    float productValue99 = ceil(spvNClamp(spvNMax(spvNMax(productValue97, productValue98), spvNMax(productValue75, 0.0039215688593685626983642578125)), 0.0, 1.0) * 255.0) * 0.0039215688593685626983642578125;
    uint bitwiseValue1 = uint(floor(fragmentVectorConstants1.packedValues[18u].w * 255.0)) << 8u;
#endif
    fragmentColor0.x = 32512u;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.y = ((uint(spvNClamp(productValue17 / productValue24, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue22 / productValue24, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue23 / productValue24, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue24, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[26u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[12u].x - productValue5) * fragmentVectorConstants1.packedValues[12u].w) + productValue5;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[12u].y - productValue6) * fragmentVectorConstants1.packedValues[12u].w) + productValue6;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[12u].z - productValue7) * fragmentVectorConstants1.packedValues[12u].w) + productValue7;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.y = ((uint(spvNClamp(productValue41 / productValue43, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue23 / productValue43, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue42 / productValue43, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue43, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[26u].y, 0.0, 1.0) * 255.0) | (bitwiseValue & 256u)) | (bitwiseValue & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[12u].x - productValue38) * fragmentVectorConstants1.packedValues[12u].w) + productValue38;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[12u].y - productValue39) * fragmentVectorConstants1.packedValues[12u].w) + productValue39;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[12u].z - productValue40) * fragmentVectorConstants1.packedValues[12u].w) + productValue40;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.y = ((uint(spvNClamp(productValue17 / productValue60, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue58 / productValue60, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue59 / productValue60, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue60, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[27u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue54) * fragmentVectorConstants1.packedValues[13u].w) + productValue54;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue55) * fragmentVectorConstants1.packedValues[13u].w) + productValue55;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue56) * fragmentVectorConstants1.packedValues[13u].w) + productValue56;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.y = ((uint(spvNClamp(productValue41 / productValue76, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue59 / productValue76, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue75 / productValue76, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue76, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[27u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue72) * fragmentVectorConstants1.packedValues[13u].w) + productValue72;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue73) * fragmentVectorConstants1.packedValues[13u].w) + productValue73;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue74) * fragmentVectorConstants1.packedValues[13u].w) + productValue74;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.y = ((uint(spvNClamp(productValue86 / productValue87, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue59 / productValue87, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue75 / productValue87, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue87, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[27u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue83) * fragmentVectorConstants1.packedValues[13u].w) + productValue83;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue84) * fragmentVectorConstants1.packedValues[13u].w) + productValue84;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue85) * fragmentVectorConstants1.packedValues[13u].w) + productValue85;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor0.y = ((uint(spvNClamp(productValue97 / productValue99, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue75 / productValue99, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.z = ((uint(spvNClamp(productValue98 / productValue99, 0.0, 1.0) * 255.0) << 8u) & 65280u) | (uint(spvNClamp(productValue99, 0.0, 1.0) * 255.0) & 255u);
    fragmentColor0.w = (uint(spvNClamp(fragmentVectorConstants1.packedValues[27u].y, 0.0, 1.0) * 255.0) | (bitwiseValue1 & 256u)) | (bitwiseValue1 & 512u);
    fragmentColor1.x = ((fragmentVectorConstants1.packedValues[13u].x - productValue94) * fragmentVectorConstants1.packedValues[13u].w) + productValue94;
    fragmentColor1.y = ((fragmentVectorConstants1.packedValues[13u].y - productValue95) * fragmentVectorConstants1.packedValues[13u].w) + productValue95;
    fragmentColor1.z = ((fragmentVectorConstants1.packedValues[13u].z - productValue96) * fragmentVectorConstants1.packedValues[13u].w) + productValue96;
#endif
    fragmentColor1.w = 0.4980392158031463623046875;
#if (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor2.x = conditionValue ? (((productValue11 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue12))) : productValue11;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue11)) * ((productValue12 < 0.0) ? (-1.0) : 1.0)) : productValue12;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].x) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[15u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[14u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[13u].x)) + fragmentVectorConstants1.packedValues[16u].x) / multiplyAddValue1)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[8u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[11u].y) / multiplyAddValue) - ((fma(fragmentVectorConstants1.packedValues[15u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[14u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[13u].y)) + fragmentVectorConstants1.packedValues[16u].y) / multiplyAddValue1)) * 0.5;
#elif (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    fragmentColor2.x = conditionValue ? (((productValue11 < 0.0) ? (-1.0) : 1.0) * (1.0 - abs(productValue12))) : productValue11;
    fragmentColor2.y = conditionValue ? ((1.0 - abs(productValue11)) * ((productValue12 < 0.0) ? (-1.0) : 1.0)) : productValue12;
    fragmentColor2.z = (((fma(fragmentVectorConstants1.packedValues[11u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].x) / multiplyAddValue20) - ((fma(fragmentVectorConstants1.packedValues[16u].x, sumValue6, fma(fragmentVectorConstants1.packedValues[15u].x, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[14u].x)) + fragmentVectorConstants1.packedValues[17u].x) / multiplyAddValue21)) * 0.5;
    fragmentColor2.w = (((fma(fragmentVectorConstants1.packedValues[11u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[10u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[9u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[12u].y) / multiplyAddValue20) - ((fma(fragmentVectorConstants1.packedValues[16u].y, sumValue6, fma(fragmentVectorConstants1.packedValues[15u].y, sumValue5, sumValue4 * fragmentVectorConstants1.packedValues[14u].y)) + fragmentVectorConstants1.packedValues[17u].y) / multiplyAddValue21)) * 0.5;
#endif
    discardIfRequested();
}
