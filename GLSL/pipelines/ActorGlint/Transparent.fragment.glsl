#version 460
#extension GL_GOOGLE_include_directive : require
// ActorGlint / Transparent / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 10
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/ActorGlint/FragmentBindings.glsli"

void main()
{
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue20 = sampledTextureValue6.x * fragmentVectorConstants1.packedValues[2u].x;
    precise float productValue21 = sampledTextureValue6.y * fragmentVectorConstants1.packedValues[2u].y;
    precise float productValue22 = sampledTextureValue6.z * fragmentVectorConstants1.packedValues[2u].z;
    precise float multiplyAddValue15 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[2u].x, productValue20) * fragmentVectorConstants1.packedValues[5u].x;
    precise float multiplyAddValue16 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[2u].y, productValue21) * fragmentVectorConstants1.packedValues[5u].y;
    precise float multiplyAddValue17 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[2u].z, productValue22) * fragmentVectorConstants1.packedValues[5u].z;
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[4u], sumValue, 1.0);
    float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[4u], sumValue1, 1.0);
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[4u], sumValue2, 1.0);
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue23 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[4u].x;
    precise float productValue24 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[4u].y;
    precise float productValue25 = sampledTextureValue5.z * fragmentVectorConstants1.packedValues[4u].z;
    precise float productValue26 = sampledTextureValue5.w * fragmentVectorConstants1.packedValues[4u].w;
    precise float productValue27 = multiplyAddValue18 * productValue23;
    precise float productValue28 = multiplyAddValue19 * productValue24;
    precise float productValue29 = multiplyAddValue20 * productValue25;
    precise float productValue30 = spvNMax(productValue26, 0.0) * fragmentScalarConstants1.packedValues[12u];
    fragmentColor0.w = productValue30;
    precise float multiplyAddValue21 = fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue23, multiplyAddValue18, fragmentVectorConstants1.packedValues[0u].x), productValue27) * varyingColor3.x;
    precise float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue24, multiplyAddValue19, fragmentVectorConstants1.packedValues[0u].y), productValue28) * varyingColor3.y;
    precise float multiplyAddValue23 = fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue25, multiplyAddValue20, fragmentVectorConstants1.packedValues[0u].z), productValue29) * varyingColor3.z;
    float multiplyAddValue24 = fma(multiplyAddValue15, multiplyAddValue15, multiplyAddValue21);
    float multiplyAddValue25 = fma(multiplyAddValue16, multiplyAddValue16, multiplyAddValue22);
    float multiplyAddValue26 = fma(multiplyAddValue17, multiplyAddValue17, multiplyAddValue23);
    precise float sumValue3 = varyingColor2.x - multiplyAddValue24;
    precise float sumValue4 = varyingColor2.y - multiplyAddValue25;
    precise float sumValue5 = varyingColor2.z - multiplyAddValue26;
    fragmentColor0.x = fma(varyingColor2.w, sumValue3, multiplyAddValue24);
    fragmentColor0.y = fma(varyingColor2.w, sumValue4, multiplyAddValue25);
    fragmentColor0.z = fma(varyingColor2.w, sumValue5, multiplyAddValue26);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    float scalarValue6 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    precise float sumValue6 = scalarValue5 + scalarValue4;
    precise float sumValue7 = scalarValue6 + sumValue6;
    precise float sumValue8 = 1.0 - scalarValue7;
    precise float productValue31 = sumValue8 * sumValue7;
    float scalarValue8 = float(productValue31 > 0.0);
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue27 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[4u].x, sampledTextureValue5.x, -scalarValue4), scalarValue4);
    float multiplyAddValue28 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[4u].y, sampledTextureValue5.y, -scalarValue5), scalarValue5);
    float multiplyAddValue29 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[4u].z, sampledTextureValue5.z, -scalarValue6), scalarValue6);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue18 = fma(fragmentScalarConstants1.packedValues[4u], sumValue, 1.0);
    float multiplyAddValue19 = fma(fragmentScalarConstants1.packedValues[4u], sumValue1, 1.0);
    float multiplyAddValue20 = fma(fragmentScalarConstants1.packedValues[4u], sumValue2, 1.0);
    precise float productValue32 = multiplyAddValue27 * multiplyAddValue18;
    precise float productValue33 = multiplyAddValue28 * multiplyAddValue19;
    precise float productValue34 = multiplyAddValue29 * multiplyAddValue20;
    precise float multiplyAddValue30 = spvNMax(fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[4u].w, sampledTextureValue5.w, -scalarValue7), scalarValue7), 0.0) * fragmentScalarConstants1.packedValues[12u];
    fragmentColor0.w = multiplyAddValue30;
    precise float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue27, multiplyAddValue18, fragmentVectorConstants1.packedValues[0u].x), productValue32) * varyingColor3.x;
    precise float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue28, multiplyAddValue19, fragmentVectorConstants1.packedValues[0u].y), productValue33) * varyingColor3.y;
    precise float multiplyAddValue33 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue29, multiplyAddValue20, fragmentVectorConstants1.packedValues[0u].z), productValue34) * varyingColor3.z;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue20 = sampledTextureValue6.x * fragmentVectorConstants1.packedValues[2u].x;
    precise float productValue21 = sampledTextureValue6.y * fragmentVectorConstants1.packedValues[2u].y;
    precise float productValue22 = sampledTextureValue6.z * fragmentVectorConstants1.packedValues[2u].z;
    precise float multiplyAddValue15 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[2u].x, productValue20) * fragmentVectorConstants1.packedValues[5u].x;
    precise float multiplyAddValue16 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[2u].y, productValue21) * fragmentVectorConstants1.packedValues[5u].y;
    precise float multiplyAddValue17 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[2u].z, productValue22) * fragmentVectorConstants1.packedValues[5u].z;
    float multiplyAddValue34 = fma(multiplyAddValue15, multiplyAddValue15, multiplyAddValue31);
    float multiplyAddValue35 = fma(multiplyAddValue16, multiplyAddValue16, multiplyAddValue32);
    float multiplyAddValue36 = fma(multiplyAddValue17, multiplyAddValue17, multiplyAddValue33);
    precise float sumValue9 = varyingColor2.x - multiplyAddValue34;
    precise float sumValue10 = varyingColor2.y - multiplyAddValue35;
    precise float sumValue11 = varyingColor2.z - multiplyAddValue36;
    fragmentColor0.x = fma(varyingColor2.w, sumValue9, multiplyAddValue34);
    fragmentColor0.y = fma(varyingColor2.w, sumValue10, multiplyAddValue35);
    fragmentColor0.z = fma(varyingColor2.w, sumValue11, multiplyAddValue36);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue58 = sampledTextureValue6.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue59 = sampledTextureValue6.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue60 = sampledTextureValue6.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue37 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[3u].x, productValue58) * fragmentVectorConstants1.packedValues[6u].x;
    precise float multiplyAddValue38 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[3u].y, productValue59) * fragmentVectorConstants1.packedValues[6u].y;
    precise float multiplyAddValue39 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[3u].z, productValue60) * fragmentVectorConstants1.packedValues[6u].z;
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue61 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue62 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue63 = sampledTextureValue5.z * fragmentVectorConstants1.packedValues[5u].z;
    precise float productValue64 = sampledTextureValue5.w * fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue40 = fma(productValue64, fma(productValue61, fragmentVectorConstants1.packedValues[0u].x, -productValue61), productValue61);
    float multiplyAddValue41 = fma(productValue64, fma(productValue62, fragmentVectorConstants1.packedValues[0u].y, -productValue62), productValue62);
    float multiplyAddValue42 = fma(productValue64, fma(productValue63, fragmentVectorConstants1.packedValues[0u].z, -productValue63), productValue63);
    precise float productValue65 = productValue64 * fragmentScalarConstants1.packedValues[3u];
    precise float productValue66 = spvNMax(productValue65, 0.0) * fragmentScalarConstants1.packedValues[16u];
    fragmentColor0.w = productValue66;
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue67 = multiplyAddValue40 * multiplyAddValue43;
    precise float productValue68 = multiplyAddValue41 * multiplyAddValue44;
    precise float productValue69 = multiplyAddValue42 * multiplyAddValue45;
    precise float multiplyAddValue46 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue40, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].x), productValue67) * varyingColor3.x;
    precise float multiplyAddValue47 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue41, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].y), productValue68) * varyingColor3.y;
    precise float multiplyAddValue48 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue42, multiplyAddValue45, fragmentVectorConstants1.packedValues[1u].z), productValue69) * varyingColor3.z;
    float multiplyAddValue49 = fma(multiplyAddValue37, multiplyAddValue37, multiplyAddValue46);
    float multiplyAddValue50 = fma(multiplyAddValue38, multiplyAddValue38, multiplyAddValue47);
    float multiplyAddValue51 = fma(multiplyAddValue39, multiplyAddValue39, multiplyAddValue48);
    precise float sumValue12 = varyingColor2.x - multiplyAddValue49;
    precise float sumValue13 = varyingColor2.y - multiplyAddValue50;
    precise float sumValue14 = varyingColor2.z - multiplyAddValue51;
    fragmentColor0.x = fma(varyingColor2.w, sumValue12, multiplyAddValue49);
    fragmentColor0.y = fma(varyingColor2.w, sumValue13, multiplyAddValue50);
    fragmentColor0.z = fma(varyingColor2.w, sumValue14, multiplyAddValue51);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    float scalarValue6 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    precise float sumValue6 = scalarValue5 + scalarValue4;
    precise float sumValue7 = scalarValue6 + sumValue6;
    precise float sumValue8 = 1.0 - scalarValue7;
    precise float productValue31 = sumValue8 * sumValue7;
    float scalarValue8 = float(productValue31 > 0.0);
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue74 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[5u].x, sampledTextureValue5.x, -scalarValue4), scalarValue4);
    float multiplyAddValue75 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[5u].y, sampledTextureValue5.y, -scalarValue5), scalarValue5);
    float multiplyAddValue76 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[5u].z, sampledTextureValue5.z, -scalarValue6), scalarValue6);
    float multiplyAddValue77 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[5u].w, sampledTextureValue5.w, -scalarValue7), scalarValue7);
    float multiplyAddValue78 = fma(multiplyAddValue77, fma(multiplyAddValue74, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue74), multiplyAddValue74);
    float multiplyAddValue79 = fma(multiplyAddValue77, fma(multiplyAddValue75, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue75), multiplyAddValue75);
    float multiplyAddValue80 = fma(multiplyAddValue77, fma(multiplyAddValue76, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue76), multiplyAddValue76);
    precise float productValue86 = multiplyAddValue77 * fragmentScalarConstants1.packedValues[3u];
    precise float productValue87 = spvNMax(productValue86, 0.0) * fragmentScalarConstants1.packedValues[16u];
    fragmentColor0.w = productValue87;
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue88 = multiplyAddValue78 * multiplyAddValue43;
    precise float productValue89 = multiplyAddValue79 * multiplyAddValue44;
    precise float productValue90 = multiplyAddValue80 * multiplyAddValue45;
    precise float multiplyAddValue81 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue78, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].x), productValue88) * varyingColor3.x;
    precise float multiplyAddValue82 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue79, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].y), productValue89) * varyingColor3.y;
    precise float multiplyAddValue83 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue80, multiplyAddValue45, fragmentVectorConstants1.packedValues[1u].z), productValue90) * varyingColor3.z;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue58 = sampledTextureValue6.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue59 = sampledTextureValue6.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue60 = sampledTextureValue6.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue37 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[3u].x, productValue58) * fragmentVectorConstants1.packedValues[6u].x;
    precise float multiplyAddValue38 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[3u].y, productValue59) * fragmentVectorConstants1.packedValues[6u].y;
    precise float multiplyAddValue39 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[3u].z, productValue60) * fragmentVectorConstants1.packedValues[6u].z;
    float multiplyAddValue84 = fma(multiplyAddValue37, multiplyAddValue37, multiplyAddValue81);
    float multiplyAddValue85 = fma(multiplyAddValue38, multiplyAddValue38, multiplyAddValue82);
    float multiplyAddValue86 = fma(multiplyAddValue39, multiplyAddValue39, multiplyAddValue83);
    precise float sumValue15 = varyingColor2.x - multiplyAddValue84;
    precise float sumValue16 = varyingColor2.y - multiplyAddValue85;
    precise float sumValue17 = varyingColor2.z - multiplyAddValue86;
    fragmentColor0.x = fma(varyingColor2.w, sumValue15, multiplyAddValue84);
    fragmentColor0.y = fma(varyingColor2.w, sumValue16, multiplyAddValue85);
    fragmentColor0.z = fma(varyingColor2.w, sumValue17, multiplyAddValue86);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue58 = sampledTextureValue6.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue59 = sampledTextureValue6.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue60 = sampledTextureValue6.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue96 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[3u].x, productValue58) * fragmentVectorConstants1.packedValues[7u].x;
    precise float multiplyAddValue97 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[3u].y, productValue59) * fragmentVectorConstants1.packedValues[7u].y;
    precise float multiplyAddValue98 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[3u].z, productValue60) * fragmentVectorConstants1.packedValues[7u].z;
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue61 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[5u].x;
    precise float productValue62 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[5u].y;
    precise float productValue94 = sampledTextureValue5.w * fragmentScalarConstants1.packedValues[23u];
    precise float productValue95 = productValue61 * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue96 = productValue61 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue97 = productValue61 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue11 = ceil(productValue62);
    precise float productValue98 = spvNMax(productValue94, 0.0) * fragmentScalarConstants1.packedValues[16u];
    fragmentColor0.w = productValue98;
    float multiplyAddValue99 = fma(scalarValue11, fma(productValue62, fragmentVectorConstants1.packedValues[6u].x, -productValue95), productValue95);
    float multiplyAddValue100 = fma(scalarValue11, fma(productValue62, fragmentVectorConstants1.packedValues[6u].y, -productValue96), productValue96);
    float multiplyAddValue101 = fma(scalarValue11, fma(productValue62, fragmentVectorConstants1.packedValues[6u].z, -productValue97), productValue97);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue99 = multiplyAddValue99 * multiplyAddValue43;
    precise float productValue100 = multiplyAddValue100 * multiplyAddValue44;
    precise float productValue101 = multiplyAddValue101 * multiplyAddValue45;
    precise float multiplyAddValue102 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue99, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].x), productValue99) * varyingColor3.x;
    precise float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue100, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].y), productValue100) * varyingColor3.y;
    precise float multiplyAddValue104 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue101, multiplyAddValue45, fragmentVectorConstants1.packedValues[1u].z), productValue101) * varyingColor3.z;
    float multiplyAddValue105 = fma(multiplyAddValue96, multiplyAddValue96, multiplyAddValue102);
    float multiplyAddValue106 = fma(multiplyAddValue97, multiplyAddValue97, multiplyAddValue103);
    float multiplyAddValue107 = fma(multiplyAddValue98, multiplyAddValue98, multiplyAddValue104);
    precise float sumValue18 = varyingColor2.x - multiplyAddValue105;
    precise float sumValue19 = varyingColor2.y - multiplyAddValue106;
    precise float sumValue20 = varyingColor2.z - multiplyAddValue107;
    fragmentColor0.x = fma(varyingColor2.w, sumValue18, multiplyAddValue105);
    fragmentColor0.y = fma(varyingColor2.w, sumValue19, multiplyAddValue106);
    fragmentColor0.z = fma(varyingColor2.w, sumValue20, multiplyAddValue107);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    float scalarValue7 = sampledTextureValue4.w;
    precise float sumValue6 = scalarValue5 + scalarValue4;
    precise float sumValue21 = sampledTextureValue4.z + sumValue6;
    precise float sumValue8 = 1.0 - scalarValue7;
    precise float productValue106 = sumValue21 * sumValue8;
    float scalarValue13 = float(productValue106 > 0.0);
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue116 = fma(scalarValue13, fma(fragmentVectorConstants1.packedValues[5u].x, sampledTextureValue5.x, -scalarValue4), scalarValue4);
    float multiplyAddValue117 = fma(scalarValue13, fma(fragmentVectorConstants1.packedValues[5u].y, sampledTextureValue5.y, -scalarValue5), scalarValue5);
    precise float productValue107 = multiplyAddValue116 * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue108 = multiplyAddValue116 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue109 = multiplyAddValue116 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue14 = ceil(multiplyAddValue117);
    precise float multiplyAddValue118 = spvNMax(fma(scalarValue13, fma(fragmentScalarConstants1.packedValues[23u], sampledTextureValue5.w, -scalarValue7), scalarValue7), 0.0) * fragmentScalarConstants1.packedValues[16u];
    fragmentColor0.w = multiplyAddValue118;
    float multiplyAddValue119 = fma(scalarValue14, fma(multiplyAddValue117, fragmentVectorConstants1.packedValues[6u].x, -productValue107), productValue107);
    float multiplyAddValue120 = fma(scalarValue14, fma(multiplyAddValue117, fragmentVectorConstants1.packedValues[6u].y, -productValue108), productValue108);
    float multiplyAddValue121 = fma(scalarValue14, fma(multiplyAddValue117, fragmentVectorConstants1.packedValues[6u].z, -productValue109), productValue109);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue110 = multiplyAddValue119 * multiplyAddValue43;
    precise float productValue111 = multiplyAddValue120 * multiplyAddValue44;
    precise float productValue112 = multiplyAddValue121 * multiplyAddValue45;
    precise float multiplyAddValue122 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue119, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].x), productValue110) * varyingColor3.x;
    precise float multiplyAddValue123 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue120, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].y), productValue111) * varyingColor3.y;
    precise float multiplyAddValue124 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue121, multiplyAddValue45, fragmentVectorConstants1.packedValues[1u].z), productValue112) * varyingColor3.z;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue58 = sampledTextureValue6.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue59 = sampledTextureValue6.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue60 = sampledTextureValue6.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue96 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[3u].x, productValue58) * fragmentVectorConstants1.packedValues[7u].x;
    precise float multiplyAddValue97 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[3u].y, productValue59) * fragmentVectorConstants1.packedValues[7u].y;
    precise float multiplyAddValue98 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[3u].z, productValue60) * fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue125 = fma(multiplyAddValue96, multiplyAddValue96, multiplyAddValue122);
    float multiplyAddValue126 = fma(multiplyAddValue97, multiplyAddValue97, multiplyAddValue123);
    float multiplyAddValue127 = fma(multiplyAddValue98, multiplyAddValue98, multiplyAddValue124);
    precise float sumValue22 = varyingColor2.x - multiplyAddValue125;
    precise float sumValue23 = varyingColor2.y - multiplyAddValue126;
    precise float sumValue24 = varyingColor2.z - multiplyAddValue127;
    fragmentColor0.x = fma(varyingColor2.w, sumValue22, multiplyAddValue125);
    fragmentColor0.y = fma(varyingColor2.w, sumValue23, multiplyAddValue126);
    fragmentColor0.z = fma(varyingColor2.w, sumValue24, multiplyAddValue127);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue6 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[2u].x, sampledTextureValue6.x * fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[5u].x;
    float multiplyAddValue7 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[2u].y, sampledTextureValue6.y * fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[5u].y;
    float multiplyAddValue8 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[2u].z, sampledTextureValue6.z * fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[5u].z;
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue17 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[4u].x;
    float productValue18 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[4u].y;
    float productValue19 = sampledTextureValue5.z * fragmentVectorConstants1.packedValues[4u].z;
    fragmentColor0.w = spvNMax(sampledTextureValue5.w * fragmentVectorConstants1.packedValues[4u].w, 0.0) * fragmentScalarConstants1.packedValues[12u];
    float multiplyAddValue12 = fma(multiplyAddValue6, multiplyAddValue6, fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue17, multiplyAddValue3, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue3 * productValue17) * varyingColor3.x);
    float multiplyAddValue13 = fma(multiplyAddValue7, multiplyAddValue7, fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue18, multiplyAddValue4, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue4 * productValue18) * varyingColor3.y);
    float multiplyAddValue14 = fma(multiplyAddValue8, multiplyAddValue8, fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue19, multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue5 * productValue19) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue12, multiplyAddValue12);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue13, multiplyAddValue13);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue14, multiplyAddValue14);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    float scalarValue6 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    bool productValue16 = ((1.0 - scalarValue7) * (scalarValue6 + (scalarValue5 + scalarValue4))) > 0.0;
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue = productValue16 ? (fma(fragmentVectorConstants1.packedValues[4u].x, sampledTextureValue5.x, -scalarValue4) + scalarValue4) : scalarValue4;
    float multiplyAddValue1 = productValue16 ? (fma(fragmentVectorConstants1.packedValues[4u].y, sampledTextureValue5.y, -scalarValue5) + scalarValue5) : scalarValue5;
    float multiplyAddValue2 = productValue16 ? (fma(fragmentVectorConstants1.packedValues[4u].z, sampledTextureValue5.z, -scalarValue6) + scalarValue6) : scalarValue6;
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.z - 1.0, 1.0);
    fragmentColor0.w = spvNMax(productValue16 ? (fma(fragmentVectorConstants1.packedValues[4u].w, sampledTextureValue5.w, -scalarValue7) + scalarValue7) : scalarValue7, 0.0) * fragmentScalarConstants1.packedValues[12u];
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue6 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[2u].x, sampledTextureValue6.x * fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[5u].x;
    float multiplyAddValue7 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[2u].y, sampledTextureValue6.y * fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[5u].y;
    float multiplyAddValue8 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[2u].z, sampledTextureValue6.z * fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[5u].z;
    float multiplyAddValue9 = fma(multiplyAddValue6, multiplyAddValue6, fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue, multiplyAddValue3, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue * multiplyAddValue3) * varyingColor3.x);
    float multiplyAddValue10 = fma(multiplyAddValue7, multiplyAddValue7, fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue1, multiplyAddValue4, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue1 * multiplyAddValue4) * varyingColor3.y);
    float multiplyAddValue11 = fma(multiplyAddValue8, multiplyAddValue8, fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue2, multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue2 * multiplyAddValue5) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue9, multiplyAddValue9);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue10, multiplyAddValue10);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue11, multiplyAddValue11);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue52 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue6.x * fragmentVectorConstants1.packedValues[3u].x) * fragmentVectorConstants1.packedValues[6u].x;
    float multiplyAddValue53 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue6.y * fragmentVectorConstants1.packedValues[3u].y) * fragmentVectorConstants1.packedValues[6u].y;
    float multiplyAddValue54 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue6.z * fragmentVectorConstants1.packedValues[3u].z) * fragmentVectorConstants1.packedValues[6u].z;
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue70 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[5u].x;
    float productValue71 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[5u].y;
    float productValue72 = sampledTextureValue5.z * fragmentVectorConstants1.packedValues[5u].z;
    float productValue73 = sampledTextureValue5.w * fragmentVectorConstants1.packedValues[5u].w;
    float multiplyAddValue55 = fma(productValue73, fma(productValue70, fragmentVectorConstants1.packedValues[0u].x, -productValue70), productValue70);
    float multiplyAddValue56 = fma(productValue73, fma(productValue71, fragmentVectorConstants1.packedValues[0u].y, -productValue71), productValue71);
    float multiplyAddValue57 = fma(productValue73, fma(productValue72, fragmentVectorConstants1.packedValues[0u].z, -productValue72), productValue72);
    fragmentColor0.w = spvNMax(productValue73 * fragmentScalarConstants1.packedValues[3u], 0.0) * fragmentScalarConstants1.packedValues[16u];
    float multiplyAddValue58 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue61 = fma(multiplyAddValue52, multiplyAddValue52, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue55, multiplyAddValue58, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue55 * multiplyAddValue58) * varyingColor3.x);
    float multiplyAddValue62 = fma(multiplyAddValue53, multiplyAddValue53, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue56, multiplyAddValue59, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue56 * multiplyAddValue59) * varyingColor3.y);
    float multiplyAddValue63 = fma(multiplyAddValue54, multiplyAddValue54, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue57, multiplyAddValue60, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue57 * multiplyAddValue60) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue61, multiplyAddValue61);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue62, multiplyAddValue62);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue63, multiplyAddValue63);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    float scalarValue6 = sampledTextureValue4.z;
    float scalarValue7 = sampledTextureValue4.w;
    bool productValue16 = ((1.0 - scalarValue7) * (scalarValue6 + (scalarValue5 + scalarValue4))) > 0.0;
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue64 = productValue16 ? (fma(fragmentVectorConstants1.packedValues[5u].x, sampledTextureValue5.x, -scalarValue4) + scalarValue4) : scalarValue4;
    float multiplyAddValue65 = productValue16 ? (fma(fragmentVectorConstants1.packedValues[5u].y, sampledTextureValue5.y, -scalarValue5) + scalarValue5) : scalarValue5;
    float multiplyAddValue66 = productValue16 ? (fma(fragmentVectorConstants1.packedValues[5u].z, sampledTextureValue5.z, -scalarValue6) + scalarValue6) : scalarValue6;
    float multiplyAddValue67 = productValue16 ? (fma(fragmentVectorConstants1.packedValues[5u].w, sampledTextureValue5.w, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue68 = fma(multiplyAddValue67, fma(multiplyAddValue64, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue64), multiplyAddValue64);
    float multiplyAddValue69 = fma(multiplyAddValue67, fma(multiplyAddValue65, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue65), multiplyAddValue65);
    float multiplyAddValue70 = fma(multiplyAddValue67, fma(multiplyAddValue66, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue66), multiplyAddValue66);
    fragmentColor0.w = spvNMax(multiplyAddValue67 * fragmentScalarConstants1.packedValues[3u], 0.0) * fragmentScalarConstants1.packedValues[16u];
    float multiplyAddValue58 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue52 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue6.x * fragmentVectorConstants1.packedValues[3u].x) * fragmentVectorConstants1.packedValues[6u].x;
    float multiplyAddValue53 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue6.y * fragmentVectorConstants1.packedValues[3u].y) * fragmentVectorConstants1.packedValues[6u].y;
    float multiplyAddValue54 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue6.z * fragmentVectorConstants1.packedValues[3u].z) * fragmentVectorConstants1.packedValues[6u].z;
    float multiplyAddValue71 = fma(multiplyAddValue52, multiplyAddValue52, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue68, multiplyAddValue58, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue68 * multiplyAddValue58) * varyingColor3.x);
    float multiplyAddValue72 = fma(multiplyAddValue53, multiplyAddValue53, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue69, multiplyAddValue59, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue69 * multiplyAddValue59) * varyingColor3.y);
    float multiplyAddValue73 = fma(multiplyAddValue54, multiplyAddValue54, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue70, multiplyAddValue60, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue70 * multiplyAddValue60) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue71, multiplyAddValue71);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue72, multiplyAddValue72);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue73, multiplyAddValue73);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue87 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue6.x * fragmentVectorConstants1.packedValues[3u].x) * fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue88 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue6.y * fragmentVectorConstants1.packedValues[3u].y) * fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue89 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue6.z * fragmentVectorConstants1.packedValues[3u].z) * fragmentVectorConstants1.packedValues[7u].z;
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue70 = sampledTextureValue5.x * fragmentVectorConstants1.packedValues[5u].x;
    float productValue71 = sampledTextureValue5.y * fragmentVectorConstants1.packedValues[5u].y;
    float productValue91 = productValue70 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue92 = productValue70 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue93 = productValue70 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue10 = ceil(productValue71);
    fragmentColor0.w = spvNMax(sampledTextureValue5.w * fragmentScalarConstants1.packedValues[23u], 0.0) * fragmentScalarConstants1.packedValues[16u];
    float multiplyAddValue90 = fma(scalarValue10, fma(productValue71, fragmentVectorConstants1.packedValues[6u].x, -productValue91), productValue91);
    float multiplyAddValue91 = fma(scalarValue10, fma(productValue71, fragmentVectorConstants1.packedValues[6u].y, -productValue92), productValue92);
    float multiplyAddValue92 = fma(scalarValue10, fma(productValue71, fragmentVectorConstants1.packedValues[6u].z, -productValue93), productValue93);
    float multiplyAddValue58 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue93 = fma(multiplyAddValue87, multiplyAddValue87, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue90, multiplyAddValue58, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue90 * multiplyAddValue58) * varyingColor3.x);
    float multiplyAddValue94 = fma(multiplyAddValue88, multiplyAddValue88, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue91, multiplyAddValue59, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue91 * multiplyAddValue59) * varyingColor3.y);
    float multiplyAddValue95 = fma(multiplyAddValue89, multiplyAddValue89, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue92, multiplyAddValue60, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue92 * multiplyAddValue60) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue93, multiplyAddValue93);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue94, multiplyAddValue94);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue95, multiplyAddValue95);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue4 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    float scalarValue7 = sampledTextureValue4.w;
    bool productValue102 = ((sampledTextureValue4.z + (scalarValue5 + scalarValue4)) * (1.0 - scalarValue7)) > 0.0;
    vec4 sampledTextureValue5 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue108 = productValue102 ? (fma(fragmentVectorConstants1.packedValues[5u].x, sampledTextureValue5.x, -scalarValue4) + scalarValue4) : scalarValue4;
    float multiplyAddValue109 = productValue102 ? (fma(fragmentVectorConstants1.packedValues[5u].y, sampledTextureValue5.y, -scalarValue5) + scalarValue5) : scalarValue5;
    float productValue103 = multiplyAddValue108 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue104 = multiplyAddValue108 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue105 = multiplyAddValue108 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue12 = ceil(multiplyAddValue109);
    fragmentColor0.w = spvNMax(productValue102 ? (fma(fragmentScalarConstants1.packedValues[23u], sampledTextureValue5.w, -scalarValue7) + scalarValue7) : scalarValue7, 0.0) * fragmentScalarConstants1.packedValues[16u];
    float multiplyAddValue110 = fma(scalarValue12, fma(multiplyAddValue109, fragmentVectorConstants1.packedValues[6u].x, -productValue103), productValue103);
    float multiplyAddValue111 = fma(scalarValue12, fma(multiplyAddValue109, fragmentVectorConstants1.packedValues[6u].y, -productValue104), productValue104);
    float multiplyAddValue112 = fma(scalarValue12, fma(multiplyAddValue109, fragmentVectorConstants1.packedValues[6u].z, -productValue105), productValue105);
    float multiplyAddValue58 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue87 = fma(sampledTextureValue7.x, fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue6.x * fragmentVectorConstants1.packedValues[3u].x) * fragmentVectorConstants1.packedValues[7u].x;
    float multiplyAddValue88 = fma(sampledTextureValue7.y, fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue6.y * fragmentVectorConstants1.packedValues[3u].y) * fragmentVectorConstants1.packedValues[7u].y;
    float multiplyAddValue89 = fma(sampledTextureValue7.z, fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue6.z * fragmentVectorConstants1.packedValues[3u].z) * fragmentVectorConstants1.packedValues[7u].z;
    float multiplyAddValue113 = fma(multiplyAddValue87, multiplyAddValue87, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue110, multiplyAddValue58, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue110 * multiplyAddValue58) * varyingColor3.x);
    float multiplyAddValue114 = fma(multiplyAddValue88, multiplyAddValue88, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue111, multiplyAddValue59, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue111 * multiplyAddValue59) * varyingColor3.y);
    float multiplyAddValue115 = fma(multiplyAddValue89, multiplyAddValue89, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue112, multiplyAddValue60, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue112 * multiplyAddValue60) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue113, multiplyAddValue113);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue114, multiplyAddValue114);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue115, multiplyAddValue115);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = (sampledTextureValue.x * fragmentVectorConstants1.packedValues[4u].x) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue1 = (sampledTextureValue.y * fragmentVectorConstants1.packedValues[4u].y) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue2 = (sampledTextureValue.z * fragmentVectorConstants1.packedValues[4u].z) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue3 = (fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[5u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue4 = (fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[5u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue5 = (fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[5u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue6 = (productValue3 * productValue3) + ((((fragmentVectorConstants1.packedValues[0u].x - productValue) * fragmentVectorConstants1.packedValues[0u].w) + productValue) * varyingColor3.x);
    float productValue7 = (productValue4 * productValue4) + ((((fragmentVectorConstants1.packedValues[0u].y - productValue1) * fragmentVectorConstants1.packedValues[0u].w) + productValue1) * varyingColor3.y);
    float productValue8 = (productValue5 * productValue5) + ((((fragmentVectorConstants1.packedValues[0u].z - productValue2) * fragmentVectorConstants1.packedValues[0u].w) + productValue2) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[3u].x * spvNMax(0.0, sampledTextureValue.w * fragmentVectorConstants1.packedValues[4u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.x;
    float scalarValue1 = sampledTextureValue3.y;
    float scalarValue2 = sampledTextureValue3.z;
    float scalarValue3 = sampledTextureValue3.w;
    float productValue9 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0 - scalarValue3)) > 0.0);
    float productValue10 = ((productValue9 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[4u].x) - scalarValue)) + scalarValue) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue11 = ((productValue9 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[4u].y) - scalarValue1)) + scalarValue1) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue12 = ((productValue9 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[4u].z) - scalarValue2)) + scalarValue2) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue3 = (fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[5u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue4 = (fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[5u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue5 = (fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[5u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue13 = (productValue3 * productValue3) + ((((fragmentVectorConstants1.packedValues[0u].x - productValue10) * fragmentVectorConstants1.packedValues[0u].w) + productValue10) * varyingColor3.x);
    float productValue14 = (productValue4 * productValue4) + ((((fragmentVectorConstants1.packedValues[0u].y - productValue11) * fragmentVectorConstants1.packedValues[0u].w) + productValue11) * varyingColor3.y);
    float productValue15 = (productValue5 * productValue5) + ((((fragmentVectorConstants1.packedValues[0u].z - productValue12) * fragmentVectorConstants1.packedValues[0u].w) + productValue12) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue13) * varyingColor2.w) + productValue13;
    fragmentColor0.y = ((varyingColor2.y - productValue14) * varyingColor2.w) + productValue14;
    fragmentColor0.z = ((varyingColor2.z - productValue15) * varyingColor2.w) + productValue15;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[3u].x * spvNMax(0.0, (productValue9 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[4u].w) - scalarValue3)) + scalarValue3);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue35 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[5u].x;
    float productValue36 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[5u].y;
    float productValue37 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[5u].z;
    float productValue38 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[5u].w;
    float productValue39 = ((((productValue35 * fragmentVectorConstants1.packedValues[0u].x) - productValue35) * productValue38) + productValue35) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue40 = ((((productValue36 * fragmentVectorConstants1.packedValues[0u].y) - productValue36) * productValue38) + productValue36) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue41 = ((((productValue37 * fragmentVectorConstants1.packedValues[0u].z) - productValue37) * productValue38) + productValue37) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue42 = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[6u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue43 = (fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[6u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue44 = (fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[6u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue45 = (productValue42 * productValue42) + ((((fragmentVectorConstants1.packedValues[1u].x - productValue39) * fragmentVectorConstants1.packedValues[1u].w) + productValue39) * varyingColor3.x);
    float productValue46 = (productValue43 * productValue43) + ((((fragmentVectorConstants1.packedValues[1u].y - productValue40) * fragmentVectorConstants1.packedValues[1u].w) + productValue40) * varyingColor3.y);
    float productValue47 = (productValue44 * productValue44) + ((((fragmentVectorConstants1.packedValues[1u].z - productValue41) * fragmentVectorConstants1.packedValues[1u].w) + productValue41) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue45) * varyingColor2.w) + productValue45;
    fragmentColor0.y = ((varyingColor2.y - productValue46) * varyingColor2.w) + productValue46;
    fragmentColor0.z = ((varyingColor2.z - productValue47) * varyingColor2.w) + productValue47;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[4u].x * spvNMax(0.0, productValue38 * fragmentVectorConstants1.packedValues[0u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.x;
    float scalarValue1 = sampledTextureValue3.y;
    float scalarValue2 = sampledTextureValue3.z;
    float scalarValue3 = sampledTextureValue3.w;
    float productValue9 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0 - scalarValue3)) > 0.0);
    float productValue48 = (productValue9 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[5u].x) - scalarValue)) + scalarValue;
    float productValue49 = (productValue9 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[5u].y) - scalarValue1)) + scalarValue1;
    float productValue50 = (productValue9 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[5u].z) - scalarValue2)) + scalarValue2;
    float productValue51 = (productValue9 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[5u].w) - scalarValue3)) + scalarValue3;
    float productValue52 = ((((productValue48 * fragmentVectorConstants1.packedValues[0u].x) - productValue48) * productValue51) + productValue48) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue53 = ((((productValue49 * fragmentVectorConstants1.packedValues[0u].y) - productValue49) * productValue51) + productValue49) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue54 = ((((productValue50 * fragmentVectorConstants1.packedValues[0u].z) - productValue50) * productValue51) + productValue50) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue42 = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[6u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue43 = (fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[6u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue44 = (fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[6u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue55 = (productValue42 * productValue42) + ((((fragmentVectorConstants1.packedValues[1u].x - productValue52) * fragmentVectorConstants1.packedValues[1u].w) + productValue52) * varyingColor3.x);
    float productValue56 = (productValue43 * productValue43) + ((((fragmentVectorConstants1.packedValues[1u].y - productValue53) * fragmentVectorConstants1.packedValues[1u].w) + productValue53) * varyingColor3.y);
    float productValue57 = (productValue44 * productValue44) + ((((fragmentVectorConstants1.packedValues[1u].z - productValue54) * fragmentVectorConstants1.packedValues[1u].w) + productValue54) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue55) * varyingColor2.w) + productValue55;
    fragmentColor0.y = ((varyingColor2.y - productValue56) * varyingColor2.w) + productValue56;
    fragmentColor0.z = ((varyingColor2.z - productValue57) * varyingColor2.w) + productValue57;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[4u].x * spvNMax(0.0, productValue51 * fragmentVectorConstants1.packedValues[0u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue35 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[5u].x;
    float productValue36 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[5u].y;
    float productValue74 = fragmentVectorConstants1.packedValues[0u].x * productValue35;
    float productValue75 = fragmentVectorConstants1.packedValues[0u].y * productValue35;
    float productValue76 = fragmentVectorConstants1.packedValues[0u].z * productValue35;
    float scalarValue9 = ceil(productValue36);
    float productValue77 = ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((productValue36 * fragmentVectorConstants1.packedValues[6u].x) - productValue74) * scalarValue9) + productValue74);
    float productValue78 = ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((productValue36 * fragmentVectorConstants1.packedValues[6u].y) - productValue75) * scalarValue9) + productValue75);
    float productValue79 = ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((productValue36 * fragmentVectorConstants1.packedValues[6u].z) - productValue76) * scalarValue9) + productValue76);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue80 = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[7u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue81 = (fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[7u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue82 = (fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[7u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue83 = (productValue80 * productValue80) + ((((fragmentVectorConstants1.packedValues[1u].x - productValue77) * fragmentVectorConstants1.packedValues[1u].w) + productValue77) * varyingColor3.x);
    float productValue84 = (productValue81 * productValue81) + ((((fragmentVectorConstants1.packedValues[1u].y - productValue78) * fragmentVectorConstants1.packedValues[1u].w) + productValue78) * varyingColor3.y);
    float productValue85 = (productValue82 * productValue82) + ((((fragmentVectorConstants1.packedValues[1u].z - productValue79) * fragmentVectorConstants1.packedValues[1u].w) + productValue79) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue83) * varyingColor2.w) + productValue83;
    fragmentColor0.y = ((varyingColor2.y - productValue84) * varyingColor2.w) + productValue84;
    fragmentColor0.z = ((varyingColor2.z - productValue85) * varyingColor2.w) + productValue85;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[4u].x * spvNMax(0.0, sampledTextureValue.w * fragmentVectorConstants1.packedValues[5u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue3 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue3.x;
    float scalarValue1 = sampledTextureValue3.y;
    float scalarValue3 = sampledTextureValue3.w;
    float productValue113 = float((((scalarValue + scalarValue1) + sampledTextureValue3.z) * (1.0 - scalarValue3)) > 0.0);
    float productValue114 = (productValue113 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[5u].x) - scalarValue)) + scalarValue;
    float productValue115 = (productValue113 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[5u].y) - scalarValue1)) + scalarValue1;
    float productValue116 = productValue114 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue117 = productValue114 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue118 = productValue114 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue15 = ceil(productValue115);
    float productValue119 = ((((productValue115 * fragmentVectorConstants1.packedValues[6u].x) - productValue116) * scalarValue15) + productValue116) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue120 = ((((productValue115 * fragmentVectorConstants1.packedValues[6u].y) - productValue117) * scalarValue15) + productValue117) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue121 = ((((productValue115 * fragmentVectorConstants1.packedValues[6u].z) - productValue118) * scalarValue15) + productValue118) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue2 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue80 = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[7u].x) * (sampledTextureValue2.x + sampledTextureValue1.x);
    float productValue81 = (fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[7u].y) * (sampledTextureValue2.y + sampledTextureValue1.y);
    float productValue82 = (fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[7u].z) * (sampledTextureValue2.z + sampledTextureValue1.z);
    float productValue122 = (productValue80 * productValue80) + ((((fragmentVectorConstants1.packedValues[1u].x - productValue119) * fragmentVectorConstants1.packedValues[1u].w) + productValue119) * varyingColor3.x);
    float productValue123 = (productValue81 * productValue81) + ((((fragmentVectorConstants1.packedValues[1u].y - productValue120) * fragmentVectorConstants1.packedValues[1u].w) + productValue120) * varyingColor3.y);
    float productValue124 = (productValue82 * productValue82) + ((((fragmentVectorConstants1.packedValues[1u].z - productValue121) * fragmentVectorConstants1.packedValues[1u].w) + productValue121) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue122) * varyingColor2.w) + productValue122;
    fragmentColor0.y = ((varyingColor2.y - productValue123) * varyingColor2.w) + productValue123;
    fragmentColor0.z = ((varyingColor2.z - productValue124) * varyingColor2.w) + productValue124;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[4u].x * spvNMax(0.0, (productValue113 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[5u].w) - scalarValue3)) + scalarValue3);
#endif
}
