#version 460
#extension GL_GOOGLE_include_directive : require
// Actor / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 54
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

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif
#if (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE2_FLOAT_2 1
#endif

#include "../../include/materials/Actor/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue7 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x;
    precise float productValue8 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y;
    precise float productValue9 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[16u].z;
    precise float productValue10 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[16u].w;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float scalarValue2 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue, sumValue1, sumValue2));
    precise float sumValue3 = fragmentScalarConstants1.packedValues[45u] - fragmentScalarConstants1.packedValues[44u];
    precise float sumValue4 = scalarValue2 - fragmentScalarConstants1.packedValues[44u];
    precise float quotientValue1 = 1.0 / sumValue3;
    precise float productValue14 = quotientValue1 * sumValue4;
    float scalarValue3 = spvNClamp(productValue14, 0.0, 1.0);
    precise float productValue15 = scalarValue3 * scalarValue3;
    precise float multiplyAddValue8 = productValue15 * fma(scalarValue3, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue9 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].x;
    precise float multiplyAddValue10 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].y;
    precise float quotientValue4 = multiplyAddValue9 / fragmentScalarConstants1.packedValues[46u];
    precise float quotientValue5 = multiplyAddValue10 / fragmentScalarConstants1.packedValues[46u];
    precise float productValue16 = floor(quotientValue4) * fragmentScalarConstants1.packedValues[46u];
    precise float productValue17 = floor(quotientValue5) * fragmentScalarConstants1.packedValues[46u];
    precise float productValue18 = productValue16 * 0.25;
    precise float productValue19 = productValue17 * 0.25;
    precise float productValue20 = productValue16 * 0.5;
    precise float productValue21 = productValue17 * 0.5;
    float scalarValue4 = floor(productValue19);
    float scalarValue5 = floor(productValue21);
    precise float productValue22 = scalarValue4 * scalarValue4;
    precise float productValue23 = scalarValue5 * scalarValue5;
    precise float productValue24 = productValue22 * 0.75;
    precise float productValue25 = productValue23 * 0.75;
    float scalarValue6 = floor(productValue17);
    precise float productValue26 = scalarValue6 * scalarValue6;
    precise float productValue27 = productValue26 * 0.75;
    precise float multiplyAddValue11 = fma(fma(fma(fract(fma(floor(productValue18), 0.5, productValue24)), 0.25, fract(fma(floor(productValue20), 0.5, productValue25))), 0.25, fract(fma(floor(productValue16), 0.5, productValue27))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[60u] != 0.0) && (multiplyAddValue11 >= multiplyAddValue8)) || (fma(fragmentScalarConstants1.packedValues[68u], fma(productValue10, fragmentScalarConstants1.packedValues[39u], -productValue10), productValue10) < 0.5))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    precise float sumValue8 = scalarValue8 + scalarValue7;
    precise float sumValue9 = scalarValue9 + sumValue8;
    precise float sumValue10 = 1.0 - scalarValue10;
    precise float productValue34 = sumValue10 * sumValue9;
    float scalarValue11 = float(productValue34 > 0.0);
    float multiplyAddValue18 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue.x, -scalarValue7), scalarValue7);
    float multiplyAddValue19 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue.y, -scalarValue8), scalarValue8);
    float multiplyAddValue20 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[16u].z, sampledTextureValue.z, -scalarValue9), scalarValue9);
    float multiplyAddValue21 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[16u].w, sampledTextureValue.w, -scalarValue10), scalarValue10);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float scalarValue2 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue, sumValue1, sumValue2));
    precise float sumValue3 = fragmentScalarConstants1.packedValues[45u] - fragmentScalarConstants1.packedValues[44u];
    precise float sumValue4 = scalarValue2 - fragmentScalarConstants1.packedValues[44u];
    precise float quotientValue1 = 1.0 / sumValue3;
    precise float productValue14 = quotientValue1 * sumValue4;
    float scalarValue3 = spvNClamp(productValue14, 0.0, 1.0);
    precise float productValue15 = scalarValue3 * scalarValue3;
    precise float multiplyAddValue8 = productValue15 * fma(scalarValue3, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue9 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].x;
    precise float multiplyAddValue10 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].y;
    precise float quotientValue4 = multiplyAddValue9 / fragmentScalarConstants1.packedValues[46u];
    precise float quotientValue5 = multiplyAddValue10 / fragmentScalarConstants1.packedValues[46u];
    precise float productValue16 = floor(quotientValue4) * fragmentScalarConstants1.packedValues[46u];
    precise float productValue17 = floor(quotientValue5) * fragmentScalarConstants1.packedValues[46u];
    precise float productValue18 = productValue16 * 0.25;
    precise float productValue19 = productValue17 * 0.25;
    precise float productValue20 = productValue16 * 0.5;
    precise float productValue21 = productValue17 * 0.5;
    float scalarValue4 = floor(productValue19);
    float scalarValue5 = floor(productValue21);
    precise float productValue22 = scalarValue4 * scalarValue4;
    precise float productValue23 = scalarValue5 * scalarValue5;
    precise float productValue24 = productValue22 * 0.75;
    precise float productValue25 = productValue23 * 0.75;
    float scalarValue6 = floor(productValue17);
    precise float productValue26 = scalarValue6 * scalarValue6;
    precise float productValue27 = productValue26 * 0.75;
    precise float multiplyAddValue11 = fma(fma(fma(fract(fma(floor(productValue18), 0.5, productValue24)), 0.25, fract(fma(floor(productValue20), 0.5, productValue25))), 0.25, fract(fma(floor(productValue16), 0.5, productValue27))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[60u] != 0.0) && (multiplyAddValue11 >= multiplyAddValue8)) || (fma(fragmentScalarConstants1.packedValues[68u], fma(multiplyAddValue21, fragmentScalarConstants1.packedValues[39u], -multiplyAddValue21), multiplyAddValue21) < 0.5))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue65 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x;
    precise float productValue66 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y;
    precise float productValue67 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z;
    precise float productValue68 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[17u].w;
    float multiplyAddValue44 = rdDot4Precise2(vec4(productValue65, productValue66, productValue67, fma(fragmentScalarConstants1.packedValues[72u], fma(productValue68, fragmentScalarConstants1.packedValues[39u], -productValue68), productValue68)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float scalarValue2 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue, sumValue1, sumValue2));
    precise float sumValue11 = fragmentScalarConstants1.packedValues[49u] - fragmentScalarConstants1.packedValues[48u];
    precise float sumValue12 = scalarValue2 - fragmentScalarConstants1.packedValues[48u];
    precise float quotientValue9 = 1.0 / sumValue11;
    precise float productValue69 = quotientValue9 * sumValue12;
    float scalarValue19 = spvNClamp(productValue69, 0.0, 1.0);
    precise float productValue70 = scalarValue19 * scalarValue19;
    precise float multiplyAddValue45 = productValue70 * fma(scalarValue19, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue46 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].x;
    precise float multiplyAddValue47 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].y;
    precise float quotientValue10 = multiplyAddValue46 / fragmentScalarConstants1.packedValues[50u];
    precise float quotientValue11 = multiplyAddValue47 / fragmentScalarConstants1.packedValues[50u];
    precise float productValue71 = floor(quotientValue10) * fragmentScalarConstants1.packedValues[50u];
    precise float productValue72 = floor(quotientValue11) * fragmentScalarConstants1.packedValues[50u];
    precise float productValue73 = productValue71 * 0.25;
    precise float productValue74 = productValue72 * 0.25;
    precise float productValue75 = productValue71 * 0.5;
    precise float productValue76 = productValue72 * 0.5;
    float scalarValue20 = floor(productValue74);
    float scalarValue21 = floor(productValue76);
    precise float productValue77 = scalarValue20 * scalarValue20;
    precise float productValue78 = scalarValue21 * scalarValue21;
    precise float productValue79 = productValue77 * 0.75;
    precise float productValue80 = productValue78 * 0.75;
    float scalarValue22 = floor(productValue72);
    precise float productValue81 = scalarValue22 * scalarValue22;
    precise float productValue82 = productValue81 * 0.75;
    precise float multiplyAddValue48 = fma(fma(fma(fract(fma(floor(productValue73), 0.5, productValue79)), 0.25, fract(fma(floor(productValue75), 0.5, productValue80))), 0.25, fract(fma(floor(productValue71), 0.5, productValue82))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[64u] != 0.0) && (multiplyAddValue48 >= multiplyAddValue45)) || (multiplyAddValue44 < fragmentScalarConstants1.packedValues[40u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    precise float sumValue8 = scalarValue8 + scalarValue7;
    precise float sumValue9 = scalarValue9 + sumValue8;
    precise float sumValue10 = 1.0 - scalarValue10;
    precise float productValue34 = sumValue10 * sumValue9;
    float scalarValue11 = float(productValue34 > 0.0);
    float multiplyAddValue69 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue.x, -scalarValue7), scalarValue7);
    float multiplyAddValue70 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue.y, -scalarValue8), scalarValue8);
    float multiplyAddValue71 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[17u].z, sampledTextureValue.z, -scalarValue9), scalarValue9);
    float multiplyAddValue72 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[17u].w, sampledTextureValue.w, -scalarValue10), scalarValue10);
    float multiplyAddValue73 = rdDot4Precise2(vec4(multiplyAddValue69, multiplyAddValue70, multiplyAddValue71, fma(fragmentScalarConstants1.packedValues[72u], fma(multiplyAddValue72, fragmentScalarConstants1.packedValues[39u], -multiplyAddValue72), multiplyAddValue72)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float scalarValue2 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue, sumValue1, sumValue2));
    precise float sumValue11 = fragmentScalarConstants1.packedValues[49u] - fragmentScalarConstants1.packedValues[48u];
    precise float sumValue12 = scalarValue2 - fragmentScalarConstants1.packedValues[48u];
    precise float quotientValue9 = 1.0 / sumValue11;
    precise float productValue69 = quotientValue9 * sumValue12;
    float scalarValue19 = spvNClamp(productValue69, 0.0, 1.0);
    precise float productValue70 = scalarValue19 * scalarValue19;
    precise float multiplyAddValue45 = productValue70 * fma(scalarValue19, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue46 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].x;
    precise float multiplyAddValue47 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].y;
    precise float quotientValue10 = multiplyAddValue46 / fragmentScalarConstants1.packedValues[50u];
    precise float quotientValue11 = multiplyAddValue47 / fragmentScalarConstants1.packedValues[50u];
    precise float productValue71 = floor(quotientValue10) * fragmentScalarConstants1.packedValues[50u];
    precise float productValue72 = floor(quotientValue11) * fragmentScalarConstants1.packedValues[50u];
    precise float productValue73 = productValue71 * 0.25;
    precise float productValue74 = productValue72 * 0.25;
    precise float productValue75 = productValue71 * 0.5;
    precise float productValue76 = productValue72 * 0.5;
    float scalarValue20 = floor(productValue74);
    float scalarValue21 = floor(productValue76);
    precise float productValue77 = scalarValue20 * scalarValue20;
    precise float productValue78 = scalarValue21 * scalarValue21;
    precise float productValue79 = productValue77 * 0.75;
    precise float productValue80 = productValue78 * 0.75;
    float scalarValue22 = floor(productValue72);
    precise float productValue81 = scalarValue22 * scalarValue22;
    precise float productValue82 = productValue81 * 0.75;
    precise float multiplyAddValue48 = fma(fma(fma(fract(fma(floor(productValue73), 0.5, productValue79)), 0.25, fract(fma(floor(productValue75), 0.5, productValue80))), 0.25, fract(fma(floor(productValue71), 0.5, productValue82))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[64u] != 0.0) && (multiplyAddValue48 >= multiplyAddValue45)) || (multiplyAddValue73 < fragmentScalarConstants1.packedValues[40u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue65 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x;
    precise float productValue66 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y;
    precise float productValue67 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z;
    precise float productValue68 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[17u].w;
    float multiplyAddValue88 = fma(fragmentScalarConstants1.packedValues[72u], fma(productValue68, fragmentScalarConstants1.packedValues[39u], -productValue68), productValue68);
    precise float sumValue16 = 1.0 - fragmentScalarConstants1.packedValues[40u];
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float scalarValue2 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue, sumValue1, sumValue2));
    precise float sumValue11 = fragmentScalarConstants1.packedValues[49u] - fragmentScalarConstants1.packedValues[48u];
    precise float sumValue12 = scalarValue2 - fragmentScalarConstants1.packedValues[48u];
    precise float quotientValue9 = 1.0 / sumValue11;
    precise float productValue69 = quotientValue9 * sumValue12;
    float scalarValue19 = spvNClamp(productValue69, 0.0, 1.0);
    precise float productValue70 = scalarValue19 * scalarValue19;
    precise float multiplyAddValue45 = productValue70 * fma(scalarValue19, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue46 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].x;
    precise float multiplyAddValue47 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].y;
    precise float quotientValue10 = multiplyAddValue46 / fragmentScalarConstants1.packedValues[50u];
    precise float quotientValue11 = multiplyAddValue47 / fragmentScalarConstants1.packedValues[50u];
    precise float productValue71 = floor(quotientValue10) * fragmentScalarConstants1.packedValues[50u];
    precise float productValue72 = floor(quotientValue11) * fragmentScalarConstants1.packedValues[50u];
    precise float productValue73 = productValue71 * 0.25;
    precise float productValue74 = productValue72 * 0.25;
    precise float productValue75 = productValue71 * 0.5;
    precise float productValue76 = productValue72 * 0.5;
    float scalarValue20 = floor(productValue74);
    float scalarValue21 = floor(productValue76);
    precise float productValue77 = scalarValue20 * scalarValue20;
    precise float productValue78 = scalarValue21 * scalarValue21;
    precise float productValue79 = productValue77 * 0.75;
    precise float productValue80 = productValue78 * 0.75;
    float scalarValue22 = floor(productValue72);
    precise float productValue81 = scalarValue22 * scalarValue22;
    precise float productValue82 = productValue81 * 0.75;
    precise float multiplyAddValue48 = fma(fma(fma(fract(fma(floor(productValue73), 0.5, productValue79)), 0.25, fract(fma(floor(productValue75), 0.5, productValue80))), 0.25, fract(fma(floor(productValue71), 0.5, productValue82))), 64.0, 0.5) * 0.015625;
    if (((multiplyAddValue88 < fragmentScalarConstants1.packedValues[40u]) || (sumValue16 < multiplyAddValue88)) || ((fragmentScalarConstants1.packedValues[64u] != 0.0) && (multiplyAddValue48 >= multiplyAddValue45)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    precise float sumValue8 = scalarValue8 + scalarValue7;
    precise float sumValue9 = scalarValue9 + sumValue8;
    precise float sumValue10 = 1.0 - scalarValue10;
    precise float productValue34 = sumValue10 * sumValue9;
    float scalarValue11 = float(productValue34 > 0.0);
    float multiplyAddValue69 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue.x, -scalarValue7), scalarValue7);
    float multiplyAddValue70 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue.y, -scalarValue8), scalarValue8);
    float multiplyAddValue71 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[17u].z, sampledTextureValue.z, -scalarValue9), scalarValue9);
    float multiplyAddValue72 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[17u].w, sampledTextureValue.w, -scalarValue10), scalarValue10);
    float multiplyAddValue92 = fma(fragmentScalarConstants1.packedValues[72u], fma(multiplyAddValue72, fragmentScalarConstants1.packedValues[39u], -multiplyAddValue72), multiplyAddValue72);
    precise float sumValue16 = 1.0 - fragmentScalarConstants1.packedValues[40u];
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float scalarValue2 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue, sumValue1, sumValue2));
    precise float sumValue11 = fragmentScalarConstants1.packedValues[49u] - fragmentScalarConstants1.packedValues[48u];
    precise float sumValue12 = scalarValue2 - fragmentScalarConstants1.packedValues[48u];
    precise float quotientValue9 = 1.0 / sumValue11;
    precise float productValue69 = quotientValue9 * sumValue12;
    float scalarValue19 = spvNClamp(productValue69, 0.0, 1.0);
    precise float productValue70 = scalarValue19 * scalarValue19;
    precise float multiplyAddValue45 = productValue70 * fma(scalarValue19, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue46 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].x;
    precise float multiplyAddValue47 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].y;
    precise float quotientValue10 = multiplyAddValue46 / fragmentScalarConstants1.packedValues[50u];
    precise float quotientValue11 = multiplyAddValue47 / fragmentScalarConstants1.packedValues[50u];
    precise float productValue71 = floor(quotientValue10) * fragmentScalarConstants1.packedValues[50u];
    precise float productValue72 = floor(quotientValue11) * fragmentScalarConstants1.packedValues[50u];
    precise float productValue73 = productValue71 * 0.25;
    precise float productValue74 = productValue72 * 0.25;
    precise float productValue75 = productValue71 * 0.5;
    precise float productValue76 = productValue72 * 0.5;
    float scalarValue20 = floor(productValue74);
    float scalarValue21 = floor(productValue76);
    precise float productValue77 = scalarValue20 * scalarValue20;
    precise float productValue78 = scalarValue21 * scalarValue21;
    precise float productValue79 = productValue77 * 0.75;
    precise float productValue80 = productValue78 * 0.75;
    float scalarValue22 = floor(productValue72);
    precise float productValue81 = scalarValue22 * scalarValue22;
    precise float productValue82 = productValue81 * 0.75;
    precise float multiplyAddValue48 = fma(fma(fma(fract(fma(floor(productValue73), 0.5, productValue79)), 0.25, fract(fma(floor(productValue75), 0.5, productValue80))), 0.25, fract(fma(floor(productValue71), 0.5, productValue82))), 64.0, 0.5) * 0.015625;
    if (((multiplyAddValue92 < fragmentScalarConstants1.packedValues[40u]) || (sumValue16 < multiplyAddValue92)) || ((fragmentScalarConstants1.packedValues[64u] != 0.0) && (multiplyAddValue48 >= multiplyAddValue45)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue155 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    precise float productValue156 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    precise float productValue157 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[18u].z;
    precise float productValue158 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[18u].w;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)) || (fma(fragmentScalarConstants1.packedValues[76u], fma(productValue158, fragmentScalarConstants1.packedValues[43u], -productValue158), productValue158) < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    precise float sumValue8 = scalarValue8 + scalarValue7;
    precise float sumValue9 = scalarValue9 + sumValue8;
    precise float sumValue10 = 1.0 - scalarValue10;
    precise float productValue34 = sumValue10 * sumValue9;
    float scalarValue11 = float(productValue34 > 0.0);
    float multiplyAddValue130 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7), scalarValue7);
    float multiplyAddValue131 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8), scalarValue8);
    float multiplyAddValue132 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue.z, -scalarValue9), scalarValue9);
    float multiplyAddValue133 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].w, sampledTextureValue.w, -scalarValue10), scalarValue10);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)) || (fma(fragmentScalarConstants1.packedValues[76u], fma(multiplyAddValue133, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue133), multiplyAddValue133) < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue155 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    precise float productValue156 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    precise float productValue157 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[18u].z;
    precise float productValue158 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[18u].w;
    float multiplyAddValue148 = rdDot4Precise2(vec4(productValue155, productValue156, productValue157, fma(fragmentScalarConstants1.packedValues[76u], fma(productValue158, fragmentScalarConstants1.packedValues[43u], -productValue158), productValue158)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)) || (multiplyAddValue148 < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    precise float sumValue8 = scalarValue8 + scalarValue7;
    precise float sumValue9 = scalarValue9 + sumValue8;
    precise float sumValue10 = 1.0 - scalarValue10;
    precise float productValue34 = sumValue10 * sumValue9;
    float scalarValue11 = float(productValue34 > 0.0);
    float multiplyAddValue130 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7), scalarValue7);
    float multiplyAddValue131 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8), scalarValue8);
    float multiplyAddValue132 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue.z, -scalarValue9), scalarValue9);
    float multiplyAddValue133 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].w, sampledTextureValue.w, -scalarValue10), scalarValue10);
    float multiplyAddValue140 = rdDot4Precise2(vec4(multiplyAddValue130, multiplyAddValue131, multiplyAddValue132, fma(fragmentScalarConstants1.packedValues[76u], fma(multiplyAddValue133, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue133), multiplyAddValue133)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)) || (multiplyAddValue140 < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue155 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    precise float productValue156 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    precise float productValue157 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[18u].z;
    precise float productValue158 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[18u].w;
    float multiplyAddValue156 = fma(fragmentScalarConstants1.packedValues[76u], fma(productValue158, fragmentScalarConstants1.packedValues[43u], -productValue158), productValue158);
    precise float sumValue22 = 1.0 - fragmentScalarConstants1.packedValues[44u];
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((multiplyAddValue156 < fragmentScalarConstants1.packedValues[44u]) || (sumValue22 < multiplyAddValue156)) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    precise float sumValue8 = scalarValue8 + scalarValue7;
    precise float sumValue9 = scalarValue9 + sumValue8;
    precise float sumValue10 = 1.0 - scalarValue10;
    precise float productValue34 = sumValue10 * sumValue9;
    float scalarValue11 = float(productValue34 > 0.0);
    float multiplyAddValue130 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7), scalarValue7);
    float multiplyAddValue131 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8), scalarValue8);
    float multiplyAddValue132 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue.z, -scalarValue9), scalarValue9);
    float multiplyAddValue133 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].w, sampledTextureValue.w, -scalarValue10), scalarValue10);
    float multiplyAddValue165 = fma(fragmentScalarConstants1.packedValues[76u], fma(multiplyAddValue133, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue133), multiplyAddValue133);
    precise float sumValue22 = 1.0 - fragmentScalarConstants1.packedValues[44u];
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((multiplyAddValue165 < fragmentScalarConstants1.packedValues[44u]) || (sumValue22 < multiplyAddValue165)) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue155 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    precise float productValue156 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    precise float productValue239 = sampledTextureValue.w * fragmentScalarConstants1.packedValues[75u];
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)) || (fma(fragmentScalarConstants1.packedValues[80u], fma(productValue239, fragmentScalarConstants1.packedValues[43u], -productValue239), productValue239) < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue10 = sampledTextureValue1.w;
    precise float sumValue8 = scalarValue8 + scalarValue7;
    precise float sumValue23 = sampledTextureValue1.z + sumValue8;
    precise float sumValue10 = 1.0 - scalarValue10;
    precise float productValue262 = sumValue23 * sumValue10;
    float scalarValue43 = float(productValue262 > 0.0);
    float multiplyAddValue181 = fma(scalarValue43, fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7), scalarValue7);
    float multiplyAddValue182 = fma(scalarValue43, fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8), scalarValue8);
    float multiplyAddValue183 = fma(scalarValue43, fma(fragmentScalarConstants1.packedValues[75u], sampledTextureValue.w, -scalarValue10), scalarValue10);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)) || (fma(fragmentScalarConstants1.packedValues[80u], fma(multiplyAddValue183, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue183), multiplyAddValue183) < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue155 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    precise float productValue156 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    precise float productValue157 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[18u].z;
    precise float productValue158 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[18u].w;
    float multiplyAddValue204 = rdDot4Precise2(vec4(productValue155, productValue156, productValue157, fma(fragmentScalarConstants1.packedValues[80u], fma(productValue158, fragmentScalarConstants1.packedValues[43u], -productValue158), productValue158)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)) || (multiplyAddValue204 < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    precise float sumValue8 = scalarValue8 + scalarValue7;
    precise float sumValue9 = scalarValue9 + sumValue8;
    precise float sumValue10 = 1.0 - scalarValue10;
    precise float productValue34 = sumValue10 * sumValue9;
    float scalarValue11 = float(productValue34 > 0.0);
    float multiplyAddValue130 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7), scalarValue7);
    float multiplyAddValue131 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8), scalarValue8);
    float multiplyAddValue133 = fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].w, sampledTextureValue.w, -scalarValue10), scalarValue10);
    float multiplyAddValue212 = rdDot4Precise2(vec4(multiplyAddValue130, multiplyAddValue131, fma(scalarValue11, fma(fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue.z, -scalarValue9), scalarValue9), fma(fragmentScalarConstants1.packedValues[80u], fma(multiplyAddValue133, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue133), multiplyAddValue133)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)) || (multiplyAddValue212 < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue155 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    precise float productValue156 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    precise float productValue239 = sampledTextureValue.w * fragmentScalarConstants1.packedValues[75u];
    float multiplyAddValue222 = fma(fragmentScalarConstants1.packedValues[80u], fma(productValue239, fragmentScalarConstants1.packedValues[43u], -productValue239), productValue239);
    precise float sumValue22 = 1.0 - fragmentScalarConstants1.packedValues[44u];
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((multiplyAddValue222 < fragmentScalarConstants1.packedValues[44u]) || (sumValue22 < multiplyAddValue222)) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue10 = sampledTextureValue1.w;
    precise float sumValue8 = scalarValue8 + scalarValue7;
    precise float sumValue23 = sampledTextureValue1.z + sumValue8;
    precise float sumValue10 = 1.0 - scalarValue10;
    precise float productValue262 = sumValue23 * sumValue10;
    float scalarValue43 = float(productValue262 > 0.0);
    float multiplyAddValue181 = fma(scalarValue43, fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7), scalarValue7);
    float multiplyAddValue182 = fma(scalarValue43, fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8), scalarValue8);
    float multiplyAddValue183 = fma(scalarValue43, fma(fragmentScalarConstants1.packedValues[75u], sampledTextureValue.w, -scalarValue10), scalarValue10);
    float multiplyAddValue230 = fma(fragmentScalarConstants1.packedValues[80u], fma(multiplyAddValue183, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue183), multiplyAddValue183);
    precise float sumValue22 = 1.0 - fragmentScalarConstants1.packedValues[44u];
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    precise float productValue11 = inverseLengthValue * fragmentScalarConstants1.packedValues[6u];
    precise float productValue12 = inverseLengthValue * fragmentScalarConstants1.packedValues[10u];
    precise float productValue13 = inverseLengthValue * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue30 = rdDot3Precise(vec3(-productValue11, -productValue12, -productValue13), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue30 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue16 = 1.0 / sumValue20;
    precise float productValue159 = quotientValue16 * sumValue21;
    float scalarValue31 = spvNClamp(productValue159, 0.0, 1.0);
    precise float productValue160 = scalarValue31 * scalarValue31;
    precise float multiplyAddValue96 = productValue160 * fma(scalarValue31, -2.0, 3.0);
    precise float quotientValue2 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue3 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue97 = fma(quotientValue2, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue98 = fma(quotientValue3, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue17 = multiplyAddValue97 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue18 = multiplyAddValue98 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue161 = floor(quotientValue17) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue162 = floor(quotientValue18) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue163 = productValue161 * 0.25;
    precise float productValue164 = productValue162 * 0.25;
    precise float productValue165 = productValue161 * 0.5;
    precise float productValue166 = productValue162 * 0.5;
    float scalarValue32 = floor(productValue164);
    float scalarValue33 = floor(productValue166);
    precise float productValue167 = scalarValue32 * scalarValue32;
    precise float productValue168 = scalarValue33 * scalarValue33;
    precise float productValue169 = productValue167 * 0.75;
    precise float productValue170 = productValue168 * 0.75;
    float scalarValue34 = floor(productValue162);
    precise float productValue171 = scalarValue34 * scalarValue34;
    precise float productValue172 = productValue171 * 0.75;
    precise float multiplyAddValue99 = fma(fma(fma(fract(fma(floor(productValue163), 0.5, productValue169)), 0.25, fract(fma(floor(productValue165), 0.5, productValue170))), 0.25, fract(fma(floor(productValue161), 0.5, productValue172))), 64.0, 0.5) * 0.015625;
    if (((multiplyAddValue230 < fragmentScalarConstants1.packedValues[44u]) || (sumValue22 < multiplyAddValue230)) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue99 >= multiplyAddValue96)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * fragmentVectorConstants1.packedValues[16u].x;
    float productValue1 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[16u].y;
    float productValue2 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[16u].z;
    float productValue3 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[16u].w;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue4 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z));
    float quotientValue = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[45u] - fragmentScalarConstants1.packedValues[44u])) * (productValue4 - fragmentScalarConstants1.packedValues[44u]), 0.0, 1.0);
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentScalarConstants1.packedValues[46u]) * fragmentScalarConstants1.packedValues[46u];
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentScalarConstants1.packedValues[46u]) * fragmentScalarConstants1.packedValues[46u];
    float productValue5 = floor(multiplyAddValue1 * 0.25);
    float productValue6 = floor(multiplyAddValue1 * 0.5);
    float scalarValue1 = floor(multiplyAddValue1);
    if ((fma(fragmentScalarConstants1.packedValues[68u], fma(productValue3, fragmentScalarConstants1.packedValues[39u], -productValue3), productValue3) < 0.5) || ((fragmentScalarConstants1.packedValues[60u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue5 * productValue5) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue6 * productValue6) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue1 * scalarValue1) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue * quotientValue) * fma(quotientValue, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    bool productValue58 = ((1.0 - scalarValue10) * (scalarValue9 + (scalarValue8 + scalarValue7))) > 0.0;
    float multiplyAddValue25 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue.x, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue26 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue.y, -scalarValue8) + scalarValue8) : scalarValue8;
    float multiplyAddValue27 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[16u].z, sampledTextureValue.z, -scalarValue9) + scalarValue9) : scalarValue9;
    float multiplyAddValue28 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[16u].w, sampledTextureValue.w, -scalarValue10) + scalarValue10) : scalarValue10;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue4 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z));
    float quotientValue = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[45u] - fragmentScalarConstants1.packedValues[44u])) * (productValue4 - fragmentScalarConstants1.packedValues[44u]), 0.0, 1.0);
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentScalarConstants1.packedValues[46u]) * fragmentScalarConstants1.packedValues[46u];
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentScalarConstants1.packedValues[46u]) * fragmentScalarConstants1.packedValues[46u];
    float productValue5 = floor(multiplyAddValue1 * 0.25);
    float productValue6 = floor(multiplyAddValue1 * 0.5);
    float scalarValue1 = floor(multiplyAddValue1);
    if ((fma(fragmentScalarConstants1.packedValues[68u], fma(multiplyAddValue28, fragmentScalarConstants1.packedValues[39u], -multiplyAddValue28), multiplyAddValue28) < 0.5) || ((fragmentScalarConstants1.packedValues[60u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue5 * productValue5) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue6 * productValue6) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue1 * scalarValue1) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue * quotientValue) * fma(quotientValue, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue59 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue60 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue61 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue62 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[17u].w;
    float multiplyAddValue32 = rdDot4Precise2(vec4(productValue59, productValue60, productValue61, fma(fragmentScalarConstants1.packedValues[72u], fma(productValue62, fragmentScalarConstants1.packedValues[39u], -productValue62), productValue62)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue4 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z));
    float quotientValue8 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[49u] - fragmentScalarConstants1.packedValues[48u])) * (productValue4 - fragmentScalarConstants1.packedValues[48u]), 0.0, 1.0);
    float multiplyAddValue33 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentScalarConstants1.packedValues[50u]) * fragmentScalarConstants1.packedValues[50u];
    float multiplyAddValue34 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentScalarConstants1.packedValues[50u]) * fragmentScalarConstants1.packedValues[50u];
    float productValue63 = floor(multiplyAddValue34 * 0.25);
    float productValue64 = floor(multiplyAddValue34 * 0.5);
    float scalarValue17 = floor(multiplyAddValue34);
    if ((multiplyAddValue32 < fragmentScalarConstants1.packedValues[40u]) || ((fragmentScalarConstants1.packedValues[64u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue33 * 0.25), 0.5, (productValue63 * productValue63) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue33 * 0.5), 0.5, (productValue64 * productValue64) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue33), 0.5, (scalarValue17 * scalarValue17) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue8 * quotientValue8) * fma(quotientValue8, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    bool productValue58 = ((1.0 - scalarValue10) * (scalarValue9 + (scalarValue8 + scalarValue7))) > 0.0;
    float multiplyAddValue58 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue.x, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue59 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue.y, -scalarValue8) + scalarValue8) : scalarValue8;
    float multiplyAddValue60 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[17u].z, sampledTextureValue.z, -scalarValue9) + scalarValue9) : scalarValue9;
    float multiplyAddValue61 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[17u].w, sampledTextureValue.w, -scalarValue10) + scalarValue10) : scalarValue10;
    float multiplyAddValue62 = rdDot4Precise2(vec4(multiplyAddValue58, multiplyAddValue59, multiplyAddValue60, fma(fragmentScalarConstants1.packedValues[72u], fma(multiplyAddValue61, fragmentScalarConstants1.packedValues[39u], -multiplyAddValue61), multiplyAddValue61)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue4 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z));
    float quotientValue8 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[49u] - fragmentScalarConstants1.packedValues[48u])) * (productValue4 - fragmentScalarConstants1.packedValues[48u]), 0.0, 1.0);
    float multiplyAddValue33 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentScalarConstants1.packedValues[50u]) * fragmentScalarConstants1.packedValues[50u];
    float multiplyAddValue34 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentScalarConstants1.packedValues[50u]) * fragmentScalarConstants1.packedValues[50u];
    float productValue63 = floor(multiplyAddValue34 * 0.25);
    float productValue64 = floor(multiplyAddValue34 * 0.5);
    float scalarValue17 = floor(multiplyAddValue34);
    if ((multiplyAddValue62 < fragmentScalarConstants1.packedValues[40u]) || ((fragmentScalarConstants1.packedValues[64u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue33 * 0.25), 0.5, (productValue63 * productValue63) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue33 * 0.5), 0.5, (productValue64 * productValue64) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue33), 0.5, (scalarValue17 * scalarValue17) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue8 * quotientValue8) * fma(quotientValue8, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue59 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue60 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue61 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue62 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[17u].w;
    float multiplyAddValue84 = fma(fragmentScalarConstants1.packedValues[72u], fma(productValue62, fragmentScalarConstants1.packedValues[39u], -productValue62), productValue62);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue4 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z));
    float quotientValue8 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[49u] - fragmentScalarConstants1.packedValues[48u])) * (productValue4 - fragmentScalarConstants1.packedValues[48u]), 0.0, 1.0);
    float multiplyAddValue33 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentScalarConstants1.packedValues[50u]) * fragmentScalarConstants1.packedValues[50u];
    float multiplyAddValue34 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentScalarConstants1.packedValues[50u]) * fragmentScalarConstants1.packedValues[50u];
    float productValue63 = floor(multiplyAddValue34 * 0.25);
    float productValue64 = floor(multiplyAddValue34 * 0.5);
    float scalarValue17 = floor(multiplyAddValue34);
    if (((fragmentScalarConstants1.packedValues[64u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue33 * 0.25), 0.5, (productValue63 * productValue63) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue33 * 0.5), 0.5, (productValue64 * productValue64) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue33), 0.5, (scalarValue17 * scalarValue17) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue8 * quotientValue8) * fma(quotientValue8, -2.0, 3.0)))) || ((multiplyAddValue84 < fragmentScalarConstants1.packedValues[40u]) || ((1.0 - fragmentScalarConstants1.packedValues[40u]) < multiplyAddValue84)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    bool productValue58 = ((1.0 - scalarValue10) * (scalarValue9 + (scalarValue8 + scalarValue7))) > 0.0;
    float multiplyAddValue58 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue.x, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue59 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue.y, -scalarValue8) + scalarValue8) : scalarValue8;
    float multiplyAddValue60 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[17u].z, sampledTextureValue.z, -scalarValue9) + scalarValue9) : scalarValue9;
    float multiplyAddValue61 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[17u].w, sampledTextureValue.w, -scalarValue10) + scalarValue10) : scalarValue10;
    float multiplyAddValue80 = fma(fragmentScalarConstants1.packedValues[72u], fma(multiplyAddValue61, fragmentScalarConstants1.packedValues[39u], -multiplyAddValue61), multiplyAddValue61);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue4 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z));
    float quotientValue8 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[49u] - fragmentScalarConstants1.packedValues[48u])) * (productValue4 - fragmentScalarConstants1.packedValues[48u]), 0.0, 1.0);
    float multiplyAddValue33 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentScalarConstants1.packedValues[50u]) * fragmentScalarConstants1.packedValues[50u];
    float multiplyAddValue34 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentScalarConstants1.packedValues[50u]) * fragmentScalarConstants1.packedValues[50u];
    float productValue63 = floor(multiplyAddValue34 * 0.25);
    float productValue64 = floor(multiplyAddValue34 * 0.5);
    float scalarValue17 = floor(multiplyAddValue34);
    if (((fragmentScalarConstants1.packedValues[64u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue33 * 0.25), 0.5, (productValue63 * productValue63) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue33 * 0.5), 0.5, (productValue64 * productValue64) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue33), 0.5, (scalarValue17 * scalarValue17) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue8 * quotientValue8) * fma(quotientValue8, -2.0, 3.0)))) || ((multiplyAddValue80 < fragmentScalarConstants1.packedValues[40u]) || ((1.0 - fragmentScalarConstants1.packedValues[40u]) < multiplyAddValue80)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue180 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue181 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue182 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[18u].z;
    float productValue183 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[18u].w;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if ((fma(fragmentScalarConstants1.packedValues[76u], fma(productValue183, fragmentScalarConstants1.packedValues[43u], -productValue183), productValue183) < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    bool productValue58 = ((1.0 - scalarValue10) * (scalarValue9 + (scalarValue8 + scalarValue7))) > 0.0;
    float multiplyAddValue120 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue121 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8) + scalarValue8) : scalarValue8;
    float multiplyAddValue122 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue.z, -scalarValue9) + scalarValue9) : scalarValue9;
    float multiplyAddValue123 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].w, sampledTextureValue.w, -scalarValue10) + scalarValue10) : scalarValue10;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if ((fma(fragmentScalarConstants1.packedValues[76u], fma(multiplyAddValue123, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue123), multiplyAddValue123) < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue180 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue181 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue182 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[18u].z;
    float productValue183 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[18u].w;
    float multiplyAddValue144 = rdDot4Precise2(vec4(productValue180, productValue181, productValue182, fma(fragmentScalarConstants1.packedValues[76u], fma(productValue183, fragmentScalarConstants1.packedValues[43u], -productValue183), productValue183)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if ((multiplyAddValue144 < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    bool productValue58 = ((1.0 - scalarValue10) * (scalarValue9 + (scalarValue8 + scalarValue7))) > 0.0;
    float multiplyAddValue120 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue121 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8) + scalarValue8) : scalarValue8;
    float multiplyAddValue122 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue.z, -scalarValue9) + scalarValue9) : scalarValue9;
    float multiplyAddValue123 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].w, sampledTextureValue.w, -scalarValue10) + scalarValue10) : scalarValue10;
    float multiplyAddValue152 = rdDot4Precise2(vec4(multiplyAddValue120, multiplyAddValue121, multiplyAddValue122, fma(fragmentScalarConstants1.packedValues[76u], fma(multiplyAddValue123, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue123), multiplyAddValue123)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if ((multiplyAddValue152 < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue180 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue181 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue182 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[18u].z;
    float productValue183 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[18u].w;
    float multiplyAddValue157 = fma(fragmentScalarConstants1.packedValues[76u], fma(productValue183, fragmentScalarConstants1.packedValues[43u], -productValue183), productValue183);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if (((multiplyAddValue157 < fragmentScalarConstants1.packedValues[44u]) || ((1.0 - fragmentScalarConstants1.packedValues[44u]) < multiplyAddValue157)) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    bool productValue58 = ((1.0 - scalarValue10) * (scalarValue9 + (scalarValue8 + scalarValue7))) > 0.0;
    float multiplyAddValue120 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue121 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8) + scalarValue8) : scalarValue8;
    float multiplyAddValue122 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue.z, -scalarValue9) + scalarValue9) : scalarValue9;
    float multiplyAddValue123 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].w, sampledTextureValue.w, -scalarValue10) + scalarValue10) : scalarValue10;
    float multiplyAddValue158 = fma(fragmentScalarConstants1.packedValues[76u], fma(multiplyAddValue123, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue123), multiplyAddValue123);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))) || ((multiplyAddValue158 < fragmentScalarConstants1.packedValues[44u]) || ((1.0 - fragmentScalarConstants1.packedValues[44u]) < multiplyAddValue158)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue180 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue181 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue222 = sampledTextureValue.w * fragmentScalarConstants1.packedValues[75u];
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if ((fma(fragmentScalarConstants1.packedValues[80u], fma(productValue222, fragmentScalarConstants1.packedValues[43u], -productValue222), productValue222) < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue10 = sampledTextureValue1.w;
    bool productValue235 = ((sampledTextureValue1.z + (scalarValue8 + scalarValue7)) * (1.0 - scalarValue10)) > 0.0;
    float multiplyAddValue166 = productValue235 ? (fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue167 = productValue235 ? (fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8) + scalarValue8) : scalarValue8;
    float multiplyAddValue168 = productValue235 ? (fma(fragmentScalarConstants1.packedValues[75u], sampledTextureValue.w, -scalarValue10) + scalarValue10) : scalarValue10;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if ((fma(fragmentScalarConstants1.packedValues[80u], fma(multiplyAddValue168, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue168), multiplyAddValue168) < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue180 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue181 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue183 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[18u].w;
    float multiplyAddValue190 = rdDot4Precise2(vec4(productValue180, productValue181, sampledTextureValue.z * fragmentVectorConstants1.packedValues[18u].z, fma(fragmentScalarConstants1.packedValues[80u], fma(productValue183, fragmentScalarConstants1.packedValues[43u], -productValue183), productValue183)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if ((multiplyAddValue190 < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue9 = sampledTextureValue1.z;
    float scalarValue10 = sampledTextureValue1.w;
    bool productValue58 = ((1.0 - scalarValue10) * (scalarValue9 + (scalarValue8 + scalarValue7))) > 0.0;
    float multiplyAddValue120 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue121 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8) + scalarValue8) : scalarValue8;
    float multiplyAddValue123 = productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].w, sampledTextureValue.w, -scalarValue10) + scalarValue10) : scalarValue10;
    float multiplyAddValue194 = rdDot4Precise2(vec4(multiplyAddValue120, multiplyAddValue121, productValue58 ? (fma(fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue.z, -scalarValue9) + scalarValue9) : scalarValue9, fma(fragmentScalarConstants1.packedValues[80u], fma(multiplyAddValue123, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue123), multiplyAddValue123)), vec4(1.0));
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if ((multiplyAddValue194 < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue180 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue181 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue222 = sampledTextureValue.w * fragmentScalarConstants1.packedValues[75u];
    float multiplyAddValue208 = fma(fragmentScalarConstants1.packedValues[80u], fma(productValue222, fragmentScalarConstants1.packedValues[43u], -productValue222), productValue222);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if (((multiplyAddValue208 < fragmentScalarConstants1.packedValues[44u]) || ((1.0 - fragmentScalarConstants1.packedValues[44u]) < multiplyAddValue208)) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue1.x;
    float scalarValue8 = sampledTextureValue1.y;
    float scalarValue10 = sampledTextureValue1.w;
    bool productValue235 = ((sampledTextureValue1.z + (scalarValue8 + scalarValue7)) * (1.0 - scalarValue10)) > 0.0;
    float multiplyAddValue166 = productValue235 ? (fma(fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue.x, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue167 = productValue235 ? (fma(fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue.y, -scalarValue8) + scalarValue8) : scalarValue8;
    float multiplyAddValue168 = productValue235 ? (fma(fragmentScalarConstants1.packedValues[75u], sampledTextureValue.w, -scalarValue10) + scalarValue10) : scalarValue10;
    float multiplyAddValue226 = fma(fragmentScalarConstants1.packedValues[80u], fma(multiplyAddValue168, fragmentScalarConstants1.packedValues[43u], -multiplyAddValue168), multiplyAddValue168);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue = inversesqrt(scalarValue);
    float productValue184 = rdDot3Precise(vec3(-(inverseLengthValue * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue19 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue184 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue109 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue110 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue185 = floor(multiplyAddValue110 * 0.25);
    float productValue186 = floor(multiplyAddValue110 * 0.5);
    float scalarValue35 = floor(multiplyAddValue110);
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue109 * 0.25), 0.5, (productValue185 * productValue185) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue109 * 0.5), 0.5, (productValue186 * productValue186) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue109), 0.5, (scalarValue35 * scalarValue35) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue19 * quotientValue19) * fma(quotientValue19, -2.0, 3.0)))) || ((multiplyAddValue226 < fragmentScalarConstants1.packedValues[44u]) || ((1.0 - fragmentScalarConstants1.packedValues[44u]) < multiplyAddValue226)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue41 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[16u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue6 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue7 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue42 = floor(quotientValue7 * 0.25);
        float productValue43 = floor(quotientValue7 * 0.5);
        float scalarValue12 = floor(quotientValue7);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue43 * productValue43) * 0.75) + (floor(quotientValue6 * 0.5) * 0.5)) + (fract(((productValue42 * productValue42) * 0.75) + (floor(quotientValue6 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue12 * scalarValue12) * 0.75) + (floor(quotientValue6) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((((((fragmentVectorConstants1.packedValues[9u].w * productValue41) - productValue41) * fragmentVectorConstants1.packedValues[17u].x) + productValue41) < 0.5) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue3.x;
    float scalarValue14 = sampledTextureValue3.y;
    float scalarValue15 = sampledTextureValue3.z;
    float scalarValue16 = sampledTextureValue3.w;
    float productValue50 = float((((scalarValue13 + scalarValue14) + scalarValue15) * (1.0 - scalarValue16)) > 0.0);
    float productValue51 = (productValue50 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[16u].w) - scalarValue16)) + scalarValue16;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue6 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue7 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue42 = floor(quotientValue7 * 0.25);
        float productValue43 = floor(quotientValue7 * 0.5);
        float scalarValue12 = floor(quotientValue7);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue43 * productValue43) * 0.75) + (floor(quotientValue6 * 0.5) * 0.5)) + (fract(((productValue42 * productValue42) * 0.75) + (floor(quotientValue6 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue12 * scalarValue12) * 0.75) + (floor(quotientValue6) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((((((productValue51 * fragmentVectorConstants1.packedValues[9u].w) - productValue51) * fragmentVectorConstants1.packedValues[17u].x) + productValue51) < 0.5) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue89 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue90 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue91 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue92 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[17u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue12 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue13 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue93 = floor(quotientValue13 * 0.25);
        float productValue94 = floor(quotientValue13 * 0.5);
        float scalarValue24 = floor(quotientValue13);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue94 * productValue94) * 0.75) + (floor(quotientValue12 * 0.5) * 0.5)) + (fract(((productValue93 * productValue93) * 0.75) + (floor(quotientValue12 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue24 * scalarValue24) * 0.75) + (floor(quotientValue12) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((dot(vec4(productValue89, productValue90, productValue91, (((fragmentVectorConstants1.packedValues[9u].w * productValue92) - productValue92) * fragmentVectorConstants1.packedValues[18u].x) + productValue92), vec4(1.0)) < fragmentVectorConstants1.packedValues[10u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue3.x;
    float scalarValue14 = sampledTextureValue3.y;
    float scalarValue15 = sampledTextureValue3.z;
    float scalarValue16 = sampledTextureValue3.w;
    float productValue50 = float((((scalarValue13 + scalarValue14) + scalarValue15) * (1.0 - scalarValue16)) > 0.0);
    float productValue107 = (productValue50 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue13)) + scalarValue13;
    float productValue108 = (productValue50 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue14)) + scalarValue14;
    float productValue109 = (productValue50 * ((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[17u].z) - scalarValue15)) + scalarValue15;
    float productValue110 = (productValue50 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue16)) + scalarValue16;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue12 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue13 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue93 = floor(quotientValue13 * 0.25);
        float productValue94 = floor(quotientValue13 * 0.5);
        float scalarValue24 = floor(quotientValue13);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue94 * productValue94) * 0.75) + (floor(quotientValue12 * 0.5) * 0.5)) + (fract(((productValue93 * productValue93) * 0.75) + (floor(quotientValue12 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue24 * scalarValue24) * 0.75) + (floor(quotientValue12) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((dot(vec4(productValue107, productValue108, productValue109, (((productValue110 * fragmentVectorConstants1.packedValues[9u].w) - productValue110) * fragmentVectorConstants1.packedValues[18u].x) + productValue110), vec4(1.0)) < fragmentVectorConstants1.packedValues[10u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue92 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[17u].w;
    float productValue124 = (((fragmentVectorConstants1.packedValues[9u].w * productValue92) - productValue92) * fragmentVectorConstants1.packedValues[18u].x) + productValue92;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue12 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue13 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue93 = floor(quotientValue13 * 0.25);
        float productValue94 = floor(quotientValue13 * 0.5);
        float scalarValue24 = floor(quotientValue13);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue94 * productValue94) * 0.75) + (floor(quotientValue12 * 0.5) * 0.5)) + (fract(((productValue93 * productValue93) * 0.75) + (floor(quotientValue12 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue24 * scalarValue24) * 0.75) + (floor(quotientValue12) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue124 < fragmentVectorConstants1.packedValues[10u].x) || (productValue124 > (1.0 - fragmentVectorConstants1.packedValues[10u].x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue3.x;
    float scalarValue14 = sampledTextureValue3.y;
    float scalarValue15 = sampledTextureValue3.z;
    float scalarValue16 = sampledTextureValue3.w;
    float productValue50 = float((((scalarValue13 + scalarValue14) + scalarValue15) * (1.0 - scalarValue16)) > 0.0);
    float productValue110 = (productValue50 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue16)) + scalarValue16;
    float productValue117 = (((productValue110 * fragmentVectorConstants1.packedValues[9u].w) - productValue110) * fragmentVectorConstants1.packedValues[18u].x) + productValue110;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[12u].x) / (fragmentVectorConstants1.packedValues[12u].y - fragmentVectorConstants1.packedValues[12u].x), 0.0, 1.0);
        float quotientValue12 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float quotientValue13 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[12u].z) * fragmentVectorConstants1.packedValues[12u].z;
        float productValue93 = floor(quotientValue13 * 0.25);
        float productValue94 = floor(quotientValue13 * 0.5);
        float scalarValue24 = floor(quotientValue13);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue94 * productValue94) * 0.75) + (floor(quotientValue12 * 0.5) * 0.5)) + (fract(((productValue93 * productValue93) * 0.75) + (floor(quotientValue12 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue24 * scalarValue24) * 0.75) + (floor(quotientValue12) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue117 < fragmentVectorConstants1.packedValues[10u].x) || (productValue117 > (1.0 - fragmentVectorConstants1.packedValues[10u].x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue143 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue144 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue145 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[18u].z;
    float productValue146 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((((((fragmentVectorConstants1.packedValues[10u].w * productValue146) - productValue146) * fragmentVectorConstants1.packedValues[19u].x) + productValue146) < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue3.x;
    float scalarValue14 = sampledTextureValue3.y;
    float scalarValue15 = sampledTextureValue3.z;
    float scalarValue16 = sampledTextureValue3.w;
    float productValue50 = float((((scalarValue13 + scalarValue14) + scalarValue15) * (1.0 - scalarValue16)) > 0.0);
    float productValue194 = (productValue50 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x) - scalarValue13)) + scalarValue13;
    float productValue195 = (productValue50 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y) - scalarValue14)) + scalarValue14;
    float productValue196 = (productValue50 * ((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[18u].z) - scalarValue15)) + scalarValue15;
    float productValue197 = (productValue50 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w) - scalarValue16)) + scalarValue16;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((((((productValue197 * fragmentVectorConstants1.packedValues[10u].w) - productValue197) * fragmentVectorConstants1.packedValues[19u].x) + productValue197) < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue143 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue144 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue145 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[18u].z;
    float productValue146 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((dot(vec4(productValue143, productValue144, productValue145, (((fragmentVectorConstants1.packedValues[10u].w * productValue146) - productValue146) * fragmentVectorConstants1.packedValues[19u].x) + productValue146), vec4(1.0)) < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue3.x;
    float scalarValue14 = sampledTextureValue3.y;
    float scalarValue15 = sampledTextureValue3.z;
    float scalarValue16 = sampledTextureValue3.w;
    float productValue50 = float((((scalarValue13 + scalarValue14) + scalarValue15) * (1.0 - scalarValue16)) > 0.0);
    float productValue194 = (productValue50 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x) - scalarValue13)) + scalarValue13;
    float productValue195 = (productValue50 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y) - scalarValue14)) + scalarValue14;
    float productValue196 = (productValue50 * ((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[18u].z) - scalarValue15)) + scalarValue15;
    float productValue197 = (productValue50 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w) - scalarValue16)) + scalarValue16;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((dot(vec4(productValue194, productValue195, productValue196, (((productValue197 * fragmentVectorConstants1.packedValues[10u].w) - productValue197) * fragmentVectorConstants1.packedValues[19u].x) + productValue197), vec4(1.0)) < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue143 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue144 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue145 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[18u].z;
    float productValue146 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w;
    float productValue220 = (((fragmentVectorConstants1.packedValues[10u].w * productValue146) - productValue146) * fragmentVectorConstants1.packedValues[19u].x) + productValue146;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue220 < fragmentVectorConstants1.packedValues[11u].x) || (productValue220 > (1.0 - fragmentVectorConstants1.packedValues[11u].x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue3.x;
    float scalarValue14 = sampledTextureValue3.y;
    float scalarValue15 = sampledTextureValue3.z;
    float scalarValue16 = sampledTextureValue3.w;
    float productValue50 = float((((scalarValue13 + scalarValue14) + scalarValue15) * (1.0 - scalarValue16)) > 0.0);
    float productValue194 = (productValue50 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x) - scalarValue13)) + scalarValue13;
    float productValue195 = (productValue50 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y) - scalarValue14)) + scalarValue14;
    float productValue196 = (productValue50 * ((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[18u].z) - scalarValue15)) + scalarValue15;
    float productValue197 = (productValue50 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w) - scalarValue16)) + scalarValue16;
    float productValue221 = (((productValue197 * fragmentVectorConstants1.packedValues[10u].w) - productValue197) * fragmentVectorConstants1.packedValues[19u].x) + productValue197;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue221 < fragmentVectorConstants1.packedValues[11u].x) || (productValue221 > (1.0 - fragmentVectorConstants1.packedValues[11u].x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue143 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue144 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue146 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((((((fragmentVectorConstants1.packedValues[10u].w * productValue146) - productValue146) * fragmentVectorConstants1.packedValues[20u].x) + productValue146) < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue3.x;
    float scalarValue14 = sampledTextureValue3.y;
    float scalarValue16 = sampledTextureValue3.w;
    float productValue249 = float((((scalarValue13 + scalarValue14) + sampledTextureValue3.z) * (1.0 - scalarValue16)) > 0.0);
    float productValue250 = (productValue249 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x) - scalarValue13)) + scalarValue13;
    float productValue251 = (productValue249 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y) - scalarValue14)) + scalarValue14;
    float productValue252 = (productValue249 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w) - scalarValue16)) + scalarValue16;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((((((productValue252 * fragmentVectorConstants1.packedValues[10u].w) - productValue252) * fragmentVectorConstants1.packedValues[20u].x) + productValue252) < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue143 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue144 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue146 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((dot(vec4(productValue143, productValue144, sampledTextureValue2.z * fragmentVectorConstants1.packedValues[18u].z, (((fragmentVectorConstants1.packedValues[10u].w * productValue146) - productValue146) * fragmentVectorConstants1.packedValues[20u].x) + productValue146), vec4(1.0)) < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue3.x;
    float scalarValue14 = sampledTextureValue3.y;
    float scalarValue15 = sampledTextureValue3.z;
    float scalarValue16 = sampledTextureValue3.w;
    float productValue50 = float((((scalarValue13 + scalarValue14) + scalarValue15) * (1.0 - scalarValue16)) > 0.0);
    float productValue194 = (productValue50 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x) - scalarValue13)) + scalarValue13;
    float productValue195 = (productValue50 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y) - scalarValue14)) + scalarValue14;
    float productValue197 = (productValue50 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w) - scalarValue16)) + scalarValue16;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((dot(vec4(productValue194, productValue195, (productValue50 * ((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[18u].z) - scalarValue15)) + scalarValue15, (((productValue197 * fragmentVectorConstants1.packedValues[10u].w) - productValue197) * fragmentVectorConstants1.packedValues[20u].x) + productValue197), vec4(1.0)) < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue143 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x;
    float productValue144 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y;
    float productValue146 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w;
    float productValue302 = (((fragmentVectorConstants1.packedValues[10u].w * productValue146) - productValue146) * fragmentVectorConstants1.packedValues[20u].x) + productValue146;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue302 < fragmentVectorConstants1.packedValues[11u].x) || (productValue302 > (1.0 - fragmentVectorConstants1.packedValues[11u].x))) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue13 = sampledTextureValue3.x;
    float scalarValue14 = sampledTextureValue3.y;
    float scalarValue16 = sampledTextureValue3.w;
    float productValue249 = float((((scalarValue13 + scalarValue14) + sampledTextureValue3.z) * (1.0 - scalarValue16)) > 0.0);
    float productValue250 = (productValue249 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[18u].x) - scalarValue13)) + scalarValue13;
    float productValue251 = (productValue249 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[18u].y) - scalarValue14)) + scalarValue14;
    float productValue252 = (productValue249 * ((sampledTextureValue2.w * fragmentVectorConstants1.packedValues[18u].w) - scalarValue16)) + scalarValue16;
    float productValue303 = (((productValue252 * fragmentVectorConstants1.packedValues[10u].w) - productValue252) * fragmentVectorConstants1.packedValues[20u].x) + productValue252;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue1 = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue1), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue1)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue14 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue15 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue147 = floor(quotientValue15 * 0.25);
        float productValue148 = floor(quotientValue15 * 0.5);
        float scalarValue29 = floor(quotientValue15);
        comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue148 * productValue148) * 0.75) + (floor(quotientValue14 * 0.5) * 0.5)) + (fract(((productValue147 * productValue147) * 0.75) + (floor(quotientValue14 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue29 * scalarValue29) * 0.75) + (floor(quotientValue14) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if (((productValue303 < fragmentVectorConstants1.packedValues[11u].x) || (productValue303 > (1.0 - fragmentVectorConstants1.packedValues[11u].x))) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    fragmentColor0.w = spvNMax(productValue10, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[40u], sumValue5, 1.0);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[40u], sumValue6, 1.0);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[40u], sumValue7, 1.0);
    precise float productValue28 = productValue7 * multiplyAddValue12;
    precise float productValue29 = productValue8 * multiplyAddValue13;
    precise float productValue30 = productValue9 * multiplyAddValue14;
    float multiplyAddValue15 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue7, multiplyAddValue12, fragmentVectorConstants1.packedValues[9u].x), productValue28);
    float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue8, multiplyAddValue13, fragmentVectorConstants1.packedValues[9u].y), productValue29);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue9, multiplyAddValue14, fragmentVectorConstants1.packedValues[9u].z), productValue30);
    precise float productValue31 = multiplyAddValue15 * varyingColor3.x;
    precise float productValue32 = multiplyAddValue16 * varyingColor3.y;
    precise float productValue33 = multiplyAddValue17 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue15, varyingColor3.x, varyingColor2.x), productValue31);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue16, varyingColor3.y, varyingColor2.y), productValue32);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue17, varyingColor3.z, varyingColor2.z), productValue33);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    fragmentColor0.w = spvNMax(multiplyAddValue21, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[40u], sumValue5, 1.0);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[40u], sumValue6, 1.0);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[40u], sumValue7, 1.0);
    precise float productValue35 = multiplyAddValue18 * multiplyAddValue12;
    precise float productValue36 = multiplyAddValue19 * multiplyAddValue13;
    precise float productValue37 = multiplyAddValue20 * multiplyAddValue14;
    float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue18, multiplyAddValue12, fragmentVectorConstants1.packedValues[9u].x), productValue35);
    float multiplyAddValue23 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue19, multiplyAddValue13, fragmentVectorConstants1.packedValues[9u].y), productValue36);
    float multiplyAddValue24 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue20, multiplyAddValue14, fragmentVectorConstants1.packedValues[9u].z), productValue37);
    precise float productValue38 = multiplyAddValue22 * varyingColor3.x;
    precise float productValue39 = multiplyAddValue23 * varyingColor3.y;
    precise float productValue40 = multiplyAddValue24 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue22, varyingColor3.x, varyingColor2.x), productValue38);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue23, varyingColor3.y, varyingColor2.y), productValue39);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue24, varyingColor3.z, varyingColor2.z), productValue40);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    float scalarValue23 = spvNMax(productValue68, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[44u], sumValue5, 1.0);
    float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[44u], sumValue6, 1.0);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[44u], sumValue7, 1.0);
    precise float productValue83 = multiplyAddValue49 * productValue65;
    precise float productValue84 = multiplyAddValue50 * productValue66;
    precise float productValue85 = multiplyAddValue51 * productValue67;
    float multiplyAddValue52 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue65, multiplyAddValue49, fragmentVectorConstants1.packedValues[9u].x), productValue83);
    float multiplyAddValue53 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue66, multiplyAddValue50, fragmentVectorConstants1.packedValues[9u].y), productValue84);
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue67, multiplyAddValue51, fragmentVectorConstants1.packedValues[9u].z), productValue85);
    precise float sumValue13 = varyingColor3.x - 1.0;
    precise float sumValue14 = varyingColor3.y - 1.0;
    precise float sumValue15 = varyingColor3.z - 1.0;
    float multiplyAddValue55 = fma(scalarValue23, sumValue13, 1.0);
    float multiplyAddValue56 = fma(scalarValue23, sumValue14, 1.0);
    float multiplyAddValue57 = fma(scalarValue23, sumValue15, 1.0);
    precise float productValue86 = multiplyAddValue52 * multiplyAddValue55;
    precise float productValue87 = multiplyAddValue53 * multiplyAddValue56;
    precise float productValue88 = multiplyAddValue54 * multiplyAddValue57;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue52, multiplyAddValue55, varyingColor2.x), productValue86);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue53, multiplyAddValue56, varyingColor2.y), productValue87);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue54, multiplyAddValue57, varyingColor2.z), productValue88);
    fragmentColor0.w = scalarValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    float scalarValue27 = spvNMax(multiplyAddValue72, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[44u], sumValue5, 1.0);
    float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[44u], sumValue6, 1.0);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[44u], sumValue7, 1.0);
    precise float productValue101 = multiplyAddValue49 * multiplyAddValue69;
    precise float productValue102 = multiplyAddValue50 * multiplyAddValue70;
    precise float productValue103 = multiplyAddValue51 * multiplyAddValue71;
    float multiplyAddValue74 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue69, multiplyAddValue49, fragmentVectorConstants1.packedValues[9u].x), productValue101);
    float multiplyAddValue75 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue70, multiplyAddValue50, fragmentVectorConstants1.packedValues[9u].y), productValue102);
    float multiplyAddValue76 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue71, multiplyAddValue51, fragmentVectorConstants1.packedValues[9u].z), productValue103);
    precise float sumValue13 = varyingColor3.x - 1.0;
    precise float sumValue14 = varyingColor3.y - 1.0;
    precise float sumValue15 = varyingColor3.z - 1.0;
    float multiplyAddValue77 = fma(scalarValue27, sumValue13, 1.0);
    float multiplyAddValue78 = fma(scalarValue27, sumValue14, 1.0);
    float multiplyAddValue79 = fma(scalarValue27, sumValue15, 1.0);
    precise float productValue104 = multiplyAddValue74 * multiplyAddValue77;
    precise float productValue105 = multiplyAddValue75 * multiplyAddValue78;
    precise float productValue106 = multiplyAddValue76 * multiplyAddValue79;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue74, multiplyAddValue77, varyingColor2.x), productValue104);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue75, multiplyAddValue78, varyingColor2.y), productValue105);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue76, multiplyAddValue79, varyingColor2.z), productValue106);
    fragmentColor0.w = scalarValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    float scalarValue23 = spvNMax(productValue68, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[44u], sumValue5, 1.0);
    float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[44u], sumValue6, 1.0);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[44u], sumValue7, 1.0);
    precise float productValue131 = productValue65 * multiplyAddValue49;
    precise float productValue132 = productValue66 * multiplyAddValue50;
    precise float productValue133 = productValue67 * multiplyAddValue51;
    float multiplyAddValue89 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue65, multiplyAddValue49, fragmentVectorConstants1.packedValues[9u].x), productValue131);
    float multiplyAddValue90 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue66, multiplyAddValue50, fragmentVectorConstants1.packedValues[9u].y), productValue132);
    float multiplyAddValue91 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue67, multiplyAddValue51, fragmentVectorConstants1.packedValues[9u].z), productValue133);
    precise float sumValue13 = varyingColor3.x - 1.0;
    precise float sumValue14 = varyingColor3.y - 1.0;
    precise float sumValue15 = varyingColor3.z - 1.0;
    float multiplyAddValue55 = fma(scalarValue23, sumValue13, 1.0);
    float multiplyAddValue56 = fma(scalarValue23, sumValue14, 1.0);
    float multiplyAddValue57 = fma(scalarValue23, sumValue15, 1.0);
    precise float productValue134 = multiplyAddValue89 * multiplyAddValue55;
    precise float productValue135 = multiplyAddValue90 * multiplyAddValue56;
    precise float productValue136 = multiplyAddValue91 * multiplyAddValue57;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue89, multiplyAddValue55, varyingColor2.x), productValue134);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue90, multiplyAddValue56, varyingColor2.y), productValue135);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue91, multiplyAddValue57, varyingColor2.z), productValue136);
    fragmentColor0.w = scalarValue23;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    float scalarValue27 = spvNMax(multiplyAddValue72, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[44u], sumValue5, 1.0);
    float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[44u], sumValue6, 1.0);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[44u], sumValue7, 1.0);
    precise float productValue137 = multiplyAddValue69 * multiplyAddValue49;
    precise float productValue138 = multiplyAddValue70 * multiplyAddValue50;
    precise float productValue139 = multiplyAddValue71 * multiplyAddValue51;
    float multiplyAddValue93 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue69, multiplyAddValue49, fragmentVectorConstants1.packedValues[9u].x), productValue137);
    float multiplyAddValue94 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue70, multiplyAddValue50, fragmentVectorConstants1.packedValues[9u].y), productValue138);
    float multiplyAddValue95 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue71, multiplyAddValue51, fragmentVectorConstants1.packedValues[9u].z), productValue139);
    precise float sumValue13 = varyingColor3.x - 1.0;
    precise float sumValue14 = varyingColor3.y - 1.0;
    precise float sumValue15 = varyingColor3.z - 1.0;
    float multiplyAddValue77 = fma(scalarValue27, sumValue13, 1.0);
    float multiplyAddValue78 = fma(scalarValue27, sumValue14, 1.0);
    float multiplyAddValue79 = fma(scalarValue27, sumValue15, 1.0);
    precise float productValue140 = multiplyAddValue93 * multiplyAddValue77;
    precise float productValue141 = multiplyAddValue94 * multiplyAddValue78;
    precise float productValue142 = multiplyAddValue95 * multiplyAddValue79;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue93, multiplyAddValue77, varyingColor2.x), productValue140);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue94, multiplyAddValue78, varyingColor2.y), productValue141);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue95, multiplyAddValue79, varyingColor2.z), productValue142);
    fragmentColor0.w = scalarValue27;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue173 = productValue158 * fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue100 = fma(productValue158, fma(productValue155, fragmentVectorConstants1.packedValues[5u].x, -productValue155), productValue155);
    float multiplyAddValue101 = fma(productValue158, fma(productValue156, fragmentVectorConstants1.packedValues[5u].y, -productValue156), productValue156);
    float multiplyAddValue102 = fma(productValue158, fma(productValue157, fragmentVectorConstants1.packedValues[5u].z, -productValue157), productValue157);
    fragmentColor0.w = spvNMax(productValue173, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue174 = multiplyAddValue100 * multiplyAddValue103;
    precise float productValue175 = multiplyAddValue101 * multiplyAddValue104;
    precise float productValue176 = multiplyAddValue102 * multiplyAddValue105;
    float multiplyAddValue106 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue100, multiplyAddValue103, fragmentVectorConstants1.packedValues[10u].x), productValue174);
    float multiplyAddValue107 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue101, multiplyAddValue104, fragmentVectorConstants1.packedValues[10u].y), productValue175);
    float multiplyAddValue108 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue102, multiplyAddValue105, fragmentVectorConstants1.packedValues[10u].z), productValue176);
    precise float productValue177 = multiplyAddValue106 * varyingColor3.x;
    precise float productValue178 = multiplyAddValue107 * varyingColor3.y;
    precise float productValue179 = multiplyAddValue108 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue106, varyingColor3.x, varyingColor2.x), productValue177);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue107, varyingColor3.y, varyingColor2.y), productValue178);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue108, varyingColor3.z, varyingColor2.z), productValue179);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue187 = multiplyAddValue133 * fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue134 = fma(multiplyAddValue133, fma(multiplyAddValue130, fragmentVectorConstants1.packedValues[5u].x, -multiplyAddValue130), multiplyAddValue130);
    float multiplyAddValue135 = fma(multiplyAddValue133, fma(multiplyAddValue131, fragmentVectorConstants1.packedValues[5u].y, -multiplyAddValue131), multiplyAddValue131);
    float multiplyAddValue136 = fma(multiplyAddValue133, fma(multiplyAddValue132, fragmentVectorConstants1.packedValues[5u].z, -multiplyAddValue132), multiplyAddValue132);
    fragmentColor0.w = spvNMax(productValue187, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue188 = multiplyAddValue134 * multiplyAddValue103;
    precise float productValue189 = multiplyAddValue135 * multiplyAddValue104;
    precise float productValue190 = multiplyAddValue136 * multiplyAddValue105;
    float multiplyAddValue137 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue134, multiplyAddValue103, fragmentVectorConstants1.packedValues[10u].x), productValue188);
    float multiplyAddValue138 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue135, multiplyAddValue104, fragmentVectorConstants1.packedValues[10u].y), productValue189);
    float multiplyAddValue139 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue136, multiplyAddValue105, fragmentVectorConstants1.packedValues[10u].z), productValue190);
    precise float productValue191 = multiplyAddValue137 * varyingColor3.x;
    precise float productValue192 = multiplyAddValue138 * varyingColor3.y;
    precise float productValue193 = multiplyAddValue139 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue137, varyingColor3.x, varyingColor2.x), productValue191);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue138, varyingColor3.y, varyingColor2.y), productValue192);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue139, varyingColor3.z, varyingColor2.z), productValue193);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue173 = productValue158 * fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue100 = fma(productValue158, fma(productValue155, fragmentVectorConstants1.packedValues[5u].x, -productValue155), productValue155);
    float multiplyAddValue101 = fma(productValue158, fma(productValue156, fragmentVectorConstants1.packedValues[5u].y, -productValue156), productValue156);
    float multiplyAddValue102 = fma(productValue158, fma(productValue157, fragmentVectorConstants1.packedValues[5u].z, -productValue157), productValue157);
    float scalarValue37 = spvNMax(productValue173, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue174 = multiplyAddValue100 * multiplyAddValue103;
    precise float productValue175 = multiplyAddValue101 * multiplyAddValue104;
    precise float productValue176 = multiplyAddValue102 * multiplyAddValue105;
    float multiplyAddValue106 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue100, multiplyAddValue103, fragmentVectorConstants1.packedValues[10u].x), productValue174);
    float multiplyAddValue107 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue101, multiplyAddValue104, fragmentVectorConstants1.packedValues[10u].y), productValue175);
    float multiplyAddValue108 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue102, multiplyAddValue105, fragmentVectorConstants1.packedValues[10u].z), productValue176);
    precise float sumValue13 = varyingColor3.x - 1.0;
    precise float sumValue14 = varyingColor3.y - 1.0;
    precise float sumValue15 = varyingColor3.z - 1.0;
    float multiplyAddValue149 = fma(scalarValue37, sumValue13, 1.0);
    float multiplyAddValue150 = fma(scalarValue37, sumValue14, 1.0);
    float multiplyAddValue151 = fma(scalarValue37, sumValue15, 1.0);
    precise float productValue212 = multiplyAddValue106 * multiplyAddValue149;
    precise float productValue213 = multiplyAddValue107 * multiplyAddValue150;
    precise float productValue214 = multiplyAddValue108 * multiplyAddValue151;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue106, multiplyAddValue149, varyingColor2.x), productValue212);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue107, multiplyAddValue150, varyingColor2.y), productValue213);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue108, multiplyAddValue151, varyingColor2.z), productValue214);
    fragmentColor0.w = scalarValue37;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue187 = multiplyAddValue133 * fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue134 = fma(multiplyAddValue133, fma(multiplyAddValue130, fragmentVectorConstants1.packedValues[5u].x, -multiplyAddValue130), multiplyAddValue130);
    float multiplyAddValue135 = fma(multiplyAddValue133, fma(multiplyAddValue131, fragmentVectorConstants1.packedValues[5u].y, -multiplyAddValue131), multiplyAddValue131);
    float multiplyAddValue136 = fma(multiplyAddValue133, fma(multiplyAddValue132, fragmentVectorConstants1.packedValues[5u].z, -multiplyAddValue132), multiplyAddValue132);
    float scalarValue36 = spvNMax(productValue187, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue188 = multiplyAddValue134 * multiplyAddValue103;
    precise float productValue189 = multiplyAddValue135 * multiplyAddValue104;
    precise float productValue190 = multiplyAddValue136 * multiplyAddValue105;
    float multiplyAddValue137 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue134, multiplyAddValue103, fragmentVectorConstants1.packedValues[10u].x), productValue188);
    float multiplyAddValue138 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue135, multiplyAddValue104, fragmentVectorConstants1.packedValues[10u].y), productValue189);
    float multiplyAddValue139 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue136, multiplyAddValue105, fragmentVectorConstants1.packedValues[10u].z), productValue190);
    precise float sumValue13 = varyingColor3.x - 1.0;
    precise float sumValue14 = varyingColor3.y - 1.0;
    precise float sumValue15 = varyingColor3.z - 1.0;
    float multiplyAddValue141 = fma(scalarValue36, sumValue13, 1.0);
    float multiplyAddValue142 = fma(scalarValue36, sumValue14, 1.0);
    float multiplyAddValue143 = fma(scalarValue36, sumValue15, 1.0);
    precise float productValue208 = multiplyAddValue137 * multiplyAddValue141;
    precise float productValue209 = multiplyAddValue138 * multiplyAddValue142;
    precise float productValue210 = multiplyAddValue139 * multiplyAddValue143;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue137, multiplyAddValue141, varyingColor2.x), productValue208);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue138, multiplyAddValue142, varyingColor2.y), productValue209);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue139, multiplyAddValue143, varyingColor2.z), productValue210);
    fragmentColor0.w = scalarValue36;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue240 = productValue155 * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue241 = productValue155 * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue242 = productValue155 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue41 = ceil(productValue156);
    float multiplyAddValue175 = fma(scalarValue41, fma(productValue156, fragmentVectorConstants1.packedValues[19u].x, -productValue240), productValue240);
    float multiplyAddValue176 = fma(scalarValue41, fma(productValue156, fragmentVectorConstants1.packedValues[19u].y, -productValue241), productValue241);
    float multiplyAddValue177 = fma(scalarValue41, fma(productValue156, fragmentVectorConstants1.packedValues[19u].z, -productValue242), productValue242);
    fragmentColor0.w = spvNMax(productValue239, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue243 = multiplyAddValue175 * multiplyAddValue103;
    precise float productValue244 = multiplyAddValue176 * multiplyAddValue104;
    precise float productValue245 = multiplyAddValue177 * multiplyAddValue105;
    float multiplyAddValue178 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue175, multiplyAddValue103, fragmentVectorConstants1.packedValues[10u].x), productValue243);
    float multiplyAddValue179 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue176, multiplyAddValue104, fragmentVectorConstants1.packedValues[10u].y), productValue244);
    float multiplyAddValue180 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue177, multiplyAddValue105, fragmentVectorConstants1.packedValues[10u].z), productValue245);
    precise float productValue246 = multiplyAddValue178 * varyingColor3.x;
    precise float productValue247 = multiplyAddValue179 * varyingColor3.y;
    precise float productValue248 = multiplyAddValue180 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue178, varyingColor3.x, varyingColor2.x), productValue246);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue179, varyingColor3.y, varyingColor2.y), productValue247);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue180, varyingColor3.z, varyingColor2.z), productValue248);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue263 = multiplyAddValue181 * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue264 = multiplyAddValue181 * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue265 = multiplyAddValue181 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue44 = ceil(multiplyAddValue182);
    float multiplyAddValue184 = fma(scalarValue44, fma(multiplyAddValue182, fragmentVectorConstants1.packedValues[19u].x, -productValue263), productValue263);
    float multiplyAddValue185 = fma(scalarValue44, fma(multiplyAddValue182, fragmentVectorConstants1.packedValues[19u].y, -productValue264), productValue264);
    float multiplyAddValue186 = fma(scalarValue44, fma(multiplyAddValue182, fragmentVectorConstants1.packedValues[19u].z, -productValue265), productValue265);
    fragmentColor0.w = spvNMax(multiplyAddValue183, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue266 = multiplyAddValue184 * multiplyAddValue103;
    precise float productValue267 = multiplyAddValue185 * multiplyAddValue104;
    precise float productValue268 = multiplyAddValue186 * multiplyAddValue105;
    float multiplyAddValue187 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue184, multiplyAddValue103, fragmentVectorConstants1.packedValues[10u].x), productValue266);
    float multiplyAddValue188 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue185, multiplyAddValue104, fragmentVectorConstants1.packedValues[10u].y), productValue267);
    float multiplyAddValue189 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue186, multiplyAddValue105, fragmentVectorConstants1.packedValues[10u].z), productValue268);
    precise float productValue269 = multiplyAddValue187 * varyingColor3.x;
    precise float productValue270 = multiplyAddValue188 * varyingColor3.y;
    precise float productValue271 = multiplyAddValue189 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue187, varyingColor3.x, varyingColor2.x), productValue269);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue188, varyingColor3.y, varyingColor2.y), productValue270);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue189, varyingColor3.z, varyingColor2.z), productValue271);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue240 = productValue155 * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue241 = productValue155 * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue242 = productValue155 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue41 = ceil(productValue156);
    float multiplyAddValue175 = fma(scalarValue41, fma(productValue156, fragmentVectorConstants1.packedValues[19u].x, -productValue240), productValue240);
    float multiplyAddValue176 = fma(scalarValue41, fma(productValue156, fragmentVectorConstants1.packedValues[19u].y, -productValue241), productValue241);
    float multiplyAddValue177 = fma(scalarValue41, fma(productValue156, fragmentVectorConstants1.packedValues[19u].z, -productValue242), productValue242);
    float scalarValue49 = spvNMax(productValue158, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue243 = multiplyAddValue175 * multiplyAddValue103;
    precise float productValue244 = multiplyAddValue176 * multiplyAddValue104;
    precise float productValue245 = multiplyAddValue177 * multiplyAddValue105;
    float multiplyAddValue178 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue175, multiplyAddValue103, fragmentVectorConstants1.packedValues[10u].x), productValue243);
    float multiplyAddValue179 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue176, multiplyAddValue104, fragmentVectorConstants1.packedValues[10u].y), productValue244);
    float multiplyAddValue180 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue177, multiplyAddValue105, fragmentVectorConstants1.packedValues[10u].z), productValue245);
    precise float sumValue13 = varyingColor3.x - 1.0;
    precise float sumValue14 = varyingColor3.y - 1.0;
    precise float sumValue15 = varyingColor3.z - 1.0;
    float multiplyAddValue205 = fma(scalarValue49, sumValue13, 1.0);
    float multiplyAddValue206 = fma(scalarValue49, sumValue14, 1.0);
    float multiplyAddValue207 = fma(scalarValue49, sumValue15, 1.0);
    precise float productValue278 = multiplyAddValue178 * multiplyAddValue205;
    precise float productValue279 = multiplyAddValue179 * multiplyAddValue206;
    precise float productValue280 = multiplyAddValue180 * multiplyAddValue207;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue178, multiplyAddValue205, varyingColor2.x), productValue278);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue179, multiplyAddValue206, varyingColor2.y), productValue279);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue180, multiplyAddValue207, varyingColor2.z), productValue280);
    fragmentColor0.w = scalarValue49;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue281 = multiplyAddValue130 * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue282 = multiplyAddValue130 * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue283 = multiplyAddValue130 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue51 = ceil(multiplyAddValue131);
    float multiplyAddValue213 = fma(scalarValue51, fma(multiplyAddValue131, fragmentVectorConstants1.packedValues[19u].x, -productValue281), productValue281);
    float multiplyAddValue214 = fma(scalarValue51, fma(multiplyAddValue131, fragmentVectorConstants1.packedValues[19u].y, -productValue282), productValue282);
    float multiplyAddValue215 = fma(scalarValue51, fma(multiplyAddValue131, fragmentVectorConstants1.packedValues[19u].z, -productValue283), productValue283);
    float scalarValue52 = spvNMax(multiplyAddValue133, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue284 = multiplyAddValue213 * multiplyAddValue103;
    precise float productValue285 = multiplyAddValue214 * multiplyAddValue104;
    precise float productValue286 = multiplyAddValue215 * multiplyAddValue105;
    float multiplyAddValue216 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue213, multiplyAddValue103, fragmentVectorConstants1.packedValues[10u].x), productValue284);
    float multiplyAddValue217 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue214, multiplyAddValue104, fragmentVectorConstants1.packedValues[10u].y), productValue285);
    float multiplyAddValue218 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue215, multiplyAddValue105, fragmentVectorConstants1.packedValues[10u].z), productValue286);
    precise float sumValue13 = varyingColor3.x - 1.0;
    precise float sumValue14 = varyingColor3.y - 1.0;
    precise float sumValue15 = varyingColor3.z - 1.0;
    float multiplyAddValue219 = fma(scalarValue52, sumValue13, 1.0);
    float multiplyAddValue220 = fma(scalarValue52, sumValue14, 1.0);
    float multiplyAddValue221 = fma(scalarValue52, sumValue15, 1.0);
    precise float productValue287 = multiplyAddValue216 * multiplyAddValue219;
    precise float productValue288 = multiplyAddValue217 * multiplyAddValue220;
    precise float productValue289 = multiplyAddValue218 * multiplyAddValue221;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue216, multiplyAddValue219, varyingColor2.x), productValue287);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue217, multiplyAddValue220, varyingColor2.y), productValue288);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue218, multiplyAddValue221, varyingColor2.z), productValue289);
    fragmentColor0.w = scalarValue52;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue240 = productValue155 * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue241 = productValue155 * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue242 = productValue155 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue41 = ceil(productValue156);
    float multiplyAddValue175 = fma(scalarValue41, fma(productValue156, fragmentVectorConstants1.packedValues[19u].x, -productValue240), productValue240);
    float multiplyAddValue176 = fma(scalarValue41, fma(productValue156, fragmentVectorConstants1.packedValues[19u].y, -productValue241), productValue241);
    float multiplyAddValue177 = fma(scalarValue41, fma(productValue156, fragmentVectorConstants1.packedValues[19u].z, -productValue242), productValue242);
    float scalarValue55 = spvNMax(productValue239, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue243 = multiplyAddValue175 * multiplyAddValue103;
    precise float productValue244 = multiplyAddValue176 * multiplyAddValue104;
    precise float productValue245 = multiplyAddValue177 * multiplyAddValue105;
    float multiplyAddValue178 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue175, multiplyAddValue103, fragmentVectorConstants1.packedValues[10u].x), productValue243);
    float multiplyAddValue179 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue176, multiplyAddValue104, fragmentVectorConstants1.packedValues[10u].y), productValue244);
    float multiplyAddValue180 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue177, multiplyAddValue105, fragmentVectorConstants1.packedValues[10u].z), productValue245);
    precise float sumValue13 = varyingColor3.x - 1.0;
    precise float sumValue14 = varyingColor3.y - 1.0;
    precise float sumValue15 = varyingColor3.z - 1.0;
    float multiplyAddValue223 = fma(scalarValue55, sumValue13, 1.0);
    float multiplyAddValue224 = fma(scalarValue55, sumValue14, 1.0);
    float multiplyAddValue225 = fma(scalarValue55, sumValue15, 1.0);
    precise float productValue299 = multiplyAddValue178 * multiplyAddValue223;
    precise float productValue300 = multiplyAddValue179 * multiplyAddValue224;
    precise float productValue301 = multiplyAddValue180 * multiplyAddValue225;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue178, multiplyAddValue223, varyingColor2.x), productValue299);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue179, multiplyAddValue224, varyingColor2.y), productValue300);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue180, multiplyAddValue225, varyingColor2.z), productValue301);
    fragmentColor0.w = scalarValue55;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue263 = multiplyAddValue181 * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue264 = multiplyAddValue181 * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue265 = multiplyAddValue181 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue44 = ceil(multiplyAddValue182);
    float multiplyAddValue184 = fma(scalarValue44, fma(multiplyAddValue182, fragmentVectorConstants1.packedValues[19u].x, -productValue263), productValue263);
    float multiplyAddValue185 = fma(scalarValue44, fma(multiplyAddValue182, fragmentVectorConstants1.packedValues[19u].y, -productValue264), productValue264);
    float multiplyAddValue186 = fma(scalarValue44, fma(multiplyAddValue182, fragmentVectorConstants1.packedValues[19u].z, -productValue265), productValue265);
    float scalarValue58 = spvNMax(multiplyAddValue183, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue266 = multiplyAddValue184 * multiplyAddValue103;
    precise float productValue267 = multiplyAddValue185 * multiplyAddValue104;
    precise float productValue268 = multiplyAddValue186 * multiplyAddValue105;
    float multiplyAddValue187 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue184, multiplyAddValue103, fragmentVectorConstants1.packedValues[10u].x), productValue266);
    float multiplyAddValue188 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue185, multiplyAddValue104, fragmentVectorConstants1.packedValues[10u].y), productValue267);
    float multiplyAddValue189 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue186, multiplyAddValue105, fragmentVectorConstants1.packedValues[10u].z), productValue268);
    precise float sumValue13 = varyingColor3.x - 1.0;
    precise float sumValue14 = varyingColor3.y - 1.0;
    precise float sumValue15 = varyingColor3.z - 1.0;
    float multiplyAddValue231 = fma(scalarValue58, sumValue13, 1.0);
    float multiplyAddValue232 = fma(scalarValue58, sumValue14, 1.0);
    float multiplyAddValue233 = fma(scalarValue58, sumValue15, 1.0);
    precise float productValue307 = multiplyAddValue187 * multiplyAddValue231;
    precise float productValue308 = multiplyAddValue188 * multiplyAddValue232;
    precise float productValue309 = multiplyAddValue189 * multiplyAddValue233;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue187, multiplyAddValue231, varyingColor2.x), productValue307);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue188, multiplyAddValue232, varyingColor2.y), productValue308);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue189, multiplyAddValue233, varyingColor2.z), productValue309);
    fragmentColor0.w = scalarValue58;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.w = spvNMax(productValue3, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue, multiplyAddValue2, fragmentVectorConstants1.packedValues[9u].x), productValue * multiplyAddValue2);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue1, multiplyAddValue3, fragmentVectorConstants1.packedValues[9u].y), productValue1 * multiplyAddValue3);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue2, multiplyAddValue4, fragmentVectorConstants1.packedValues[9u].z), productValue2 * multiplyAddValue4);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue5, varyingColor3.x, varyingColor2.x), multiplyAddValue5 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue6, varyingColor3.y, varyingColor2.y), multiplyAddValue6 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue7, varyingColor3.z, varyingColor2.z), multiplyAddValue7 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.w = spvNMax(multiplyAddValue28, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue29 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue25, multiplyAddValue2, fragmentVectorConstants1.packedValues[9u].x), multiplyAddValue25 * multiplyAddValue2);
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue26, multiplyAddValue3, fragmentVectorConstants1.packedValues[9u].y), multiplyAddValue26 * multiplyAddValue3);
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue27, multiplyAddValue4, fragmentVectorConstants1.packedValues[9u].z), multiplyAddValue27 * multiplyAddValue4);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue29, varyingColor3.x, varyingColor2.x), multiplyAddValue29 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue30, varyingColor3.y, varyingColor2.y), multiplyAddValue30 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue31, varyingColor3.z, varyingColor2.z), multiplyAddValue31 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    float scalarValue18 = spvNMax(productValue62, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue35 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue36 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue37 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue38 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue59, multiplyAddValue35, fragmentVectorConstants1.packedValues[9u].x), multiplyAddValue35 * productValue59);
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue60, multiplyAddValue36, fragmentVectorConstants1.packedValues[9u].y), multiplyAddValue36 * productValue60);
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue61, multiplyAddValue37, fragmentVectorConstants1.packedValues[9u].z), multiplyAddValue37 * productValue61);
    float multiplyAddValue41 = fma(scalarValue18, varyingColor3.x - 1.0, 1.0);
    float multiplyAddValue42 = fma(scalarValue18, varyingColor3.y - 1.0, 1.0);
    float multiplyAddValue43 = fma(scalarValue18, varyingColor3.z - 1.0, 1.0);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue38, multiplyAddValue41, varyingColor2.x), multiplyAddValue38 * multiplyAddValue41);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue39, multiplyAddValue42, varyingColor2.y), multiplyAddValue39 * multiplyAddValue42);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue40, multiplyAddValue43, varyingColor2.z), multiplyAddValue40 * multiplyAddValue43);
    fragmentColor0.w = scalarValue18;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    float scalarValue26 = spvNMax(multiplyAddValue61, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue35 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue36 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue37 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue63 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue58, multiplyAddValue35, fragmentVectorConstants1.packedValues[9u].x), multiplyAddValue35 * multiplyAddValue58);
    float multiplyAddValue64 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue59, multiplyAddValue36, fragmentVectorConstants1.packedValues[9u].y), multiplyAddValue36 * multiplyAddValue59);
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue60, multiplyAddValue37, fragmentVectorConstants1.packedValues[9u].z), multiplyAddValue37 * multiplyAddValue60);
    float multiplyAddValue66 = fma(scalarValue26, varyingColor3.x - 1.0, 1.0);
    float multiplyAddValue67 = fma(scalarValue26, varyingColor3.y - 1.0, 1.0);
    float multiplyAddValue68 = fma(scalarValue26, varyingColor3.z - 1.0, 1.0);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue63, multiplyAddValue66, varyingColor2.x), multiplyAddValue63 * multiplyAddValue66);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue64, multiplyAddValue67, varyingColor2.y), multiplyAddValue64 * multiplyAddValue67);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue65, multiplyAddValue68, varyingColor2.z), multiplyAddValue65 * multiplyAddValue68);
    fragmentColor0.w = scalarValue26;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    float scalarValue18 = spvNMax(productValue62, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue35 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue36 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue37 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue85 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue59, multiplyAddValue35, fragmentVectorConstants1.packedValues[9u].x), productValue59 * multiplyAddValue35);
    float multiplyAddValue86 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue60, multiplyAddValue36, fragmentVectorConstants1.packedValues[9u].y), productValue60 * multiplyAddValue36);
    float multiplyAddValue87 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue61, multiplyAddValue37, fragmentVectorConstants1.packedValues[9u].z), productValue61 * multiplyAddValue37);
    float multiplyAddValue41 = fma(scalarValue18, varyingColor3.x - 1.0, 1.0);
    float multiplyAddValue42 = fma(scalarValue18, varyingColor3.y - 1.0, 1.0);
    float multiplyAddValue43 = fma(scalarValue18, varyingColor3.z - 1.0, 1.0);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue85, multiplyAddValue41, varyingColor2.x), multiplyAddValue85 * multiplyAddValue41);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue86, multiplyAddValue42, varyingColor2.y), multiplyAddValue86 * multiplyAddValue42);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue87, multiplyAddValue43, varyingColor2.z), multiplyAddValue87 * multiplyAddValue43);
    fragmentColor0.w = scalarValue18;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    float scalarValue26 = spvNMax(multiplyAddValue61, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue35 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue36 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue37 = fma(fragmentScalarConstants1.packedValues[44u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue81 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue58, multiplyAddValue35, fragmentVectorConstants1.packedValues[9u].x), multiplyAddValue58 * multiplyAddValue35);
    float multiplyAddValue82 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue59, multiplyAddValue36, fragmentVectorConstants1.packedValues[9u].y), multiplyAddValue59 * multiplyAddValue36);
    float multiplyAddValue83 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue60, multiplyAddValue37, fragmentVectorConstants1.packedValues[9u].z), multiplyAddValue60 * multiplyAddValue37);
    float multiplyAddValue66 = fma(scalarValue26, varyingColor3.x - 1.0, 1.0);
    float multiplyAddValue67 = fma(scalarValue26, varyingColor3.y - 1.0, 1.0);
    float multiplyAddValue68 = fma(scalarValue26, varyingColor3.z - 1.0, 1.0);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue81, multiplyAddValue66, varyingColor2.x), multiplyAddValue81 * multiplyAddValue66);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue82, multiplyAddValue67, varyingColor2.y), multiplyAddValue82 * multiplyAddValue67);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue83, multiplyAddValue68, varyingColor2.z), multiplyAddValue83 * multiplyAddValue68);
    fragmentColor0.w = scalarValue26;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue111 = fma(productValue183, fma(productValue180, fragmentVectorConstants1.packedValues[5u].x, -productValue180), productValue180);
    float multiplyAddValue112 = fma(productValue183, fma(productValue181, fragmentVectorConstants1.packedValues[5u].y, -productValue181), productValue181);
    float multiplyAddValue113 = fma(productValue183, fma(productValue182, fragmentVectorConstants1.packedValues[5u].z, -productValue182), productValue182);
    fragmentColor0.w = spvNMax(productValue183 * fragmentScalarConstants1.packedValues[23u], fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue114 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue115 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue116 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue117 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue111, multiplyAddValue114, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue111 * multiplyAddValue114);
    float multiplyAddValue118 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue112, multiplyAddValue115, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue112 * multiplyAddValue115);
    float multiplyAddValue119 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue113, multiplyAddValue116, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue113 * multiplyAddValue116);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue117, varyingColor3.x, varyingColor2.x), multiplyAddValue117 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue118, varyingColor3.y, varyingColor2.y), multiplyAddValue118 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue119, varyingColor3.z, varyingColor2.z), multiplyAddValue119 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue124 = fma(multiplyAddValue123, fma(multiplyAddValue120, fragmentVectorConstants1.packedValues[5u].x, -multiplyAddValue120), multiplyAddValue120);
    float multiplyAddValue125 = fma(multiplyAddValue123, fma(multiplyAddValue121, fragmentVectorConstants1.packedValues[5u].y, -multiplyAddValue121), multiplyAddValue121);
    float multiplyAddValue126 = fma(multiplyAddValue123, fma(multiplyAddValue122, fragmentVectorConstants1.packedValues[5u].z, -multiplyAddValue122), multiplyAddValue122);
    fragmentColor0.w = spvNMax(multiplyAddValue123 * fragmentScalarConstants1.packedValues[23u], fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue114 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue115 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue116 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue127 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue124, multiplyAddValue114, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue124 * multiplyAddValue114);
    float multiplyAddValue128 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue125, multiplyAddValue115, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue125 * multiplyAddValue115);
    float multiplyAddValue129 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue126, multiplyAddValue116, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue126 * multiplyAddValue116);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue127, varyingColor3.x, varyingColor2.x), multiplyAddValue127 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue128, varyingColor3.y, varyingColor2.y), multiplyAddValue128 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue129, varyingColor3.z, varyingColor2.z), multiplyAddValue129 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue111 = fma(productValue183, fma(productValue180, fragmentVectorConstants1.packedValues[5u].x, -productValue180), productValue180);
    float multiplyAddValue112 = fma(productValue183, fma(productValue181, fragmentVectorConstants1.packedValues[5u].y, -productValue181), productValue181);
    float multiplyAddValue113 = fma(productValue183, fma(productValue182, fragmentVectorConstants1.packedValues[5u].z, -productValue182), productValue182);
    float productValue211 = spvNMax(productValue183 * fragmentScalarConstants1.packedValues[23u], fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue114 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue115 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue116 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue117 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue111, multiplyAddValue114, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue111 * multiplyAddValue114);
    float multiplyAddValue118 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue112, multiplyAddValue115, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue112 * multiplyAddValue115);
    float multiplyAddValue119 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue113, multiplyAddValue116, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue113 * multiplyAddValue116);
    float multiplyAddValue145 = fma(productValue211, varyingColor3.x - 1.0, 1.0);
    float multiplyAddValue146 = fma(productValue211, varyingColor3.y - 1.0, 1.0);
    float multiplyAddValue147 = fma(productValue211, varyingColor3.z - 1.0, 1.0);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue117, multiplyAddValue145, varyingColor2.x), multiplyAddValue117 * multiplyAddValue145);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue118, multiplyAddValue146, varyingColor2.y), multiplyAddValue118 * multiplyAddValue146);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue119, multiplyAddValue147, varyingColor2.z), multiplyAddValue119 * multiplyAddValue147);
    fragmentColor0.w = productValue211;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue124 = fma(multiplyAddValue123, fma(multiplyAddValue120, fragmentVectorConstants1.packedValues[5u].x, -multiplyAddValue120), multiplyAddValue120);
    float multiplyAddValue125 = fma(multiplyAddValue123, fma(multiplyAddValue121, fragmentVectorConstants1.packedValues[5u].y, -multiplyAddValue121), multiplyAddValue121);
    float multiplyAddValue126 = fma(multiplyAddValue123, fma(multiplyAddValue122, fragmentVectorConstants1.packedValues[5u].z, -multiplyAddValue122), multiplyAddValue122);
    float productValue215 = spvNMax(multiplyAddValue123 * fragmentScalarConstants1.packedValues[23u], fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue114 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue115 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue116 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue127 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue124, multiplyAddValue114, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue124 * multiplyAddValue114);
    float multiplyAddValue128 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue125, multiplyAddValue115, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue125 * multiplyAddValue115);
    float multiplyAddValue129 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue126, multiplyAddValue116, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue126 * multiplyAddValue116);
    float multiplyAddValue153 = fma(productValue215, varyingColor3.x - 1.0, 1.0);
    float multiplyAddValue154 = fma(productValue215, varyingColor3.y - 1.0, 1.0);
    float multiplyAddValue155 = fma(productValue215, varyingColor3.z - 1.0, 1.0);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue127, multiplyAddValue153, varyingColor2.x), multiplyAddValue127 * multiplyAddValue153);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue128, multiplyAddValue154, varyingColor2.y), multiplyAddValue128 * multiplyAddValue154);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue129, multiplyAddValue155, varyingColor2.z), multiplyAddValue129 * multiplyAddValue155);
    fragmentColor0.w = productValue215;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue223 = productValue180 * fragmentVectorConstants1.packedValues[5u].x;
    float productValue224 = productValue180 * fragmentVectorConstants1.packedValues[5u].y;
    float productValue225 = productValue180 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue38 = ceil(productValue181);
    float multiplyAddValue159 = fma(scalarValue38, fma(productValue181, fragmentVectorConstants1.packedValues[19u].x, -productValue223), productValue223);
    float multiplyAddValue160 = fma(scalarValue38, fma(productValue181, fragmentVectorConstants1.packedValues[19u].y, -productValue224), productValue224);
    float multiplyAddValue161 = fma(scalarValue38, fma(productValue181, fragmentVectorConstants1.packedValues[19u].z, -productValue225), productValue225);
    fragmentColor0.w = spvNMax(productValue222, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue114 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue115 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue116 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue162 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue159, multiplyAddValue114, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue159 * multiplyAddValue114);
    float multiplyAddValue163 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue160, multiplyAddValue115, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue160 * multiplyAddValue115);
    float multiplyAddValue164 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue161, multiplyAddValue116, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue161 * multiplyAddValue116);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue162, varyingColor3.x, varyingColor2.x), multiplyAddValue162 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue163, varyingColor3.y, varyingColor2.y), multiplyAddValue163 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue164, varyingColor3.z, varyingColor2.z), multiplyAddValue164 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue236 = multiplyAddValue166 * fragmentVectorConstants1.packedValues[5u].x;
    float productValue237 = multiplyAddValue166 * fragmentVectorConstants1.packedValues[5u].y;
    float productValue238 = multiplyAddValue166 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue40 = ceil(multiplyAddValue167);
    float multiplyAddValue169 = fma(scalarValue40, fma(multiplyAddValue167, fragmentVectorConstants1.packedValues[19u].x, -productValue236), productValue236);
    float multiplyAddValue170 = fma(scalarValue40, fma(multiplyAddValue167, fragmentVectorConstants1.packedValues[19u].y, -productValue237), productValue237);
    float multiplyAddValue171 = fma(scalarValue40, fma(multiplyAddValue167, fragmentVectorConstants1.packedValues[19u].z, -productValue238), productValue238);
    fragmentColor0.w = spvNMax(multiplyAddValue168, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue114 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue115 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue116 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue172 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue169, multiplyAddValue114, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue169 * multiplyAddValue114);
    float multiplyAddValue173 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue170, multiplyAddValue115, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue170 * multiplyAddValue115);
    float multiplyAddValue174 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue171, multiplyAddValue116, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue171 * multiplyAddValue116);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue172, varyingColor3.x, varyingColor2.x), multiplyAddValue172 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue173, varyingColor3.y, varyingColor2.y), multiplyAddValue173 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue174, varyingColor3.z, varyingColor2.z), multiplyAddValue174 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue223 = productValue180 * fragmentVectorConstants1.packedValues[5u].x;
    float productValue224 = productValue180 * fragmentVectorConstants1.packedValues[5u].y;
    float productValue225 = productValue180 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue38 = ceil(productValue181);
    float multiplyAddValue159 = fma(scalarValue38, fma(productValue181, fragmentVectorConstants1.packedValues[19u].x, -productValue223), productValue223);
    float multiplyAddValue160 = fma(scalarValue38, fma(productValue181, fragmentVectorConstants1.packedValues[19u].y, -productValue224), productValue224);
    float multiplyAddValue161 = fma(scalarValue38, fma(productValue181, fragmentVectorConstants1.packedValues[19u].z, -productValue225), productValue225);
    float scalarValue45 = spvNMax(productValue183, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue114 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue115 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue116 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue162 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue159, multiplyAddValue114, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue159 * multiplyAddValue114);
    float multiplyAddValue163 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue160, multiplyAddValue115, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue160 * multiplyAddValue115);
    float multiplyAddValue164 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue161, multiplyAddValue116, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue161 * multiplyAddValue116);
    float multiplyAddValue191 = fma(scalarValue45, varyingColor3.x - 1.0, 1.0);
    float multiplyAddValue192 = fma(scalarValue45, varyingColor3.y - 1.0, 1.0);
    float multiplyAddValue193 = fma(scalarValue45, varyingColor3.z - 1.0, 1.0);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue162, multiplyAddValue191, varyingColor2.x), multiplyAddValue162 * multiplyAddValue191);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue163, multiplyAddValue192, varyingColor2.y), multiplyAddValue163 * multiplyAddValue192);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue164, multiplyAddValue193, varyingColor2.z), multiplyAddValue164 * multiplyAddValue193);
    fragmentColor0.w = scalarValue45;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue275 = multiplyAddValue120 * fragmentVectorConstants1.packedValues[5u].x;
    float productValue276 = multiplyAddValue120 * fragmentVectorConstants1.packedValues[5u].y;
    float productValue277 = multiplyAddValue120 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue47 = ceil(multiplyAddValue121);
    float multiplyAddValue195 = fma(scalarValue47, fma(multiplyAddValue121, fragmentVectorConstants1.packedValues[19u].x, -productValue275), productValue275);
    float multiplyAddValue196 = fma(scalarValue47, fma(multiplyAddValue121, fragmentVectorConstants1.packedValues[19u].y, -productValue276), productValue276);
    float multiplyAddValue197 = fma(scalarValue47, fma(multiplyAddValue121, fragmentVectorConstants1.packedValues[19u].z, -productValue277), productValue277);
    float scalarValue48 = spvNMax(multiplyAddValue123, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue114 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue115 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue116 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue198 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue195, multiplyAddValue114, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue195 * multiplyAddValue114);
    float multiplyAddValue199 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue196, multiplyAddValue115, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue196 * multiplyAddValue115);
    float multiplyAddValue200 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue197, multiplyAddValue116, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue197 * multiplyAddValue116);
    float multiplyAddValue201 = fma(scalarValue48, varyingColor3.x - 1.0, 1.0);
    float multiplyAddValue202 = fma(scalarValue48, varyingColor3.y - 1.0, 1.0);
    float multiplyAddValue203 = fma(scalarValue48, varyingColor3.z - 1.0, 1.0);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue198, multiplyAddValue201, varyingColor2.x), multiplyAddValue198 * multiplyAddValue201);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue199, multiplyAddValue202, varyingColor2.y), multiplyAddValue199 * multiplyAddValue202);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue200, multiplyAddValue203, varyingColor2.z), multiplyAddValue200 * multiplyAddValue203);
    fragmentColor0.w = scalarValue48;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue223 = productValue180 * fragmentVectorConstants1.packedValues[5u].x;
    float productValue224 = productValue180 * fragmentVectorConstants1.packedValues[5u].y;
    float productValue225 = productValue180 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue38 = ceil(productValue181);
    float multiplyAddValue159 = fma(scalarValue38, fma(productValue181, fragmentVectorConstants1.packedValues[19u].x, -productValue223), productValue223);
    float multiplyAddValue160 = fma(scalarValue38, fma(productValue181, fragmentVectorConstants1.packedValues[19u].y, -productValue224), productValue224);
    float multiplyAddValue161 = fma(scalarValue38, fma(productValue181, fragmentVectorConstants1.packedValues[19u].z, -productValue225), productValue225);
    float scalarValue50 = spvNMax(productValue222, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue114 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue115 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue116 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue162 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue159, multiplyAddValue114, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue159 * multiplyAddValue114);
    float multiplyAddValue163 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue160, multiplyAddValue115, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue160 * multiplyAddValue115);
    float multiplyAddValue164 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue161, multiplyAddValue116, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue161 * multiplyAddValue116);
    float multiplyAddValue209 = fma(scalarValue50, varyingColor3.x - 1.0, 1.0);
    float multiplyAddValue210 = fma(scalarValue50, varyingColor3.y - 1.0, 1.0);
    float multiplyAddValue211 = fma(scalarValue50, varyingColor3.z - 1.0, 1.0);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue162, multiplyAddValue209, varyingColor2.x), multiplyAddValue162 * multiplyAddValue209);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue163, multiplyAddValue210, varyingColor2.y), multiplyAddValue163 * multiplyAddValue210);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue164, multiplyAddValue211, varyingColor2.z), multiplyAddValue164 * multiplyAddValue211);
    fragmentColor0.w = scalarValue50;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue236 = multiplyAddValue166 * fragmentVectorConstants1.packedValues[5u].x;
    float productValue237 = multiplyAddValue166 * fragmentVectorConstants1.packedValues[5u].y;
    float productValue238 = multiplyAddValue166 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue40 = ceil(multiplyAddValue167);
    float multiplyAddValue169 = fma(scalarValue40, fma(multiplyAddValue167, fragmentVectorConstants1.packedValues[19u].x, -productValue236), productValue236);
    float multiplyAddValue170 = fma(scalarValue40, fma(multiplyAddValue167, fragmentVectorConstants1.packedValues[19u].y, -productValue237), productValue237);
    float multiplyAddValue171 = fma(scalarValue40, fma(multiplyAddValue167, fragmentVectorConstants1.packedValues[19u].z, -productValue238), productValue238);
    float scalarValue56 = spvNMax(multiplyAddValue168, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue114 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue115 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue116 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue172 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue169, multiplyAddValue114, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue169 * multiplyAddValue114);
    float multiplyAddValue173 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue170, multiplyAddValue115, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue170 * multiplyAddValue115);
    float multiplyAddValue174 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue171, multiplyAddValue116, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue171 * multiplyAddValue116);
    float multiplyAddValue227 = fma(scalarValue56, varyingColor3.x - 1.0, 1.0);
    float multiplyAddValue228 = fma(scalarValue56, varyingColor3.y - 1.0, 1.0);
    float multiplyAddValue229 = fma(scalarValue56, varyingColor3.z - 1.0, 1.0);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue172, multiplyAddValue227, varyingColor2.x), multiplyAddValue172 * multiplyAddValue227);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue173, multiplyAddValue228, varyingColor2.y), multiplyAddValue173 * multiplyAddValue228);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue174, multiplyAddValue229, varyingColor2.z), multiplyAddValue174 * multiplyAddValue229);
    fragmentColor0.w = scalarValue56;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue44 = (sampledTextureValue2.x * fragmentVectorConstants1.packedValues[16u].x) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue45 = (sampledTextureValue2.y * fragmentVectorConstants1.packedValues[16u].y) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue46 = (sampledTextureValue2.z * fragmentVectorConstants1.packedValues[16u].z) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue47 = (((fragmentVectorConstants1.packedValues[9u].x - productValue44) * fragmentVectorConstants1.packedValues[9u].w) + productValue44) * varyingColor3.x;
    float productValue48 = (((fragmentVectorConstants1.packedValues[9u].y - productValue45) * fragmentVectorConstants1.packedValues[9u].w) + productValue45) * varyingColor3.y;
    float productValue49 = (((fragmentVectorConstants1.packedValues[9u].z - productValue46) * fragmentVectorConstants1.packedValues[9u].w) + productValue46) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue47) * varyingColor2.w) + productValue47;
    fragmentColor0.y = ((varyingColor2.y - productValue48) * varyingColor2.w) + productValue48;
    fragmentColor0.z = ((varyingColor2.z - productValue49) * varyingColor2.w) + productValue49;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue41);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue52 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((productValue50 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[16u].x) - scalarValue13)) + scalarValue13);
    float productValue53 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((productValue50 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[16u].y) - scalarValue14)) + scalarValue14);
    float productValue54 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((productValue50 * ((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[16u].z) - scalarValue15)) + scalarValue15);
    float productValue55 = (((fragmentVectorConstants1.packedValues[9u].x - productValue52) * fragmentVectorConstants1.packedValues[9u].w) + productValue52) * varyingColor3.x;
    float productValue56 = (((fragmentVectorConstants1.packedValues[9u].y - productValue53) * fragmentVectorConstants1.packedValues[9u].w) + productValue53) * varyingColor3.y;
    float productValue57 = (((fragmentVectorConstants1.packedValues[9u].z - productValue54) * fragmentVectorConstants1.packedValues[9u].w) + productValue54) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue55) * varyingColor2.w) + productValue55;
    fragmentColor0.y = ((varyingColor2.y - productValue56) * varyingColor2.w) + productValue56;
    fragmentColor0.z = ((varyingColor2.z - productValue57) * varyingColor2.w) + productValue57;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue51);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue25 = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue92);
    float productValue95 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue89;
    float productValue96 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue90;
    float productValue97 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue91;
    float productValue98 = (((fragmentVectorConstants1.packedValues[9u].x - productValue95) * fragmentVectorConstants1.packedValues[9u].w) + productValue95) * ((scalarValue25 * (varyingColor3.x + (-1.0))) + 1.0);
    float productValue99 = (((fragmentVectorConstants1.packedValues[9u].y - productValue96) * fragmentVectorConstants1.packedValues[9u].w) + productValue96) * ((scalarValue25 * (varyingColor3.y + (-1.0))) + 1.0);
    float productValue100 = (((fragmentVectorConstants1.packedValues[9u].z - productValue97) * fragmentVectorConstants1.packedValues[9u].w) + productValue97) * ((scalarValue25 * (varyingColor3.z + (-1.0))) + 1.0);
    fragmentColor0.x = ((varyingColor2.x - productValue98) * varyingColor2.w) + productValue98;
    fragmentColor0.y = ((varyingColor2.y - productValue99) * varyingColor2.w) + productValue99;
    fragmentColor0.z = ((varyingColor2.z - productValue100) * varyingColor2.w) + productValue100;
    fragmentColor0.w = scalarValue25;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue28 = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue110);
    float productValue111 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * productValue107;
    float productValue112 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * productValue108;
    float productValue113 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * productValue109;
    float productValue114 = (((fragmentVectorConstants1.packedValues[9u].x - productValue111) * fragmentVectorConstants1.packedValues[9u].w) + productValue111) * ((scalarValue28 * (varyingColor3.x + (-1.0))) + 1.0);
    float productValue115 = (((fragmentVectorConstants1.packedValues[9u].y - productValue112) * fragmentVectorConstants1.packedValues[9u].w) + productValue112) * ((scalarValue28 * (varyingColor3.y + (-1.0))) + 1.0);
    float productValue116 = (((fragmentVectorConstants1.packedValues[9u].z - productValue113) * fragmentVectorConstants1.packedValues[9u].w) + productValue113) * ((scalarValue28 * (varyingColor3.z + (-1.0))) + 1.0);
    fragmentColor0.x = ((varyingColor2.x - productValue114) * varyingColor2.w) + productValue114;
    fragmentColor0.y = ((varyingColor2.y - productValue115) * varyingColor2.w) + productValue115;
    fragmentColor0.z = ((varyingColor2.z - productValue116) * varyingColor2.w) + productValue116;
    fragmentColor0.w = scalarValue28;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue25 = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue92);
    float productValue125 = (sampledTextureValue2.x * fragmentVectorConstants1.packedValues[17u].x) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue126 = (sampledTextureValue2.y * fragmentVectorConstants1.packedValues[17u].y) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue127 = (sampledTextureValue2.z * fragmentVectorConstants1.packedValues[17u].z) * ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue128 = (((fragmentVectorConstants1.packedValues[9u].x - productValue125) * fragmentVectorConstants1.packedValues[9u].w) + productValue125) * ((scalarValue25 * (varyingColor3.x + (-1.0))) + 1.0);
    float productValue129 = (((fragmentVectorConstants1.packedValues[9u].y - productValue126) * fragmentVectorConstants1.packedValues[9u].w) + productValue126) * ((scalarValue25 * (varyingColor3.y + (-1.0))) + 1.0);
    float productValue130 = (((fragmentVectorConstants1.packedValues[9u].z - productValue127) * fragmentVectorConstants1.packedValues[9u].w) + productValue127) * ((scalarValue25 * (varyingColor3.z + (-1.0))) + 1.0);
    fragmentColor0.x = ((varyingColor2.x - productValue128) * varyingColor2.w) + productValue128;
    fragmentColor0.y = ((varyingColor2.y - productValue129) * varyingColor2.w) + productValue129;
    fragmentColor0.z = ((varyingColor2.z - productValue130) * varyingColor2.w) + productValue130;
    fragmentColor0.w = scalarValue25;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float scalarValue28 = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue110);
    float productValue118 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((productValue50 * ((sampledTextureValue2.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue13)) + scalarValue13);
    float productValue119 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((productValue50 * ((sampledTextureValue2.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue14)) + scalarValue14);
    float productValue120 = ((fragmentVectorConstants1.packedValues[11u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((productValue50 * ((sampledTextureValue2.z * fragmentVectorConstants1.packedValues[17u].z) - scalarValue15)) + scalarValue15);
    float productValue121 = (((fragmentVectorConstants1.packedValues[9u].x - productValue118) * fragmentVectorConstants1.packedValues[9u].w) + productValue118) * ((scalarValue28 * (varyingColor3.x + (-1.0))) + 1.0);
    float productValue122 = (((fragmentVectorConstants1.packedValues[9u].y - productValue119) * fragmentVectorConstants1.packedValues[9u].w) + productValue119) * ((scalarValue28 * (varyingColor3.y + (-1.0))) + 1.0);
    float productValue123 = (((fragmentVectorConstants1.packedValues[9u].z - productValue120) * fragmentVectorConstants1.packedValues[9u].w) + productValue120) * ((scalarValue28 * (varyingColor3.z + (-1.0))) + 1.0);
    fragmentColor0.x = ((varyingColor2.x - productValue121) * varyingColor2.w) + productValue121;
    fragmentColor0.y = ((varyingColor2.y - productValue122) * varyingColor2.w) + productValue122;
    fragmentColor0.z = ((varyingColor2.z - productValue123) * varyingColor2.w) + productValue123;
    fragmentColor0.w = scalarValue28;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue149 = ((((fragmentVectorConstants1.packedValues[5u].x * productValue143) - productValue143) * productValue146) + productValue143) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue150 = ((((fragmentVectorConstants1.packedValues[5u].y * productValue144) - productValue144) * productValue146) + productValue144) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue151 = ((((fragmentVectorConstants1.packedValues[5u].z * productValue145) - productValue145) * productValue146) + productValue145) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue152 = (((fragmentVectorConstants1.packedValues[10u].x - productValue149) * fragmentVectorConstants1.packedValues[10u].w) + productValue149) * varyingColor3.x;
    float productValue153 = (((fragmentVectorConstants1.packedValues[10u].y - productValue150) * fragmentVectorConstants1.packedValues[10u].w) + productValue150) * varyingColor3.y;
    float productValue154 = (((fragmentVectorConstants1.packedValues[10u].z - productValue151) * fragmentVectorConstants1.packedValues[10u].w) + productValue151) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue152) * varyingColor2.w) + productValue152;
    fragmentColor0.y = ((varyingColor2.y - productValue153) * varyingColor2.w) + productValue153;
    fragmentColor0.z = ((varyingColor2.z - productValue154) * varyingColor2.w) + productValue154;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, fragmentVectorConstants1.packedValues[5u].w * productValue146);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue198 = ((((fragmentVectorConstants1.packedValues[5u].x * productValue194) - productValue194) * productValue197) + productValue194) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue199 = ((((fragmentVectorConstants1.packedValues[5u].y * productValue195) - productValue195) * productValue197) + productValue195) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue200 = ((((fragmentVectorConstants1.packedValues[5u].z * productValue196) - productValue196) * productValue197) + productValue196) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue201 = (((fragmentVectorConstants1.packedValues[10u].x - productValue198) * fragmentVectorConstants1.packedValues[10u].w) + productValue198) * varyingColor3.x;
    float productValue202 = (((fragmentVectorConstants1.packedValues[10u].y - productValue199) * fragmentVectorConstants1.packedValues[10u].w) + productValue199) * varyingColor3.y;
    float productValue203 = (((fragmentVectorConstants1.packedValues[10u].z - productValue200) * fragmentVectorConstants1.packedValues[10u].w) + productValue200) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue201) * varyingColor2.w) + productValue201;
    fragmentColor0.y = ((varyingColor2.y - productValue202) * varyingColor2.w) + productValue202;
    fragmentColor0.z = ((varyingColor2.z - productValue203) * varyingColor2.w) + productValue203;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, fragmentVectorConstants1.packedValues[5u].w * productValue197);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue204 = spvNMax(fragmentVectorConstants1.packedValues[0u].x, fragmentVectorConstants1.packedValues[5u].w * productValue146);
    float productValue149 = ((((fragmentVectorConstants1.packedValues[5u].x * productValue143) - productValue143) * productValue146) + productValue143) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue150 = ((((fragmentVectorConstants1.packedValues[5u].y * productValue144) - productValue144) * productValue146) + productValue144) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue151 = ((((fragmentVectorConstants1.packedValues[5u].z * productValue145) - productValue145) * productValue146) + productValue145) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue205 = (((fragmentVectorConstants1.packedValues[10u].x - productValue149) * fragmentVectorConstants1.packedValues[10u].w) + productValue149) * ((productValue204 * (varyingColor3.x + (-1.0))) + 1.0);
    float productValue206 = (((fragmentVectorConstants1.packedValues[10u].y - productValue150) * fragmentVectorConstants1.packedValues[10u].w) + productValue150) * ((productValue204 * (varyingColor3.y + (-1.0))) + 1.0);
    float productValue207 = (((fragmentVectorConstants1.packedValues[10u].z - productValue151) * fragmentVectorConstants1.packedValues[10u].w) + productValue151) * ((productValue204 * (varyingColor3.z + (-1.0))) + 1.0);
    fragmentColor0.x = ((varyingColor2.x - productValue205) * varyingColor2.w) + productValue205;
    fragmentColor0.y = ((varyingColor2.y - productValue206) * varyingColor2.w) + productValue206;
    fragmentColor0.z = ((varyingColor2.z - productValue207) * varyingColor2.w) + productValue207;
    fragmentColor0.w = productValue204;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue216 = spvNMax(fragmentVectorConstants1.packedValues[0u].x, fragmentVectorConstants1.packedValues[5u].w * productValue197);
    float productValue198 = ((((fragmentVectorConstants1.packedValues[5u].x * productValue194) - productValue194) * productValue197) + productValue194) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue199 = ((((fragmentVectorConstants1.packedValues[5u].y * productValue195) - productValue195) * productValue197) + productValue195) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue200 = ((((fragmentVectorConstants1.packedValues[5u].z * productValue196) - productValue196) * productValue197) + productValue196) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue217 = (((fragmentVectorConstants1.packedValues[10u].x - productValue198) * fragmentVectorConstants1.packedValues[10u].w) + productValue198) * ((productValue216 * (varyingColor3.x + (-1.0))) + 1.0);
    float productValue218 = (((fragmentVectorConstants1.packedValues[10u].y - productValue199) * fragmentVectorConstants1.packedValues[10u].w) + productValue199) * ((productValue216 * (varyingColor3.y + (-1.0))) + 1.0);
    float productValue219 = (((fragmentVectorConstants1.packedValues[10u].z - productValue200) * fragmentVectorConstants1.packedValues[10u].w) + productValue200) * ((productValue216 * (varyingColor3.z + (-1.0))) + 1.0);
    fragmentColor0.x = ((varyingColor2.x - productValue217) * varyingColor2.w) + productValue217;
    fragmentColor0.y = ((varyingColor2.y - productValue218) * varyingColor2.w) + productValue218;
    fragmentColor0.z = ((varyingColor2.z - productValue219) * varyingColor2.w) + productValue219;
    fragmentColor0.w = productValue216;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue226 = fragmentVectorConstants1.packedValues[5u].x * productValue143;
    float productValue227 = fragmentVectorConstants1.packedValues[5u].y * productValue143;
    float productValue228 = fragmentVectorConstants1.packedValues[5u].z * productValue143;
    float scalarValue39 = ceil(productValue144);
    float productValue229 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].x * productValue144) - productValue226) * scalarValue39) + productValue226);
    float productValue230 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].y * productValue144) - productValue227) * scalarValue39) + productValue227);
    float productValue231 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].z * productValue144) - productValue228) * scalarValue39) + productValue228);
    float productValue232 = (((fragmentVectorConstants1.packedValues[10u].x - productValue229) * fragmentVectorConstants1.packedValues[10u].w) + productValue229) * varyingColor3.x;
    float productValue233 = (((fragmentVectorConstants1.packedValues[10u].y - productValue230) * fragmentVectorConstants1.packedValues[10u].w) + productValue230) * varyingColor3.y;
    float productValue234 = (((fragmentVectorConstants1.packedValues[10u].z - productValue231) * fragmentVectorConstants1.packedValues[10u].w) + productValue231) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue232) * varyingColor2.w) + productValue232;
    fragmentColor0.y = ((varyingColor2.y - productValue233) * varyingColor2.w) + productValue233;
    fragmentColor0.z = ((varyingColor2.z - productValue234) * varyingColor2.w) + productValue234;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue146);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue253 = fragmentVectorConstants1.packedValues[5u].x * productValue250;
    float productValue254 = fragmentVectorConstants1.packedValues[5u].y * productValue250;
    float productValue255 = fragmentVectorConstants1.packedValues[5u].z * productValue250;
    float scalarValue42 = ceil(productValue251);
    float productValue256 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].x * productValue251) - productValue253) * scalarValue42) + productValue253);
    float productValue257 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].y * productValue251) - productValue254) * scalarValue42) + productValue254);
    float productValue258 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].z * productValue251) - productValue255) * scalarValue42) + productValue255);
    float productValue259 = (((fragmentVectorConstants1.packedValues[10u].x - productValue256) * fragmentVectorConstants1.packedValues[10u].w) + productValue256) * varyingColor3.x;
    float productValue260 = (((fragmentVectorConstants1.packedValues[10u].y - productValue257) * fragmentVectorConstants1.packedValues[10u].w) + productValue257) * varyingColor3.y;
    float productValue261 = (((fragmentVectorConstants1.packedValues[10u].z - productValue258) * fragmentVectorConstants1.packedValues[10u].w) + productValue258) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue259) * varyingColor2.w) + productValue259;
    fragmentColor0.y = ((varyingColor2.y - productValue260) * varyingColor2.w) + productValue260;
    fragmentColor0.z = ((varyingColor2.z - productValue261) * varyingColor2.w) + productValue261;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue252);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue226 = fragmentVectorConstants1.packedValues[5u].x * productValue143;
    float productValue227 = fragmentVectorConstants1.packedValues[5u].y * productValue143;
    float productValue228 = fragmentVectorConstants1.packedValues[5u].z * productValue143;
    float scalarValue39 = ceil(productValue144);
    float scalarValue46 = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue146);
    float productValue229 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].x * productValue144) - productValue226) * scalarValue39) + productValue226);
    float productValue230 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].y * productValue144) - productValue227) * scalarValue39) + productValue227);
    float productValue231 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].z * productValue144) - productValue228) * scalarValue39) + productValue228);
    float productValue272 = (((fragmentVectorConstants1.packedValues[10u].x - productValue229) * fragmentVectorConstants1.packedValues[10u].w) + productValue229) * ((scalarValue46 * (varyingColor3.x + (-1.0))) + 1.0);
    float productValue273 = (((fragmentVectorConstants1.packedValues[10u].y - productValue230) * fragmentVectorConstants1.packedValues[10u].w) + productValue230) * ((scalarValue46 * (varyingColor3.y + (-1.0))) + 1.0);
    float productValue274 = (((fragmentVectorConstants1.packedValues[10u].z - productValue231) * fragmentVectorConstants1.packedValues[10u].w) + productValue231) * ((scalarValue46 * (varyingColor3.z + (-1.0))) + 1.0);
    fragmentColor0.x = ((varyingColor2.x - productValue272) * varyingColor2.w) + productValue272;
    fragmentColor0.y = ((varyingColor2.y - productValue273) * varyingColor2.w) + productValue273;
    fragmentColor0.z = ((varyingColor2.z - productValue274) * varyingColor2.w) + productValue274;
    fragmentColor0.w = scalarValue46;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue290 = fragmentVectorConstants1.packedValues[5u].x * productValue194;
    float productValue291 = fragmentVectorConstants1.packedValues[5u].y * productValue194;
    float productValue292 = fragmentVectorConstants1.packedValues[5u].z * productValue194;
    float scalarValue53 = ceil(productValue195);
    float scalarValue54 = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue197);
    float productValue293 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].x * productValue195) - productValue290) * scalarValue53) + productValue290);
    float productValue294 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].y * productValue195) - productValue291) * scalarValue53) + productValue291);
    float productValue295 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].z * productValue195) - productValue292) * scalarValue53) + productValue292);
    float productValue296 = (((fragmentVectorConstants1.packedValues[10u].x - productValue293) * fragmentVectorConstants1.packedValues[10u].w) + productValue293) * ((scalarValue54 * (varyingColor3.x + (-1.0))) + 1.0);
    float productValue297 = (((fragmentVectorConstants1.packedValues[10u].y - productValue294) * fragmentVectorConstants1.packedValues[10u].w) + productValue294) * ((scalarValue54 * (varyingColor3.y + (-1.0))) + 1.0);
    float productValue298 = (((fragmentVectorConstants1.packedValues[10u].z - productValue295) * fragmentVectorConstants1.packedValues[10u].w) + productValue295) * ((scalarValue54 * (varyingColor3.z + (-1.0))) + 1.0);
    fragmentColor0.x = ((varyingColor2.x - productValue296) * varyingColor2.w) + productValue296;
    fragmentColor0.y = ((varyingColor2.y - productValue297) * varyingColor2.w) + productValue297;
    fragmentColor0.z = ((varyingColor2.z - productValue298) * varyingColor2.w) + productValue298;
    fragmentColor0.w = scalarValue54;
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_OPTION_EMISSIVE == RD_EMISSIVE_EMISSIVE_ONLY && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue253 = fragmentVectorConstants1.packedValues[5u].x * productValue250;
    float productValue254 = fragmentVectorConstants1.packedValues[5u].y * productValue250;
    float productValue255 = fragmentVectorConstants1.packedValues[5u].z * productValue250;
    float scalarValue42 = ceil(productValue251);
    float scalarValue57 = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue252);
    float productValue256 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].x * productValue251) - productValue253) * scalarValue42) + productValue253);
    float productValue257 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].y * productValue251) - productValue254) * scalarValue42) + productValue254);
    float productValue258 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[19u].z * productValue251) - productValue255) * scalarValue42) + productValue255);
    float productValue304 = (((fragmentVectorConstants1.packedValues[10u].x - productValue256) * fragmentVectorConstants1.packedValues[10u].w) + productValue256) * ((scalarValue57 * (varyingColor3.x + (-1.0))) + 1.0);
    float productValue305 = (((fragmentVectorConstants1.packedValues[10u].y - productValue257) * fragmentVectorConstants1.packedValues[10u].w) + productValue257) * ((scalarValue57 * (varyingColor3.y + (-1.0))) + 1.0);
    float productValue306 = (((fragmentVectorConstants1.packedValues[10u].z - productValue258) * fragmentVectorConstants1.packedValues[10u].w) + productValue258) * ((scalarValue57 * (varyingColor3.z + (-1.0))) + 1.0);
    fragmentColor0.x = ((varyingColor2.x - productValue304) * varyingColor2.w) + productValue304;
    fragmentColor0.y = ((varyingColor2.y - productValue305) * varyingColor2.w) + productValue305;
    fragmentColor0.z = ((varyingColor2.z - productValue306) * varyingColor2.w) + productValue306;
    fragmentColor0.w = scalarValue57;
#endif
    discardIfRequested();
}
