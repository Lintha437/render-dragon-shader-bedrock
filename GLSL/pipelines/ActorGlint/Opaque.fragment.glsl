#version 460
#extension GL_GOOGLE_include_directive : require
// ActorGlint / Opaque / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 9
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/ActorGlint/FragmentBindings.glsli"

void main()
{
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue12 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[2u].x;
    precise float productValue13 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[2u].y;
    precise float productValue14 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[2u].z;
    precise float multiplyAddValue9 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[2u].x, productValue12) * fragmentVectorConstants1.packedValues[4u].x;
    precise float multiplyAddValue10 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[2u].y, productValue13) * fragmentVectorConstants1.packedValues[4u].y;
    precise float multiplyAddValue11 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[2u].z, productValue14) * fragmentVectorConstants1.packedValues[4u].z;
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[4u], sumValue, 1.0);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[4u], sumValue1, 1.0);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[4u], sumValue2, 1.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue15 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue16 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue17 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float productValue18 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[3u].w;
    precise float productValue19 = multiplyAddValue12 * productValue15;
    precise float productValue20 = multiplyAddValue13 * productValue16;
    precise float productValue21 = multiplyAddValue14 * productValue17;
    fragmentColor0.w = spvNMax(productValue18, 0.0);
    precise float multiplyAddValue15 = fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue15, multiplyAddValue12, fragmentVectorConstants1.packedValues[0u].x), productValue19) * varyingColor3.x;
    precise float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue16, multiplyAddValue13, fragmentVectorConstants1.packedValues[0u].y), productValue20) * varyingColor3.y;
    precise float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue17, multiplyAddValue14, fragmentVectorConstants1.packedValues[0u].z), productValue21) * varyingColor3.z;
    float multiplyAddValue18 = fma(multiplyAddValue9, multiplyAddValue9, multiplyAddValue15);
    float multiplyAddValue19 = fma(multiplyAddValue10, multiplyAddValue10, multiplyAddValue16);
    float multiplyAddValue20 = fma(multiplyAddValue11, multiplyAddValue11, multiplyAddValue17);
    precise float sumValue3 = varyingColor2.x - multiplyAddValue18;
    precise float sumValue4 = varyingColor2.y - multiplyAddValue19;
    precise float sumValue5 = varyingColor2.z - multiplyAddValue20;
    fragmentColor0.x = fma(varyingColor2.w, sumValue3, multiplyAddValue18);
    fragmentColor0.y = fma(varyingColor2.w, sumValue4, multiplyAddValue19);
    fragmentColor0.z = fma(varyingColor2.w, sumValue5, multiplyAddValue20);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue7.x;
    float scalarValue5 = sampledTextureValue7.y;
    float scalarValue6 = sampledTextureValue7.z;
    float scalarValue7 = sampledTextureValue7.w;
    precise float sumValue6 = scalarValue5 + scalarValue4;
    precise float sumValue7 = scalarValue6 + sumValue6;
    precise float sumValue8 = 1.0 - scalarValue7;
    precise float productValue29 = sumValue8 * sumValue7;
    float scalarValue8 = float(productValue29 > 0.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue21 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue2.x, -scalarValue4), scalarValue4);
    float multiplyAddValue22 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue2.y, -scalarValue5), scalarValue5);
    float multiplyAddValue23 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue2.z, -scalarValue6), scalarValue6);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[4u], sumValue, 1.0);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[4u], sumValue1, 1.0);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[4u], sumValue2, 1.0);
    precise float productValue30 = multiplyAddValue21 * multiplyAddValue12;
    precise float productValue31 = multiplyAddValue22 * multiplyAddValue13;
    precise float productValue32 = multiplyAddValue23 * multiplyAddValue14;
    fragmentColor0.w = spvNMax(fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[3u].w, sampledTextureValue2.w, -scalarValue7), scalarValue7), 0.0);
    precise float multiplyAddValue24 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue21, multiplyAddValue12, fragmentVectorConstants1.packedValues[0u].x), productValue30) * varyingColor3.x;
    precise float multiplyAddValue25 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue22, multiplyAddValue13, fragmentVectorConstants1.packedValues[0u].y), productValue31) * varyingColor3.y;
    precise float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue23, multiplyAddValue14, fragmentVectorConstants1.packedValues[0u].z), productValue32) * varyingColor3.z;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue12 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[2u].x;
    precise float productValue13 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[2u].y;
    precise float productValue14 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[2u].z;
    precise float multiplyAddValue9 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[2u].x, productValue12) * fragmentVectorConstants1.packedValues[4u].x;
    precise float multiplyAddValue10 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[2u].y, productValue13) * fragmentVectorConstants1.packedValues[4u].y;
    precise float multiplyAddValue11 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[2u].z, productValue14) * fragmentVectorConstants1.packedValues[4u].z;
    float multiplyAddValue27 = fma(multiplyAddValue9, multiplyAddValue9, multiplyAddValue24);
    float multiplyAddValue28 = fma(multiplyAddValue10, multiplyAddValue10, multiplyAddValue25);
    float multiplyAddValue29 = fma(multiplyAddValue11, multiplyAddValue11, multiplyAddValue26);
    precise float sumValue9 = varyingColor2.x - multiplyAddValue27;
    precise float sumValue10 = varyingColor2.y - multiplyAddValue28;
    precise float sumValue11 = varyingColor2.z - multiplyAddValue29;
    fragmentColor0.x = fma(varyingColor2.w, sumValue9, multiplyAddValue27);
    fragmentColor0.y = fma(varyingColor2.w, sumValue10, multiplyAddValue28);
    fragmentColor0.z = fma(varyingColor2.w, sumValue11, multiplyAddValue29);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue61 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue62 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue63 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue48 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, productValue61) * fragmentVectorConstants1.packedValues[5u].x;
    precise float multiplyAddValue49 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, productValue62) * fragmentVectorConstants1.packedValues[5u].y;
    precise float multiplyAddValue50 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, productValue63) * fragmentVectorConstants1.packedValues[5u].z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue64 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[4u].x;
    precise float productValue65 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[4u].y;
    precise float productValue66 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[4u].z;
    precise float productValue67 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue51 = fma(productValue67, fma(productValue64, fragmentVectorConstants1.packedValues[0u].x, -productValue64), productValue64);
    float multiplyAddValue52 = fma(productValue67, fma(productValue65, fragmentVectorConstants1.packedValues[0u].y, -productValue65), productValue65);
    float multiplyAddValue53 = fma(productValue67, fma(productValue66, fragmentVectorConstants1.packedValues[0u].z, -productValue66), productValue66);
    precise float productValue68 = productValue67 * fragmentScalarConstants1.packedValues[3u];
    fragmentColor0.w = spvNMax(productValue68, 0.0);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue69 = multiplyAddValue51 * multiplyAddValue54;
    precise float productValue70 = multiplyAddValue52 * multiplyAddValue55;
    precise float productValue71 = multiplyAddValue53 * multiplyAddValue56;
    precise float multiplyAddValue57 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue51, multiplyAddValue54, fragmentVectorConstants1.packedValues[1u].x), productValue69) * varyingColor3.x;
    precise float multiplyAddValue58 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue52, multiplyAddValue55, fragmentVectorConstants1.packedValues[1u].y), productValue70) * varyingColor3.y;
    precise float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue53, multiplyAddValue56, fragmentVectorConstants1.packedValues[1u].z), productValue71) * varyingColor3.z;
    float multiplyAddValue60 = fma(multiplyAddValue48, multiplyAddValue48, multiplyAddValue57);
    float multiplyAddValue61 = fma(multiplyAddValue49, multiplyAddValue49, multiplyAddValue58);
    float multiplyAddValue62 = fma(multiplyAddValue50, multiplyAddValue50, multiplyAddValue59);
    precise float sumValue12 = varyingColor2.x - multiplyAddValue60;
    precise float sumValue13 = varyingColor2.y - multiplyAddValue61;
    precise float sumValue14 = varyingColor2.z - multiplyAddValue62;
    fragmentColor0.x = fma(varyingColor2.w, sumValue12, multiplyAddValue60);
    fragmentColor0.y = fma(varyingColor2.w, sumValue13, multiplyAddValue61);
    fragmentColor0.z = fma(varyingColor2.w, sumValue14, multiplyAddValue62);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue7.x;
    float scalarValue5 = sampledTextureValue7.y;
    float scalarValue6 = sampledTextureValue7.z;
    float scalarValue7 = sampledTextureValue7.w;
    precise float sumValue6 = scalarValue5 + scalarValue4;
    precise float sumValue7 = scalarValue6 + sumValue6;
    precise float sumValue8 = 1.0 - scalarValue7;
    precise float productValue29 = sumValue8 * sumValue7;
    float scalarValue8 = float(productValue29 > 0.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue73 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[4u].x, sampledTextureValue2.x, -scalarValue4), scalarValue4);
    float multiplyAddValue74 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[4u].y, sampledTextureValue2.y, -scalarValue5), scalarValue5);
    float multiplyAddValue75 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[4u].z, sampledTextureValue2.z, -scalarValue6), scalarValue6);
    float multiplyAddValue76 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[4u].w, sampledTextureValue2.w, -scalarValue7), scalarValue7);
    float multiplyAddValue77 = fma(multiplyAddValue76, fma(multiplyAddValue73, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue73), multiplyAddValue73);
    float multiplyAddValue78 = fma(multiplyAddValue76, fma(multiplyAddValue74, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue74), multiplyAddValue74);
    float multiplyAddValue79 = fma(multiplyAddValue76, fma(multiplyAddValue75, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue75), multiplyAddValue75);
    precise float productValue72 = multiplyAddValue76 * fragmentScalarConstants1.packedValues[3u];
    fragmentColor0.w = spvNMax(productValue72, 0.0);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue73 = multiplyAddValue77 * multiplyAddValue54;
    precise float productValue74 = multiplyAddValue78 * multiplyAddValue55;
    precise float productValue75 = multiplyAddValue79 * multiplyAddValue56;
    precise float multiplyAddValue80 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue77, multiplyAddValue54, fragmentVectorConstants1.packedValues[1u].x), productValue73) * varyingColor3.x;
    precise float multiplyAddValue81 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue78, multiplyAddValue55, fragmentVectorConstants1.packedValues[1u].y), productValue74) * varyingColor3.y;
    precise float multiplyAddValue82 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue79, multiplyAddValue56, fragmentVectorConstants1.packedValues[1u].z), productValue75) * varyingColor3.z;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue61 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue62 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue63 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue48 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, productValue61) * fragmentVectorConstants1.packedValues[5u].x;
    precise float multiplyAddValue49 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, productValue62) * fragmentVectorConstants1.packedValues[5u].y;
    precise float multiplyAddValue50 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, productValue63) * fragmentVectorConstants1.packedValues[5u].z;
    float multiplyAddValue83 = fma(multiplyAddValue48, multiplyAddValue48, multiplyAddValue80);
    float multiplyAddValue84 = fma(multiplyAddValue49, multiplyAddValue49, multiplyAddValue81);
    float multiplyAddValue85 = fma(multiplyAddValue50, multiplyAddValue50, multiplyAddValue82);
    precise float sumValue15 = varyingColor2.x - multiplyAddValue83;
    precise float sumValue16 = varyingColor2.y - multiplyAddValue84;
    precise float sumValue17 = varyingColor2.z - multiplyAddValue85;
    fragmentColor0.x = fma(varyingColor2.w, sumValue15, multiplyAddValue83);
    fragmentColor0.y = fma(varyingColor2.w, sumValue16, multiplyAddValue84);
    fragmentColor0.z = fma(varyingColor2.w, sumValue17, multiplyAddValue85);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue61 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue62 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue63 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue95 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, productValue61) * fragmentVectorConstants1.packedValues[6u].x;
    precise float multiplyAddValue96 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, productValue62) * fragmentVectorConstants1.packedValues[6u].y;
    precise float multiplyAddValue97 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, productValue63) * fragmentVectorConstants1.packedValues[6u].z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue64 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[4u].x;
    precise float productValue65 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[4u].y;
    precise float productValue91 = sampledTextureValue2.w * fragmentScalarConstants1.packedValues[19u];
    precise float productValue92 = productValue64 * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue93 = productValue64 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue94 = productValue64 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue11 = ceil(productValue65);
    fragmentColor0.w = spvNMax(productValue91, 0.0);
    float multiplyAddValue98 = fma(scalarValue11, fma(productValue65, fragmentVectorConstants1.packedValues[5u].x, -productValue92), productValue92);
    float multiplyAddValue99 = fma(scalarValue11, fma(productValue65, fragmentVectorConstants1.packedValues[5u].y, -productValue93), productValue93);
    float multiplyAddValue100 = fma(scalarValue11, fma(productValue65, fragmentVectorConstants1.packedValues[5u].z, -productValue94), productValue94);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue95 = multiplyAddValue98 * multiplyAddValue54;
    precise float productValue96 = multiplyAddValue99 * multiplyAddValue55;
    precise float productValue97 = multiplyAddValue100 * multiplyAddValue56;
    precise float multiplyAddValue101 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue98, multiplyAddValue54, fragmentVectorConstants1.packedValues[1u].x), productValue95) * varyingColor3.x;
    precise float multiplyAddValue102 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue99, multiplyAddValue55, fragmentVectorConstants1.packedValues[1u].y), productValue96) * varyingColor3.y;
    precise float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue100, multiplyAddValue56, fragmentVectorConstants1.packedValues[1u].z), productValue97) * varyingColor3.z;
    float multiplyAddValue104 = fma(multiplyAddValue95, multiplyAddValue95, multiplyAddValue101);
    float multiplyAddValue105 = fma(multiplyAddValue96, multiplyAddValue96, multiplyAddValue102);
    float multiplyAddValue106 = fma(multiplyAddValue97, multiplyAddValue97, multiplyAddValue103);
    precise float sumValue18 = varyingColor2.x - multiplyAddValue104;
    precise float sumValue19 = varyingColor2.y - multiplyAddValue105;
    precise float sumValue20 = varyingColor2.z - multiplyAddValue106;
    fragmentColor0.x = fma(varyingColor2.w, sumValue18, multiplyAddValue104);
    fragmentColor0.y = fma(varyingColor2.w, sumValue19, multiplyAddValue105);
    fragmentColor0.z = fma(varyingColor2.w, sumValue20, multiplyAddValue106);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue7.x;
    float scalarValue5 = sampledTextureValue7.y;
    float scalarValue7 = sampledTextureValue7.w;
    precise float sumValue6 = scalarValue5 + scalarValue4;
    precise float sumValue21 = sampledTextureValue7.z + sumValue6;
    precise float sumValue8 = 1.0 - scalarValue7;
    precise float productValue114 = sumValue21 * sumValue8;
    float scalarValue14 = float(productValue114 > 0.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue115 = fma(scalarValue14, fma(fragmentVectorConstants1.packedValues[4u].x, sampledTextureValue2.x, -scalarValue4), scalarValue4);
    float multiplyAddValue116 = fma(scalarValue14, fma(fragmentVectorConstants1.packedValues[4u].y, sampledTextureValue2.y, -scalarValue5), scalarValue5);
    precise float productValue115 = multiplyAddValue115 * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue116 = multiplyAddValue115 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue117 = multiplyAddValue115 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue15 = ceil(multiplyAddValue116);
    fragmentColor0.w = spvNMax(fma(scalarValue14, fma(fragmentScalarConstants1.packedValues[19u], sampledTextureValue2.w, -scalarValue7), scalarValue7), 0.0);
    float multiplyAddValue117 = fma(scalarValue15, fma(multiplyAddValue116, fragmentVectorConstants1.packedValues[5u].x, -productValue115), productValue115);
    float multiplyAddValue118 = fma(scalarValue15, fma(multiplyAddValue116, fragmentVectorConstants1.packedValues[5u].y, -productValue116), productValue116);
    float multiplyAddValue119 = fma(scalarValue15, fma(multiplyAddValue116, fragmentVectorConstants1.packedValues[5u].z, -productValue117), productValue117);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue118 = multiplyAddValue117 * multiplyAddValue54;
    precise float productValue119 = multiplyAddValue118 * multiplyAddValue55;
    precise float productValue120 = multiplyAddValue119 * multiplyAddValue56;
    precise float multiplyAddValue120 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue117, multiplyAddValue54, fragmentVectorConstants1.packedValues[1u].x), productValue118) * varyingColor3.x;
    precise float multiplyAddValue121 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue118, multiplyAddValue55, fragmentVectorConstants1.packedValues[1u].y), productValue119) * varyingColor3.y;
    precise float multiplyAddValue122 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue119, multiplyAddValue56, fragmentVectorConstants1.packedValues[1u].z), productValue120) * varyingColor3.z;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    precise float productValue61 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue62 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue63 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float multiplyAddValue95 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, productValue61) * fragmentVectorConstants1.packedValues[6u].x;
    precise float multiplyAddValue96 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, productValue62) * fragmentVectorConstants1.packedValues[6u].y;
    precise float multiplyAddValue97 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, productValue63) * fragmentVectorConstants1.packedValues[6u].z;
    float multiplyAddValue123 = fma(multiplyAddValue95, multiplyAddValue95, multiplyAddValue120);
    float multiplyAddValue124 = fma(multiplyAddValue96, multiplyAddValue96, multiplyAddValue121);
    float multiplyAddValue125 = fma(multiplyAddValue97, multiplyAddValue97, multiplyAddValue122);
    precise float sumValue22 = varyingColor2.x - multiplyAddValue123;
    precise float sumValue23 = varyingColor2.y - multiplyAddValue124;
    precise float sumValue24 = varyingColor2.z - multiplyAddValue125;
    fragmentColor0.x = fma(varyingColor2.w, sumValue22, multiplyAddValue123);
    fragmentColor0.y = fma(varyingColor2.w, sumValue23, multiplyAddValue124);
    fragmentColor0.z = fma(varyingColor2.w, sumValue24, multiplyAddValue125);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[2u].x, sampledTextureValue.x * fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[4u].x;
    float multiplyAddValue1 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[2u].y, sampledTextureValue.y * fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[4u].y;
    float multiplyAddValue2 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[2u].z, sampledTextureValue.z * fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[4u].z;
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[3u].x;
    float productValue1 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[3u].y;
    float productValue2 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[3u].z;
    fragmentColor0.w = spvNMax(sampledTextureValue2.w * fragmentVectorConstants1.packedValues[3u].w, 0.0);
    float multiplyAddValue6 = fma(multiplyAddValue, multiplyAddValue, fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue, multiplyAddValue3, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue3 * productValue) * varyingColor3.x);
    float multiplyAddValue7 = fma(multiplyAddValue1, multiplyAddValue1, fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue1, multiplyAddValue4, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue4 * productValue1) * varyingColor3.y);
    float multiplyAddValue8 = fma(multiplyAddValue2, multiplyAddValue2, fma(fragmentScalarConstants1.packedValues[3u], fma(-productValue2, multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue5 * productValue2) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue6, multiplyAddValue6);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue7, multiplyAddValue7);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue8, multiplyAddValue8);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue7.x;
    float scalarValue5 = sampledTextureValue7.y;
    float scalarValue6 = sampledTextureValue7.z;
    float scalarValue7 = sampledTextureValue7.w;
    bool productValue33 = ((1.0 - scalarValue7) * (scalarValue6 + (scalarValue5 + scalarValue4))) > 0.0;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue30 = productValue33 ? (fma(fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue2.x, -scalarValue4) + scalarValue4) : scalarValue4;
    float multiplyAddValue31 = productValue33 ? (fma(fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue2.y, -scalarValue5) + scalarValue5) : scalarValue5;
    float multiplyAddValue32 = productValue33 ? (fma(fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue2.z, -scalarValue6) + scalarValue6) : scalarValue6;
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.z - 1.0, 1.0);
    fragmentColor0.w = spvNMax(productValue33 ? (fma(fragmentVectorConstants1.packedValues[3u].w, sampledTextureValue2.w, -scalarValue7) + scalarValue7) : scalarValue7, 0.0);
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[2u].x, sampledTextureValue.x * fragmentVectorConstants1.packedValues[2u].x) * fragmentVectorConstants1.packedValues[4u].x;
    float multiplyAddValue1 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[2u].y, sampledTextureValue.y * fragmentVectorConstants1.packedValues[2u].y) * fragmentVectorConstants1.packedValues[4u].y;
    float multiplyAddValue2 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[2u].z, sampledTextureValue.z * fragmentVectorConstants1.packedValues[2u].z) * fragmentVectorConstants1.packedValues[4u].z;
    float multiplyAddValue33 = fma(multiplyAddValue, multiplyAddValue, fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue30, multiplyAddValue3, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue30 * multiplyAddValue3) * varyingColor3.x);
    float multiplyAddValue34 = fma(multiplyAddValue1, multiplyAddValue1, fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue31, multiplyAddValue4, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue31 * multiplyAddValue4) * varyingColor3.y);
    float multiplyAddValue35 = fma(multiplyAddValue2, multiplyAddValue2, fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue32, multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue32 * multiplyAddValue5) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue33, multiplyAddValue33);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue34, multiplyAddValue34);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue35, multiplyAddValue35);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue36 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x) * fragmentVectorConstants1.packedValues[5u].x;
    float multiplyAddValue37 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y) * fragmentVectorConstants1.packedValues[5u].y;
    float multiplyAddValue38 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z) * fragmentVectorConstants1.packedValues[5u].z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue47 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[4u].x;
    float productValue48 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[4u].y;
    float productValue49 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[4u].z;
    float productValue50 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[4u].w;
    float multiplyAddValue39 = fma(productValue50, fma(productValue47, fragmentVectorConstants1.packedValues[0u].x, -productValue47), productValue47);
    float multiplyAddValue40 = fma(productValue50, fma(productValue48, fragmentVectorConstants1.packedValues[0u].y, -productValue48), productValue48);
    float multiplyAddValue41 = fma(productValue50, fma(productValue49, fragmentVectorConstants1.packedValues[0u].z, -productValue49), productValue49);
    fragmentColor0.w = spvNMax(productValue50 * fragmentScalarConstants1.packedValues[3u], 0.0);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue45 = fma(multiplyAddValue36, multiplyAddValue36, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue39, multiplyAddValue42, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue39 * multiplyAddValue42) * varyingColor3.x);
    float multiplyAddValue46 = fma(multiplyAddValue37, multiplyAddValue37, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue40, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue40 * multiplyAddValue43) * varyingColor3.y);
    float multiplyAddValue47 = fma(multiplyAddValue38, multiplyAddValue38, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue41, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue41 * multiplyAddValue44) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue45, multiplyAddValue45);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue46, multiplyAddValue46);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue47, multiplyAddValue47);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue7.x;
    float scalarValue5 = sampledTextureValue7.y;
    float scalarValue6 = sampledTextureValue7.z;
    float scalarValue7 = sampledTextureValue7.w;
    bool productValue33 = ((1.0 - scalarValue7) * (scalarValue6 + (scalarValue5 + scalarValue4))) > 0.0;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue63 = productValue33 ? (fma(fragmentVectorConstants1.packedValues[4u].x, sampledTextureValue2.x, -scalarValue4) + scalarValue4) : scalarValue4;
    float multiplyAddValue64 = productValue33 ? (fma(fragmentVectorConstants1.packedValues[4u].y, sampledTextureValue2.y, -scalarValue5) + scalarValue5) : scalarValue5;
    float multiplyAddValue65 = productValue33 ? (fma(fragmentVectorConstants1.packedValues[4u].z, sampledTextureValue2.z, -scalarValue6) + scalarValue6) : scalarValue6;
    float multiplyAddValue66 = productValue33 ? (fma(fragmentVectorConstants1.packedValues[4u].w, sampledTextureValue2.w, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue67 = fma(multiplyAddValue66, fma(multiplyAddValue63, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue63), multiplyAddValue63);
    float multiplyAddValue68 = fma(multiplyAddValue66, fma(multiplyAddValue64, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue64), multiplyAddValue64);
    float multiplyAddValue69 = fma(multiplyAddValue66, fma(multiplyAddValue65, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue65), multiplyAddValue65);
    fragmentColor0.w = spvNMax(multiplyAddValue66 * fragmentScalarConstants1.packedValues[3u], 0.0);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue36 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x) * fragmentVectorConstants1.packedValues[5u].x;
    float multiplyAddValue37 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y) * fragmentVectorConstants1.packedValues[5u].y;
    float multiplyAddValue38 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z) * fragmentVectorConstants1.packedValues[5u].z;
    float multiplyAddValue70 = fma(multiplyAddValue36, multiplyAddValue36, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue67, multiplyAddValue42, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue67 * multiplyAddValue42) * varyingColor3.x);
    float multiplyAddValue71 = fma(multiplyAddValue37, multiplyAddValue37, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue68, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue68 * multiplyAddValue43) * varyingColor3.y);
    float multiplyAddValue72 = fma(multiplyAddValue38, multiplyAddValue38, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue69, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue69 * multiplyAddValue44) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue70, multiplyAddValue70);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue71, multiplyAddValue71);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue72, multiplyAddValue72);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue86 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x) * fragmentVectorConstants1.packedValues[6u].x;
    float multiplyAddValue87 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y) * fragmentVectorConstants1.packedValues[6u].y;
    float multiplyAddValue88 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z) * fragmentVectorConstants1.packedValues[6u].z;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue47 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[4u].x;
    float productValue48 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[4u].y;
    float productValue88 = productValue47 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue89 = productValue47 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue90 = productValue47 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue10 = ceil(productValue48);
    fragmentColor0.w = spvNMax(sampledTextureValue2.w * fragmentScalarConstants1.packedValues[19u], 0.0);
    float multiplyAddValue89 = fma(scalarValue10, fma(productValue48, fragmentVectorConstants1.packedValues[5u].x, -productValue88), productValue88);
    float multiplyAddValue90 = fma(scalarValue10, fma(productValue48, fragmentVectorConstants1.packedValues[5u].y, -productValue89), productValue89);
    float multiplyAddValue91 = fma(scalarValue10, fma(productValue48, fragmentVectorConstants1.packedValues[5u].z, -productValue90), productValue90);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue92 = fma(multiplyAddValue86, multiplyAddValue86, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue89, multiplyAddValue42, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue89 * multiplyAddValue42) * varyingColor3.x);
    float multiplyAddValue93 = fma(multiplyAddValue87, multiplyAddValue87, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue90, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue90 * multiplyAddValue43) * varyingColor3.y);
    float multiplyAddValue94 = fma(multiplyAddValue88, multiplyAddValue88, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue91, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue91 * multiplyAddValue44) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue92, multiplyAddValue92);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue93, multiplyAddValue93);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue94, multiplyAddValue94);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue7 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue7.x;
    float scalarValue5 = sampledTextureValue7.y;
    float scalarValue7 = sampledTextureValue7.w;
    bool productValue110 = ((sampledTextureValue7.z + (scalarValue5 + scalarValue4)) * (1.0 - scalarValue7)) > 0.0;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue107 = productValue110 ? (fma(fragmentVectorConstants1.packedValues[4u].x, sampledTextureValue2.x, -scalarValue4) + scalarValue4) : scalarValue4;
    float multiplyAddValue108 = productValue110 ? (fma(fragmentVectorConstants1.packedValues[4u].y, sampledTextureValue2.y, -scalarValue5) + scalarValue5) : scalarValue5;
    float productValue111 = multiplyAddValue107 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue112 = multiplyAddValue107 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue113 = multiplyAddValue107 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue13 = ceil(multiplyAddValue108);
    fragmentColor0.w = spvNMax(productValue110 ? (fma(fragmentScalarConstants1.packedValues[19u], sampledTextureValue2.w, -scalarValue7) + scalarValue7) : scalarValue7, 0.0);
    float multiplyAddValue109 = fma(scalarValue13, fma(multiplyAddValue108, fragmentVectorConstants1.packedValues[5u].x, -productValue111), productValue111);
    float multiplyAddValue110 = fma(scalarValue13, fma(multiplyAddValue108, fragmentVectorConstants1.packedValues[5u].y, -productValue112), productValue112);
    float multiplyAddValue111 = fma(scalarValue13, fma(multiplyAddValue108, fragmentVectorConstants1.packedValues[5u].z, -productValue113), productValue113);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    vec4 sampledTextureValue = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    vec4 sampledTextureValue1 = texture(sampler2D(materialTexture1, textureSampler1), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    float multiplyAddValue86 = fma(sampledTextureValue1.x, fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x) * fragmentVectorConstants1.packedValues[6u].x;
    float multiplyAddValue87 = fma(sampledTextureValue1.y, fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y) * fragmentVectorConstants1.packedValues[6u].y;
    float multiplyAddValue88 = fma(sampledTextureValue1.z, fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z) * fragmentVectorConstants1.packedValues[6u].z;
    float multiplyAddValue112 = fma(multiplyAddValue86, multiplyAddValue86, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue109, multiplyAddValue42, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue109 * multiplyAddValue42) * varyingColor3.x);
    float multiplyAddValue113 = fma(multiplyAddValue87, multiplyAddValue87, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue110, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue110 * multiplyAddValue43) * varyingColor3.y);
    float multiplyAddValue114 = fma(multiplyAddValue88, multiplyAddValue88, fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue111, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue111 * multiplyAddValue44) * varyingColor3.z);
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue112, multiplyAddValue112);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue113, multiplyAddValue113);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue114, multiplyAddValue114);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue3 = (sampledTextureValue3.x * fragmentVectorConstants1.packedValues[3u].x) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue4 = (sampledTextureValue3.y * fragmentVectorConstants1.packedValues[3u].y) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue5 = (sampledTextureValue3.z * fragmentVectorConstants1.packedValues[3u].z) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue6 = (fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[4u].x) * (sampledTextureValue5.x + sampledTextureValue4.x);
    float productValue7 = (fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[4u].y) * (sampledTextureValue5.y + sampledTextureValue4.y);
    float productValue8 = (fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[4u].z) * (sampledTextureValue5.z + sampledTextureValue4.z);
    float productValue9 = (productValue6 * productValue6) + ((((fragmentVectorConstants1.packedValues[0u].x - productValue3) * fragmentVectorConstants1.packedValues[0u].w) + productValue3) * varyingColor3.x);
    float productValue10 = (productValue7 * productValue7) + ((((fragmentVectorConstants1.packedValues[0u].y - productValue4) * fragmentVectorConstants1.packedValues[0u].w) + productValue4) * varyingColor3.y);
    float productValue11 = (productValue8 * productValue8) + ((((fragmentVectorConstants1.packedValues[0u].z - productValue5) * fragmentVectorConstants1.packedValues[0u].w) + productValue5) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = spvNMax(0.0, sampledTextureValue3.w * fragmentVectorConstants1.packedValues[3u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue6 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue6.x;
    float scalarValue1 = sampledTextureValue6.y;
    float scalarValue2 = sampledTextureValue6.z;
    float scalarValue3 = sampledTextureValue6.w;
    float productValue22 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0 - scalarValue3)) > 0.0);
    float productValue23 = ((productValue22 * ((sampledTextureValue3.x * fragmentVectorConstants1.packedValues[3u].x) - scalarValue)) + scalarValue) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue24 = ((productValue22 * ((sampledTextureValue3.y * fragmentVectorConstants1.packedValues[3u].y) - scalarValue1)) + scalarValue1) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue25 = ((productValue22 * ((sampledTextureValue3.z * fragmentVectorConstants1.packedValues[3u].z) - scalarValue2)) + scalarValue2) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue6 = (fragmentVectorConstants1.packedValues[2u].x * fragmentVectorConstants1.packedValues[4u].x) * (sampledTextureValue5.x + sampledTextureValue4.x);
    float productValue7 = (fragmentVectorConstants1.packedValues[2u].y * fragmentVectorConstants1.packedValues[4u].y) * (sampledTextureValue5.y + sampledTextureValue4.y);
    float productValue8 = (fragmentVectorConstants1.packedValues[2u].z * fragmentVectorConstants1.packedValues[4u].z) * (sampledTextureValue5.z + sampledTextureValue4.z);
    float productValue26 = (productValue6 * productValue6) + ((((fragmentVectorConstants1.packedValues[0u].x - productValue23) * fragmentVectorConstants1.packedValues[0u].w) + productValue23) * varyingColor3.x);
    float productValue27 = (productValue7 * productValue7) + ((((fragmentVectorConstants1.packedValues[0u].y - productValue24) * fragmentVectorConstants1.packedValues[0u].w) + productValue24) * varyingColor3.y);
    float productValue28 = (productValue8 * productValue8) + ((((fragmentVectorConstants1.packedValues[0u].z - productValue25) * fragmentVectorConstants1.packedValues[0u].w) + productValue25) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue26) * varyingColor2.w) + productValue26;
    fragmentColor0.y = ((varyingColor2.y - productValue27) * varyingColor2.w) + productValue27;
    fragmentColor0.z = ((varyingColor2.z - productValue28) * varyingColor2.w) + productValue28;
    fragmentColor0.w = spvNMax(0.0, (productValue22 * ((sampledTextureValue3.w * fragmentVectorConstants1.packedValues[3u].w) - scalarValue3)) + scalarValue3);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue34 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[4u].x;
    float productValue35 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[4u].y;
    float productValue36 = sampledTextureValue3.z * fragmentVectorConstants1.packedValues[4u].z;
    float productValue37 = sampledTextureValue3.w * fragmentVectorConstants1.packedValues[4u].w;
    float productValue38 = ((((productValue34 * fragmentVectorConstants1.packedValues[0u].x) - productValue34) * productValue37) + productValue34) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue39 = ((((productValue35 * fragmentVectorConstants1.packedValues[0u].y) - productValue35) * productValue37) + productValue35) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue40 = ((((productValue36 * fragmentVectorConstants1.packedValues[0u].z) - productValue36) * productValue37) + productValue36) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue41 = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[5u].x) * (sampledTextureValue5.x + sampledTextureValue4.x);
    float productValue42 = (fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[5u].y) * (sampledTextureValue5.y + sampledTextureValue4.y);
    float productValue43 = (fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[5u].z) * (sampledTextureValue5.z + sampledTextureValue4.z);
    float productValue44 = (productValue41 * productValue41) + ((((fragmentVectorConstants1.packedValues[1u].x - productValue38) * fragmentVectorConstants1.packedValues[1u].w) + productValue38) * varyingColor3.x);
    float productValue45 = (productValue42 * productValue42) + ((((fragmentVectorConstants1.packedValues[1u].y - productValue39) * fragmentVectorConstants1.packedValues[1u].w) + productValue39) * varyingColor3.y);
    float productValue46 = (productValue43 * productValue43) + ((((fragmentVectorConstants1.packedValues[1u].z - productValue40) * fragmentVectorConstants1.packedValues[1u].w) + productValue40) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue44) * varyingColor2.w) + productValue44;
    fragmentColor0.y = ((varyingColor2.y - productValue45) * varyingColor2.w) + productValue45;
    fragmentColor0.z = ((varyingColor2.z - productValue46) * varyingColor2.w) + productValue46;
    fragmentColor0.w = spvNMax(0.0, productValue37 * fragmentVectorConstants1.packedValues[0u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue6 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue6.x;
    float scalarValue1 = sampledTextureValue6.y;
    float scalarValue2 = sampledTextureValue6.z;
    float scalarValue3 = sampledTextureValue6.w;
    float productValue22 = float((((scalarValue + scalarValue1) + scalarValue2) * (1.0 - scalarValue3)) > 0.0);
    float productValue51 = (productValue22 * ((sampledTextureValue3.x * fragmentVectorConstants1.packedValues[4u].x) - scalarValue)) + scalarValue;
    float productValue52 = (productValue22 * ((sampledTextureValue3.y * fragmentVectorConstants1.packedValues[4u].y) - scalarValue1)) + scalarValue1;
    float productValue53 = (productValue22 * ((sampledTextureValue3.z * fragmentVectorConstants1.packedValues[4u].z) - scalarValue2)) + scalarValue2;
    float productValue54 = (productValue22 * ((sampledTextureValue3.w * fragmentVectorConstants1.packedValues[4u].w) - scalarValue3)) + scalarValue3;
    float productValue55 = ((((productValue51 * fragmentVectorConstants1.packedValues[0u].x) - productValue51) * productValue54) + productValue51) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue56 = ((((productValue52 * fragmentVectorConstants1.packedValues[0u].y) - productValue52) * productValue54) + productValue52) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue57 = ((((productValue53 * fragmentVectorConstants1.packedValues[0u].z) - productValue53) * productValue54) + productValue53) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue41 = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[5u].x) * (sampledTextureValue5.x + sampledTextureValue4.x);
    float productValue42 = (fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[5u].y) * (sampledTextureValue5.y + sampledTextureValue4.y);
    float productValue43 = (fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[5u].z) * (sampledTextureValue5.z + sampledTextureValue4.z);
    float productValue58 = (productValue41 * productValue41) + ((((fragmentVectorConstants1.packedValues[1u].x - productValue55) * fragmentVectorConstants1.packedValues[1u].w) + productValue55) * varyingColor3.x);
    float productValue59 = (productValue42 * productValue42) + ((((fragmentVectorConstants1.packedValues[1u].y - productValue56) * fragmentVectorConstants1.packedValues[1u].w) + productValue56) * varyingColor3.y);
    float productValue60 = (productValue43 * productValue43) + ((((fragmentVectorConstants1.packedValues[1u].z - productValue57) * fragmentVectorConstants1.packedValues[1u].w) + productValue57) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue58) * varyingColor2.w) + productValue58;
    fragmentColor0.y = ((varyingColor2.y - productValue59) * varyingColor2.w) + productValue59;
    fragmentColor0.z = ((varyingColor2.z - productValue60) * varyingColor2.w) + productValue60;
    fragmentColor0.w = spvNMax(0.0, productValue54 * fragmentVectorConstants1.packedValues[0u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue34 = sampledTextureValue3.x * fragmentVectorConstants1.packedValues[4u].x;
    float productValue35 = sampledTextureValue3.y * fragmentVectorConstants1.packedValues[4u].y;
    float productValue76 = fragmentVectorConstants1.packedValues[0u].x * productValue34;
    float productValue77 = fragmentVectorConstants1.packedValues[0u].y * productValue34;
    float productValue78 = fragmentVectorConstants1.packedValues[0u].z * productValue34;
    float scalarValue9 = ceil(productValue35);
    float productValue79 = ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0) * ((((productValue35 * fragmentVectorConstants1.packedValues[5u].x) - productValue76) * scalarValue9) + productValue76);
    float productValue80 = ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0) * ((((productValue35 * fragmentVectorConstants1.packedValues[5u].y) - productValue77) * scalarValue9) + productValue77);
    float productValue81 = ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0) * ((((productValue35 * fragmentVectorConstants1.packedValues[5u].z) - productValue78) * scalarValue9) + productValue78);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue82 = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[6u].x) * (sampledTextureValue5.x + sampledTextureValue4.x);
    float productValue83 = (fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[6u].y) * (sampledTextureValue5.y + sampledTextureValue4.y);
    float productValue84 = (fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[6u].z) * (sampledTextureValue5.z + sampledTextureValue4.z);
    float productValue85 = (productValue82 * productValue82) + ((((fragmentVectorConstants1.packedValues[1u].x - productValue79) * fragmentVectorConstants1.packedValues[1u].w) + productValue79) * varyingColor3.x);
    float productValue86 = (productValue83 * productValue83) + ((((fragmentVectorConstants1.packedValues[1u].y - productValue80) * fragmentVectorConstants1.packedValues[1u].w) + productValue80) * varyingColor3.y);
    float productValue87 = (productValue84 * productValue84) + ((((fragmentVectorConstants1.packedValues[1u].z - productValue81) * fragmentVectorConstants1.packedValues[1u].w) + productValue81) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue85) * varyingColor2.w) + productValue85;
    fragmentColor0.y = ((varyingColor2.y - productValue86) * varyingColor2.w) + productValue86;
    fragmentColor0.z = ((varyingColor2.z - productValue87) * varyingColor2.w) + productValue87;
    fragmentColor0.w = spvNMax(0.0, sampledTextureValue3.w * fragmentVectorConstants1.packedValues[4u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue3 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue6 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue6.x;
    float scalarValue1 = sampledTextureValue6.y;
    float scalarValue3 = sampledTextureValue6.w;
    float productValue98 = float((((scalarValue + scalarValue1) + sampledTextureValue6.z) * (1.0 - scalarValue3)) > 0.0);
    float productValue99 = (productValue98 * ((sampledTextureValue3.x * fragmentVectorConstants1.packedValues[4u].x) - scalarValue)) + scalarValue;
    float productValue100 = (productValue98 * ((sampledTextureValue3.y * fragmentVectorConstants1.packedValues[4u].y) - scalarValue1)) + scalarValue1;
    float productValue101 = productValue99 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue102 = productValue99 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue103 = productValue99 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue12 = ceil(productValue100);
    float productValue104 = ((((productValue100 * fragmentVectorConstants1.packedValues[5u].x) - productValue101) * scalarValue12) + productValue101) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue105 = ((((productValue100 * fragmentVectorConstants1.packedValues[5u].y) - productValue102) * scalarValue12) + productValue102) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue106 = ((((productValue100 * fragmentVectorConstants1.packedValues[5u].z) - productValue103) * scalarValue12) + productValue103) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0);
    vec4 sampledTextureValue4 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.x), fract(varyingTexCoord2.y)));
    vec4 sampledTextureValue5 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(fract(varyingTexCoord2.z), fract(varyingTexCoord2.w)));
    float productValue82 = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[6u].x) * (sampledTextureValue5.x + sampledTextureValue4.x);
    float productValue83 = (fragmentVectorConstants1.packedValues[3u].y * fragmentVectorConstants1.packedValues[6u].y) * (sampledTextureValue5.y + sampledTextureValue4.y);
    float productValue84 = (fragmentVectorConstants1.packedValues[3u].z * fragmentVectorConstants1.packedValues[6u].z) * (sampledTextureValue5.z + sampledTextureValue4.z);
    float productValue107 = (productValue82 * productValue82) + ((((fragmentVectorConstants1.packedValues[1u].x - productValue104) * fragmentVectorConstants1.packedValues[1u].w) + productValue104) * varyingColor3.x);
    float productValue108 = (productValue83 * productValue83) + ((((fragmentVectorConstants1.packedValues[1u].y - productValue105) * fragmentVectorConstants1.packedValues[1u].w) + productValue105) * varyingColor3.y);
    float productValue109 = (productValue84 * productValue84) + ((((fragmentVectorConstants1.packedValues[1u].z - productValue106) * fragmentVectorConstants1.packedValues[1u].w) + productValue106) * varyingColor3.z);
    fragmentColor0.x = ((varyingColor2.x - productValue107) * varyingColor2.w) + productValue107;
    fragmentColor0.y = ((varyingColor2.y - productValue108) * varyingColor2.w) + productValue108;
    fragmentColor0.z = ((varyingColor2.z - productValue109) * varyingColor2.w) + productValue109;
    fragmentColor0.w = spvNMax(0.0, (productValue98 * ((sampledTextureValue3.w * fragmentVectorConstants1.packedValues[4u].w) - scalarValue3)) + scalarValue3);
#endif
}
