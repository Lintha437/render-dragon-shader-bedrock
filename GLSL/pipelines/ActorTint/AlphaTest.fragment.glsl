#version 460
#extension GL_GOOGLE_include_directive : require
// ActorTint / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 18
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
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ActorTint/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    precise float reinterpretedBits18 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits.x);
    precise float reinterpretedBits19 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits.y);
    precise float reinterpretedBits20 = sampledTextureValue.z * uintBitsToFloat(reinterpretedBits.z);
    precise float reinterpretedBits21 = sampledTextureValue.w * uintBitsToFloat(reinterpretedBits.w);
    float scalarValue8 = spvNMax(reinterpretedBits21, 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    precise float productValue25 = inverseLengthValue * reinterpretedBits5;
    precise float productValue26 = inverseLengthValue * reinterpretedBits6;
    precise float productValue27 = inverseLengthValue * reinterpretedBits7;
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits22 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits8.x);
    precise float reinterpretedBits23 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits8.y);
    precise float reinterpretedBits24 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits8.z);
    float scalarValue9 = rdDot3Precise(vec3(-productValue25, -productValue26, -productValue27), vec3(reinterpretedBits22, reinterpretedBits23, reinterpretedBits24));
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float reinterpretedBits25 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits10;
    precise float sumValue = scalarValue9 - reinterpretedBits10;
    precise float quotientValue2 = 1.0 / reinterpretedBits25;
    precise float productValue28 = quotientValue2 * sumValue;
    float scalarValue10 = spvNClamp(productValue28, 0.0, 1.0);
    precise float productValue29 = scalarValue10 * scalarValue10;
    precise float multiplyAddValue11 = productValue29 * fma(scalarValue10, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    precise float multiplyAddValue12 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits12.x);
    precise float multiplyAddValue13 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits12.y);
    float reinterpretedBits13 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    precise float quotientValue5 = multiplyAddValue12 / reinterpretedBits13;
    precise float quotientValue6 = multiplyAddValue13 / reinterpretedBits13;
    precise float productValue30 = floor(quotientValue5) * reinterpretedBits13;
    precise float productValue31 = floor(quotientValue6) * reinterpretedBits13;
    precise float productValue32 = productValue30 * 0.25;
    precise float productValue33 = productValue31 * 0.25;
    precise float productValue34 = productValue30 * 0.5;
    precise float productValue35 = productValue31 * 0.5;
    float scalarValue11 = floor(productValue33);
    float scalarValue12 = floor(productValue35);
    precise float productValue36 = scalarValue11 * scalarValue11;
    precise float productValue37 = scalarValue12 * scalarValue12;
    precise float productValue38 = productValue36 * 0.75;
    precise float productValue39 = productValue37 * 0.75;
    float scalarValue13 = floor(productValue31);
    precise float productValue40 = scalarValue13 * scalarValue13;
    precise float productValue41 = productValue40 * 0.75;
    precise float multiplyAddValue14 = fma(fma(fma(fract(fma(floor(productValue32), 0.5, productValue38)), 0.25, fract(fma(floor(productValue34), 0.5, productValue39))), 0.25, fract(fma(floor(productValue30), 0.5, productValue41))), 64.0, 0.5) * 0.015625;
    precise float sumValue1 = scalarValue8 + scalarValue;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && (multiplyAddValue14 >= multiplyAddValue11)) || (sumValue1 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue1.x;
    float scalarValue15 = sampledTextureValue1.y;
    float scalarValue16 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    precise float sumValue5 = scalarValue15 + scalarValue14;
    precise float sumValue6 = scalarValue16 + sumValue5;
    precise float sumValue7 = 1.0 - scalarValue;
    precise float productValue48 = sumValue7 * sumValue6;
    float scalarValue17 = float(productValue48 > 0.0);
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue24 = fma(scalarValue17, fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue.x, -scalarValue14), scalarValue14);
    float multiplyAddValue25 = fma(scalarValue17, fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue.y, -scalarValue15), scalarValue15);
    float multiplyAddValue26 = fma(scalarValue17, fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue.z, -scalarValue16), scalarValue16);
    float multiplyAddValue27 = spvNMax(fma(scalarValue17, fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue.w, -scalarValue), scalarValue), 0.0);
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    precise float productValue25 = inverseLengthValue * reinterpretedBits5;
    precise float productValue26 = inverseLengthValue * reinterpretedBits6;
    precise float productValue27 = inverseLengthValue * reinterpretedBits7;
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    precise float reinterpretedBits22 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits8.x);
    precise float reinterpretedBits23 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits8.y);
    precise float reinterpretedBits24 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits8.z);
    float scalarValue9 = rdDot3Precise(vec3(-productValue25, -productValue26, -productValue27), vec3(reinterpretedBits22, reinterpretedBits23, reinterpretedBits24));
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    precise float reinterpretedBits25 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits10;
    precise float sumValue = scalarValue9 - reinterpretedBits10;
    precise float quotientValue2 = 1.0 / reinterpretedBits25;
    precise float productValue28 = quotientValue2 * sumValue;
    float scalarValue10 = spvNClamp(productValue28, 0.0, 1.0);
    precise float productValue29 = scalarValue10 * scalarValue10;
    precise float multiplyAddValue11 = productValue29 * fma(scalarValue10, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    precise float multiplyAddValue12 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits12.x);
    precise float multiplyAddValue13 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits12.y);
    float reinterpretedBits13 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    precise float quotientValue5 = multiplyAddValue12 / reinterpretedBits13;
    precise float quotientValue6 = multiplyAddValue13 / reinterpretedBits13;
    precise float productValue30 = floor(quotientValue5) * reinterpretedBits13;
    precise float productValue31 = floor(quotientValue6) * reinterpretedBits13;
    precise float productValue32 = productValue30 * 0.25;
    precise float productValue33 = productValue31 * 0.25;
    precise float productValue34 = productValue30 * 0.5;
    precise float productValue35 = productValue31 * 0.5;
    float scalarValue11 = floor(productValue33);
    float scalarValue12 = floor(productValue35);
    precise float productValue36 = scalarValue11 * scalarValue11;
    precise float productValue37 = scalarValue12 * scalarValue12;
    precise float productValue38 = productValue36 * 0.75;
    precise float productValue39 = productValue37 * 0.75;
    float scalarValue13 = floor(productValue31);
    precise float productValue40 = scalarValue13 * scalarValue13;
    precise float productValue41 = productValue40 * 0.75;
    precise float multiplyAddValue14 = fma(fma(fma(fract(fma(floor(productValue32), 0.5, productValue38)), 0.25, fract(fma(floor(productValue34), 0.5, productValue39))), 0.25, fract(fma(floor(productValue30), 0.5, productValue41))), 64.0, 0.5) * 0.015625;
    precise float sumValue8 = scalarValue + multiplyAddValue27;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && (multiplyAddValue14 >= multiplyAddValue11)) || (sumValue8 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float reinterpretedBits40 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits14.x);
    precise float reinterpretedBits41 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits14.y);
    precise float reinterpretedBits42 = sampledTextureValue.z * uintBitsToFloat(reinterpretedBits14.z);
    precise float reinterpretedBits43 = sampledTextureValue.w * uintBitsToFloat(reinterpretedBits14.w);
    precise float reinterpretedBits44 = reinterpretedBits43 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u]));
    float scalarValue20 = spvNMax(reinterpretedBits44, 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    precise float productValue25 = inverseLengthValue * reinterpretedBits5;
    precise float productValue26 = inverseLengthValue * reinterpretedBits6;
    precise float productValue27 = inverseLengthValue * reinterpretedBits7;
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits45 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits16.x);
    precise float reinterpretedBits46 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits16.y);
    precise float reinterpretedBits47 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits16.z);
    float scalarValue21 = rdDot3Precise(vec3(-productValue25, -productValue26, -productValue27), vec3(reinterpretedBits45, reinterpretedBits46, reinterpretedBits47));
    float reinterpretedBits32 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits32;
    precise float sumValue9 = scalarValue21 - reinterpretedBits32;
    precise float quotientValue9 = 1.0 / reinterpretedBits48;
    precise float productValue74 = quotientValue9 * sumValue9;
    float scalarValue22 = spvNClamp(productValue74, 0.0, 1.0);
    precise float productValue75 = scalarValue22 * scalarValue22;
    precise float multiplyAddValue58 = productValue75 * fma(scalarValue22, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue59 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.x);
    precise float multiplyAddValue60 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.y);
    float reinterpretedBits35 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue59 / reinterpretedBits35;
    precise float quotientValue11 = multiplyAddValue60 / reinterpretedBits35;
    precise float productValue76 = floor(quotientValue10) * reinterpretedBits35;
    precise float productValue77 = floor(quotientValue11) * reinterpretedBits35;
    precise float productValue78 = productValue76 * 0.25;
    precise float productValue79 = productValue77 * 0.25;
    precise float productValue80 = productValue76 * 0.5;
    precise float productValue81 = productValue77 * 0.5;
    float scalarValue23 = floor(productValue79);
    float scalarValue24 = floor(productValue81);
    precise float productValue82 = scalarValue23 * scalarValue23;
    precise float productValue83 = scalarValue24 * scalarValue24;
    precise float productValue84 = productValue82 * 0.75;
    precise float productValue85 = productValue83 * 0.75;
    float scalarValue25 = floor(productValue77);
    precise float productValue86 = scalarValue25 * scalarValue25;
    precise float productValue87 = productValue86 * 0.75;
    precise float multiplyAddValue61 = fma(fma(fma(fract(fma(floor(productValue78), 0.5, productValue84)), 0.25, fract(fma(floor(productValue80), 0.5, productValue85))), 0.25, fract(fma(floor(productValue76), 0.5, productValue87))), 64.0, 0.5) * 0.015625;
    precise float sumValue10 = scalarValue20 + scalarValue;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue61 >= multiplyAddValue58)) || (sumValue10 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue1.x;
    float scalarValue15 = sampledTextureValue1.y;
    float scalarValue16 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    precise float sumValue5 = scalarValue15 + scalarValue14;
    precise float sumValue6 = scalarValue16 + sumValue5;
    precise float sumValue7 = 1.0 - scalarValue;
    precise float productValue48 = sumValue7 * sumValue6;
    float scalarValue17 = float(productValue48 > 0.0);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue87 = fma(scalarValue17, fma(uintBitsToFloat(reinterpretedBits14.x), sampledTextureValue.x, -scalarValue14), scalarValue14);
    float multiplyAddValue88 = fma(scalarValue17, fma(uintBitsToFloat(reinterpretedBits14.y), sampledTextureValue.y, -scalarValue15), scalarValue15);
    float multiplyAddValue89 = fma(scalarValue17, fma(uintBitsToFloat(reinterpretedBits14.z), sampledTextureValue.z, -scalarValue16), scalarValue16);
    float multiplyAddValue90 = fma(scalarValue17, fma(uintBitsToFloat(reinterpretedBits14.w), sampledTextureValue.w, -scalarValue), scalarValue);
    precise float reinterpretedBits50 = multiplyAddValue90 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u]));
    float scalarValue27 = spvNMax(reinterpretedBits50, 0.0);
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    precise float productValue25 = inverseLengthValue * reinterpretedBits5;
    precise float productValue26 = inverseLengthValue * reinterpretedBits6;
    precise float productValue27 = inverseLengthValue * reinterpretedBits7;
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits45 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits16.x);
    precise float reinterpretedBits46 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits16.y);
    precise float reinterpretedBits47 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits16.z);
    float scalarValue21 = rdDot3Precise(vec3(-productValue25, -productValue26, -productValue27), vec3(reinterpretedBits45, reinterpretedBits46, reinterpretedBits47));
    float reinterpretedBits32 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits32;
    precise float sumValue9 = scalarValue21 - reinterpretedBits32;
    precise float quotientValue9 = 1.0 / reinterpretedBits48;
    precise float productValue74 = quotientValue9 * sumValue9;
    float scalarValue22 = spvNClamp(productValue74, 0.0, 1.0);
    precise float productValue75 = scalarValue22 * scalarValue22;
    precise float multiplyAddValue58 = productValue75 * fma(scalarValue22, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue59 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.x);
    precise float multiplyAddValue60 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.y);
    float reinterpretedBits35 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue59 / reinterpretedBits35;
    precise float quotientValue11 = multiplyAddValue60 / reinterpretedBits35;
    precise float productValue76 = floor(quotientValue10) * reinterpretedBits35;
    precise float productValue77 = floor(quotientValue11) * reinterpretedBits35;
    precise float productValue78 = productValue76 * 0.25;
    precise float productValue79 = productValue77 * 0.25;
    precise float productValue80 = productValue76 * 0.5;
    precise float productValue81 = productValue77 * 0.5;
    float scalarValue23 = floor(productValue79);
    float scalarValue24 = floor(productValue81);
    precise float productValue82 = scalarValue23 * scalarValue23;
    precise float productValue83 = scalarValue24 * scalarValue24;
    precise float productValue84 = productValue82 * 0.75;
    precise float productValue85 = productValue83 * 0.75;
    float scalarValue25 = floor(productValue77);
    precise float productValue86 = scalarValue25 * scalarValue25;
    precise float productValue87 = productValue86 * 0.75;
    precise float multiplyAddValue61 = fma(fma(fma(fract(fma(floor(productValue78), 0.5, productValue84)), 0.25, fract(fma(floor(productValue80), 0.5, productValue85))), 0.25, fract(fma(floor(productValue76), 0.5, productValue87))), 64.0, 0.5) * 0.015625;
    precise float sumValue11 = scalarValue + scalarValue27;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue61 >= multiplyAddValue58)) || (sumValue11 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    precise float reinterpretedBits40 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits14.x);
    precise float reinterpretedBits41 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits14.y);
    precise float reinterpretedBits58 = sampledTextureValue.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u]));
    float scalarValue29 = spvNMax(reinterpretedBits58, 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    precise float productValue25 = inverseLengthValue * reinterpretedBits5;
    precise float productValue26 = inverseLengthValue * reinterpretedBits6;
    precise float productValue27 = inverseLengthValue * reinterpretedBits7;
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits45 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits16.x);
    precise float reinterpretedBits46 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits16.y);
    precise float reinterpretedBits47 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits16.z);
    float scalarValue21 = rdDot3Precise(vec3(-productValue25, -productValue26, -productValue27), vec3(reinterpretedBits45, reinterpretedBits46, reinterpretedBits47));
    float reinterpretedBits32 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits32;
    precise float sumValue9 = scalarValue21 - reinterpretedBits32;
    precise float quotientValue9 = 1.0 / reinterpretedBits48;
    precise float productValue74 = quotientValue9 * sumValue9;
    float scalarValue22 = spvNClamp(productValue74, 0.0, 1.0);
    precise float productValue75 = scalarValue22 * scalarValue22;
    precise float multiplyAddValue58 = productValue75 * fma(scalarValue22, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue59 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.x);
    precise float multiplyAddValue60 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.y);
    float reinterpretedBits35 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue59 / reinterpretedBits35;
    precise float quotientValue11 = multiplyAddValue60 / reinterpretedBits35;
    precise float productValue76 = floor(quotientValue10) * reinterpretedBits35;
    precise float productValue77 = floor(quotientValue11) * reinterpretedBits35;
    precise float productValue78 = productValue76 * 0.25;
    precise float productValue79 = productValue77 * 0.25;
    precise float productValue80 = productValue76 * 0.5;
    precise float productValue81 = productValue77 * 0.5;
    float scalarValue23 = floor(productValue79);
    float scalarValue24 = floor(productValue81);
    precise float productValue82 = scalarValue23 * scalarValue23;
    precise float productValue83 = scalarValue24 * scalarValue24;
    precise float productValue84 = productValue82 * 0.75;
    precise float productValue85 = productValue83 * 0.75;
    float scalarValue25 = floor(productValue77);
    precise float productValue86 = scalarValue25 * scalarValue25;
    precise float productValue87 = productValue86 * 0.75;
    precise float multiplyAddValue61 = fma(fma(fma(fract(fma(floor(productValue78), 0.5, productValue84)), 0.25, fract(fma(floor(productValue80), 0.5, productValue85))), 0.25, fract(fma(floor(productValue76), 0.5, productValue87))), 64.0, 0.5) * 0.015625;
    precise float sumValue12 = scalarValue29 + scalarValue;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue61 >= multiplyAddValue58)) || (sumValue12 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue1.x;
    float scalarValue15 = sampledTextureValue1.y;
    float scalarValue16 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    precise float sumValue5 = scalarValue15 + scalarValue14;
    precise float sumValue6 = scalarValue16 + sumValue5;
    precise float sumValue7 = 1.0 - scalarValue;
    precise float productValue147 = sumValue6 * sumValue7;
    float scalarValue33 = float(productValue147 > 0.0);
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue130 = fma(scalarValue33, fma(uintBitsToFloat(reinterpretedBits14.x), sampledTextureValue.x, -scalarValue14), scalarValue14);
    float multiplyAddValue131 = fma(scalarValue33, fma(uintBitsToFloat(reinterpretedBits14.y), sampledTextureValue.y, -scalarValue15), scalarValue15);
    float multiplyAddValue132 = spvNMax(fma(scalarValue33, fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), sampledTextureValue.w, -scalarValue), scalarValue), 0.0);
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    precise float productValue25 = inverseLengthValue * reinterpretedBits5;
    precise float productValue26 = inverseLengthValue * reinterpretedBits6;
    precise float productValue27 = inverseLengthValue * reinterpretedBits7;
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits45 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits16.x);
    precise float reinterpretedBits46 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits16.y);
    precise float reinterpretedBits47 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits16.z);
    float scalarValue21 = rdDot3Precise(vec3(-productValue25, -productValue26, -productValue27), vec3(reinterpretedBits45, reinterpretedBits46, reinterpretedBits47));
    float reinterpretedBits32 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    precise float reinterpretedBits48 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits32;
    precise float sumValue9 = scalarValue21 - reinterpretedBits32;
    precise float quotientValue9 = 1.0 / reinterpretedBits48;
    precise float productValue74 = quotientValue9 * sumValue9;
    float scalarValue22 = spvNClamp(productValue74, 0.0, 1.0);
    precise float productValue75 = scalarValue22 * scalarValue22;
    precise float multiplyAddValue58 = productValue75 * fma(scalarValue22, -2.0, 3.0);
    precise float quotientValue3 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue4 = varyingColor1.y / varyingColor1.w;
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    precise float multiplyAddValue59 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.x);
    precise float multiplyAddValue60 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.y);
    float reinterpretedBits35 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    precise float quotientValue10 = multiplyAddValue59 / reinterpretedBits35;
    precise float quotientValue11 = multiplyAddValue60 / reinterpretedBits35;
    precise float productValue76 = floor(quotientValue10) * reinterpretedBits35;
    precise float productValue77 = floor(quotientValue11) * reinterpretedBits35;
    precise float productValue78 = productValue76 * 0.25;
    precise float productValue79 = productValue77 * 0.25;
    precise float productValue80 = productValue76 * 0.5;
    precise float productValue81 = productValue77 * 0.5;
    float scalarValue23 = floor(productValue79);
    float scalarValue24 = floor(productValue81);
    precise float productValue82 = scalarValue23 * scalarValue23;
    precise float productValue83 = scalarValue24 * scalarValue24;
    precise float productValue84 = productValue82 * 0.75;
    precise float productValue85 = productValue83 * 0.75;
    float scalarValue25 = floor(productValue77);
    precise float productValue86 = scalarValue25 * scalarValue25;
    precise float productValue87 = productValue86 * 0.75;
    precise float multiplyAddValue61 = fma(fma(fma(fract(fma(floor(productValue78), 0.5, productValue84)), 0.25, fract(fma(floor(productValue80), 0.5, productValue85))), 0.25, fract(fma(floor(productValue76), 0.5, productValue87))), 64.0, 0.5) * 0.015625;
    precise float sumValue13 = scalarValue + multiplyAddValue132;
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue61 >= multiplyAddValue58)) || (sumValue13 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float reinterpretedBits1 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits.x);
    float reinterpretedBits2 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits.y);
    float reinterpretedBits3 = sampledTextureValue.z * uintBitsToFloat(reinterpretedBits.z);
    float reinterpretedBits4 = spvNMax(sampledTextureValue.w * uintBitsToFloat(reinterpretedBits.w), 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits9 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits5), -(inverseLengthValue * reinterpretedBits6), -(inverseLengthValue * reinterpretedBits7)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits8.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits8.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits8.z)));
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float reinterpretedBits11 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits10)) * (reinterpretedBits9 - reinterpretedBits10), 0.0, 1.0);
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits13 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits12.x)) / reinterpretedBits13) * reinterpretedBits13;
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits12.y)) / reinterpretedBits13) * reinterpretedBits13;
    float productValue = floor(multiplyAddValue1 * 0.25);
    float productValue1 = floor(multiplyAddValue1 * 0.5);
    float scalarValue2 = floor(multiplyAddValue1);
    if (((reinterpretedBits4 + scalarValue) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue * productValue) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue1 * productValue1) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue2 * scalarValue2) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits11 * reinterpretedBits11) * fma(reinterpretedBits11, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue1.x;
    float scalarValue15 = sampledTextureValue1.y;
    float scalarValue16 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    bool productValue55 = ((1.0 - scalarValue) * (scalarValue16 + (scalarValue15 + scalarValue14))) > 0.0;
    uvec4 reinterpretedBits = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
    float multiplyAddValue34 = productValue55 ? (fma(uintBitsToFloat(reinterpretedBits.x), sampledTextureValue.x, -scalarValue14) + scalarValue14) : scalarValue14;
    float multiplyAddValue35 = productValue55 ? (fma(uintBitsToFloat(reinterpretedBits.y), sampledTextureValue.y, -scalarValue15) + scalarValue15) : scalarValue15;
    float multiplyAddValue36 = productValue55 ? (fma(uintBitsToFloat(reinterpretedBits.z), sampledTextureValue.z, -scalarValue16) + scalarValue16) : scalarValue16;
    float multiplyAddValue37 = spvNMax(productValue55 ? (fma(uintBitsToFloat(reinterpretedBits.w), sampledTextureValue.w, -scalarValue) + scalarValue) : scalarValue, 0.0);
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
    float reinterpretedBits9 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits5), -(inverseLengthValue * reinterpretedBits6), -(inverseLengthValue * reinterpretedBits7)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits8.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits8.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits8.z)));
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float reinterpretedBits11 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[45u])) - reinterpretedBits10)) * (reinterpretedBits9 - reinterpretedBits10), 0.0, 1.0);
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[14u]);
    float reinterpretedBits13 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[46u]));
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits12.x)) / reinterpretedBits13) * reinterpretedBits13;
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits12.y)) / reinterpretedBits13) * reinterpretedBits13;
    float productValue = floor(multiplyAddValue1 * 0.25);
    float productValue1 = floor(multiplyAddValue1 * 0.5);
    float scalarValue2 = floor(multiplyAddValue1);
    if (((scalarValue + multiplyAddValue37) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue * productValue) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue1 * productValue1) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue2 * scalarValue2) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits11 * reinterpretedBits11) * fma(reinterpretedBits11, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits26 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits14.x);
    float reinterpretedBits27 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits14.y);
    float reinterpretedBits28 = sampledTextureValue.z * uintBitsToFloat(reinterpretedBits14.z);
    float reinterpretedBits29 = sampledTextureValue.w * uintBitsToFloat(reinterpretedBits14.w);
    float reinterpretedBits30 = spvNMax(reinterpretedBits29 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits31 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits5), -(inverseLengthValue * reinterpretedBits6), -(inverseLengthValue * reinterpretedBits7)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits16.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits16.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits16.z)));
    float reinterpretedBits32 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits33 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits32)) * (reinterpretedBits31 - reinterpretedBits32), 0.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits35 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue44 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.x)) / reinterpretedBits35) * reinterpretedBits35;
    float multiplyAddValue45 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.y)) / reinterpretedBits35) * reinterpretedBits35;
    float productValue72 = floor(multiplyAddValue45 * 0.25);
    float productValue73 = floor(multiplyAddValue45 * 0.5);
    float scalarValue19 = floor(multiplyAddValue45);
    if (((reinterpretedBits30 + scalarValue) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue44 * 0.25), 0.5, (productValue72 * productValue72) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue44 * 0.5), 0.5, (productValue73 * productValue73) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue44), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits33 * reinterpretedBits33) * fma(reinterpretedBits33, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue1.x;
    float scalarValue15 = sampledTextureValue1.y;
    float scalarValue16 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    bool productValue55 = ((1.0 - scalarValue) * (scalarValue16 + (scalarValue15 + scalarValue14))) > 0.0;
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue74 = productValue55 ? (fma(uintBitsToFloat(reinterpretedBits14.x), sampledTextureValue.x, -scalarValue14) + scalarValue14) : scalarValue14;
    float multiplyAddValue75 = productValue55 ? (fma(uintBitsToFloat(reinterpretedBits14.y), sampledTextureValue.y, -scalarValue15) + scalarValue15) : scalarValue15;
    float multiplyAddValue76 = productValue55 ? (fma(uintBitsToFloat(reinterpretedBits14.z), sampledTextureValue.z, -scalarValue16) + scalarValue16) : scalarValue16;
    float multiplyAddValue77 = productValue55 ? (fma(uintBitsToFloat(reinterpretedBits14.w), sampledTextureValue.w, -scalarValue) + scalarValue) : scalarValue;
    float reinterpretedBits49 = spvNMax(multiplyAddValue77 * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[19u])), 0.0);
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits31 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits5), -(inverseLengthValue * reinterpretedBits6), -(inverseLengthValue * reinterpretedBits7)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits16.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits16.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits16.z)));
    float reinterpretedBits32 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits33 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits32)) * (reinterpretedBits31 - reinterpretedBits32), 0.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits35 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue44 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.x)) / reinterpretedBits35) * reinterpretedBits35;
    float multiplyAddValue45 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.y)) / reinterpretedBits35) * reinterpretedBits35;
    float productValue72 = floor(multiplyAddValue45 * 0.25);
    float productValue73 = floor(multiplyAddValue45 * 0.5);
    float scalarValue19 = floor(multiplyAddValue45);
    if (((scalarValue + reinterpretedBits49) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue44 * 0.25), 0.5, (productValue72 * productValue72) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue44 * 0.5), 0.5, (productValue73 * productValue73) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue44), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits33 * reinterpretedBits33) * fma(reinterpretedBits33, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float reinterpretedBits26 = sampledTextureValue.x * uintBitsToFloat(reinterpretedBits14.x);
    float reinterpretedBits27 = sampledTextureValue.y * uintBitsToFloat(reinterpretedBits14.y);
    float reinterpretedBits51 = spvNMax(sampledTextureValue.w * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), 0.0);
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits31 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits5), -(inverseLengthValue * reinterpretedBits6), -(inverseLengthValue * reinterpretedBits7)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits16.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits16.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits16.z)));
    float reinterpretedBits32 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits33 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits32)) * (reinterpretedBits31 - reinterpretedBits32), 0.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits35 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue44 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.x)) / reinterpretedBits35) * reinterpretedBits35;
    float multiplyAddValue45 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.y)) / reinterpretedBits35) * reinterpretedBits35;
    float productValue72 = floor(multiplyAddValue45 * 0.25);
    float productValue73 = floor(multiplyAddValue45 * 0.5);
    float scalarValue19 = floor(multiplyAddValue45);
    if (((reinterpretedBits51 + scalarValue) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]))) || ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue44 * 0.25), 0.5, (productValue72 * productValue72) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue44 * 0.5), 0.5, (productValue73 * productValue73) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue44), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits33 * reinterpretedBits33) * fma(reinterpretedBits33, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue14 = sampledTextureValue1.x;
    float scalarValue15 = sampledTextureValue1.y;
    float scalarValue16 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    bool productValue146 = ((scalarValue16 + (scalarValue15 + scalarValue14)) * (1.0 - scalarValue)) > 0.0;
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue118 = productValue146 ? (fma(uintBitsToFloat(reinterpretedBits14.x), sampledTextureValue.x, -scalarValue14) + scalarValue14) : scalarValue14;
    float multiplyAddValue119 = productValue146 ? (fma(uintBitsToFloat(reinterpretedBits14.y), sampledTextureValue.y, -scalarValue15) + scalarValue15) : scalarValue15;
    float multiplyAddValue120 = spvNMax(productValue146 ? (fma(uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[71u])), sampledTextureValue.w, -scalarValue) + scalarValue) : scalarValue, 0.0);
    float reinterpretedBits5 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
    float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
    float reinterpretedBits7 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
    vec3 vectorValue = vec3(reinterpretedBits5, reinterpretedBits6, reinterpretedBits7);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue1);
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits31 = rdDot3Precise(vec3(-(inverseLengthValue * reinterpretedBits5), -(inverseLengthValue * reinterpretedBits6), -(inverseLengthValue * reinterpretedBits7)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits16.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits16.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits16.z)));
    float reinterpretedBits32 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]));
    float reinterpretedBits33 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[49u])) - reinterpretedBits32)) * (reinterpretedBits31 - reinterpretedBits32), 0.0, 1.0);
    uvec4 reinterpretedBits34 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
    float reinterpretedBits35 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[50u]));
    float multiplyAddValue44 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.x)) / reinterpretedBits35) * reinterpretedBits35;
    float multiplyAddValue45 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits34.y)) / reinterpretedBits35) * reinterpretedBits35;
    float productValue72 = floor(multiplyAddValue45 * 0.25);
    float productValue73 = floor(multiplyAddValue45 * 0.5);
    float scalarValue19 = floor(multiplyAddValue45);
    if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue44 * 0.25), 0.5, (productValue72 * productValue72) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue44 * 0.5), 0.5, (productValue73 * productValue73) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue44), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits33 * reinterpretedBits33) * fma(reinterpretedBits33, -2.0, 3.0)))) || ((scalarValue + multiplyAddValue120) < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue2 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue3 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue4 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[16u].z;
    float productValue5 = spvNMax(0.0, sampledTextureValue2.w * fragmentVectorConstants1.packedValues[16u].w);
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue3.w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue6 = floor(quotientValue1 * 0.25);
        float productValue7 = floor(quotientValue1 * 0.5);
        float scalarValue4 = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue7 * productValue7) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue6 * productValue6) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue4 * scalarValue4) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((scalarValue3 + productValue5) < fragmentVectorConstants1.packedValues[9u].x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue3.x;
    float scalarValue6 = sampledTextureValue3.y;
    float scalarValue7 = sampledTextureValue3.z;
    float scalarValue3 = sampledTextureValue3.w;
    float productValue14 = float((((scalarValue5 + scalarValue6) + scalarValue7) * (1.0 - scalarValue3)) > 0.0);
    float productValue15 = (productValue14 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[16u].x) - scalarValue5)) + scalarValue5;
    float productValue16 = (productValue14 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[16u].y) - scalarValue6)) + scalarValue6;
    float productValue17 = (productValue14 * ((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[16u].z) - scalarValue7)) + scalarValue7;
    float productValue18 = spvNMax(0.0, (productValue14 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[16u].w) - scalarValue3)) + scalarValue3);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue6 = floor(quotientValue1 * 0.25);
        float productValue7 = floor(quotientValue1 * 0.5);
        float scalarValue4 = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue7 * productValue7) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue6 * productValue6) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue4 * scalarValue4) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((scalarValue3 + productValue18) < fragmentVectorConstants1.packedValues[9u].x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue56 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue57 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue58 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue59 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[17u].w;
    float productValue60 = (((productValue56 * fragmentVectorConstants1.packedValues[4u].x) - productValue56) * productValue59) + productValue56;
    float productValue61 = (((productValue57 * fragmentVectorConstants1.packedValues[4u].y) - productValue57) * productValue59) + productValue57;
    float productValue62 = (((productValue58 * fragmentVectorConstants1.packedValues[4u].z) - productValue58) * productValue59) + productValue58;
    float productValue63 = spvNMax(0.0, productValue59 * fragmentVectorConstants1.packedValues[4u].w);
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue3.w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue64 = floor(quotientValue8 * 0.25);
        float productValue65 = floor(quotientValue8 * 0.5);
        float scalarValue18 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue65 * productValue65) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue64 * productValue64) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((scalarValue3 + productValue63) < fragmentVectorConstants1.packedValues[10u].x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue3.x;
    float scalarValue6 = sampledTextureValue3.y;
    float scalarValue7 = sampledTextureValue3.z;
    float scalarValue3 = sampledTextureValue3.w;
    float productValue14 = float((((scalarValue5 + scalarValue6) + scalarValue7) * (1.0 - scalarValue3)) > 0.0);
    float productValue94 = (productValue14 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue5)) + scalarValue5;
    float productValue95 = (productValue14 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue6)) + scalarValue6;
    float productValue96 = (productValue14 * ((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[17u].z) - scalarValue7)) + scalarValue7;
    float productValue97 = (productValue14 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue3)) + scalarValue3;
    float productValue98 = (((productValue94 * fragmentVectorConstants1.packedValues[4u].x) - productValue94) * productValue97) + productValue94;
    float productValue99 = (((productValue95 * fragmentVectorConstants1.packedValues[4u].y) - productValue95) * productValue97) + productValue95;
    float productValue100 = (((productValue96 * fragmentVectorConstants1.packedValues[4u].z) - productValue96) * productValue97) + productValue96;
    float productValue101 = spvNMax(0.0, productValue97 * fragmentVectorConstants1.packedValues[4u].w);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue64 = floor(quotientValue8 * 0.25);
        float productValue65 = floor(quotientValue8 * 0.5);
        float scalarValue18 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue65 * productValue65) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue64 * productValue64) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((productValue101 + scalarValue3) < fragmentVectorConstants1.packedValues[10u].x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue56 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue57 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue108 = fragmentVectorConstants1.packedValues[4u].x * productValue56;
    float productValue109 = fragmentVectorConstants1.packedValues[4u].y * productValue56;
    float productValue110 = fragmentVectorConstants1.packedValues[4u].z * productValue56;
    float scalarValue26 = ceil(productValue57);
    float productValue111 = (((productValue57 * fragmentVectorConstants1.packedValues[18u].x) - productValue108) * scalarValue26) + productValue108;
    float productValue112 = (((productValue57 * fragmentVectorConstants1.packedValues[18u].y) - productValue109) * scalarValue26) + productValue109;
    float productValue113 = (((productValue57 * fragmentVectorConstants1.packedValues[18u].z) - productValue110) * scalarValue26) + productValue110;
    float productValue114 = spvNMax(0.0, sampledTextureValue2.w * fragmentVectorConstants1.packedValues[17u].w);
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue3 = sampledTextureValue3.w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue64 = floor(quotientValue8 * 0.25);
        float productValue65 = floor(quotientValue8 * 0.5);
        float scalarValue18 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue65 * productValue65) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue64 * productValue64) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((scalarValue3 + productValue114) < fragmentVectorConstants1.packedValues[10u].x))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue3.x;
    float scalarValue6 = sampledTextureValue3.y;
    float scalarValue7 = sampledTextureValue3.z;
    float scalarValue3 = sampledTextureValue3.w;
    float productValue14 = float((((scalarValue5 + scalarValue6) + scalarValue7) * (1.0 - scalarValue3)) > 0.0);
    float productValue94 = (productValue14 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue5)) + scalarValue5;
    float productValue95 = (productValue14 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue6)) + scalarValue6;
    float productValue133 = productValue94 * fragmentVectorConstants1.packedValues[4u].x;
    float productValue134 = productValue94 * fragmentVectorConstants1.packedValues[4u].y;
    float productValue135 = productValue94 * fragmentVectorConstants1.packedValues[4u].z;
    float scalarValue31 = ceil(productValue95);
    float productValue136 = (((productValue95 * fragmentVectorConstants1.packedValues[18u].x) - productValue133) * scalarValue31) + productValue133;
    float productValue137 = (((productValue95 * fragmentVectorConstants1.packedValues[18u].y) - productValue134) * scalarValue31) + productValue134;
    float productValue138 = (((productValue95 * fragmentVectorConstants1.packedValues[18u].z) - productValue135) * scalarValue31) + productValue135;
    float productValue139 = spvNMax(0.0, (productValue14 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue3)) + scalarValue3);
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue7 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue8 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue64 = floor(quotientValue8 * 0.25);
        float productValue65 = floor(quotientValue8 * 0.5);
        float scalarValue18 = floor(quotientValue8);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue65 * productValue65) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue64 * productValue64) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (comparisonValue || ((productValue139 + scalarValue3) < fragmentVectorConstants1.packedValues[10u].x))
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue15 = fma(scalarValue, fma(sampledTextureValue1.x, uintBitsToFloat(reinterpretedBits14.x), -reinterpretedBits18), reinterpretedBits18);
    float multiplyAddValue16 = fma(scalarValue, fma(sampledTextureValue1.y, uintBitsToFloat(reinterpretedBits14.y), -reinterpretedBits19), reinterpretedBits19);
    float multiplyAddValue17 = fma(scalarValue, fma(sampledTextureValue1.z, uintBitsToFloat(reinterpretedBits14.z), -reinterpretedBits20), reinterpretedBits20);
    precise float sumValue2 = varyingColor0.x - 1.0;
    precise float sumValue3 = varyingColor0.y - 1.0;
    precise float sumValue4 = varyingColor0.z - 1.0;
    float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue18 = fma(reinterpretedBits15, sumValue2, 1.0);
    float multiplyAddValue19 = fma(reinterpretedBits15, sumValue3, 1.0);
    float multiplyAddValue20 = fma(reinterpretedBits15, sumValue4, 1.0);
    precise float productValue42 = multiplyAddValue15 * multiplyAddValue18;
    precise float productValue43 = multiplyAddValue16 * multiplyAddValue19;
    precise float productValue44 = multiplyAddValue17 * multiplyAddValue20;
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue21 = fma(reinterpretedBits17, fma(-multiplyAddValue15, multiplyAddValue18, uintBitsToFloat(reinterpretedBits16.x)), productValue42);
    float multiplyAddValue22 = fma(reinterpretedBits17, fma(-multiplyAddValue16, multiplyAddValue19, uintBitsToFloat(reinterpretedBits16.y)), productValue43);
    float multiplyAddValue23 = fma(reinterpretedBits17, fma(-multiplyAddValue17, multiplyAddValue20, uintBitsToFloat(reinterpretedBits16.z)), productValue44);
    precise float productValue45 = multiplyAddValue21 * varyingColor3.x;
    precise float productValue46 = multiplyAddValue22 * varyingColor3.y;
    precise float productValue47 = multiplyAddValue23 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue21, varyingColor3.x, varyingColor2.x), productValue45);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue22, varyingColor3.y, varyingColor2.y), productValue46);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue23, varyingColor3.z, varyingColor2.z), productValue47);
    fragmentColor0.w = scalarValue8;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue28 = fma(scalarValue, fma(scalarValue14, uintBitsToFloat(reinterpretedBits14.x), -multiplyAddValue24), multiplyAddValue24);
    float multiplyAddValue29 = fma(scalarValue, fma(scalarValue15, uintBitsToFloat(reinterpretedBits14.y), -multiplyAddValue25), multiplyAddValue25);
    float multiplyAddValue30 = fma(scalarValue, fma(scalarValue16, uintBitsToFloat(reinterpretedBits14.z), -multiplyAddValue26), multiplyAddValue26);
    precise float sumValue2 = varyingColor0.x - 1.0;
    precise float sumValue3 = varyingColor0.y - 1.0;
    precise float sumValue4 = varyingColor0.z - 1.0;
    float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue18 = fma(reinterpretedBits15, sumValue2, 1.0);
    float multiplyAddValue19 = fma(reinterpretedBits15, sumValue3, 1.0);
    float multiplyAddValue20 = fma(reinterpretedBits15, sumValue4, 1.0);
    precise float productValue49 = multiplyAddValue28 * multiplyAddValue18;
    precise float productValue50 = multiplyAddValue29 * multiplyAddValue19;
    precise float productValue51 = multiplyAddValue30 * multiplyAddValue20;
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue31 = fma(reinterpretedBits17, fma(-multiplyAddValue28, multiplyAddValue18, uintBitsToFloat(reinterpretedBits16.x)), productValue49);
    float multiplyAddValue32 = fma(reinterpretedBits17, fma(-multiplyAddValue29, multiplyAddValue19, uintBitsToFloat(reinterpretedBits16.y)), productValue50);
    float multiplyAddValue33 = fma(reinterpretedBits17, fma(-multiplyAddValue30, multiplyAddValue20, uintBitsToFloat(reinterpretedBits16.z)), productValue51);
    precise float productValue52 = multiplyAddValue31 * varyingColor3.x;
    precise float productValue53 = multiplyAddValue32 * varyingColor3.y;
    precise float productValue54 = multiplyAddValue33 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue31, varyingColor3.x, varyingColor2.x), productValue52);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue32, varyingColor3.y, varyingColor2.y), productValue53);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue33, varyingColor3.z, varyingColor2.z), productValue54);
    fragmentColor0.w = multiplyAddValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue62 = fma(reinterpretedBits43, fma(reinterpretedBits40, uintBitsToFloat(reinterpretedBits36.x), -reinterpretedBits40), reinterpretedBits40);
    float multiplyAddValue63 = fma(reinterpretedBits43, fma(reinterpretedBits41, uintBitsToFloat(reinterpretedBits36.y), -reinterpretedBits41), reinterpretedBits41);
    float multiplyAddValue64 = fma(reinterpretedBits43, fma(reinterpretedBits42, uintBitsToFloat(reinterpretedBits36.z), -reinterpretedBits42), reinterpretedBits42);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue65 = fma(scalarValue, fma(sampledTextureValue1.x, uintBitsToFloat(reinterpretedBits37.x), -multiplyAddValue62), multiplyAddValue62);
    float multiplyAddValue66 = fma(scalarValue, fma(sampledTextureValue1.y, uintBitsToFloat(reinterpretedBits37.y), -multiplyAddValue63), multiplyAddValue63);
    float multiplyAddValue67 = fma(scalarValue, fma(sampledTextureValue1.z, uintBitsToFloat(reinterpretedBits37.z), -multiplyAddValue64), multiplyAddValue64);
    precise float sumValue2 = varyingColor0.x - 1.0;
    precise float sumValue3 = varyingColor0.y - 1.0;
    precise float sumValue4 = varyingColor0.z - 1.0;
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue68 = fma(reinterpretedBits10, sumValue2, 1.0);
    float multiplyAddValue69 = fma(reinterpretedBits10, sumValue3, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits10, sumValue4, 1.0);
    precise float productValue88 = multiplyAddValue65 * multiplyAddValue68;
    precise float productValue89 = multiplyAddValue66 * multiplyAddValue69;
    precise float productValue90 = multiplyAddValue67 * multiplyAddValue70;
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue71 = fma(reinterpretedBits39, fma(-multiplyAddValue65, multiplyAddValue68, uintBitsToFloat(reinterpretedBits38.x)), productValue88);
    float multiplyAddValue72 = fma(reinterpretedBits39, fma(-multiplyAddValue66, multiplyAddValue69, uintBitsToFloat(reinterpretedBits38.y)), productValue89);
    float multiplyAddValue73 = fma(reinterpretedBits39, fma(-multiplyAddValue67, multiplyAddValue70, uintBitsToFloat(reinterpretedBits38.z)), productValue90);
    precise float productValue91 = multiplyAddValue71 * varyingColor3.x;
    precise float productValue92 = multiplyAddValue72 * varyingColor3.y;
    precise float productValue93 = multiplyAddValue73 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue71, varyingColor3.x, varyingColor2.x), productValue91);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue72, varyingColor3.y, varyingColor2.y), productValue92);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue73, varyingColor3.z, varyingColor2.z), productValue93);
    fragmentColor0.w = scalarValue20;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue91 = fma(multiplyAddValue90, fma(multiplyAddValue87, uintBitsToFloat(reinterpretedBits36.x), -multiplyAddValue87), multiplyAddValue87);
    float multiplyAddValue92 = fma(multiplyAddValue90, fma(multiplyAddValue88, uintBitsToFloat(reinterpretedBits36.y), -multiplyAddValue88), multiplyAddValue88);
    float multiplyAddValue93 = fma(multiplyAddValue90, fma(multiplyAddValue89, uintBitsToFloat(reinterpretedBits36.z), -multiplyAddValue89), multiplyAddValue89);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue94 = fma(scalarValue, fma(scalarValue14, uintBitsToFloat(reinterpretedBits37.x), -multiplyAddValue91), multiplyAddValue91);
    float multiplyAddValue95 = fma(scalarValue, fma(scalarValue15, uintBitsToFloat(reinterpretedBits37.y), -multiplyAddValue92), multiplyAddValue92);
    float multiplyAddValue96 = fma(scalarValue, fma(scalarValue16, uintBitsToFloat(reinterpretedBits37.z), -multiplyAddValue93), multiplyAddValue93);
    precise float sumValue2 = varyingColor0.x - 1.0;
    precise float sumValue3 = varyingColor0.y - 1.0;
    precise float sumValue4 = varyingColor0.z - 1.0;
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue68 = fma(reinterpretedBits10, sumValue2, 1.0);
    float multiplyAddValue69 = fma(reinterpretedBits10, sumValue3, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits10, sumValue4, 1.0);
    precise float productValue121 = multiplyAddValue94 * multiplyAddValue68;
    precise float productValue122 = multiplyAddValue95 * multiplyAddValue69;
    precise float productValue123 = multiplyAddValue96 * multiplyAddValue70;
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue97 = fma(reinterpretedBits39, fma(-multiplyAddValue94, multiplyAddValue68, uintBitsToFloat(reinterpretedBits38.x)), productValue121);
    float multiplyAddValue98 = fma(reinterpretedBits39, fma(-multiplyAddValue95, multiplyAddValue69, uintBitsToFloat(reinterpretedBits38.y)), productValue122);
    float multiplyAddValue99 = fma(reinterpretedBits39, fma(-multiplyAddValue96, multiplyAddValue70, uintBitsToFloat(reinterpretedBits38.z)), productValue123);
    precise float productValue124 = multiplyAddValue97 * varyingColor3.x;
    precise float productValue125 = multiplyAddValue98 * varyingColor3.y;
    precise float productValue126 = multiplyAddValue99 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue97, varyingColor3.x, varyingColor2.x), productValue124);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue98, varyingColor3.y, varyingColor2.y), productValue125);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue99, varyingColor3.z, varyingColor2.z), productValue126);
    fragmentColor0.w = scalarValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    precise float reinterpretedBits59 = reinterpretedBits40 * uintBitsToFloat(reinterpretedBits36.x);
    precise float reinterpretedBits60 = reinterpretedBits40 * uintBitsToFloat(reinterpretedBits36.y);
    precise float reinterpretedBits61 = reinterpretedBits40 * uintBitsToFloat(reinterpretedBits36.z);
    float scalarValue30 = ceil(reinterpretedBits41);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits37.x);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits37.y);
    float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits37.z);
    float multiplyAddValue109 = fma(scalarValue30, fma(reinterpretedBits41, reinterpretedBits55, -reinterpretedBits59), reinterpretedBits59);
    float multiplyAddValue110 = fma(scalarValue30, fma(reinterpretedBits41, reinterpretedBits56, -reinterpretedBits60), reinterpretedBits60);
    float multiplyAddValue111 = fma(scalarValue30, fma(reinterpretedBits41, reinterpretedBits57, -reinterpretedBits61), reinterpretedBits61);
    float multiplyAddValue112 = fma(scalarValue, fma(sampledTextureValue1.x, reinterpretedBits55, -multiplyAddValue109), multiplyAddValue109);
    float multiplyAddValue113 = fma(scalarValue, fma(sampledTextureValue1.y, reinterpretedBits56, -multiplyAddValue110), multiplyAddValue110);
    float multiplyAddValue114 = fma(scalarValue, fma(sampledTextureValue1.z, reinterpretedBits57, -multiplyAddValue111), multiplyAddValue111);
    precise float sumValue2 = varyingColor0.x - 1.0;
    precise float sumValue3 = varyingColor0.y - 1.0;
    precise float sumValue4 = varyingColor0.z - 1.0;
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue68 = fma(reinterpretedBits10, sumValue2, 1.0);
    float multiplyAddValue69 = fma(reinterpretedBits10, sumValue3, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits10, sumValue4, 1.0);
    precise float productValue127 = multiplyAddValue112 * multiplyAddValue68;
    precise float productValue128 = multiplyAddValue113 * multiplyAddValue69;
    precise float productValue129 = multiplyAddValue114 * multiplyAddValue70;
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue115 = fma(reinterpretedBits39, fma(-multiplyAddValue112, multiplyAddValue68, uintBitsToFloat(reinterpretedBits38.x)), productValue127);
    float multiplyAddValue116 = fma(reinterpretedBits39, fma(-multiplyAddValue113, multiplyAddValue69, uintBitsToFloat(reinterpretedBits38.y)), productValue128);
    float multiplyAddValue117 = fma(reinterpretedBits39, fma(-multiplyAddValue114, multiplyAddValue70, uintBitsToFloat(reinterpretedBits38.z)), productValue129);
    precise float productValue130 = multiplyAddValue115 * varyingColor3.x;
    precise float productValue131 = multiplyAddValue116 * varyingColor3.y;
    precise float productValue132 = multiplyAddValue117 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue115, varyingColor3.x, varyingColor2.x), productValue130);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue116, varyingColor3.y, varyingColor2.y), productValue131);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue117, varyingColor3.z, varyingColor2.z), productValue132);
    fragmentColor0.w = scalarValue29;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    precise float reinterpretedBits65 = multiplyAddValue130 * uintBitsToFloat(reinterpretedBits36.x);
    precise float reinterpretedBits66 = multiplyAddValue130 * uintBitsToFloat(reinterpretedBits36.y);
    precise float reinterpretedBits67 = multiplyAddValue130 * uintBitsToFloat(reinterpretedBits36.z);
    float scalarValue34 = ceil(multiplyAddValue131);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits37.x);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits37.y);
    float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits37.z);
    float multiplyAddValue133 = fma(scalarValue34, fma(multiplyAddValue131, reinterpretedBits55, -reinterpretedBits65), reinterpretedBits65);
    float multiplyAddValue134 = fma(scalarValue34, fma(multiplyAddValue131, reinterpretedBits56, -reinterpretedBits66), reinterpretedBits66);
    float multiplyAddValue135 = fma(scalarValue34, fma(multiplyAddValue131, reinterpretedBits57, -reinterpretedBits67), reinterpretedBits67);
    float multiplyAddValue136 = fma(scalarValue, fma(scalarValue14, reinterpretedBits55, -multiplyAddValue133), multiplyAddValue133);
    float multiplyAddValue137 = fma(scalarValue, fma(scalarValue15, reinterpretedBits56, -multiplyAddValue134), multiplyAddValue134);
    float multiplyAddValue138 = fma(scalarValue, fma(scalarValue16, reinterpretedBits57, -multiplyAddValue135), multiplyAddValue135);
    precise float sumValue2 = varyingColor0.x - 1.0;
    precise float sumValue3 = varyingColor0.y - 1.0;
    precise float sumValue4 = varyingColor0.z - 1.0;
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue68 = fma(reinterpretedBits10, sumValue2, 1.0);
    float multiplyAddValue69 = fma(reinterpretedBits10, sumValue3, 1.0);
    float multiplyAddValue70 = fma(reinterpretedBits10, sumValue4, 1.0);
    precise float productValue148 = multiplyAddValue136 * multiplyAddValue68;
    precise float productValue149 = multiplyAddValue137 * multiplyAddValue69;
    precise float productValue150 = multiplyAddValue138 * multiplyAddValue70;
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue139 = fma(reinterpretedBits39, fma(-multiplyAddValue136, multiplyAddValue68, uintBitsToFloat(reinterpretedBits38.x)), productValue148);
    float multiplyAddValue140 = fma(reinterpretedBits39, fma(-multiplyAddValue137, multiplyAddValue69, uintBitsToFloat(reinterpretedBits38.y)), productValue149);
    float multiplyAddValue141 = fma(reinterpretedBits39, fma(-multiplyAddValue138, multiplyAddValue70, uintBitsToFloat(reinterpretedBits38.z)), productValue150);
    precise float productValue151 = multiplyAddValue139 * varyingColor3.x;
    precise float productValue152 = multiplyAddValue140 * varyingColor3.y;
    precise float productValue153 = multiplyAddValue141 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue139, varyingColor3.x, varyingColor2.x), productValue151);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue140, varyingColor3.y, varyingColor2.y), productValue152);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue141, varyingColor3.z, varyingColor2.z), productValue153);
    fragmentColor0.w = multiplyAddValue132;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue2 = fma(scalarValue, fma(sampledTextureValue1.x, uintBitsToFloat(reinterpretedBits14.x), -reinterpretedBits1), reinterpretedBits1);
    float multiplyAddValue3 = fma(scalarValue, fma(sampledTextureValue1.y, uintBitsToFloat(reinterpretedBits14.y), -reinterpretedBits2), reinterpretedBits2);
    float multiplyAddValue4 = fma(scalarValue, fma(sampledTextureValue1.z, uintBitsToFloat(reinterpretedBits14.z), -reinterpretedBits3), reinterpretedBits3);
    float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue5 = fma(reinterpretedBits15, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue6 = fma(reinterpretedBits15, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue7 = fma(reinterpretedBits15, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue8 = fma(reinterpretedBits17, fma(-multiplyAddValue2, multiplyAddValue5, uintBitsToFloat(reinterpretedBits16.x)), multiplyAddValue2 * multiplyAddValue5);
    float multiplyAddValue9 = fma(reinterpretedBits17, fma(-multiplyAddValue3, multiplyAddValue6, uintBitsToFloat(reinterpretedBits16.y)), multiplyAddValue3 * multiplyAddValue6);
    float multiplyAddValue10 = fma(reinterpretedBits17, fma(-multiplyAddValue4, multiplyAddValue7, uintBitsToFloat(reinterpretedBits16.z)), multiplyAddValue4 * multiplyAddValue7);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue8, varyingColor3.x, varyingColor2.x), multiplyAddValue8 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue9, varyingColor3.y, varyingColor2.y), multiplyAddValue9 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue10, varyingColor3.z, varyingColor2.z), multiplyAddValue10 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits4;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits14 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
    float multiplyAddValue38 = fma(scalarValue, fma(scalarValue14, uintBitsToFloat(reinterpretedBits14.x), -multiplyAddValue34), multiplyAddValue34);
    float multiplyAddValue39 = fma(scalarValue, fma(scalarValue15, uintBitsToFloat(reinterpretedBits14.y), -multiplyAddValue35), multiplyAddValue35);
    float multiplyAddValue40 = fma(scalarValue, fma(scalarValue16, uintBitsToFloat(reinterpretedBits14.z), -multiplyAddValue36), multiplyAddValue36);
    float reinterpretedBits15 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    float multiplyAddValue5 = fma(reinterpretedBits15, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue6 = fma(reinterpretedBits15, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue7 = fma(reinterpretedBits15, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits16 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue41 = fma(reinterpretedBits17, fma(-multiplyAddValue38, multiplyAddValue5, uintBitsToFloat(reinterpretedBits16.x)), multiplyAddValue38 * multiplyAddValue5);
    float multiplyAddValue42 = fma(reinterpretedBits17, fma(-multiplyAddValue39, multiplyAddValue6, uintBitsToFloat(reinterpretedBits16.y)), multiplyAddValue39 * multiplyAddValue6);
    float multiplyAddValue43 = fma(reinterpretedBits17, fma(-multiplyAddValue40, multiplyAddValue7, uintBitsToFloat(reinterpretedBits16.z)), multiplyAddValue40 * multiplyAddValue7);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue41, varyingColor3.x, varyingColor2.x), multiplyAddValue41 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue42, varyingColor3.y, varyingColor2.y), multiplyAddValue42 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue43, varyingColor3.z, varyingColor2.z), multiplyAddValue43 * varyingColor3.z);
    fragmentColor0.w = multiplyAddValue37;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue46 = fma(reinterpretedBits29, fma(reinterpretedBits26, uintBitsToFloat(reinterpretedBits36.x), -reinterpretedBits26), reinterpretedBits26);
    float multiplyAddValue47 = fma(reinterpretedBits29, fma(reinterpretedBits27, uintBitsToFloat(reinterpretedBits36.y), -reinterpretedBits27), reinterpretedBits27);
    float multiplyAddValue48 = fma(reinterpretedBits29, fma(reinterpretedBits28, uintBitsToFloat(reinterpretedBits36.z), -reinterpretedBits28), reinterpretedBits28);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue49 = fma(scalarValue, fma(sampledTextureValue1.x, uintBitsToFloat(reinterpretedBits37.x), -multiplyAddValue46), multiplyAddValue46);
    float multiplyAddValue50 = fma(scalarValue, fma(sampledTextureValue1.y, uintBitsToFloat(reinterpretedBits37.y), -multiplyAddValue47), multiplyAddValue47);
    float multiplyAddValue51 = fma(scalarValue, fma(sampledTextureValue1.z, uintBitsToFloat(reinterpretedBits37.z), -multiplyAddValue48), multiplyAddValue48);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue52 = fma(reinterpretedBits10, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue53 = fma(reinterpretedBits10, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue54 = fma(reinterpretedBits10, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue55 = fma(reinterpretedBits39, fma(-multiplyAddValue49, multiplyAddValue52, uintBitsToFloat(reinterpretedBits38.x)), multiplyAddValue49 * multiplyAddValue52);
    float multiplyAddValue56 = fma(reinterpretedBits39, fma(-multiplyAddValue50, multiplyAddValue53, uintBitsToFloat(reinterpretedBits38.y)), multiplyAddValue50 * multiplyAddValue53);
    float multiplyAddValue57 = fma(reinterpretedBits39, fma(-multiplyAddValue51, multiplyAddValue54, uintBitsToFloat(reinterpretedBits38.z)), multiplyAddValue51 * multiplyAddValue54);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue55, varyingColor3.x, varyingColor2.x), multiplyAddValue55 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue56, varyingColor3.y, varyingColor2.y), multiplyAddValue56 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue57, varyingColor3.z, varyingColor2.z), multiplyAddValue57 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits30;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue78 = fma(multiplyAddValue77, fma(multiplyAddValue74, uintBitsToFloat(reinterpretedBits36.x), -multiplyAddValue74), multiplyAddValue74);
    float multiplyAddValue79 = fma(multiplyAddValue77, fma(multiplyAddValue75, uintBitsToFloat(reinterpretedBits36.y), -multiplyAddValue75), multiplyAddValue75);
    float multiplyAddValue80 = fma(multiplyAddValue77, fma(multiplyAddValue76, uintBitsToFloat(reinterpretedBits36.z), -multiplyAddValue76), multiplyAddValue76);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float multiplyAddValue81 = fma(scalarValue, fma(scalarValue14, uintBitsToFloat(reinterpretedBits37.x), -multiplyAddValue78), multiplyAddValue78);
    float multiplyAddValue82 = fma(scalarValue, fma(scalarValue15, uintBitsToFloat(reinterpretedBits37.y), -multiplyAddValue79), multiplyAddValue79);
    float multiplyAddValue83 = fma(scalarValue, fma(scalarValue16, uintBitsToFloat(reinterpretedBits37.z), -multiplyAddValue80), multiplyAddValue80);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue52 = fma(reinterpretedBits10, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue53 = fma(reinterpretedBits10, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue54 = fma(reinterpretedBits10, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue84 = fma(reinterpretedBits39, fma(-multiplyAddValue81, multiplyAddValue52, uintBitsToFloat(reinterpretedBits38.x)), multiplyAddValue81 * multiplyAddValue52);
    float multiplyAddValue85 = fma(reinterpretedBits39, fma(-multiplyAddValue82, multiplyAddValue53, uintBitsToFloat(reinterpretedBits38.y)), multiplyAddValue82 * multiplyAddValue53);
    float multiplyAddValue86 = fma(reinterpretedBits39, fma(-multiplyAddValue83, multiplyAddValue54, uintBitsToFloat(reinterpretedBits38.z)), multiplyAddValue83 * multiplyAddValue54);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue84, varyingColor3.x, varyingColor2.x), multiplyAddValue84 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue85, varyingColor3.y, varyingColor2.y), multiplyAddValue85 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue86, varyingColor3.z, varyingColor2.z), multiplyAddValue86 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits49;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits52 = reinterpretedBits26 * uintBitsToFloat(reinterpretedBits36.x);
    float reinterpretedBits53 = reinterpretedBits26 * uintBitsToFloat(reinterpretedBits36.y);
    float reinterpretedBits54 = reinterpretedBits26 * uintBitsToFloat(reinterpretedBits36.z);
    float scalarValue28 = ceil(reinterpretedBits27);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits37.x);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits37.y);
    float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits37.z);
    float multiplyAddValue100 = fma(scalarValue28, fma(reinterpretedBits27, reinterpretedBits55, -reinterpretedBits52), reinterpretedBits52);
    float multiplyAddValue101 = fma(scalarValue28, fma(reinterpretedBits27, reinterpretedBits56, -reinterpretedBits53), reinterpretedBits53);
    float multiplyAddValue102 = fma(scalarValue28, fma(reinterpretedBits27, reinterpretedBits57, -reinterpretedBits54), reinterpretedBits54);
    float multiplyAddValue103 = fma(scalarValue, fma(sampledTextureValue1.x, reinterpretedBits55, -multiplyAddValue100), multiplyAddValue100);
    float multiplyAddValue104 = fma(scalarValue, fma(sampledTextureValue1.y, reinterpretedBits56, -multiplyAddValue101), multiplyAddValue101);
    float multiplyAddValue105 = fma(scalarValue, fma(sampledTextureValue1.z, reinterpretedBits57, -multiplyAddValue102), multiplyAddValue102);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue52 = fma(reinterpretedBits10, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue53 = fma(reinterpretedBits10, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue54 = fma(reinterpretedBits10, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue106 = fma(reinterpretedBits39, fma(-multiplyAddValue103, multiplyAddValue52, uintBitsToFloat(reinterpretedBits38.x)), multiplyAddValue103 * multiplyAddValue52);
    float multiplyAddValue107 = fma(reinterpretedBits39, fma(-multiplyAddValue104, multiplyAddValue53, uintBitsToFloat(reinterpretedBits38.y)), multiplyAddValue104 * multiplyAddValue53);
    float multiplyAddValue108 = fma(reinterpretedBits39, fma(-multiplyAddValue105, multiplyAddValue54, uintBitsToFloat(reinterpretedBits38.z)), multiplyAddValue105 * multiplyAddValue54);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue106, varyingColor3.x, varyingColor2.x), multiplyAddValue106 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue107, varyingColor3.y, varyingColor2.y), multiplyAddValue107 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue108, varyingColor3.z, varyingColor2.z), multiplyAddValue108 * varyingColor3.z);
    fragmentColor0.w = reinterpretedBits51;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    uvec4 reinterpretedBits36 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits62 = multiplyAddValue118 * uintBitsToFloat(reinterpretedBits36.x);
    float reinterpretedBits63 = multiplyAddValue118 * uintBitsToFloat(reinterpretedBits36.y);
    float reinterpretedBits64 = multiplyAddValue118 * uintBitsToFloat(reinterpretedBits36.z);
    float scalarValue32 = ceil(multiplyAddValue119);
    uvec4 reinterpretedBits37 = floatBitsToUint(fragmentVectorConstants1.packedValues[18u]);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits37.x);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits37.y);
    float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits37.z);
    float multiplyAddValue121 = fma(scalarValue32, fma(multiplyAddValue119, reinterpretedBits55, -reinterpretedBits62), reinterpretedBits62);
    float multiplyAddValue122 = fma(scalarValue32, fma(multiplyAddValue119, reinterpretedBits56, -reinterpretedBits63), reinterpretedBits63);
    float multiplyAddValue123 = fma(scalarValue32, fma(multiplyAddValue119, reinterpretedBits57, -reinterpretedBits64), reinterpretedBits64);
    float multiplyAddValue124 = fma(scalarValue, fma(scalarValue14, reinterpretedBits55, -multiplyAddValue121), multiplyAddValue121);
    float multiplyAddValue125 = fma(scalarValue, fma(scalarValue15, reinterpretedBits56, -multiplyAddValue122), multiplyAddValue122);
    float multiplyAddValue126 = fma(scalarValue, fma(scalarValue16, reinterpretedBits57, -multiplyAddValue123), multiplyAddValue123);
    float reinterpretedBits10 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u]));
    float multiplyAddValue52 = fma(reinterpretedBits10, varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue53 = fma(reinterpretedBits10, varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue54 = fma(reinterpretedBits10, varyingColor0.z - 1.0, 1.0);
    uvec4 reinterpretedBits38 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits39 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue127 = fma(reinterpretedBits39, fma(-multiplyAddValue124, multiplyAddValue52, uintBitsToFloat(reinterpretedBits38.x)), multiplyAddValue124 * multiplyAddValue52);
    float multiplyAddValue128 = fma(reinterpretedBits39, fma(-multiplyAddValue125, multiplyAddValue53, uintBitsToFloat(reinterpretedBits38.y)), multiplyAddValue125 * multiplyAddValue53);
    float multiplyAddValue129 = fma(reinterpretedBits39, fma(-multiplyAddValue126, multiplyAddValue54, uintBitsToFloat(reinterpretedBits38.z)), multiplyAddValue126 * multiplyAddValue54);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue127, varyingColor3.x, varyingColor2.x), multiplyAddValue127 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue128, varyingColor3.y, varyingColor2.y), multiplyAddValue128 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue129, varyingColor3.z, varyingColor2.z), multiplyAddValue129 * varyingColor3.z);
    fragmentColor0.w = multiplyAddValue120;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue8 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[17u].x * sampledTextureValue3.x) - productValue2) * scalarValue3) + productValue2);
    float productValue9 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[17u].y * sampledTextureValue3.y) - productValue3) * scalarValue3) + productValue3);
    float productValue10 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[17u].z * sampledTextureValue3.z) - productValue4) * scalarValue3) + productValue4);
    float productValue11 = (((fragmentVectorConstants1.packedValues[8u].x - productValue8) * fragmentVectorConstants1.packedValues[8u].w) + productValue8) * varyingColor3.x;
    float productValue12 = (((fragmentVectorConstants1.packedValues[8u].y - productValue9) * fragmentVectorConstants1.packedValues[8u].w) + productValue9) * varyingColor3.y;
    float productValue13 = (((fragmentVectorConstants1.packedValues[8u].z - productValue10) * fragmentVectorConstants1.packedValues[8u].w) + productValue10) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.y = ((varyingColor2.y - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.z = ((varyingColor2.z - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.w = productValue5;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue19 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[17u].x * scalarValue5) - productValue15) * scalarValue3) + productValue15);
    float productValue20 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[17u].y * scalarValue6) - productValue16) * scalarValue3) + productValue16);
    float productValue21 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[17u].z * scalarValue7) - productValue17) * scalarValue3) + productValue17);
    float productValue22 = (((fragmentVectorConstants1.packedValues[8u].x - productValue19) * fragmentVectorConstants1.packedValues[8u].w) + productValue19) * varyingColor3.x;
    float productValue23 = (((fragmentVectorConstants1.packedValues[8u].y - productValue20) * fragmentVectorConstants1.packedValues[8u].w) + productValue20) * varyingColor3.y;
    float productValue24 = (((fragmentVectorConstants1.packedValues[8u].z - productValue21) * fragmentVectorConstants1.packedValues[8u].w) + productValue21) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue22) * varyingColor2.w) + productValue22;
    fragmentColor0.y = ((varyingColor2.y - productValue23) * varyingColor2.w) + productValue23;
    fragmentColor0.z = ((varyingColor2.z - productValue24) * varyingColor2.w) + productValue24;
    fragmentColor0.w = productValue18;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue66 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[18u].x * sampledTextureValue3.x) - productValue60) * scalarValue3) + productValue60);
    float productValue67 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[18u].y * sampledTextureValue3.y) - productValue61) * scalarValue3) + productValue61);
    float productValue68 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[18u].z * sampledTextureValue3.z) - productValue62) * scalarValue3) + productValue62);
    float productValue69 = (((fragmentVectorConstants1.packedValues[9u].x - productValue66) * fragmentVectorConstants1.packedValues[9u].w) + productValue66) * varyingColor3.x;
    float productValue70 = (((fragmentVectorConstants1.packedValues[9u].y - productValue67) * fragmentVectorConstants1.packedValues[9u].w) + productValue67) * varyingColor3.y;
    float productValue71 = (((fragmentVectorConstants1.packedValues[9u].z - productValue68) * fragmentVectorConstants1.packedValues[9u].w) + productValue68) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue69) * varyingColor2.w) + productValue69;
    fragmentColor0.y = ((varyingColor2.y - productValue70) * varyingColor2.w) + productValue70;
    fragmentColor0.z = ((varyingColor2.z - productValue71) * varyingColor2.w) + productValue71;
    fragmentColor0.w = productValue63;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue102 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[18u].x * scalarValue5) - productValue98) * scalarValue3) + productValue98);
    float productValue103 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[18u].y * scalarValue6) - productValue99) * scalarValue3) + productValue99);
    float productValue104 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[18u].z * scalarValue7) - productValue100) * scalarValue3) + productValue100);
    float productValue105 = (((fragmentVectorConstants1.packedValues[9u].x - productValue102) * fragmentVectorConstants1.packedValues[9u].w) + productValue102) * varyingColor3.x;
    float productValue106 = (((fragmentVectorConstants1.packedValues[9u].y - productValue103) * fragmentVectorConstants1.packedValues[9u].w) + productValue103) * varyingColor3.y;
    float productValue107 = (((fragmentVectorConstants1.packedValues[9u].z - productValue104) * fragmentVectorConstants1.packedValues[9u].w) + productValue104) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue105) * varyingColor2.w) + productValue105;
    fragmentColor0.y = ((varyingColor2.y - productValue106) * varyingColor2.w) + productValue106;
    fragmentColor0.z = ((varyingColor2.z - productValue107) * varyingColor2.w) + productValue107;
    fragmentColor0.w = productValue101;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue115 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((sampledTextureValue3.x * fragmentVectorConstants1.packedValues[18u].x) - productValue111) * scalarValue3) + productValue111);
    float productValue116 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((sampledTextureValue3.y * fragmentVectorConstants1.packedValues[18u].y) - productValue112) * scalarValue3) + productValue112);
    float productValue117 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((sampledTextureValue3.z * fragmentVectorConstants1.packedValues[18u].z) - productValue113) * scalarValue3) + productValue113);
    float productValue118 = (((fragmentVectorConstants1.packedValues[9u].x - productValue115) * fragmentVectorConstants1.packedValues[9u].w) + productValue115) * varyingColor3.x;
    float productValue119 = (((fragmentVectorConstants1.packedValues[9u].y - productValue116) * fragmentVectorConstants1.packedValues[9u].w) + productValue116) * varyingColor3.y;
    float productValue120 = (((fragmentVectorConstants1.packedValues[9u].z - productValue117) * fragmentVectorConstants1.packedValues[9u].w) + productValue117) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue118) * varyingColor2.w) + productValue118;
    fragmentColor0.y = ((varyingColor2.y - productValue119) * varyingColor2.w) + productValue119;
    fragmentColor0.z = ((varyingColor2.z - productValue120) * varyingColor2.w) + productValue120;
    fragmentColor0.w = productValue114;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue140 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[18u].x * scalarValue5) - productValue136) * scalarValue3) + productValue136);
    float productValue141 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[18u].y * scalarValue6) - productValue137) * scalarValue3) + productValue137);
    float productValue142 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[18u].z * scalarValue7) - productValue138) * scalarValue3) + productValue138);
    float productValue143 = (((fragmentVectorConstants1.packedValues[9u].x - productValue140) * fragmentVectorConstants1.packedValues[9u].w) + productValue140) * varyingColor3.x;
    float productValue144 = (((fragmentVectorConstants1.packedValues[9u].y - productValue141) * fragmentVectorConstants1.packedValues[9u].w) + productValue141) * varyingColor3.y;
    float productValue145 = (((fragmentVectorConstants1.packedValues[9u].z - productValue142) * fragmentVectorConstants1.packedValues[9u].w) + productValue142) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue143) * varyingColor2.w) + productValue143;
    fragmentColor0.y = ((varyingColor2.y - productValue144) * varyingColor2.w) + productValue144;
    fragmentColor0.z = ((varyingColor2.z - productValue145) * varyingColor2.w) + productValue145;
    fragmentColor0.w = productValue139;
#endif
    discardIfRequested();
}
