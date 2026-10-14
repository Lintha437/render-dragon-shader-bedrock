#version 460
#extension GL_GOOGLE_include_directive : require
// ActorGlint / AlphaTest / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 2
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/ActorGlint/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
    isFragmentDiscarded = false;
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue19 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x;
    precise float productValue20 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y;
    precise float productValue21 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[17u].z;
    precise float productValue22 = sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    precise float productValue23 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u];
    precise float productValue24 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u];
    precise float productValue25 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float scalarValue3 = rdDot3Precise(vec3(-productValue23, -productValue24, -productValue25), vec3(sumValue, sumValue1, sumValue2));
    precise float sumValue3 = fragmentScalarConstants1.packedValues[45u] - fragmentScalarConstants1.packedValues[44u];
    precise float sumValue4 = scalarValue3 - fragmentScalarConstants1.packedValues[44u];
    precise float quotientValue3 = 1.0 / sumValue3;
    precise float productValue26 = quotientValue3 * sumValue4;
    float scalarValue4 = spvNClamp(productValue26, 0.0, 1.0);
    precise float productValue27 = scalarValue4 * scalarValue4;
    precise float multiplyAddValue11 = productValue27 * fma(scalarValue4, -2.0, 3.0);
    precise float quotientValue4 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue5 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue12 = fma(quotientValue4, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].x;
    precise float multiplyAddValue13 = fma(quotientValue5, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].y;
    precise float quotientValue6 = multiplyAddValue12 / fragmentScalarConstants1.packedValues[46u];
    precise float quotientValue7 = multiplyAddValue13 / fragmentScalarConstants1.packedValues[46u];
    precise float productValue28 = floor(quotientValue6) * fragmentScalarConstants1.packedValues[46u];
    precise float productValue29 = floor(quotientValue7) * fragmentScalarConstants1.packedValues[46u];
    precise float productValue30 = productValue28 * 0.25;
    precise float productValue31 = productValue29 * 0.25;
    precise float productValue32 = productValue28 * 0.5;
    precise float productValue33 = productValue29 * 0.5;
    float scalarValue5 = floor(productValue31);
    float scalarValue6 = floor(productValue33);
    precise float productValue34 = scalarValue5 * scalarValue5;
    precise float productValue35 = scalarValue6 * scalarValue6;
    precise float productValue36 = productValue34 * 0.75;
    precise float productValue37 = productValue35 * 0.75;
    float scalarValue7 = floor(productValue29);
    precise float productValue38 = scalarValue7 * scalarValue7;
    precise float productValue39 = productValue38 * 0.75;
    precise float multiplyAddValue14 = fma(fma(fma(fract(fma(floor(productValue30), 0.5, productValue36)), 0.25, fract(fma(floor(productValue32), 0.5, productValue37))), 0.25, fract(fma(floor(productValue28), 0.5, productValue39))), 64.0, 0.5) * 0.015625;
    if ((productValue22 < 0.5) || ((fragmentScalarConstants1.packedValues[60u] != 0.0) && (multiplyAddValue14 >= multiplyAddValue11)))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue7.x;
    float scalarValue13 = sampledTextureValue7.y;
    float scalarValue14 = sampledTextureValue7.z;
    float scalarValue15 = sampledTextureValue7.w;
    precise float sumValue11 = scalarValue13 + scalarValue12;
    precise float sumValue12 = scalarValue14 + sumValue11;
    precise float sumValue13 = 1.0 - scalarValue15;
    precise float productValue55 = sumValue13 * sumValue12;
    float scalarValue16 = float(productValue55 > 0.0);
    float multiplyAddValue34 = fma(scalarValue16, fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue3.x, -scalarValue12), scalarValue12);
    float multiplyAddValue35 = fma(scalarValue16, fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue3.y, -scalarValue13), scalarValue13);
    float multiplyAddValue36 = fma(scalarValue16, fma(fragmentVectorConstants1.packedValues[17u].z, sampledTextureValue3.z, -scalarValue14), scalarValue14);
    float multiplyAddValue37 = fma(scalarValue16, fma(fragmentVectorConstants1.packedValues[17u].w, sampledTextureValue3.w, -scalarValue15), scalarValue15);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    precise float productValue23 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u];
    precise float productValue24 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u];
    precise float productValue25 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x;
    precise float sumValue1 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y;
    precise float sumValue2 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z;
    float scalarValue3 = rdDot3Precise(vec3(-productValue23, -productValue24, -productValue25), vec3(sumValue, sumValue1, sumValue2));
    precise float sumValue3 = fragmentScalarConstants1.packedValues[45u] - fragmentScalarConstants1.packedValues[44u];
    precise float sumValue4 = scalarValue3 - fragmentScalarConstants1.packedValues[44u];
    precise float quotientValue3 = 1.0 / sumValue3;
    precise float productValue26 = quotientValue3 * sumValue4;
    float scalarValue4 = spvNClamp(productValue26, 0.0, 1.0);
    precise float productValue27 = scalarValue4 * scalarValue4;
    precise float multiplyAddValue11 = productValue27 * fma(scalarValue4, -2.0, 3.0);
    precise float quotientValue4 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue5 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue12 = fma(quotientValue4, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].x;
    precise float multiplyAddValue13 = fma(quotientValue5, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].y;
    precise float quotientValue6 = multiplyAddValue12 / fragmentScalarConstants1.packedValues[46u];
    precise float quotientValue7 = multiplyAddValue13 / fragmentScalarConstants1.packedValues[46u];
    precise float productValue28 = floor(quotientValue6) * fragmentScalarConstants1.packedValues[46u];
    precise float productValue29 = floor(quotientValue7) * fragmentScalarConstants1.packedValues[46u];
    precise float productValue30 = productValue28 * 0.25;
    precise float productValue31 = productValue29 * 0.25;
    precise float productValue32 = productValue28 * 0.5;
    precise float productValue33 = productValue29 * 0.5;
    float scalarValue5 = floor(productValue31);
    float scalarValue6 = floor(productValue33);
    precise float productValue34 = scalarValue5 * scalarValue5;
    precise float productValue35 = scalarValue6 * scalarValue6;
    precise float productValue36 = productValue34 * 0.75;
    precise float productValue37 = productValue35 * 0.75;
    float scalarValue7 = floor(productValue29);
    precise float productValue38 = scalarValue7 * scalarValue7;
    precise float productValue39 = productValue38 * 0.75;
    precise float multiplyAddValue14 = fma(fma(fma(fract(fma(floor(productValue30), 0.5, productValue36)), 0.25, fract(fma(floor(productValue32), 0.5, productValue37))), 0.25, fract(fma(floor(productValue28), 0.5, productValue39))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[60u] != 0.0) && (multiplyAddValue14 >= multiplyAddValue11)) || (multiplyAddValue37 < 0.5))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue81 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[19u].x;
    precise float productValue82 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[19u].y;
    precise float productValue83 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[19u].z;
    precise float productValue84 = sampledTextureValue3.w * fragmentVectorConstants1.packedValues[19u].w;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    precise float productValue23 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u];
    precise float productValue24 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u];
    precise float productValue25 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue19 = rdDot3Precise(vec3(-productValue23, -productValue24, -productValue25), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue19 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue11 = 1.0 / sumValue20;
    precise float productValue85 = quotientValue11 * sumValue21;
    float scalarValue20 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue20 * scalarValue20;
    precise float multiplyAddValue58 = productValue86 * fma(scalarValue20, -2.0, 3.0);
    precise float quotientValue4 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue5 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue59 = fma(quotientValue4, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue60 = fma(quotientValue5, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue12 = multiplyAddValue59 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue13 = multiplyAddValue60 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue87 = floor(quotientValue12) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue88 = floor(quotientValue13) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue21 = floor(productValue90);
    float scalarValue22 = floor(productValue92);
    precise float productValue93 = scalarValue21 * scalarValue21;
    precise float productValue94 = scalarValue22 * scalarValue22;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue23 = floor(productValue88);
    precise float productValue97 = scalarValue23 * scalarValue23;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue61 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue61 >= multiplyAddValue58)) || (productValue84 < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue7.x;
    float scalarValue13 = sampledTextureValue7.y;
    float scalarValue14 = sampledTextureValue7.z;
    float scalarValue15 = sampledTextureValue7.w;
    precise float sumValue11 = scalarValue13 + scalarValue12;
    precise float sumValue12 = scalarValue14 + sumValue11;
    precise float sumValue13 = 1.0 - scalarValue15;
    precise float productValue55 = sumValue13 * sumValue12;
    float scalarValue16 = float(productValue55 > 0.0);
    float multiplyAddValue77 = fma(scalarValue16, fma(fragmentVectorConstants1.packedValues[19u].x, sampledTextureValue3.x, -scalarValue12), scalarValue12);
    float multiplyAddValue78 = fma(scalarValue16, fma(fragmentVectorConstants1.packedValues[19u].y, sampledTextureValue3.y, -scalarValue13), scalarValue13);
    float multiplyAddValue79 = fma(scalarValue16, fma(fragmentVectorConstants1.packedValues[19u].z, sampledTextureValue3.z, -scalarValue14), scalarValue14);
    float multiplyAddValue80 = fma(scalarValue16, fma(fragmentVectorConstants1.packedValues[19u].w, sampledTextureValue3.w, -scalarValue15), scalarValue15);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    precise float productValue23 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u];
    precise float productValue24 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u];
    precise float productValue25 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue19 = rdDot3Precise(vec3(-productValue23, -productValue24, -productValue25), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue19 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue11 = 1.0 / sumValue20;
    precise float productValue85 = quotientValue11 * sumValue21;
    float scalarValue20 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue20 * scalarValue20;
    precise float multiplyAddValue58 = productValue86 * fma(scalarValue20, -2.0, 3.0);
    precise float quotientValue4 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue5 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue59 = fma(quotientValue4, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue60 = fma(quotientValue5, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue12 = multiplyAddValue59 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue13 = multiplyAddValue60 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue87 = floor(quotientValue12) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue88 = floor(quotientValue13) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue21 = floor(productValue90);
    float scalarValue22 = floor(productValue92);
    precise float productValue93 = scalarValue21 * scalarValue21;
    precise float productValue94 = scalarValue22 * scalarValue22;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue23 = floor(productValue88);
    precise float productValue97 = scalarValue23 * scalarValue23;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue61 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue61 >= multiplyAddValue58)) || (multiplyAddValue80 < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue81 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[19u].x;
    precise float productValue82 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[19u].y;
    precise float productValue132 = sampledTextureValue3.w * fragmentScalarConstants1.packedValues[79u];
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    precise float productValue23 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u];
    precise float productValue24 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u];
    precise float productValue25 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue19 = rdDot3Precise(vec3(-productValue23, -productValue24, -productValue25), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue19 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue11 = 1.0 / sumValue20;
    precise float productValue85 = quotientValue11 * sumValue21;
    float scalarValue20 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue20 * scalarValue20;
    precise float multiplyAddValue58 = productValue86 * fma(scalarValue20, -2.0, 3.0);
    precise float quotientValue4 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue5 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue59 = fma(quotientValue4, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue60 = fma(quotientValue5, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue12 = multiplyAddValue59 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue13 = multiplyAddValue60 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue87 = floor(quotientValue12) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue88 = floor(quotientValue13) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue21 = floor(productValue90);
    float scalarValue22 = floor(productValue92);
    precise float productValue93 = scalarValue21 * scalarValue21;
    precise float productValue94 = scalarValue22 * scalarValue22;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue23 = floor(productValue88);
    precise float productValue97 = scalarValue23 * scalarValue23;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue61 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue61 >= multiplyAddValue58)) || (productValue132 < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue7.x;
    float scalarValue13 = sampledTextureValue7.y;
    float scalarValue15 = sampledTextureValue7.w;
    precise float sumValue11 = scalarValue13 + scalarValue12;
    precise float sumValue31 = sampledTextureValue7.z + sumValue11;
    precise float sumValue13 = 1.0 - scalarValue15;
    precise float productValue160 = sumValue31 * sumValue13;
    float scalarValue29 = float(productValue160 > 0.0);
    float multiplyAddValue130 = fma(scalarValue29, fma(fragmentVectorConstants1.packedValues[19u].x, sampledTextureValue3.x, -scalarValue12), scalarValue12);
    float multiplyAddValue131 = fma(scalarValue29, fma(fragmentVectorConstants1.packedValues[19u].y, sampledTextureValue3.y, -scalarValue13), scalarValue13);
    float multiplyAddValue132 = fma(scalarValue29, fma(fragmentScalarConstants1.packedValues[79u], sampledTextureValue3.w, -scalarValue15), scalarValue15);
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    precise float productValue23 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u];
    precise float productValue24 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u];
    precise float productValue25 = inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u];
    precise float sumValue17 = varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x;
    precise float sumValue18 = varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y;
    precise float sumValue19 = varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z;
    float scalarValue19 = rdDot3Precise(vec3(-productValue23, -productValue24, -productValue25), vec3(sumValue17, sumValue18, sumValue19));
    precise float sumValue20 = fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u];
    precise float sumValue21 = scalarValue19 - fragmentScalarConstants1.packedValues[52u];
    precise float quotientValue11 = 1.0 / sumValue20;
    precise float productValue85 = quotientValue11 * sumValue21;
    float scalarValue20 = spvNClamp(productValue85, 0.0, 1.0);
    precise float productValue86 = scalarValue20 * scalarValue20;
    precise float multiplyAddValue58 = productValue86 * fma(scalarValue20, -2.0, 3.0);
    precise float quotientValue4 = varyingColor1.x / varyingColor1.w;
    precise float quotientValue5 = varyingColor1.y / varyingColor1.w;
    precise float multiplyAddValue59 = fma(quotientValue4, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x;
    precise float multiplyAddValue60 = fma(quotientValue5, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y;
    precise float quotientValue12 = multiplyAddValue59 / fragmentScalarConstants1.packedValues[54u];
    precise float quotientValue13 = multiplyAddValue60 / fragmentScalarConstants1.packedValues[54u];
    precise float productValue87 = floor(quotientValue12) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue88 = floor(quotientValue13) * fragmentScalarConstants1.packedValues[54u];
    precise float productValue89 = productValue87 * 0.25;
    precise float productValue90 = productValue88 * 0.25;
    precise float productValue91 = productValue87 * 0.5;
    precise float productValue92 = productValue88 * 0.5;
    float scalarValue21 = floor(productValue90);
    float scalarValue22 = floor(productValue92);
    precise float productValue93 = scalarValue21 * scalarValue21;
    precise float productValue94 = scalarValue22 * scalarValue22;
    precise float productValue95 = productValue93 * 0.75;
    precise float productValue96 = productValue94 * 0.75;
    float scalarValue23 = floor(productValue88);
    precise float productValue97 = scalarValue23 * scalarValue23;
    precise float productValue98 = productValue97 * 0.75;
    precise float multiplyAddValue61 = fma(fma(fma(fract(fma(floor(productValue89), 0.5, productValue95)), 0.25, fract(fma(floor(productValue91), 0.5, productValue96))), 0.25, fract(fma(floor(productValue87), 0.5, productValue98))), 64.0, 0.5) * 0.015625;
    if (((fragmentScalarConstants1.packedValues[68u] != 0.0) && (multiplyAddValue61 >= multiplyAddValue58)) || (multiplyAddValue132 < fragmentScalarConstants1.packedValues[44u]))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue12 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[17u].x;
    float productValue13 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[17u].y;
    float productValue14 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[17u].z;
    float productValue15 = sampledTextureValue3.w * fragmentVectorConstants1.packedValues[17u].w;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    float productValue16 = rdDot3Precise(vec3(-(inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z));
    float quotientValue2 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[45u] - fragmentScalarConstants1.packedValues[44u])) * (productValue16 - fragmentScalarConstants1.packedValues[44u]), 0.0, 1.0);
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentScalarConstants1.packedValues[46u]) * fragmentScalarConstants1.packedValues[46u];
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentScalarConstants1.packedValues[46u]) * fragmentScalarConstants1.packedValues[46u];
    float productValue17 = floor(multiplyAddValue1 * 0.25);
    float productValue18 = floor(multiplyAddValue1 * 0.5);
    float scalarValue2 = floor(multiplyAddValue1);
    if ((productValue15 < 0.5) || ((fragmentScalarConstants1.packedValues[60u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue17 * productValue17) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue18 * productValue18) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue2 * scalarValue2) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue2 * quotientValue2) * fma(quotientValue2, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue7.x;
    float scalarValue13 = sampledTextureValue7.y;
    float scalarValue14 = sampledTextureValue7.z;
    float scalarValue15 = sampledTextureValue7.w;
    bool productValue54 = ((1.0 - scalarValue15) * (scalarValue14 + (scalarValue13 + scalarValue12))) > 0.0;
    float multiplyAddValue27 = productValue54 ? (fma(fragmentVectorConstants1.packedValues[17u].x, sampledTextureValue3.x, -scalarValue12) + scalarValue12) : scalarValue12;
    float multiplyAddValue28 = productValue54 ? (fma(fragmentVectorConstants1.packedValues[17u].y, sampledTextureValue3.y, -scalarValue13) + scalarValue13) : scalarValue13;
    float multiplyAddValue29 = productValue54 ? (fma(fragmentVectorConstants1.packedValues[17u].z, sampledTextureValue3.z, -scalarValue14) + scalarValue14) : scalarValue14;
    float multiplyAddValue30 = productValue54 ? (fma(fragmentVectorConstants1.packedValues[17u].w, sampledTextureValue3.w, -scalarValue15) + scalarValue15) : scalarValue15;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    float productValue16 = rdDot3Precise(vec3(-(inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z));
    float quotientValue2 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[45u] - fragmentScalarConstants1.packedValues[44u])) * (productValue16 - fragmentScalarConstants1.packedValues[44u]), 0.0, 1.0);
    float multiplyAddValue = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentScalarConstants1.packedValues[46u]) * fragmentScalarConstants1.packedValues[46u];
    float multiplyAddValue1 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentScalarConstants1.packedValues[46u]) * fragmentScalarConstants1.packedValues[46u];
    float productValue17 = floor(multiplyAddValue1 * 0.25);
    float productValue18 = floor(multiplyAddValue1 * 0.5);
    float scalarValue2 = floor(multiplyAddValue1);
    if ((multiplyAddValue30 < 0.5) || ((fragmentScalarConstants1.packedValues[60u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue * 0.25), 0.5, (productValue17 * productValue17) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue * 0.5), 0.5, (productValue18 * productValue18) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue), 0.5, (scalarValue2 * scalarValue2) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue2 * quotientValue2) * fma(quotientValue2, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue74 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[19u].x;
    float productValue75 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[19u].y;
    float productValue76 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[19u].z;
    float productValue77 = sampledTextureValue3.w * fragmentVectorConstants1.packedValues[19u].w;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    float productValue78 = rdDot3Precise(vec3(-(inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue10 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue78 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue44 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue45 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue79 = floor(multiplyAddValue45 * 0.25);
    float productValue80 = floor(multiplyAddValue45 * 0.5);
    float scalarValue18 = floor(multiplyAddValue45);
    if ((productValue77 < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue44 * 0.25), 0.5, (productValue79 * productValue79) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue44 * 0.5), 0.5, (productValue80 * productValue80) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue44), 0.5, (scalarValue18 * scalarValue18) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue10 * quotientValue10) * fma(quotientValue10, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue7.x;
    float scalarValue13 = sampledTextureValue7.y;
    float scalarValue14 = sampledTextureValue7.z;
    float scalarValue15 = sampledTextureValue7.w;
    bool productValue54 = ((1.0 - scalarValue15) * (scalarValue14 + (scalarValue13 + scalarValue12))) > 0.0;
    float multiplyAddValue90 = productValue54 ? (fma(fragmentVectorConstants1.packedValues[19u].x, sampledTextureValue3.x, -scalarValue12) + scalarValue12) : scalarValue12;
    float multiplyAddValue91 = productValue54 ? (fma(fragmentVectorConstants1.packedValues[19u].y, sampledTextureValue3.y, -scalarValue13) + scalarValue13) : scalarValue13;
    float multiplyAddValue92 = productValue54 ? (fma(fragmentVectorConstants1.packedValues[19u].z, sampledTextureValue3.z, -scalarValue14) + scalarValue14) : scalarValue14;
    float multiplyAddValue93 = productValue54 ? (fma(fragmentVectorConstants1.packedValues[19u].w, sampledTextureValue3.w, -scalarValue15) + scalarValue15) : scalarValue15;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    float productValue78 = rdDot3Precise(vec3(-(inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue10 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue78 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue44 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue45 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue79 = floor(multiplyAddValue45 * 0.25);
    float productValue80 = floor(multiplyAddValue45 * 0.5);
    float scalarValue18 = floor(multiplyAddValue45);
    if ((multiplyAddValue93 < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue44 * 0.25), 0.5, (productValue79 * productValue79) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue44 * 0.5), 0.5, (productValue80 * productValue80) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue44), 0.5, (scalarValue18 * scalarValue18) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue10 * quotientValue10) * fma(quotientValue10, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue74 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[19u].x;
    float productValue75 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[19u].y;
    float productValue139 = sampledTextureValue3.w * fragmentScalarConstants1.packedValues[79u];
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    float productValue78 = rdDot3Precise(vec3(-(inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue10 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue78 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue44 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue45 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue79 = floor(multiplyAddValue45 * 0.25);
    float productValue80 = floor(multiplyAddValue45 * 0.5);
    float scalarValue18 = floor(multiplyAddValue45);
    if ((productValue139 < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue44 * 0.25), 0.5, (productValue79 * productValue79) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue44 * 0.5), 0.5, (productValue80 * productValue80) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue44), 0.5, (scalarValue18 * scalarValue18) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue10 * quotientValue10) * fma(quotientValue10, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue12 = sampledTextureValue7.x;
    float scalarValue13 = sampledTextureValue7.y;
    float scalarValue15 = sampledTextureValue7.w;
    bool productValue156 = ((sampledTextureValue7.z + (scalarValue13 + scalarValue12)) * (1.0 - scalarValue15)) > 0.0;
    float multiplyAddValue121 = productValue156 ? (fma(fragmentVectorConstants1.packedValues[19u].x, sampledTextureValue3.x, -scalarValue12) + scalarValue12) : scalarValue12;
    float multiplyAddValue122 = productValue156 ? (fma(fragmentVectorConstants1.packedValues[19u].y, sampledTextureValue3.y, -scalarValue13) + scalarValue13) : scalarValue13;
    float multiplyAddValue123 = productValue156 ? (fma(fragmentScalarConstants1.packedValues[79u], sampledTextureValue3.w, -scalarValue15) + scalarValue15) : scalarValue15;
    vec3 vectorValue = vec3(fragmentScalarConstants1.packedValues[6u], fragmentScalarConstants1.packedValues[10u], fragmentScalarConstants1.packedValues[14u]);
    float scalarValue1 = rdDot3Precise(vectorValue, vectorValue);
    float inverseLengthValue1 = inversesqrt(scalarValue1);
    float productValue78 = rdDot3Precise(vec3(-(inverseLengthValue1 * fragmentScalarConstants1.packedValues[6u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[10u]), -(inverseLengthValue1 * fragmentScalarConstants1.packedValues[14u])), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z));
    float quotientValue10 = spvNClamp((1.0 / (fragmentScalarConstants1.packedValues[53u] - fragmentScalarConstants1.packedValues[52u])) * (productValue78 - fragmentScalarConstants1.packedValues[52u]), 0.0, 1.0);
    float multiplyAddValue44 = floor((fma(varyingColor1.x / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float multiplyAddValue45 = floor((fma(varyingColor1.y / varyingColor1.w, 0.5, 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentScalarConstants1.packedValues[54u]) * fragmentScalarConstants1.packedValues[54u];
    float productValue79 = floor(multiplyAddValue45 * 0.25);
    float productValue80 = floor(multiplyAddValue45 * 0.5);
    float scalarValue18 = floor(multiplyAddValue45);
    if ((multiplyAddValue123 < fragmentScalarConstants1.packedValues[44u]) || ((fragmentScalarConstants1.packedValues[68u] != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue44 * 0.25), 0.5, (productValue79 * productValue79) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue44 * 0.5), 0.5, (productValue80 * productValue80) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue44), 0.5, (scalarValue18 * scalarValue18) * 0.75))), 64.0, 0.5) * 0.015625) >= ((quotientValue10 * quotientValue10) * fma(quotientValue10, -2.0, 3.0)))))
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.w * fragmentVectorConstants1.packedValues[17u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue1 = floor(quotientValue1 * 0.25);
        float productValue2 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue2 * productValue2) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue1 * productValue1) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((productValue < 0.5) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue6 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue6.x;
    float scalarValue9 = sampledTextureValue6.y;
    float scalarValue10 = sampledTextureValue6.z;
    float scalarValue11 = sampledTextureValue6.w;
    float productValue46 = float((((scalarValue8 + scalarValue9) + scalarValue10) * (1.0 - scalarValue11)) > 0.0);
    float productValue47 = (productValue46 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[17u].w) - scalarValue11)) + scalarValue11;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[15u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[11u].x) / (fragmentVectorConstants1.packedValues[11u].y - fragmentVectorConstants1.packedValues[11u].x), 0.0, 1.0);
        float quotientValue = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].x) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float quotientValue1 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[14u].y) / fragmentVectorConstants1.packedValues[11u].z) * fragmentVectorConstants1.packedValues[11u].z;
        float productValue1 = floor(quotientValue1 * 0.25);
        float productValue2 = floor(quotientValue1 * 0.5);
        float scalarValue = floor(quotientValue1);
        comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue2 * productValue2) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue1 * productValue1) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue * scalarValue) * 0.75) + (floor(quotientValue) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((productValue47 < 0.5) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue59 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[19u].x;
    float productValue60 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[19u].y;
    float productValue61 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[19u].z;
    float productValue62 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[19u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue8 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue9 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue63 = floor(quotientValue9 * 0.25);
        float productValue64 = floor(quotientValue9 * 0.5);
        float scalarValue17 = floor(quotientValue9);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue64 * productValue64) * 0.75) + (floor(quotientValue8 * 0.5) * 0.5)) + (fract(((productValue63 * productValue63) * 0.75) + (floor(quotientValue8 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue17 * scalarValue17) * 0.75) + (floor(quotientValue8) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((productValue62 < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue6 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue6.x;
    float scalarValue9 = sampledTextureValue6.y;
    float scalarValue10 = sampledTextureValue6.z;
    float scalarValue11 = sampledTextureValue6.w;
    float productValue46 = float((((scalarValue8 + scalarValue9) + scalarValue10) * (1.0 - scalarValue11)) > 0.0);
    float productValue106 = (productValue46 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[19u].x) - scalarValue8)) + scalarValue8;
    float productValue107 = (productValue46 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[19u].y) - scalarValue9)) + scalarValue9;
    float productValue108 = (productValue46 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[19u].z) - scalarValue10)) + scalarValue10;
    float productValue109 = (productValue46 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[19u].w) - scalarValue11)) + scalarValue11;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue8 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue9 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue63 = floor(quotientValue9 * 0.25);
        float productValue64 = floor(quotientValue9 * 0.5);
        float scalarValue17 = floor(quotientValue9);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue64 * productValue64) * 0.75) + (floor(quotientValue8 * 0.5) * 0.5)) + (fract(((productValue63 * productValue63) * 0.75) + (floor(quotientValue8 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue17 * scalarValue17) * 0.75) + (floor(quotientValue8) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((productValue109 < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue59 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[19u].x;
    float productValue60 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[19u].y;
    float productValue62 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[19u].w;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue8 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue9 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue63 = floor(quotientValue9 * 0.25);
        float productValue64 = floor(quotientValue9 * 0.5);
        float scalarValue17 = floor(quotientValue9);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue64 * productValue64) * 0.75) + (floor(quotientValue8 * 0.5) * 0.5)) + (fract(((productValue63 * productValue63) * 0.75) + (floor(quotientValue8 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue17 * scalarValue17) * 0.75) + (floor(quotientValue8) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((productValue62 < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue6 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue8 = sampledTextureValue6.x;
    float scalarValue9 = sampledTextureValue6.y;
    float scalarValue11 = sampledTextureValue6.w;
    float productValue143 = float((((scalarValue8 + scalarValue9) + sampledTextureValue6.z) * (1.0 - scalarValue11)) > 0.0);
    float productValue144 = (productValue143 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[19u].x) - scalarValue8)) + scalarValue8;
    float productValue145 = (productValue143 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[19u].y) - scalarValue9)) + scalarValue9;
    float productValue146 = (productValue143 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[19u].w) - scalarValue11)) + scalarValue11;
    bool comparisonValue;
    if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
    {
        float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z), vec3(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[3u].z)));
        float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[3u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[9u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[9u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[9u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
        float quotientValue8 = floor(((((varyingColor1.x / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float quotientValue9 = floor(((((varyingColor1.y / varyingColor1.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
        float productValue63 = floor(quotientValue9 * 0.25);
        float productValue64 = floor(quotientValue9 * 0.5);
        float scalarValue17 = floor(quotientValue9);
        comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue64 * productValue64) * 0.75) + (floor(quotientValue8 * 0.5) * 0.5)) + (fract(((productValue63 * productValue63) * 0.75) + (floor(quotientValue8 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue17 * scalarValue17) * 0.75) + (floor(quotientValue8) * 0.5)));
    }
    else
    {
        comparisonValue = false;
    }
    if ((productValue146 < fragmentVectorConstants1.packedValues[11u].x) || comparisonValue)
#endif
    {
        isFragmentDiscarded = true;
    }
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    fragmentColor0.w = spvNMax(productValue22, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue15 = fma(fragmentScalarConstants1.packedValues[40u], sumValue5, 1.0);
    float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[40u], sumValue6, 1.0);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[40u], sumValue7, 1.0);
    precise float productValue40 = productValue19 * multiplyAddValue15;
    precise float productValue41 = productValue20 * multiplyAddValue16;
    precise float productValue42 = productValue21 * multiplyAddValue17;
    precise float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue19, multiplyAddValue15, fragmentVectorConstants1.packedValues[9u].x), productValue40) * varyingColor3.x;
    precise float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue20, multiplyAddValue16, fragmentVectorConstants1.packedValues[9u].y), productValue41) * varyingColor3.y;
    precise float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue21, multiplyAddValue17, fragmentVectorConstants1.packedValues[9u].z), productValue42) * varyingColor3.z;
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    precise float productValue43 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[16u].x;
    precise float productValue44 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[16u].y;
    precise float productValue45 = sampledTextureValue5.z * fragmentVectorConstants1.packedValues[16u].z;
    precise float multiplyAddValue21 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[16u].x, productValue43) * fragmentVectorConstants1.packedValues[18u].x;
    precise float multiplyAddValue22 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[16u].y, productValue44) * fragmentVectorConstants1.packedValues[18u].y;
    precise float multiplyAddValue23 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[16u].z, productValue45) * fragmentVectorConstants1.packedValues[18u].z;
    float multiplyAddValue24 = fma(multiplyAddValue21, multiplyAddValue21, multiplyAddValue18);
    float multiplyAddValue25 = fma(multiplyAddValue22, multiplyAddValue22, multiplyAddValue19);
    float multiplyAddValue26 = fma(multiplyAddValue23, multiplyAddValue23, multiplyAddValue20);
    precise float sumValue8 = varyingColor2.x - multiplyAddValue24;
    precise float sumValue9 = varyingColor2.y - multiplyAddValue25;
    precise float sumValue10 = varyingColor2.z - multiplyAddValue26;
    fragmentColor0.x = fma(varyingColor2.w, sumValue8, multiplyAddValue24);
    fragmentColor0.y = fma(varyingColor2.w, sumValue9, multiplyAddValue25);
    fragmentColor0.z = fma(varyingColor2.w, sumValue10, multiplyAddValue26);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    fragmentColor0.w = spvNMax(multiplyAddValue37, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue15 = fma(fragmentScalarConstants1.packedValues[40u], sumValue5, 1.0);
    float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[40u], sumValue6, 1.0);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[40u], sumValue7, 1.0);
    precise float productValue56 = multiplyAddValue34 * multiplyAddValue15;
    precise float productValue57 = multiplyAddValue35 * multiplyAddValue16;
    precise float productValue58 = multiplyAddValue36 * multiplyAddValue17;
    precise float multiplyAddValue38 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue34, multiplyAddValue15, fragmentVectorConstants1.packedValues[9u].x), productValue56) * varyingColor3.x;
    precise float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue35, multiplyAddValue16, fragmentVectorConstants1.packedValues[9u].y), productValue57) * varyingColor3.y;
    precise float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue36, multiplyAddValue17, fragmentVectorConstants1.packedValues[9u].z), productValue58) * varyingColor3.z;
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    precise float productValue43 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[16u].x;
    precise float productValue44 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[16u].y;
    precise float productValue45 = sampledTextureValue5.z * fragmentVectorConstants1.packedValues[16u].z;
    precise float multiplyAddValue21 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[16u].x, productValue43) * fragmentVectorConstants1.packedValues[18u].x;
    precise float multiplyAddValue22 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[16u].y, productValue44) * fragmentVectorConstants1.packedValues[18u].y;
    precise float multiplyAddValue23 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[16u].z, productValue45) * fragmentVectorConstants1.packedValues[18u].z;
    float multiplyAddValue41 = fma(multiplyAddValue21, multiplyAddValue21, multiplyAddValue38);
    float multiplyAddValue42 = fma(multiplyAddValue22, multiplyAddValue22, multiplyAddValue39);
    float multiplyAddValue43 = fma(multiplyAddValue23, multiplyAddValue23, multiplyAddValue40);
    precise float sumValue14 = varyingColor2.x - multiplyAddValue41;
    precise float sumValue15 = varyingColor2.y - multiplyAddValue42;
    precise float sumValue16 = varyingColor2.z - multiplyAddValue43;
    fragmentColor0.x = fma(varyingColor2.w, sumValue14, multiplyAddValue41);
    fragmentColor0.y = fma(varyingColor2.w, sumValue15, multiplyAddValue42);
    fragmentColor0.z = fma(varyingColor2.w, sumValue16, multiplyAddValue43);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue99 = productValue84 * fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue62 = fma(productValue84, fma(productValue81, fragmentVectorConstants1.packedValues[5u].x, -productValue81), productValue81);
    float multiplyAddValue63 = fma(productValue84, fma(productValue82, fragmentVectorConstants1.packedValues[5u].y, -productValue82), productValue82);
    float multiplyAddValue64 = fma(productValue84, fma(productValue83, fragmentVectorConstants1.packedValues[5u].z, -productValue83), productValue83);
    fragmentColor0.w = spvNMax(productValue99, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue66 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue67 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue100 = multiplyAddValue62 * multiplyAddValue65;
    precise float productValue101 = multiplyAddValue63 * multiplyAddValue66;
    precise float productValue102 = multiplyAddValue64 * multiplyAddValue67;
    precise float multiplyAddValue68 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue62, multiplyAddValue65, fragmentVectorConstants1.packedValues[10u].x), productValue100) * varyingColor3.x;
    precise float multiplyAddValue69 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue63, multiplyAddValue66, fragmentVectorConstants1.packedValues[10u].y), productValue101) * varyingColor3.y;
    precise float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue64, multiplyAddValue67, fragmentVectorConstants1.packedValues[10u].z), productValue102) * varyingColor3.z;
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    precise float productValue103 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[18u].x;
    precise float productValue104 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[18u].y;
    precise float productValue105 = sampledTextureValue5.z * fragmentVectorConstants1.packedValues[18u].z;
    precise float multiplyAddValue71 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[18u].x, productValue103) * fragmentVectorConstants1.packedValues[20u].x;
    precise float multiplyAddValue72 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[18u].y, productValue104) * fragmentVectorConstants1.packedValues[20u].y;
    precise float multiplyAddValue73 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[18u].z, productValue105) * fragmentVectorConstants1.packedValues[20u].z;
    float multiplyAddValue74 = fma(multiplyAddValue71, multiplyAddValue71, multiplyAddValue68);
    float multiplyAddValue75 = fma(multiplyAddValue72, multiplyAddValue72, multiplyAddValue69);
    float multiplyAddValue76 = fma(multiplyAddValue73, multiplyAddValue73, multiplyAddValue70);
    precise float sumValue22 = varyingColor2.x - multiplyAddValue74;
    precise float sumValue23 = varyingColor2.y - multiplyAddValue75;
    precise float sumValue24 = varyingColor2.z - multiplyAddValue76;
    fragmentColor0.x = fma(varyingColor2.w, sumValue22, multiplyAddValue74);
    fragmentColor0.y = fma(varyingColor2.w, sumValue23, multiplyAddValue75);
    fragmentColor0.z = fma(varyingColor2.w, sumValue24, multiplyAddValue76);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue116 = multiplyAddValue80 * fragmentScalarConstants1.packedValues[23u];
    float multiplyAddValue81 = fma(multiplyAddValue80, fma(multiplyAddValue77, fragmentVectorConstants1.packedValues[5u].x, -multiplyAddValue77), multiplyAddValue77);
    float multiplyAddValue82 = fma(multiplyAddValue80, fma(multiplyAddValue78, fragmentVectorConstants1.packedValues[5u].y, -multiplyAddValue78), multiplyAddValue78);
    float multiplyAddValue83 = fma(multiplyAddValue80, fma(multiplyAddValue79, fragmentVectorConstants1.packedValues[5u].z, -multiplyAddValue79), multiplyAddValue79);
    fragmentColor0.w = spvNMax(productValue116, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue66 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue67 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue117 = multiplyAddValue81 * multiplyAddValue65;
    precise float productValue118 = multiplyAddValue82 * multiplyAddValue66;
    precise float productValue119 = multiplyAddValue83 * multiplyAddValue67;
    precise float multiplyAddValue84 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue81, multiplyAddValue65, fragmentVectorConstants1.packedValues[10u].x), productValue117) * varyingColor3.x;
    precise float multiplyAddValue85 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue82, multiplyAddValue66, fragmentVectorConstants1.packedValues[10u].y), productValue118) * varyingColor3.y;
    precise float multiplyAddValue86 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue83, multiplyAddValue67, fragmentVectorConstants1.packedValues[10u].z), productValue119) * varyingColor3.z;
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    precise float productValue103 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[18u].x;
    precise float productValue104 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[18u].y;
    precise float productValue105 = sampledTextureValue5.z * fragmentVectorConstants1.packedValues[18u].z;
    precise float multiplyAddValue71 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[18u].x, productValue103) * fragmentVectorConstants1.packedValues[20u].x;
    precise float multiplyAddValue72 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[18u].y, productValue104) * fragmentVectorConstants1.packedValues[20u].y;
    precise float multiplyAddValue73 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[18u].z, productValue105) * fragmentVectorConstants1.packedValues[20u].z;
    float multiplyAddValue87 = fma(multiplyAddValue71, multiplyAddValue71, multiplyAddValue84);
    float multiplyAddValue88 = fma(multiplyAddValue72, multiplyAddValue72, multiplyAddValue85);
    float multiplyAddValue89 = fma(multiplyAddValue73, multiplyAddValue73, multiplyAddValue86);
    precise float sumValue25 = varyingColor2.x - multiplyAddValue87;
    precise float sumValue26 = varyingColor2.y - multiplyAddValue88;
    precise float sumValue27 = varyingColor2.z - multiplyAddValue89;
    fragmentColor0.x = fma(varyingColor2.w, sumValue25, multiplyAddValue87);
    fragmentColor0.y = fma(varyingColor2.w, sumValue26, multiplyAddValue88);
    fragmentColor0.z = fma(varyingColor2.w, sumValue27, multiplyAddValue89);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue133 = productValue81 * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue134 = productValue81 * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue135 = productValue81 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue25 = ceil(productValue82);
    float multiplyAddValue100 = fma(scalarValue25, fma(productValue82, fragmentVectorConstants1.packedValues[20u].x, -productValue133), productValue133);
    float multiplyAddValue101 = fma(scalarValue25, fma(productValue82, fragmentVectorConstants1.packedValues[20u].y, -productValue134), productValue134);
    float multiplyAddValue102 = fma(scalarValue25, fma(productValue82, fragmentVectorConstants1.packedValues[20u].z, -productValue135), productValue135);
    fragmentColor0.w = spvNMax(productValue132, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue66 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue67 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue136 = multiplyAddValue100 * multiplyAddValue65;
    precise float productValue137 = multiplyAddValue101 * multiplyAddValue66;
    precise float productValue138 = multiplyAddValue102 * multiplyAddValue67;
    precise float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue100, multiplyAddValue65, fragmentVectorConstants1.packedValues[10u].x), productValue136) * varyingColor3.x;
    precise float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue101, multiplyAddValue66, fragmentVectorConstants1.packedValues[10u].y), productValue137) * varyingColor3.y;
    precise float multiplyAddValue105 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue102, multiplyAddValue67, fragmentVectorConstants1.packedValues[10u].z), productValue138) * varyingColor3.z;
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    precise float productValue103 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[18u].x;
    precise float productValue104 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[18u].y;
    precise float productValue105 = sampledTextureValue5.z * fragmentVectorConstants1.packedValues[18u].z;
    precise float multiplyAddValue106 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[18u].x, productValue103) * fragmentVectorConstants1.packedValues[21u].x;
    precise float multiplyAddValue107 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[18u].y, productValue104) * fragmentVectorConstants1.packedValues[21u].y;
    precise float multiplyAddValue108 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[18u].z, productValue105) * fragmentVectorConstants1.packedValues[21u].z;
    float multiplyAddValue109 = fma(multiplyAddValue106, multiplyAddValue106, multiplyAddValue103);
    float multiplyAddValue110 = fma(multiplyAddValue107, multiplyAddValue107, multiplyAddValue104);
    float multiplyAddValue111 = fma(multiplyAddValue108, multiplyAddValue108, multiplyAddValue105);
    precise float sumValue28 = varyingColor2.x - multiplyAddValue109;
    precise float sumValue29 = varyingColor2.y - multiplyAddValue110;
    precise float sumValue30 = varyingColor2.z - multiplyAddValue111;
    fragmentColor0.x = fma(varyingColor2.w, sumValue28, multiplyAddValue109);
    fragmentColor0.y = fma(varyingColor2.w, sumValue29, multiplyAddValue110);
    fragmentColor0.z = fma(varyingColor2.w, sumValue30, multiplyAddValue111);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue161 = multiplyAddValue130 * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue162 = multiplyAddValue130 * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue163 = multiplyAddValue130 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue30 = ceil(multiplyAddValue131);
    float multiplyAddValue133 = fma(scalarValue30, fma(multiplyAddValue131, fragmentVectorConstants1.packedValues[20u].x, -productValue161), productValue161);
    float multiplyAddValue134 = fma(scalarValue30, fma(multiplyAddValue131, fragmentVectorConstants1.packedValues[20u].y, -productValue162), productValue162);
    float multiplyAddValue135 = fma(scalarValue30, fma(multiplyAddValue131, fragmentVectorConstants1.packedValues[20u].z, -productValue163), productValue163);
    fragmentColor0.w = spvNMax(multiplyAddValue132, fragmentScalarConstants1.packedValues[0u]);
    precise float sumValue5 = varyingColor0.x - 1.0;
    precise float sumValue6 = varyingColor0.y - 1.0;
    precise float sumValue7 = varyingColor0.z - 1.0;
    float multiplyAddValue65 = fma(fragmentScalarConstants1.packedValues[48u], sumValue5, 1.0);
    float multiplyAddValue66 = fma(fragmentScalarConstants1.packedValues[48u], sumValue6, 1.0);
    float multiplyAddValue67 = fma(fragmentScalarConstants1.packedValues[48u], sumValue7, 1.0);
    precise float productValue164 = multiplyAddValue133 * multiplyAddValue65;
    precise float productValue165 = multiplyAddValue134 * multiplyAddValue66;
    precise float productValue166 = multiplyAddValue135 * multiplyAddValue67;
    precise float multiplyAddValue136 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue133, multiplyAddValue65, fragmentVectorConstants1.packedValues[10u].x), productValue164) * varyingColor3.x;
    precise float multiplyAddValue137 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue134, multiplyAddValue66, fragmentVectorConstants1.packedValues[10u].y), productValue165) * varyingColor3.y;
    precise float multiplyAddValue138 = fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue135, multiplyAddValue67, fragmentVectorConstants1.packedValues[10u].z), productValue166) * varyingColor3.z;
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    precise float productValue103 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[18u].x;
    precise float productValue104 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[18u].y;
    precise float productValue105 = sampledTextureValue5.z * fragmentVectorConstants1.packedValues[18u].z;
    precise float multiplyAddValue106 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[18u].x, productValue103) * fragmentVectorConstants1.packedValues[21u].x;
    precise float multiplyAddValue107 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[18u].y, productValue104) * fragmentVectorConstants1.packedValues[21u].y;
    precise float multiplyAddValue108 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[18u].z, productValue105) * fragmentVectorConstants1.packedValues[21u].z;
    float multiplyAddValue139 = fma(multiplyAddValue106, multiplyAddValue106, multiplyAddValue136);
    float multiplyAddValue140 = fma(multiplyAddValue107, multiplyAddValue107, multiplyAddValue137);
    float multiplyAddValue141 = fma(multiplyAddValue108, multiplyAddValue108, multiplyAddValue138);
    precise float sumValue32 = varyingColor2.x - multiplyAddValue139;
    precise float sumValue33 = varyingColor2.y - multiplyAddValue140;
    precise float sumValue34 = varyingColor2.z - multiplyAddValue141;
    fragmentColor0.x = fma(varyingColor2.w, sumValue32, multiplyAddValue139);
    fragmentColor0.y = fma(varyingColor2.w, sumValue33, multiplyAddValue140);
    fragmentColor0.z = fma(varyingColor2.w, sumValue34, multiplyAddValue141);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.w = spvNMax(productValue15, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue5 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue5.x * fragmentVectorConstants1.packedValues[16u].x) * fragmentVectorConstants1.packedValues[18u].x;
    float multiplyAddValue6 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue5.y * fragmentVectorConstants1.packedValues[16u].y) * fragmentVectorConstants1.packedValues[18u].y;
    float multiplyAddValue7 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[16u].z, sampledTextureValue5.z * fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[18u].z;
    float multiplyAddValue8 = fma(multiplyAddValue5, multiplyAddValue5, fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue12, multiplyAddValue2, fragmentVectorConstants1.packedValues[9u].x), productValue12 * multiplyAddValue2) * varyingColor3.x);
    float multiplyAddValue9 = fma(multiplyAddValue6, multiplyAddValue6, fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue13, multiplyAddValue3, fragmentVectorConstants1.packedValues[9u].y), productValue13 * multiplyAddValue3) * varyingColor3.y);
    float multiplyAddValue10 = fma(multiplyAddValue7, multiplyAddValue7, fma(fragmentScalarConstants1.packedValues[39u], fma(-productValue14, multiplyAddValue4, fragmentVectorConstants1.packedValues[9u].z), productValue14 * multiplyAddValue4) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue8, multiplyAddValue8);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue9, multiplyAddValue9);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue10, multiplyAddValue10);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    fragmentColor0.w = spvNMax(multiplyAddValue30, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[40u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue5 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[16u].x, sampledTextureValue5.x * fragmentVectorConstants1.packedValues[16u].x) * fragmentVectorConstants1.packedValues[18u].x;
    float multiplyAddValue6 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[16u].y, sampledTextureValue5.y * fragmentVectorConstants1.packedValues[16u].y) * fragmentVectorConstants1.packedValues[18u].y;
    float multiplyAddValue7 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[16u].z, sampledTextureValue5.z * fragmentVectorConstants1.packedValues[16u].z) * fragmentVectorConstants1.packedValues[18u].z;
    float multiplyAddValue31 = fma(multiplyAddValue5, multiplyAddValue5, fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue27, multiplyAddValue2, fragmentVectorConstants1.packedValues[9u].x), multiplyAddValue27 * multiplyAddValue2) * varyingColor3.x);
    float multiplyAddValue32 = fma(multiplyAddValue6, multiplyAddValue6, fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue28, multiplyAddValue3, fragmentVectorConstants1.packedValues[9u].y), multiplyAddValue28 * multiplyAddValue3) * varyingColor3.y);
    float multiplyAddValue33 = fma(multiplyAddValue7, multiplyAddValue7, fma(fragmentScalarConstants1.packedValues[39u], fma(-multiplyAddValue29, multiplyAddValue4, fragmentVectorConstants1.packedValues[9u].z), multiplyAddValue29 * multiplyAddValue4) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue31, multiplyAddValue31);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue32, multiplyAddValue32);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue33, multiplyAddValue33);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue46 = fma(productValue77, fma(productValue74, fragmentVectorConstants1.packedValues[5u].x, -productValue74), productValue74);
    float multiplyAddValue47 = fma(productValue77, fma(productValue75, fragmentVectorConstants1.packedValues[5u].y, -productValue75), productValue75);
    float multiplyAddValue48 = fma(productValue77, fma(productValue76, fragmentVectorConstants1.packedValues[5u].z, -productValue76), productValue76);
    fragmentColor0.w = spvNMax(productValue77 * fragmentScalarConstants1.packedValues[23u], fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue52 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue5.x * fragmentVectorConstants1.packedValues[18u].x) * fragmentVectorConstants1.packedValues[20u].x;
    float multiplyAddValue53 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue5.y * fragmentVectorConstants1.packedValues[18u].y) * fragmentVectorConstants1.packedValues[20u].y;
    float multiplyAddValue54 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue5.z * fragmentVectorConstants1.packedValues[18u].z) * fragmentVectorConstants1.packedValues[20u].z;
    float multiplyAddValue55 = fma(multiplyAddValue52, multiplyAddValue52, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue46, multiplyAddValue49, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue46 * multiplyAddValue49) * varyingColor3.x);
    float multiplyAddValue56 = fma(multiplyAddValue53, multiplyAddValue53, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue47, multiplyAddValue50, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue47 * multiplyAddValue50) * varyingColor3.y);
    float multiplyAddValue57 = fma(multiplyAddValue54, multiplyAddValue54, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue48, multiplyAddValue51, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue48 * multiplyAddValue51) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue55, multiplyAddValue55);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue56, multiplyAddValue56);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue57, multiplyAddValue57);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue94 = fma(multiplyAddValue93, fma(multiplyAddValue90, fragmentVectorConstants1.packedValues[5u].x, -multiplyAddValue90), multiplyAddValue90);
    float multiplyAddValue95 = fma(multiplyAddValue93, fma(multiplyAddValue91, fragmentVectorConstants1.packedValues[5u].y, -multiplyAddValue91), multiplyAddValue91);
    float multiplyAddValue96 = fma(multiplyAddValue93, fma(multiplyAddValue92, fragmentVectorConstants1.packedValues[5u].z, -multiplyAddValue92), multiplyAddValue92);
    fragmentColor0.w = spvNMax(multiplyAddValue93 * fragmentScalarConstants1.packedValues[23u], fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue52 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue5.x * fragmentVectorConstants1.packedValues[18u].x) * fragmentVectorConstants1.packedValues[20u].x;
    float multiplyAddValue53 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue5.y * fragmentVectorConstants1.packedValues[18u].y) * fragmentVectorConstants1.packedValues[20u].y;
    float multiplyAddValue54 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue5.z * fragmentVectorConstants1.packedValues[18u].z) * fragmentVectorConstants1.packedValues[20u].z;
    float multiplyAddValue97 = fma(multiplyAddValue52, multiplyAddValue52, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue94, multiplyAddValue49, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue94 * multiplyAddValue49) * varyingColor3.x);
    float multiplyAddValue98 = fma(multiplyAddValue53, multiplyAddValue53, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue95, multiplyAddValue50, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue95 * multiplyAddValue50) * varyingColor3.y);
    float multiplyAddValue99 = fma(multiplyAddValue54, multiplyAddValue54, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue96, multiplyAddValue51, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue96 * multiplyAddValue51) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue97, multiplyAddValue97);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue98, multiplyAddValue98);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue99, multiplyAddValue99);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue140 = productValue74 * fragmentVectorConstants1.packedValues[5u].x;
    float productValue141 = productValue74 * fragmentVectorConstants1.packedValues[5u].y;
    float productValue142 = productValue74 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue26 = ceil(productValue75);
    float multiplyAddValue112 = fma(scalarValue26, fma(productValue75, fragmentVectorConstants1.packedValues[20u].x, -productValue140), productValue140);
    float multiplyAddValue113 = fma(scalarValue26, fma(productValue75, fragmentVectorConstants1.packedValues[20u].y, -productValue141), productValue141);
    float multiplyAddValue114 = fma(scalarValue26, fma(productValue75, fragmentVectorConstants1.packedValues[20u].z, -productValue142), productValue142);
    fragmentColor0.w = spvNMax(productValue139, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue115 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue5.x * fragmentVectorConstants1.packedValues[18u].x) * fragmentVectorConstants1.packedValues[21u].x;
    float multiplyAddValue116 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue5.y * fragmentVectorConstants1.packedValues[18u].y) * fragmentVectorConstants1.packedValues[21u].y;
    float multiplyAddValue117 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue5.z * fragmentVectorConstants1.packedValues[18u].z) * fragmentVectorConstants1.packedValues[21u].z;
    float multiplyAddValue118 = fma(multiplyAddValue115, multiplyAddValue115, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue112, multiplyAddValue49, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue112 * multiplyAddValue49) * varyingColor3.x);
    float multiplyAddValue119 = fma(multiplyAddValue116, multiplyAddValue116, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue113, multiplyAddValue50, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue113 * multiplyAddValue50) * varyingColor3.y);
    float multiplyAddValue120 = fma(multiplyAddValue117, multiplyAddValue117, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue114, multiplyAddValue51, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue114 * multiplyAddValue51) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue118, multiplyAddValue118);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue119, multiplyAddValue119);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue120, multiplyAddValue120);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    float productValue157 = multiplyAddValue121 * fragmentVectorConstants1.packedValues[5u].x;
    float productValue158 = multiplyAddValue121 * fragmentVectorConstants1.packedValues[5u].y;
    float productValue159 = multiplyAddValue121 * fragmentVectorConstants1.packedValues[5u].z;
    float scalarValue28 = ceil(multiplyAddValue122);
    float multiplyAddValue124 = fma(scalarValue28, fma(multiplyAddValue122, fragmentVectorConstants1.packedValues[20u].x, -productValue157), productValue157);
    float multiplyAddValue125 = fma(scalarValue28, fma(multiplyAddValue122, fragmentVectorConstants1.packedValues[20u].y, -productValue158), productValue158);
    float multiplyAddValue126 = fma(scalarValue28, fma(multiplyAddValue122, fragmentVectorConstants1.packedValues[20u].z, -productValue159), productValue159);
    fragmentColor0.w = spvNMax(multiplyAddValue123, fragmentScalarConstants1.packedValues[0u]);
    float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue51 = fma(fragmentScalarConstants1.packedValues[48u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float multiplyAddValue115 = fma(sampledTextureValue4.x, fragmentVectorConstants1.packedValues[18u].x, sampledTextureValue5.x * fragmentVectorConstants1.packedValues[18u].x) * fragmentVectorConstants1.packedValues[21u].x;
    float multiplyAddValue116 = fma(sampledTextureValue4.y, fragmentVectorConstants1.packedValues[18u].y, sampledTextureValue5.y * fragmentVectorConstants1.packedValues[18u].y) * fragmentVectorConstants1.packedValues[21u].y;
    float multiplyAddValue117 = fma(sampledTextureValue4.z, fragmentVectorConstants1.packedValues[18u].z, sampledTextureValue5.z * fragmentVectorConstants1.packedValues[18u].z) * fragmentVectorConstants1.packedValues[21u].z;
    float multiplyAddValue127 = fma(multiplyAddValue115, multiplyAddValue115, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue124, multiplyAddValue49, fragmentVectorConstants1.packedValues[10u].x), multiplyAddValue124 * multiplyAddValue49) * varyingColor3.x);
    float multiplyAddValue128 = fma(multiplyAddValue116, multiplyAddValue116, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue125, multiplyAddValue50, fragmentVectorConstants1.packedValues[10u].y), multiplyAddValue125 * multiplyAddValue50) * varyingColor3.y);
    float multiplyAddValue129 = fma(multiplyAddValue117, multiplyAddValue117, fma(fragmentScalarConstants1.packedValues[43u], fma(-multiplyAddValue126, multiplyAddValue51, fragmentVectorConstants1.packedValues[10u].z), multiplyAddValue126 * multiplyAddValue51) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue127, multiplyAddValue127);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue128, multiplyAddValue128);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue129, multiplyAddValue129);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue3 = (sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue4 = (sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue5 = (sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z) * ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue6 = (fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[18u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue7 = (fragmentVectorConstants1.packedValues[16u].y * fragmentVectorConstants1.packedValues[18u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue8 = (fragmentVectorConstants1.packedValues[16u].z * fragmentVectorConstants1.packedValues[18u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue9 = (productValue6 * productValue6) + ((((fragmentVectorConstants1.packedValues[9u].x - productValue3) * fragmentVectorConstants1.packedValues[9u].w) + productValue3) * varyingColor3.x);
    float productValue10 = (productValue7 * productValue7) + ((((fragmentVectorConstants1.packedValues[9u].y - productValue4) * fragmentVectorConstants1.packedValues[9u].w) + productValue4) * varyingColor3.y);
    float productValue11 = (productValue8 * productValue8) + ((((fragmentVectorConstants1.packedValues[9u].z - productValue5) * fragmentVectorConstants1.packedValues[9u].w) + productValue5) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue48 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((productValue46 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[17u].x) - scalarValue8)) + scalarValue8);
    float productValue49 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((productValue46 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[17u].y) - scalarValue9)) + scalarValue9);
    float productValue50 = ((fragmentVectorConstants1.packedValues[10u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((productValue46 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[17u].z) - scalarValue10)) + scalarValue10);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue6 = (fragmentVectorConstants1.packedValues[16u].x * fragmentVectorConstants1.packedValues[18u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue7 = (fragmentVectorConstants1.packedValues[16u].y * fragmentVectorConstants1.packedValues[18u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue8 = (fragmentVectorConstants1.packedValues[16u].z * fragmentVectorConstants1.packedValues[18u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue51 = (productValue6 * productValue6) + ((((fragmentVectorConstants1.packedValues[9u].x - productValue48) * fragmentVectorConstants1.packedValues[9u].w) + productValue48) * varyingColor3.x);
    float productValue52 = (productValue7 * productValue7) + ((((fragmentVectorConstants1.packedValues[9u].y - productValue49) * fragmentVectorConstants1.packedValues[9u].w) + productValue49) * varyingColor3.y);
    float productValue53 = (productValue8 * productValue8) + ((((fragmentVectorConstants1.packedValues[9u].z - productValue50) * fragmentVectorConstants1.packedValues[9u].w) + productValue50) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue51) * varyingColor2.w) + productValue51;
    fragmentColor0.y = ((varyingColor2.y - productValue52) * varyingColor2.w) + productValue52;
    fragmentColor0.z = ((varyingColor2.z - productValue53) * varyingColor2.w) + productValue53;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue47);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue65 = ((((fragmentVectorConstants1.packedValues[5u].x * productValue59) - productValue59) * productValue62) + productValue59) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue66 = ((((fragmentVectorConstants1.packedValues[5u].y * productValue60) - productValue60) * productValue62) + productValue60) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue67 = ((((fragmentVectorConstants1.packedValues[5u].z * productValue61) - productValue61) * productValue62) + productValue61) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue68 = (fragmentVectorConstants1.packedValues[18u].x * fragmentVectorConstants1.packedValues[20u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue69 = (fragmentVectorConstants1.packedValues[18u].y * fragmentVectorConstants1.packedValues[20u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue70 = (fragmentVectorConstants1.packedValues[18u].z * fragmentVectorConstants1.packedValues[20u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue71 = (productValue68 * productValue68) + ((((fragmentVectorConstants1.packedValues[10u].x - productValue65) * fragmentVectorConstants1.packedValues[10u].w) + productValue65) * varyingColor3.x);
    float productValue72 = (productValue69 * productValue69) + ((((fragmentVectorConstants1.packedValues[10u].y - productValue66) * fragmentVectorConstants1.packedValues[10u].w) + productValue66) * varyingColor3.y);
    float productValue73 = (productValue70 * productValue70) + ((((fragmentVectorConstants1.packedValues[10u].z - productValue67) * fragmentVectorConstants1.packedValues[10u].w) + productValue67) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue71) * varyingColor2.w) + productValue71;
    fragmentColor0.y = ((varyingColor2.y - productValue72) * varyingColor2.w) + productValue72;
    fragmentColor0.z = ((varyingColor2.z - productValue73) * varyingColor2.w) + productValue73;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, fragmentVectorConstants1.packedValues[5u].w * productValue62);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue110 = ((((fragmentVectorConstants1.packedValues[5u].x * productValue106) - productValue106) * productValue109) + productValue106) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue111 = ((((fragmentVectorConstants1.packedValues[5u].y * productValue107) - productValue107) * productValue109) + productValue107) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue112 = ((((fragmentVectorConstants1.packedValues[5u].z * productValue108) - productValue108) * productValue109) + productValue108) * ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue68 = (fragmentVectorConstants1.packedValues[18u].x * fragmentVectorConstants1.packedValues[20u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue69 = (fragmentVectorConstants1.packedValues[18u].y * fragmentVectorConstants1.packedValues[20u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue70 = (fragmentVectorConstants1.packedValues[18u].z * fragmentVectorConstants1.packedValues[20u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue113 = (productValue68 * productValue68) + ((((fragmentVectorConstants1.packedValues[10u].x - productValue110) * fragmentVectorConstants1.packedValues[10u].w) + productValue110) * varyingColor3.x);
    float productValue114 = (productValue69 * productValue69) + ((((fragmentVectorConstants1.packedValues[10u].y - productValue111) * fragmentVectorConstants1.packedValues[10u].w) + productValue111) * varyingColor3.y);
    float productValue115 = (productValue70 * productValue70) + ((((fragmentVectorConstants1.packedValues[10u].z - productValue112) * fragmentVectorConstants1.packedValues[10u].w) + productValue112) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue113) * varyingColor2.w) + productValue113;
    fragmentColor0.y = ((varyingColor2.y - productValue114) * varyingColor2.w) + productValue114;
    fragmentColor0.z = ((varyingColor2.z - productValue115) * varyingColor2.w) + productValue115;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, fragmentVectorConstants1.packedValues[5u].w * productValue109);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue120 = fragmentVectorConstants1.packedValues[5u].x * productValue59;
    float productValue121 = fragmentVectorConstants1.packedValues[5u].y * productValue59;
    float productValue122 = fragmentVectorConstants1.packedValues[5u].z * productValue59;
    float scalarValue24 = ceil(productValue60);
    float productValue123 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[20u].x * productValue60) - productValue120) * scalarValue24) + productValue120);
    float productValue124 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[20u].y * productValue60) - productValue121) * scalarValue24) + productValue121);
    float productValue125 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[20u].z * productValue60) - productValue122) * scalarValue24) + productValue122);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue126 = (fragmentVectorConstants1.packedValues[18u].x * fragmentVectorConstants1.packedValues[21u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue127 = (fragmentVectorConstants1.packedValues[18u].y * fragmentVectorConstants1.packedValues[21u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue128 = (fragmentVectorConstants1.packedValues[18u].z * fragmentVectorConstants1.packedValues[21u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue129 = (productValue126 * productValue126) + ((((fragmentVectorConstants1.packedValues[10u].x - productValue123) * fragmentVectorConstants1.packedValues[10u].w) + productValue123) * varyingColor3.x);
    float productValue130 = (productValue127 * productValue127) + ((((fragmentVectorConstants1.packedValues[10u].y - productValue124) * fragmentVectorConstants1.packedValues[10u].w) + productValue124) * varyingColor3.y);
    float productValue131 = (productValue128 * productValue128) + ((((fragmentVectorConstants1.packedValues[10u].z - productValue125) * fragmentVectorConstants1.packedValues[10u].w) + productValue125) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue129) * varyingColor2.w) + productValue129;
    fragmentColor0.y = ((varyingColor2.y - productValue130) * varyingColor2.w) + productValue130;
    fragmentColor0.z = ((varyingColor2.z - productValue131) * varyingColor2.w) + productValue131;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue62);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue147 = fragmentVectorConstants1.packedValues[5u].x * productValue144;
    float productValue148 = fragmentVectorConstants1.packedValues[5u].y * productValue144;
    float productValue149 = fragmentVectorConstants1.packedValues[5u].z * productValue144;
    float scalarValue27 = ceil(productValue145);
    float productValue150 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[20u].x * productValue145) - productValue147) * scalarValue27) + productValue147);
    float productValue151 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[20u].y * productValue145) - productValue148) * scalarValue27) + productValue148);
    float productValue152 = ((fragmentVectorConstants1.packedValues[12u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((fragmentVectorConstants1.packedValues[20u].z * productValue145) - productValue149) * scalarValue27) + productValue149);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue126 = (fragmentVectorConstants1.packedValues[18u].x * fragmentVectorConstants1.packedValues[21u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue127 = (fragmentVectorConstants1.packedValues[18u].y * fragmentVectorConstants1.packedValues[21u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue128 = (fragmentVectorConstants1.packedValues[18u].z * fragmentVectorConstants1.packedValues[21u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue153 = (productValue126 * productValue126) + ((((fragmentVectorConstants1.packedValues[10u].x - productValue150) * fragmentVectorConstants1.packedValues[10u].w) + productValue150) * varyingColor3.x);
    float productValue154 = (productValue127 * productValue127) + ((((fragmentVectorConstants1.packedValues[10u].y - productValue151) * fragmentVectorConstants1.packedValues[10u].w) + productValue151) * varyingColor3.y);
    float productValue155 = (productValue128 * productValue128) + ((((fragmentVectorConstants1.packedValues[10u].z - productValue152) * fragmentVectorConstants1.packedValues[10u].w) + productValue152) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue153) * varyingColor2.w) + productValue153;
    fragmentColor0.y = ((varyingColor2.y - productValue154) * varyingColor2.w) + productValue154;
    fragmentColor0.z = ((varyingColor2.z - productValue155) * varyingColor2.w) + productValue155;
    fragmentColor0.w = spvNMax(fragmentVectorConstants1.packedValues[0u].x, productValue146);
#endif
    discardIfRequested();
}
