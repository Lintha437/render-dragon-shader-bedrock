#version 460
#extension GL_GOOGLE_include_directive : require
// ActorTint / Opaque / fragment forward pipeline.
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
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/ActorTint/FragmentBindings.glsli"

void main()
{
#if (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue12 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[2u].x;
    precise float productValue13 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[2u].y;
    precise float productValue14 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[2u].z;
    precise float productValue15 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[2u].w;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.w;
    float multiplyAddValue9 = fma(scalarValue1, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[3u].x, -productValue12), productValue12);
    float multiplyAddValue10 = fma(scalarValue1, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[3u].y, -productValue13), productValue13);
    float multiplyAddValue11 = fma(scalarValue1, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[3u].z, -productValue14), productValue14);
    fragmentColor0.w = spvNMax(productValue15, 0.0);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[4u], sumValue, 1.0);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[4u], sumValue1, 1.0);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[4u], sumValue2, 1.0);
    precise float productValue16 = multiplyAddValue9 * multiplyAddValue12;
    precise float productValue17 = multiplyAddValue10 * multiplyAddValue13;
    precise float productValue18 = multiplyAddValue11 * multiplyAddValue14;
    float multiplyAddValue15 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue9, multiplyAddValue12, fragmentVectorConstants1.packedValues[0u].x), productValue16);
    float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue10, multiplyAddValue13, fragmentVectorConstants1.packedValues[0u].y), productValue17);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue11, multiplyAddValue14, fragmentVectorConstants1.packedValues[0u].z), productValue18);
    precise float productValue19 = multiplyAddValue15 * varyingColor3.x;
    precise float productValue20 = multiplyAddValue16 * varyingColor3.y;
    precise float productValue21 = multiplyAddValue17 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue15, varyingColor3.x, varyingColor2.x), productValue19);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue16, varyingColor3.y, varyingColor2.y), productValue20);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue17, varyingColor3.z, varyingColor2.z), productValue21);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue3.x;
    float scalarValue6 = sampledTextureValue3.y;
    float scalarValue7 = sampledTextureValue3.z;
    float scalarValue1 = sampledTextureValue3.w;
    precise float sumValue3 = scalarValue6 + scalarValue5;
    precise float sumValue4 = scalarValue7 + sumValue3;
    precise float sumValue5 = 1.0 - scalarValue1;
    precise float productValue46 = sumValue5 * sumValue4;
    float scalarValue8 = float(productValue46 > 0.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue27 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[2u].x, sampledTextureValue2.x, -scalarValue5), scalarValue5);
    float multiplyAddValue28 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[2u].y, sampledTextureValue2.y, -scalarValue6), scalarValue6);
    float multiplyAddValue29 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[2u].z, sampledTextureValue2.z, -scalarValue7), scalarValue7);
    float multiplyAddValue30 = fma(scalarValue1, fma(scalarValue5, fragmentVectorConstants1.packedValues[3u].x, -multiplyAddValue27), multiplyAddValue27);
    float multiplyAddValue31 = fma(scalarValue1, fma(scalarValue6, fragmentVectorConstants1.packedValues[3u].y, -multiplyAddValue28), multiplyAddValue28);
    float multiplyAddValue32 = fma(scalarValue1, fma(scalarValue7, fragmentVectorConstants1.packedValues[3u].z, -multiplyAddValue29), multiplyAddValue29);
    fragmentColor0.w = spvNMax(fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[2u].w, sampledTextureValue2.w, -scalarValue1), scalarValue1), 0.0);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[4u], sumValue, 1.0);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[4u], sumValue1, 1.0);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[4u], sumValue2, 1.0);
    precise float productValue47 = multiplyAddValue30 * multiplyAddValue12;
    precise float productValue48 = multiplyAddValue31 * multiplyAddValue13;
    precise float productValue49 = multiplyAddValue32 * multiplyAddValue14;
    float multiplyAddValue33 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue30, multiplyAddValue12, fragmentVectorConstants1.packedValues[0u].x), productValue47);
    float multiplyAddValue34 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue31, multiplyAddValue13, fragmentVectorConstants1.packedValues[0u].y), productValue48);
    float multiplyAddValue35 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue32, multiplyAddValue14, fragmentVectorConstants1.packedValues[0u].z), productValue49);
    precise float productValue50 = multiplyAddValue33 * varyingColor3.x;
    precise float productValue51 = multiplyAddValue34 * varyingColor3.y;
    precise float productValue52 = multiplyAddValue35 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue33, varyingColor3.x, varyingColor2.x), productValue50);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue34, varyingColor3.y, varyingColor2.y), productValue51);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue35, varyingColor3.z, varyingColor2.z), productValue52);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue57 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue58 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue59 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float productValue60 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue48 = fma(productValue60, fma(productValue57, fragmentVectorConstants1.packedValues[0u].x, -productValue57), productValue57);
    float multiplyAddValue49 = fma(productValue60, fma(productValue58, fragmentVectorConstants1.packedValues[0u].y, -productValue58), productValue58);
    float multiplyAddValue50 = fma(productValue60, fma(productValue59, fragmentVectorConstants1.packedValues[0u].z, -productValue59), productValue59);
    precise float productValue61 = productValue60 * fragmentScalarConstants1.packedValues[3u];
    fragmentColor0.w = spvNMax(productValue61, 0.0);
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.w;
    float multiplyAddValue51 = fma(scalarValue1, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[4u].x, -multiplyAddValue48), multiplyAddValue48);
    float multiplyAddValue52 = fma(scalarValue1, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[4u].y, -multiplyAddValue49), multiplyAddValue49);
    float multiplyAddValue53 = fma(scalarValue1, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[4u].z, -multiplyAddValue50), multiplyAddValue50);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue62 = multiplyAddValue51 * multiplyAddValue54;
    precise float productValue63 = multiplyAddValue52 * multiplyAddValue55;
    precise float productValue64 = multiplyAddValue53 * multiplyAddValue56;
    float multiplyAddValue57 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue51, multiplyAddValue54, fragmentVectorConstants1.packedValues[1u].x), productValue62);
    float multiplyAddValue58 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue52, multiplyAddValue55, fragmentVectorConstants1.packedValues[1u].y), productValue63);
    float multiplyAddValue59 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue53, multiplyAddValue56, fragmentVectorConstants1.packedValues[1u].z), productValue64);
    precise float productValue65 = multiplyAddValue57 * varyingColor3.x;
    precise float productValue66 = multiplyAddValue58 * varyingColor3.y;
    precise float productValue67 = multiplyAddValue59 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue57, varyingColor3.x, varyingColor2.x), productValue65);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue58, varyingColor3.y, varyingColor2.y), productValue66);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue59, varyingColor3.z, varyingColor2.z), productValue67);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue3.x;
    float scalarValue6 = sampledTextureValue3.y;
    float scalarValue7 = sampledTextureValue3.z;
    float scalarValue1 = sampledTextureValue3.w;
    precise float sumValue3 = scalarValue6 + scalarValue5;
    precise float sumValue4 = scalarValue7 + sumValue3;
    precise float sumValue5 = 1.0 - scalarValue1;
    precise float productValue46 = sumValue5 * sumValue4;
    float scalarValue8 = float(productValue46 > 0.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue73 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue2.x, -scalarValue5), scalarValue5);
    float multiplyAddValue74 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue2.y, -scalarValue6), scalarValue6);
    float multiplyAddValue75 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue2.z, -scalarValue7), scalarValue7);
    float multiplyAddValue76 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[3u].w, sampledTextureValue2.w, -scalarValue1), scalarValue1);
    float multiplyAddValue77 = fma(multiplyAddValue76, fma(multiplyAddValue73, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue73), multiplyAddValue73);
    float multiplyAddValue78 = fma(multiplyAddValue76, fma(multiplyAddValue74, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue74), multiplyAddValue74);
    float multiplyAddValue79 = fma(multiplyAddValue76, fma(multiplyAddValue75, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue75), multiplyAddValue75);
    precise float productValue93 = multiplyAddValue76 * fragmentScalarConstants1.packedValues[3u];
    fragmentColor0.w = spvNMax(productValue93, 0.0);
    float multiplyAddValue80 = fma(scalarValue1, fma(scalarValue5, fragmentVectorConstants1.packedValues[4u].x, -multiplyAddValue77), multiplyAddValue77);
    float multiplyAddValue81 = fma(scalarValue1, fma(scalarValue6, fragmentVectorConstants1.packedValues[4u].y, -multiplyAddValue78), multiplyAddValue78);
    float multiplyAddValue82 = fma(scalarValue1, fma(scalarValue7, fragmentVectorConstants1.packedValues[4u].z, -multiplyAddValue79), multiplyAddValue79);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue94 = multiplyAddValue80 * multiplyAddValue54;
    precise float productValue95 = multiplyAddValue81 * multiplyAddValue55;
    precise float productValue96 = multiplyAddValue82 * multiplyAddValue56;
    float multiplyAddValue83 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue80, multiplyAddValue54, fragmentVectorConstants1.packedValues[1u].x), productValue94);
    float multiplyAddValue84 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue81, multiplyAddValue55, fragmentVectorConstants1.packedValues[1u].y), productValue95);
    float multiplyAddValue85 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue82, multiplyAddValue56, fragmentVectorConstants1.packedValues[1u].z), productValue96);
    precise float productValue97 = multiplyAddValue83 * varyingColor3.x;
    precise float productValue98 = multiplyAddValue84 * varyingColor3.y;
    precise float productValue99 = multiplyAddValue85 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue83, varyingColor3.x, varyingColor2.x), productValue97);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue84, varyingColor3.y, varyingColor2.y), productValue98);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue85, varyingColor3.z, varyingColor2.z), productValue99);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue57 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue58 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue115 = sampledTextureValue2.w * fragmentScalarConstants1.packedValues[15u];
    precise float productValue116 = productValue57 * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue117 = productValue57 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue118 = productValue57 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue12 = ceil(productValue58);
    fragmentColor0.w = spvNMax(productValue115, 0.0);
    float multiplyAddValue95 = fma(scalarValue12, fma(productValue58, fragmentVectorConstants1.packedValues[4u].x, -productValue116), productValue116);
    float multiplyAddValue96 = fma(scalarValue12, fma(productValue58, fragmentVectorConstants1.packedValues[4u].y, -productValue117), productValue117);
    float multiplyAddValue97 = fma(scalarValue12, fma(productValue58, fragmentVectorConstants1.packedValues[4u].z, -productValue118), productValue118);
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.w;
    float multiplyAddValue98 = fma(scalarValue1, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[4u].x, -multiplyAddValue95), multiplyAddValue95);
    float multiplyAddValue99 = fma(scalarValue1, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[4u].y, -multiplyAddValue96), multiplyAddValue96);
    float multiplyAddValue100 = fma(scalarValue1, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[4u].z, -multiplyAddValue97), multiplyAddValue97);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue119 = multiplyAddValue98 * multiplyAddValue54;
    precise float productValue120 = multiplyAddValue99 * multiplyAddValue55;
    precise float productValue121 = multiplyAddValue100 * multiplyAddValue56;
    float multiplyAddValue101 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue98, multiplyAddValue54, fragmentVectorConstants1.packedValues[1u].x), productValue119);
    float multiplyAddValue102 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue99, multiplyAddValue55, fragmentVectorConstants1.packedValues[1u].y), productValue120);
    float multiplyAddValue103 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue100, multiplyAddValue56, fragmentVectorConstants1.packedValues[1u].z), productValue121);
    precise float productValue122 = multiplyAddValue101 * varyingColor3.x;
    precise float productValue123 = multiplyAddValue102 * varyingColor3.y;
    precise float productValue124 = multiplyAddValue103 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue101, varyingColor3.x, varyingColor2.x), productValue122);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue102, varyingColor3.y, varyingColor2.y), productValue123);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue103, varyingColor3.z, varyingColor2.z), productValue124);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue3.x;
    float scalarValue6 = sampledTextureValue3.y;
    float scalarValue7 = sampledTextureValue3.z;
    float scalarValue1 = sampledTextureValue3.w;
    precise float sumValue3 = scalarValue6 + scalarValue5;
    precise float sumValue4 = scalarValue7 + sumValue3;
    precise float sumValue5 = 1.0 - scalarValue1;
    precise float productValue46 = sumValue5 * sumValue4;
    float scalarValue8 = float(productValue46 > 0.0);
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue73 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue2.x, -scalarValue5), scalarValue5);
    float multiplyAddValue74 = fma(scalarValue8, fma(fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue2.y, -scalarValue6), scalarValue6);
    precise float productValue128 = multiplyAddValue73 * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue129 = multiplyAddValue73 * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue130 = multiplyAddValue73 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue14 = ceil(multiplyAddValue74);
    fragmentColor0.w = spvNMax(fma(scalarValue8, fma(fragmentScalarConstants1.packedValues[15u], sampledTextureValue2.w, -scalarValue1), scalarValue1), 0.0);
    float multiplyAddValue113 = fma(scalarValue14, fma(multiplyAddValue74, fragmentVectorConstants1.packedValues[4u].x, -productValue128), productValue128);
    float multiplyAddValue114 = fma(scalarValue14, fma(multiplyAddValue74, fragmentVectorConstants1.packedValues[4u].y, -productValue129), productValue129);
    float multiplyAddValue115 = fma(scalarValue14, fma(multiplyAddValue74, fragmentVectorConstants1.packedValues[4u].z, -productValue130), productValue130);
    float multiplyAddValue116 = fma(scalarValue1, fma(scalarValue5, fragmentVectorConstants1.packedValues[4u].x, -multiplyAddValue113), multiplyAddValue113);
    float multiplyAddValue117 = fma(scalarValue1, fma(scalarValue6, fragmentVectorConstants1.packedValues[4u].y, -multiplyAddValue114), multiplyAddValue114);
    float multiplyAddValue118 = fma(scalarValue1, fma(scalarValue7, fragmentVectorConstants1.packedValues[4u].z, -multiplyAddValue115), multiplyAddValue115);
    precise float sumValue = varyingColor0.x - 1.0;
    precise float sumValue1 = varyingColor0.y - 1.0;
    precise float sumValue2 = varyingColor0.z - 1.0;
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[8u], sumValue, 1.0);
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[8u], sumValue1, 1.0);
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[8u], sumValue2, 1.0);
    precise float productValue131 = multiplyAddValue116 * multiplyAddValue54;
    precise float productValue132 = multiplyAddValue117 * multiplyAddValue55;
    precise float productValue133 = multiplyAddValue118 * multiplyAddValue56;
    float multiplyAddValue119 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue116, multiplyAddValue54, fragmentVectorConstants1.packedValues[1u].x), productValue131);
    float multiplyAddValue120 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue117, multiplyAddValue55, fragmentVectorConstants1.packedValues[1u].y), productValue132);
    float multiplyAddValue121 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue118, multiplyAddValue56, fragmentVectorConstants1.packedValues[1u].z), productValue133);
    precise float productValue134 = multiplyAddValue119 * varyingColor3.x;
    precise float productValue135 = multiplyAddValue120 * varyingColor3.y;
    precise float productValue136 = multiplyAddValue121 * varyingColor3.z;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue119, varyingColor3.x, varyingColor2.x), productValue134);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue120, varyingColor3.y, varyingColor2.y), productValue135);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue121, varyingColor3.z, varyingColor2.z), productValue136);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue9 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[2u].x;
    float productValue10 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[2u].y;
    float productValue11 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[2u].z;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.w;
    float multiplyAddValue = fma(scalarValue1, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[3u].x, -productValue9), productValue9);
    float multiplyAddValue1 = fma(scalarValue1, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[3u].y, -productValue10), productValue10);
    float multiplyAddValue2 = fma(scalarValue1, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[3u].z, -productValue11), productValue11);
    fragmentColor0.w = spvNMax(sampledTextureValue2.w * fragmentVectorConstants1.packedValues[2u].w, 0.0);
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue, multiplyAddValue3, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue * multiplyAddValue3);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue1, multiplyAddValue4, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue1 * multiplyAddValue4);
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue2, multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue2 * multiplyAddValue5);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue6, varyingColor3.x, varyingColor2.x), multiplyAddValue6 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue7, varyingColor3.y, varyingColor2.y), multiplyAddValue7 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue8, varyingColor3.z, varyingColor2.z), multiplyAddValue8 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue3.x;
    float scalarValue6 = sampledTextureValue3.y;
    float scalarValue7 = sampledTextureValue3.z;
    float scalarValue1 = sampledTextureValue3.w;
    bool productValue45 = ((1.0 - scalarValue1) * (scalarValue7 + (scalarValue6 + scalarValue5))) > 0.0;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue18 = productValue45 ? (fma(fragmentVectorConstants1.packedValues[2u].x, sampledTextureValue2.x, -scalarValue5) + scalarValue5) : scalarValue5;
    float multiplyAddValue19 = productValue45 ? (fma(fragmentVectorConstants1.packedValues[2u].y, sampledTextureValue2.y, -scalarValue6) + scalarValue6) : scalarValue6;
    float multiplyAddValue20 = productValue45 ? (fma(fragmentVectorConstants1.packedValues[2u].z, sampledTextureValue2.z, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue21 = fma(scalarValue1, fma(scalarValue5, fragmentVectorConstants1.packedValues[3u].x, -multiplyAddValue18), multiplyAddValue18);
    float multiplyAddValue22 = fma(scalarValue1, fma(scalarValue6, fragmentVectorConstants1.packedValues[3u].y, -multiplyAddValue19), multiplyAddValue19);
    float multiplyAddValue23 = fma(scalarValue1, fma(scalarValue7, fragmentVectorConstants1.packedValues[3u].z, -multiplyAddValue20), multiplyAddValue20);
    fragmentColor0.w = spvNMax(productValue45 ? (fma(fragmentVectorConstants1.packedValues[2u].w, sampledTextureValue2.w, -scalarValue1) + scalarValue1) : scalarValue1, 0.0);
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[4u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue24 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue21, multiplyAddValue3, fragmentVectorConstants1.packedValues[0u].x), multiplyAddValue21 * multiplyAddValue3);
    float multiplyAddValue25 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue22, multiplyAddValue4, fragmentVectorConstants1.packedValues[0u].y), multiplyAddValue22 * multiplyAddValue4);
    float multiplyAddValue26 = fma(fragmentScalarConstants1.packedValues[3u], fma(-multiplyAddValue23, multiplyAddValue5, fragmentVectorConstants1.packedValues[0u].z), multiplyAddValue23 * multiplyAddValue5);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue24, varyingColor3.x, varyingColor2.x), multiplyAddValue24 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue25, varyingColor3.y, varyingColor2.y), multiplyAddValue25 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue26, varyingColor3.z, varyingColor2.z), multiplyAddValue26 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue53 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[3u].x;
    float productValue54 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[3u].y;
    float productValue55 = sampledTextureValue2.z * fragmentVectorConstants1.packedValues[3u].z;
    float productValue56 = sampledTextureValue2.w * fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue36 = fma(productValue56, fma(productValue53, fragmentVectorConstants1.packedValues[0u].x, -productValue53), productValue53);
    float multiplyAddValue37 = fma(productValue56, fma(productValue54, fragmentVectorConstants1.packedValues[0u].y, -productValue54), productValue54);
    float multiplyAddValue38 = fma(productValue56, fma(productValue55, fragmentVectorConstants1.packedValues[0u].z, -productValue55), productValue55);
    fragmentColor0.w = spvNMax(productValue56 * fragmentScalarConstants1.packedValues[3u], 0.0);
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.w;
    float multiplyAddValue39 = fma(scalarValue1, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[4u].x, -multiplyAddValue36), multiplyAddValue36);
    float multiplyAddValue40 = fma(scalarValue1, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[4u].y, -multiplyAddValue37), multiplyAddValue37);
    float multiplyAddValue41 = fma(scalarValue1, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[4u].z, -multiplyAddValue38), multiplyAddValue38);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue45 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue39, multiplyAddValue42, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue39 * multiplyAddValue42);
    float multiplyAddValue46 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue40, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue40 * multiplyAddValue43);
    float multiplyAddValue47 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue41, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue41 * multiplyAddValue44);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue45, varyingColor3.x, varyingColor2.x), multiplyAddValue45 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue46, varyingColor3.y, varyingColor2.y), multiplyAddValue46 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue47, varyingColor3.z, varyingColor2.z), multiplyAddValue47 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue3.x;
    float scalarValue6 = sampledTextureValue3.y;
    float scalarValue7 = sampledTextureValue3.z;
    float scalarValue1 = sampledTextureValue3.w;
    bool productValue45 = ((1.0 - scalarValue1) * (scalarValue7 + (scalarValue6 + scalarValue5))) > 0.0;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue60 = productValue45 ? (fma(fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue2.x, -scalarValue5) + scalarValue5) : scalarValue5;
    float multiplyAddValue61 = productValue45 ? (fma(fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue2.y, -scalarValue6) + scalarValue6) : scalarValue6;
    float multiplyAddValue62 = productValue45 ? (fma(fragmentVectorConstants1.packedValues[3u].z, sampledTextureValue2.z, -scalarValue7) + scalarValue7) : scalarValue7;
    float multiplyAddValue63 = productValue45 ? (fma(fragmentVectorConstants1.packedValues[3u].w, sampledTextureValue2.w, -scalarValue1) + scalarValue1) : scalarValue1;
    float multiplyAddValue64 = fma(multiplyAddValue63, fma(multiplyAddValue60, fragmentVectorConstants1.packedValues[0u].x, -multiplyAddValue60), multiplyAddValue60);
    float multiplyAddValue65 = fma(multiplyAddValue63, fma(multiplyAddValue61, fragmentVectorConstants1.packedValues[0u].y, -multiplyAddValue61), multiplyAddValue61);
    float multiplyAddValue66 = fma(multiplyAddValue63, fma(multiplyAddValue62, fragmentVectorConstants1.packedValues[0u].z, -multiplyAddValue62), multiplyAddValue62);
    fragmentColor0.w = spvNMax(multiplyAddValue63 * fragmentScalarConstants1.packedValues[3u], 0.0);
    float multiplyAddValue67 = fma(scalarValue1, fma(scalarValue5, fragmentVectorConstants1.packedValues[4u].x, -multiplyAddValue64), multiplyAddValue64);
    float multiplyAddValue68 = fma(scalarValue1, fma(scalarValue6, fragmentVectorConstants1.packedValues[4u].y, -multiplyAddValue65), multiplyAddValue65);
    float multiplyAddValue69 = fma(scalarValue1, fma(scalarValue7, fragmentVectorConstants1.packedValues[4u].z, -multiplyAddValue66), multiplyAddValue66);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue70 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue67, multiplyAddValue42, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue67 * multiplyAddValue42);
    float multiplyAddValue71 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue68, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue68 * multiplyAddValue43);
    float multiplyAddValue72 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue69, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue69 * multiplyAddValue44);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue70, varyingColor3.x, varyingColor2.x), multiplyAddValue70 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue71, varyingColor3.y, varyingColor2.y), multiplyAddValue71 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue72, varyingColor3.z, varyingColor2.z), multiplyAddValue72 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue53 = sampledTextureValue2.x * fragmentVectorConstants1.packedValues[3u].x;
    float productValue54 = sampledTextureValue2.y * fragmentVectorConstants1.packedValues[3u].y;
    float productValue100 = productValue53 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue101 = productValue53 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue102 = productValue53 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue10 = ceil(productValue54);
    fragmentColor0.w = spvNMax(sampledTextureValue2.w * fragmentScalarConstants1.packedValues[15u], 0.0);
    float multiplyAddValue86 = fma(scalarValue10, fma(productValue54, fragmentVectorConstants1.packedValues[4u].x, -productValue100), productValue100);
    float multiplyAddValue87 = fma(scalarValue10, fma(productValue54, fragmentVectorConstants1.packedValues[4u].y, -productValue101), productValue101);
    float multiplyAddValue88 = fma(scalarValue10, fma(productValue54, fragmentVectorConstants1.packedValues[4u].z, -productValue102), productValue102);
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue1 = sampledTextureValue3.w;
    float multiplyAddValue89 = fma(scalarValue1, fma(sampledTextureValue3.x, fragmentVectorConstants1.packedValues[4u].x, -multiplyAddValue86), multiplyAddValue86);
    float multiplyAddValue90 = fma(scalarValue1, fma(sampledTextureValue3.y, fragmentVectorConstants1.packedValues[4u].y, -multiplyAddValue87), multiplyAddValue87);
    float multiplyAddValue91 = fma(scalarValue1, fma(sampledTextureValue3.z, fragmentVectorConstants1.packedValues[4u].z, -multiplyAddValue88), multiplyAddValue88);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue92 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue89, multiplyAddValue42, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue89 * multiplyAddValue42);
    float multiplyAddValue93 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue90, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue90 * multiplyAddValue43);
    float multiplyAddValue94 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue91, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue91 * multiplyAddValue44);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue92, varyingColor3.x, varyingColor2.x), multiplyAddValue92 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue93, varyingColor3.y, varyingColor2.y), multiplyAddValue93 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue94, varyingColor3.z, varyingColor2.z), multiplyAddValue94 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture1, textureSampler1), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue5 = sampledTextureValue3.x;
    float scalarValue6 = sampledTextureValue3.y;
    float scalarValue7 = sampledTextureValue3.z;
    float scalarValue1 = sampledTextureValue3.w;
    bool productValue45 = ((1.0 - scalarValue1) * (scalarValue7 + (scalarValue6 + scalarValue5))) > 0.0;
    vec4 sampledTextureValue2 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float multiplyAddValue60 = productValue45 ? (fma(fragmentVectorConstants1.packedValues[3u].x, sampledTextureValue2.x, -scalarValue5) + scalarValue5) : scalarValue5;
    float multiplyAddValue61 = productValue45 ? (fma(fragmentVectorConstants1.packedValues[3u].y, sampledTextureValue2.y, -scalarValue6) + scalarValue6) : scalarValue6;
    float productValue125 = multiplyAddValue60 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue126 = multiplyAddValue60 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue127 = multiplyAddValue60 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue13 = ceil(multiplyAddValue61);
    fragmentColor0.w = spvNMax(productValue45 ? (fma(fragmentScalarConstants1.packedValues[15u], sampledTextureValue2.w, -scalarValue1) + scalarValue1) : scalarValue1, 0.0);
    float multiplyAddValue104 = fma(scalarValue13, fma(multiplyAddValue61, fragmentVectorConstants1.packedValues[4u].x, -productValue125), productValue125);
    float multiplyAddValue105 = fma(scalarValue13, fma(multiplyAddValue61, fragmentVectorConstants1.packedValues[4u].y, -productValue126), productValue126);
    float multiplyAddValue106 = fma(scalarValue13, fma(multiplyAddValue61, fragmentVectorConstants1.packedValues[4u].z, -productValue127), productValue127);
    float multiplyAddValue107 = fma(scalarValue1, fma(scalarValue5, fragmentVectorConstants1.packedValues[4u].x, -multiplyAddValue104), multiplyAddValue104);
    float multiplyAddValue108 = fma(scalarValue1, fma(scalarValue6, fragmentVectorConstants1.packedValues[4u].y, -multiplyAddValue105), multiplyAddValue105);
    float multiplyAddValue109 = fma(scalarValue1, fma(scalarValue7, fragmentVectorConstants1.packedValues[4u].z, -multiplyAddValue106), multiplyAddValue106);
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.x - 1.0, 1.0);
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.y - 1.0, 1.0);
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[8u], varyingColor0.z - 1.0, 1.0);
    float multiplyAddValue110 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue107, multiplyAddValue42, fragmentVectorConstants1.packedValues[1u].x), multiplyAddValue107 * multiplyAddValue42);
    float multiplyAddValue111 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue108, multiplyAddValue43, fragmentVectorConstants1.packedValues[1u].y), multiplyAddValue108 * multiplyAddValue43);
    float multiplyAddValue112 = fma(fragmentScalarConstants1.packedValues[7u], fma(-multiplyAddValue109, multiplyAddValue44, fragmentVectorConstants1.packedValues[1u].z), multiplyAddValue109 * multiplyAddValue44);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue110, varyingColor3.x, varyingColor2.x), multiplyAddValue110 * varyingColor3.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue111, varyingColor3.y, varyingColor2.y), multiplyAddValue111 * varyingColor3.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue112, varyingColor3.z, varyingColor2.z), multiplyAddValue112 * varyingColor3.z);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue = sampledTextureValue.x * fragmentVectorConstants1.packedValues[2u].x;
    float productValue1 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[2u].y;
    float productValue2 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[2u].z;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue3 = ((((fragmentVectorConstants1.packedValues[3u].x * sampledTextureValue1.x) - productValue) * scalarValue) + productValue) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue4 = ((((fragmentVectorConstants1.packedValues[3u].y * sampledTextureValue1.y) - productValue1) * scalarValue) + productValue1) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue5 = ((((fragmentVectorConstants1.packedValues[3u].z * sampledTextureValue1.z) - productValue2) * scalarValue) + productValue2) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue6 = (((fragmentVectorConstants1.packedValues[0u].x - productValue3) * fragmentVectorConstants1.packedValues[0u].w) + productValue3) * varyingColor3.x;
    float productValue7 = (((fragmentVectorConstants1.packedValues[0u].y - productValue4) * fragmentVectorConstants1.packedValues[0u].w) + productValue4) * varyingColor3.y;
    float productValue8 = (((fragmentVectorConstants1.packedValues[0u].z - productValue5) * fragmentVectorConstants1.packedValues[0u].w) + productValue5) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = spvNMax(0.0, sampledTextureValue.w * fragmentVectorConstants1.packedValues[2u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue22 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0 - scalarValue)) > 0.0);
    float productValue23 = (productValue22 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[2u].x) - scalarValue2)) + scalarValue2;
    float productValue24 = (productValue22 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[2u].y) - scalarValue3)) + scalarValue3;
    float productValue25 = (productValue22 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[2u].z) - scalarValue4)) + scalarValue4;
    float productValue26 = ((((fragmentVectorConstants1.packedValues[3u].x * scalarValue2) - productValue23) * scalarValue) + productValue23) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue27 = ((((fragmentVectorConstants1.packedValues[3u].y * scalarValue3) - productValue24) * scalarValue) + productValue24) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue28 = ((((fragmentVectorConstants1.packedValues[3u].z * scalarValue4) - productValue25) * scalarValue) + productValue25) * ((fragmentVectorConstants1.packedValues[1u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue29 = (((fragmentVectorConstants1.packedValues[0u].x - productValue26) * fragmentVectorConstants1.packedValues[0u].w) + productValue26) * varyingColor3.x;
    float productValue30 = (((fragmentVectorConstants1.packedValues[0u].y - productValue27) * fragmentVectorConstants1.packedValues[0u].w) + productValue27) * varyingColor3.y;
    float productValue31 = (((fragmentVectorConstants1.packedValues[0u].z - productValue28) * fragmentVectorConstants1.packedValues[0u].w) + productValue28) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue29) * varyingColor2.w) + productValue29;
    fragmentColor0.y = ((varyingColor2.y - productValue30) * varyingColor2.w) + productValue30;
    fragmentColor0.z = ((varyingColor2.z - productValue31) * varyingColor2.w) + productValue31;
    fragmentColor0.w = spvNMax(0.0, (productValue22 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[2u].w) - scalarValue)) + scalarValue);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue32 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x;
    float productValue33 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y;
    float productValue34 = sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z;
    float productValue35 = sampledTextureValue.w * fragmentVectorConstants1.packedValues[3u].w;
    float productValue36 = (((productValue32 * fragmentVectorConstants1.packedValues[0u].x) - productValue32) * productValue35) + productValue32;
    float productValue37 = (((productValue33 * fragmentVectorConstants1.packedValues[0u].y) - productValue33) * productValue35) + productValue33;
    float productValue38 = (((productValue34 * fragmentVectorConstants1.packedValues[0u].z) - productValue34) * productValue35) + productValue34;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue39 = ((((fragmentVectorConstants1.packedValues[4u].x * sampledTextureValue1.x) - productValue36) * scalarValue) + productValue36) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue40 = ((((fragmentVectorConstants1.packedValues[4u].y * sampledTextureValue1.y) - productValue37) * scalarValue) + productValue37) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue41 = ((((fragmentVectorConstants1.packedValues[4u].z * sampledTextureValue1.z) - productValue38) * scalarValue) + productValue38) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue42 = (((fragmentVectorConstants1.packedValues[1u].x - productValue39) * fragmentVectorConstants1.packedValues[1u].w) + productValue39) * varyingColor3.x;
    float productValue43 = (((fragmentVectorConstants1.packedValues[1u].y - productValue40) * fragmentVectorConstants1.packedValues[1u].w) + productValue40) * varyingColor3.y;
    float productValue44 = (((fragmentVectorConstants1.packedValues[1u].z - productValue41) * fragmentVectorConstants1.packedValues[1u].w) + productValue41) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue42) * varyingColor2.w) + productValue42;
    fragmentColor0.y = ((varyingColor2.y - productValue43) * varyingColor2.w) + productValue43;
    fragmentColor0.z = ((varyingColor2.z - productValue44) * varyingColor2.w) + productValue44;
    fragmentColor0.w = spvNMax(0.0, productValue35 * fragmentVectorConstants1.packedValues[0u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue22 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0 - scalarValue)) > 0.0);
    float productValue68 = (productValue22 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x) - scalarValue2)) + scalarValue2;
    float productValue69 = (productValue22 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y) - scalarValue3)) + scalarValue3;
    float productValue70 = (productValue22 * ((sampledTextureValue.z * fragmentVectorConstants1.packedValues[3u].z) - scalarValue4)) + scalarValue4;
    float productValue71 = (productValue22 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[3u].w) - scalarValue)) + scalarValue;
    float productValue72 = (((productValue68 * fragmentVectorConstants1.packedValues[0u].x) - productValue68) * productValue71) + productValue68;
    float productValue73 = (((productValue69 * fragmentVectorConstants1.packedValues[0u].y) - productValue69) * productValue71) + productValue69;
    float productValue74 = (((productValue70 * fragmentVectorConstants1.packedValues[0u].z) - productValue70) * productValue71) + productValue70;
    float productValue75 = ((((fragmentVectorConstants1.packedValues[4u].x * scalarValue2) - productValue72) * scalarValue) + productValue72) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue76 = ((((fragmentVectorConstants1.packedValues[4u].y * scalarValue3) - productValue73) * scalarValue) + productValue73) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue77 = ((((fragmentVectorConstants1.packedValues[4u].z * scalarValue4) - productValue74) * scalarValue) + productValue74) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue78 = (((fragmentVectorConstants1.packedValues[1u].x - productValue75) * fragmentVectorConstants1.packedValues[1u].w) + productValue75) * varyingColor3.x;
    float productValue79 = (((fragmentVectorConstants1.packedValues[1u].y - productValue76) * fragmentVectorConstants1.packedValues[1u].w) + productValue76) * varyingColor3.y;
    float productValue80 = (((fragmentVectorConstants1.packedValues[1u].z - productValue77) * fragmentVectorConstants1.packedValues[1u].w) + productValue77) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue78) * varyingColor2.w) + productValue78;
    fragmentColor0.y = ((varyingColor2.y - productValue79) * varyingColor2.w) + productValue79;
    fragmentColor0.z = ((varyingColor2.z - productValue80) * varyingColor2.w) + productValue80;
    fragmentColor0.w = spvNMax(0.0, productValue71 * fragmentVectorConstants1.packedValues[0u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_OFF && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float productValue32 = sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x;
    float productValue33 = sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y;
    float productValue81 = fragmentVectorConstants1.packedValues[0u].x * productValue32;
    float productValue82 = fragmentVectorConstants1.packedValues[0u].y * productValue32;
    float productValue83 = fragmentVectorConstants1.packedValues[0u].z * productValue32;
    float scalarValue9 = ceil(productValue33);
    float productValue84 = (((productValue33 * fragmentVectorConstants1.packedValues[4u].x) - productValue81) * scalarValue9) + productValue81;
    float productValue85 = (((productValue33 * fragmentVectorConstants1.packedValues[4u].y) - productValue82) * scalarValue9) + productValue82;
    float productValue86 = (((productValue33 * fragmentVectorConstants1.packedValues[4u].z) - productValue83) * scalarValue9) + productValue83;
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue1.w;
    float productValue87 = ((((sampledTextureValue1.x * fragmentVectorConstants1.packedValues[4u].x) - productValue84) * scalarValue) + productValue84) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue88 = ((((sampledTextureValue1.y * fragmentVectorConstants1.packedValues[4u].y) - productValue85) * scalarValue) + productValue85) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue89 = ((((sampledTextureValue1.z * fragmentVectorConstants1.packedValues[4u].z) - productValue86) * scalarValue) + productValue86) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue90 = (((fragmentVectorConstants1.packedValues[1u].x - productValue87) * fragmentVectorConstants1.packedValues[1u].w) + productValue87) * varyingColor3.x;
    float productValue91 = (((fragmentVectorConstants1.packedValues[1u].y - productValue88) * fragmentVectorConstants1.packedValues[1u].w) + productValue88) * varyingColor3.y;
    float productValue92 = (((fragmentVectorConstants1.packedValues[1u].z - productValue89) * fragmentVectorConstants1.packedValues[1u].w) + productValue89) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue90) * varyingColor2.w) + productValue90;
    fragmentColor0.y = ((varyingColor2.y - productValue91) * varyingColor2.w) + productValue91;
    fragmentColor0.z = ((varyingColor2.z - productValue92) * varyingColor2.w) + productValue92;
    fragmentColor0.w = spvNMax(0.0, sampledTextureValue.w * fragmentVectorConstants1.packedValues[3u].w);
#elif (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_MASKED_MULTITEXTURE == RD_ON && RD_OPTION_CHANGE_COLOR == RD_CHANGE_COLOR_MULTI && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    vec4 sampledTextureValue1 = texture(sampler2D(matTexture1Texture, matTexture1Sampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue2 = sampledTextureValue1.x;
    float scalarValue3 = sampledTextureValue1.y;
    float scalarValue4 = sampledTextureValue1.z;
    float scalarValue = sampledTextureValue1.w;
    float productValue22 = float((((scalarValue2 + scalarValue3) + scalarValue4) * (1.0 - scalarValue)) > 0.0);
    float productValue68 = (productValue22 * ((sampledTextureValue.x * fragmentVectorConstants1.packedValues[3u].x) - scalarValue2)) + scalarValue2;
    float productValue69 = (productValue22 * ((sampledTextureValue.y * fragmentVectorConstants1.packedValues[3u].y) - scalarValue3)) + scalarValue3;
    float productValue103 = productValue68 * fragmentVectorConstants1.packedValues[0u].x;
    float productValue104 = productValue68 * fragmentVectorConstants1.packedValues[0u].y;
    float productValue105 = productValue68 * fragmentVectorConstants1.packedValues[0u].z;
    float scalarValue11 = ceil(productValue69);
    float productValue106 = (((productValue69 * fragmentVectorConstants1.packedValues[4u].x) - productValue103) * scalarValue11) + productValue103;
    float productValue107 = (((productValue69 * fragmentVectorConstants1.packedValues[4u].y) - productValue104) * scalarValue11) + productValue104;
    float productValue108 = (((productValue69 * fragmentVectorConstants1.packedValues[4u].z) - productValue105) * scalarValue11) + productValue105;
    float productValue109 = ((((fragmentVectorConstants1.packedValues[4u].x * scalarValue2) - productValue106) * scalarValue) + productValue106) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.x + (-1.0))) + 1.0);
    float productValue110 = ((((fragmentVectorConstants1.packedValues[4u].y * scalarValue3) - productValue107) * scalarValue) + productValue107) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.y + (-1.0))) + 1.0);
    float productValue111 = ((((fragmentVectorConstants1.packedValues[4u].z * scalarValue4) - productValue108) * scalarValue) + productValue108) * ((fragmentVectorConstants1.packedValues[2u].x * (varyingColor0.z + (-1.0))) + 1.0);
    float productValue112 = (((fragmentVectorConstants1.packedValues[1u].x - productValue109) * fragmentVectorConstants1.packedValues[1u].w) + productValue109) * varyingColor3.x;
    float productValue113 = (((fragmentVectorConstants1.packedValues[1u].y - productValue110) * fragmentVectorConstants1.packedValues[1u].w) + productValue110) * varyingColor3.y;
    float productValue114 = (((fragmentVectorConstants1.packedValues[1u].z - productValue111) * fragmentVectorConstants1.packedValues[1u].w) + productValue111) * varyingColor3.z;
    fragmentColor0.x = ((varyingColor2.x - productValue112) * varyingColor2.w) + productValue112;
    fragmentColor0.y = ((varyingColor2.y - productValue113) * varyingColor2.w) + productValue113;
    fragmentColor0.z = ((varyingColor2.z - productValue114) * varyingColor2.w) + productValue114;
    fragmentColor0.w = spvNMax(0.0, (productValue22 * ((sampledTextureValue.w * fragmentVectorConstants1.packedValues[3u].w) - scalarValue)) + scalarValue);
#endif
}
