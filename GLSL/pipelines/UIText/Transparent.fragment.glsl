#version 460
#extension GL_GOOGLE_include_directive : require
// UIText / Transparent / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 24
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_ALPHA_TEST
#define RD_FEATURE_ALPHA_TEST RD_OFF
#endif
#ifndef RD_OPTION_FONT_TYPE
#define RD_OPTION_FONT_TYPE RD_FONT_TYPE_BITMAP
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#elif (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM65)
#extension GL_EXT_spirv_intrinsics : require
#endif

#include "../../include/materials/UIText/FragmentBindings.glsli"

void main()
{
#if (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w)));
    precise float productValue = sampledTextureValue.x * varyingColor0.x;
    precise float productValue1 = sampledTextureValue.y * varyingColor0.y;
    precise float productValue2 = sampledTextureValue.z * varyingColor0.z;
    precise float productValue3 = sampledTextureValue.w * varyingColor0.w;
    precise float productValue4 = productValue * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue5 = productValue1 * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue6 = productValue2 * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue7 = productValue3 * fragmentVectorConstants1.packedValues[1u].w;
    precise float productValue8 = productValue7 * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.w = productValue8;
    fragmentColor0.x = productValue4;
    fragmentColor0.y = productValue5;
    fragmentColor0.z = productValue6;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w)));
    precise float sumValue = sampledTextureValue.x - 0.300000011920928955078125;
    precise float sumValue1 = sampledTextureValue.y - 0.300000011920928955078125;
    precise float sumValue2 = sampledTextureValue.z - 0.300000011920928955078125;
    precise float sumValue3 = sampledTextureValue.w - 0.300000011920928955078125;
    precise float productValue17 = sumValue * 5.000000476837158203125;
    precise float productValue18 = sumValue1 * 5.000000476837158203125;
    precise float productValue19 = sumValue2 * 5.000000476837158203125;
    precise float productValue20 = sumValue3 * 5.000000476837158203125;
    float scalarValue = spvNClamp(productValue17, 0.0, 1.0);
    float scalarValue1 = spvNClamp(productValue18, 0.0, 1.0);
    float scalarValue2 = spvNClamp(productValue19, 0.0, 1.0);
    float scalarValue3 = spvNClamp(productValue20, 0.0, 1.0);
    precise float productValue21 = scalarValue * scalarValue;
    precise float productValue22 = scalarValue1 * scalarValue1;
    precise float productValue23 = scalarValue2 * scalarValue2;
    precise float productValue24 = scalarValue3 * scalarValue3;
    precise float multiplyAddValue = productValue21 * fma(scalarValue, -2.0, 3.0);
    precise float multiplyAddValue1 = productValue22 * fma(scalarValue1, -2.0, 3.0);
    precise float multiplyAddValue2 = productValue23 * fma(scalarValue2, -2.0, 3.0);
    precise float multiplyAddValue3 = productValue24 * fma(scalarValue3, -2.0, 3.0);
    precise float productValue25 = multiplyAddValue * varyingColor0.x;
    precise float productValue26 = multiplyAddValue1 * varyingColor0.y;
    precise float productValue27 = multiplyAddValue2 * varyingColor0.z;
    precise float productValue28 = multiplyAddValue3 * varyingColor0.w;
    precise float productValue29 = productValue25 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue30 = productValue26 * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue31 = productValue27 * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue32 = productValue28 * fragmentVectorConstants1.packedValues[1u].w;
    precise float productValue33 = productValue32 * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.w = productValue33;
    fragmentColor0.x = productValue29;
    fragmentColor0.y = productValue30;
    fragmentColor0.z = productValue31;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    precise float productValue34 = sampledTextureValue3.x * varyingColor0.x;
    precise float productValue35 = sampledTextureValue3.y * varyingColor0.y;
    precise float productValue36 = sampledTextureValue3.z * varyingColor0.z;
    precise float productValue37 = sampledTextureValue3.w * varyingColor0.w;
    precise float productValue38 = productValue34 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue39 = productValue35 * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue40 = productValue36 * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue41 = productValue37 * fragmentVectorConstants1.packedValues[1u].w;
    precise float productValue42 = productValue41 * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.w = productValue42;
    fragmentColor0.x = productValue38;
    fragmentColor0.y = productValue39;
    fragmentColor0.z = productValue40;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM40)
    bool conditionValue = fragmentScalarConstants1.packedValues[8u] > 0.00095000001601874828338623046875;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture0, textureSampler0), vec2(conditionValue ? spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z) : varyingTexCoord0.x, conditionValue ? spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w) : varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue6.x;
    float scalarValue8 = sampledTextureValue6.y;
    float scalarValue9 = spvNMax(spvNMin(sampledTextureValue6.z, spvNMax(scalarValue8, scalarValue7)), spvNMin(scalarValue8, scalarValue7));
    precise float sumValue10 = fragmentScalarConstants1.packedValues[4u] - fragmentScalarConstants1.packedValues[8u];
    float scalarValue10 = spvNMax(sumValue10, 0.0);
    precise float sumValue11 = scalarValue9 - scalarValue10;
    precise float sumValue12 = fragmentScalarConstants1.packedValues[4u] + fragmentScalarConstants1.packedValues[8u];
    precise float sumValue13 = spvNMin(sumValue12, 1.0) - scalarValue10;
    precise float quotientValue4 = 1.0 / sumValue13;
    precise float productValue50 = quotientValue4 * sumValue11;
    float scalarValue11 = spvNClamp(productValue50, 0.0, 1.0);
    precise float productValue51 = scalarValue11 * scalarValue11;
    precise float multiplyAddValue7 = productValue51 * fma(scalarValue11, -2.0, 3.0);
    precise float sumValue14 = varyingColor0.x - fragmentVectorConstants1.packedValues[4u].x;
    precise float sumValue15 = varyingColor0.y - fragmentVectorConstants1.packedValues[4u].y;
    precise float sumValue16 = varyingColor0.z - fragmentVectorConstants1.packedValues[4u].z;
    precise float sumValue17 = varyingColor0.w - fragmentVectorConstants1.packedValues[4u].w;
    precise float sumValue18 = fragmentScalarConstants1.packedValues[20u] - fragmentScalarConstants1.packedValues[8u];
    float scalarValue12 = spvNMax(sumValue18, 0.0);
    precise float sumValue19 = scalarValue9 - scalarValue12;
    precise float sumValue20 = fragmentScalarConstants1.packedValues[8u] + fragmentScalarConstants1.packedValues[20u];
    precise float sumValue21 = spvNMin(sumValue20, 1.0) - scalarValue12;
    precise float quotientValue5 = 1.0 / sumValue21;
    precise float productValue52 = quotientValue5 * sumValue19;
    float scalarValue13 = spvNClamp(productValue52, 0.0, 1.0);
    precise float productValue53 = scalarValue13 * scalarValue13;
    precise float multiplyAddValue8 = productValue53 * fma(scalarValue13, -2.0, 3.0);
    precise float multiplyAddValue9 = multiplyAddValue8 * fma(multiplyAddValue7, sumValue17, fragmentVectorConstants1.packedValues[4u].w);
    precise float productValue54 = varyingTexCoord0.x * 16.0;
    precise float productValue55 = varyingTexCoord0.y * 16.0;
    float scalarValue14 = floor(productValue54);
    float scalarValue15 = floor(productValue55);
    precise float productValue56 = scalarValue14 * 0.0625;
    precise float productValue57 = scalarValue15 * 0.0625;
    precise float sumValue22 = varyingTexCoord0.x - fragmentVectorConstants1.packedValues[7u].x;
    precise float sumValue23 = varyingTexCoord0.y - fragmentVectorConstants1.packedValues[7u].y;
    precise float sumValue24 = fragmentScalarConstants1.packedValues[20u] - fragmentScalarConstants1.packedValues[0u];
    float scalarValue16 = spvNMax(sumValue24, 0.0);
    precise float sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(fma(scalarValue14, 0.0625, 0.0625), spvNMax(productValue56, sumValue22)), spvNMin(fma(scalarValue15, 0.0625, 0.0625), spvNMax(productValue57, sumValue23)))).w - scalarValue16;
    precise float sumValue25 = fragmentScalarConstants1.packedValues[0u] + fragmentScalarConstants1.packedValues[20u];
    precise float sumValue26 = spvNMin(sumValue25, 1.0) - scalarValue16;
    precise float quotientValue6 = 1.0 / sumValue26;
    precise float productValue58 = quotientValue6 * sampledTextureValue8;
    float scalarValue17 = spvNClamp(productValue58, 0.0, 1.0);
    precise float productValue59 = scalarValue17 * scalarValue17;
    precise float multiplyAddValue10 = productValue59 * fma(scalarValue17, -2.0, 3.0);
    precise float productValue60 = multiplyAddValue10 * fragmentScalarConstants1.packedValues[27u];
    precise float multiplyAddValue11 = fma(multiplyAddValue7, sumValue14, fragmentVectorConstants1.packedValues[4u].x) - fragmentVectorConstants1.packedValues[6u].x;
    precise float multiplyAddValue12 = fma(multiplyAddValue7, sumValue15, fragmentVectorConstants1.packedValues[4u].y) - fragmentVectorConstants1.packedValues[6u].y;
    precise float multiplyAddValue13 = fma(multiplyAddValue7, sumValue16, fragmentVectorConstants1.packedValues[4u].z) - fragmentVectorConstants1.packedValues[6u].z;
    precise float sumValue27 = multiplyAddValue9 - productValue60;
    precise float multiplyAddValue14 = fma(multiplyAddValue8, multiplyAddValue11, fragmentVectorConstants1.packedValues[6u].x) * fragmentVectorConstants1.packedValues[8u].x;
    precise float multiplyAddValue15 = fma(multiplyAddValue8, multiplyAddValue12, fragmentVectorConstants1.packedValues[6u].y) * fragmentVectorConstants1.packedValues[8u].y;
    precise float multiplyAddValue16 = fma(multiplyAddValue8, multiplyAddValue13, fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[8u].z;
    precise float multiplyAddValue17 = fma(multiplyAddValue8, sumValue27, productValue60) * fragmentVectorConstants1.packedValues[8u].w;
    precise float productValue61 = multiplyAddValue17 * fragmentScalarConstants1.packedValues[12u];
    fragmentColor0.w = productValue61;
    fragmentColor0.x = multiplyAddValue14;
    fragmentColor0.y = multiplyAddValue15;
    fragmentColor0.z = multiplyAddValue16;
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w)));
    float scalarValue19 = sampledTextureValue.w;
    if (scalarValue19 < 0.5)
    {
        isFragmentDiscarded = true;
    }
    precise float productValue = sampledTextureValue.x * varyingColor0.x;
    precise float productValue1 = sampledTextureValue.y * varyingColor0.y;
    precise float productValue2 = sampledTextureValue.z * varyingColor0.z;
    precise float productValue63 = scalarValue19 * varyingColor0.w;
    precise float productValue4 = productValue * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue5 = productValue1 * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue6 = productValue2 * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue64 = productValue63 * fragmentVectorConstants1.packedValues[1u].w;
    precise float productValue65 = productValue64 * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.w = productValue65;
    fragmentColor0.x = productValue4;
    fragmentColor0.y = productValue5;
    fragmentColor0.z = productValue6;
    discardIfRequested();
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w)));
    precise float sumValue = sampledTextureValue.x - 0.300000011920928955078125;
    precise float sumValue1 = sampledTextureValue.y - 0.300000011920928955078125;
    precise float sumValue2 = sampledTextureValue.z - 0.300000011920928955078125;
    precise float sumValue3 = sampledTextureValue.w - 0.300000011920928955078125;
    precise float productValue17 = sumValue * 5.000000476837158203125;
    precise float productValue18 = sumValue1 * 5.000000476837158203125;
    precise float productValue19 = sumValue2 * 5.000000476837158203125;
    precise float productValue20 = sumValue3 * 5.000000476837158203125;
    float scalarValue = spvNClamp(productValue17, 0.0, 1.0);
    float scalarValue1 = spvNClamp(productValue18, 0.0, 1.0);
    float scalarValue2 = spvNClamp(productValue19, 0.0, 1.0);
    float scalarValue3 = spvNClamp(productValue20, 0.0, 1.0);
    precise float productValue21 = scalarValue * scalarValue;
    precise float productValue22 = scalarValue1 * scalarValue1;
    precise float productValue23 = scalarValue2 * scalarValue2;
    precise float productValue24 = scalarValue3 * scalarValue3;
    precise float multiplyAddValue = productValue21 * fma(scalarValue, -2.0, 3.0);
    precise float multiplyAddValue1 = productValue22 * fma(scalarValue1, -2.0, 3.0);
    precise float multiplyAddValue2 = productValue23 * fma(scalarValue2, -2.0, 3.0);
    precise float multiplyAddValue3 = productValue24 * fma(scalarValue3, -2.0, 3.0);
    if (multiplyAddValue3 < 0.5)
    {
        isFragmentDiscarded = true;
    }
    precise float productValue25 = multiplyAddValue * varyingColor0.x;
    precise float productValue26 = multiplyAddValue1 * varyingColor0.y;
    precise float productValue27 = multiplyAddValue2 * varyingColor0.z;
    precise float productValue28 = multiplyAddValue3 * varyingColor0.w;
    precise float productValue29 = productValue25 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue30 = productValue26 * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue31 = productValue27 * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue32 = productValue28 * fragmentVectorConstants1.packedValues[1u].w;
    precise float productValue33 = productValue32 * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.w = productValue33;
    fragmentColor0.x = productValue29;
    fragmentColor0.y = productValue30;
    fragmentColor0.z = productValue31;
    discardIfRequested();
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue21 = sampledTextureValue3.w;
    if (scalarValue21 < 0.5)
    {
        isFragmentDiscarded = true;
    }
    precise float productValue34 = sampledTextureValue3.x * varyingColor0.x;
    precise float productValue35 = sampledTextureValue3.y * varyingColor0.y;
    precise float productValue36 = sampledTextureValue3.z * varyingColor0.z;
    precise float productValue66 = scalarValue21 * varyingColor0.w;
    precise float productValue38 = productValue34 * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue39 = productValue35 * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue40 = productValue36 * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue67 = productValue66 * fragmentVectorConstants1.packedValues[1u].w;
    precise float productValue68 = productValue67 * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.w = productValue68;
    fragmentColor0.x = productValue38;
    fragmentColor0.y = productValue39;
    fragmentColor0.z = productValue40;
    discardIfRequested();
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    bool conditionValue = fragmentScalarConstants1.packedValues[8u] > 0.00095000001601874828338623046875;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture0, textureSampler0), vec2(conditionValue ? spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z) : varyingTexCoord0.x, conditionValue ? spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w) : varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue6.x;
    float scalarValue8 = sampledTextureValue6.y;
    if (sampledTextureValue6.w < 0.5)
    {
        isFragmentDiscarded = true;
    }
    float scalarValue9 = spvNMax(spvNMin(sampledTextureValue6.z, spvNMax(scalarValue8, scalarValue7)), spvNMin(scalarValue8, scalarValue7));
    precise float sumValue10 = fragmentScalarConstants1.packedValues[4u] - fragmentScalarConstants1.packedValues[8u];
    float scalarValue10 = spvNMax(sumValue10, 0.0);
    precise float sumValue12 = fragmentScalarConstants1.packedValues[4u] + fragmentScalarConstants1.packedValues[8u];
    precise float sumValue13 = spvNMin(sumValue12, 1.0) - scalarValue10;
    precise float sumValue11 = scalarValue9 - scalarValue10;
    precise float quotientValue4 = 1.0 / sumValue13;
    precise float productValue50 = quotientValue4 * sumValue11;
    float scalarValue11 = spvNClamp(productValue50, 0.0, 1.0);
    precise float productValue51 = scalarValue11 * scalarValue11;
    precise float multiplyAddValue7 = productValue51 * fma(scalarValue11, -2.0, 3.0);
    precise float sumValue14 = varyingColor0.x - fragmentVectorConstants1.packedValues[4u].x;
    precise float sumValue15 = varyingColor0.y - fragmentVectorConstants1.packedValues[4u].y;
    precise float sumValue16 = varyingColor0.z - fragmentVectorConstants1.packedValues[4u].z;
    precise float sumValue17 = varyingColor0.w - fragmentVectorConstants1.packedValues[4u].w;
    precise float sumValue18 = fragmentScalarConstants1.packedValues[20u] - fragmentScalarConstants1.packedValues[8u];
    float scalarValue12 = spvNMax(sumValue18, 0.0);
    precise float sumValue20 = fragmentScalarConstants1.packedValues[8u] + fragmentScalarConstants1.packedValues[20u];
    precise float sumValue19 = scalarValue9 - scalarValue12;
    precise float sumValue21 = spvNMin(sumValue20, 1.0) - scalarValue12;
    precise float quotientValue5 = 1.0 / sumValue21;
    precise float productValue52 = quotientValue5 * sumValue19;
    float scalarValue13 = spvNClamp(productValue52, 0.0, 1.0);
    precise float productValue53 = scalarValue13 * scalarValue13;
    precise float multiplyAddValue8 = productValue53 * fma(scalarValue13, -2.0, 3.0);
    precise float multiplyAddValue9 = multiplyAddValue8 * fma(multiplyAddValue7, sumValue17, fragmentVectorConstants1.packedValues[4u].w);
    precise float productValue54 = varyingTexCoord0.x * 16.0;
    precise float productValue55 = varyingTexCoord0.y * 16.0;
    float scalarValue14 = floor(productValue54);
    float scalarValue15 = floor(productValue55);
    precise float productValue56 = scalarValue14 * 0.0625;
    precise float productValue57 = scalarValue15 * 0.0625;
    precise float sumValue22 = varyingTexCoord0.x - fragmentVectorConstants1.packedValues[7u].x;
    precise float sumValue23 = varyingTexCoord0.y - fragmentVectorConstants1.packedValues[7u].y;
    precise float sumValue24 = fragmentScalarConstants1.packedValues[20u] - fragmentScalarConstants1.packedValues[0u];
    float scalarValue16 = spvNMax(sumValue24, 0.0);
    precise float sumValue25 = fragmentScalarConstants1.packedValues[0u] + fragmentScalarConstants1.packedValues[20u];
    precise float sumValue26 = spvNMin(sumValue25, 1.0) - scalarValue16;
    precise float sampledTextureValue8 = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(fma(scalarValue14, 0.0625, 0.0625), spvNMax(productValue56, sumValue22)), spvNMin(fma(scalarValue15, 0.0625, 0.0625), spvNMax(productValue57, sumValue23)))).w - scalarValue16;
    precise float quotientValue6 = 1.0 / sumValue26;
    precise float productValue58 = quotientValue6 * sampledTextureValue8;
    float scalarValue17 = spvNClamp(productValue58, 0.0, 1.0);
    precise float productValue59 = scalarValue17 * scalarValue17;
    precise float multiplyAddValue10 = productValue59 * fma(scalarValue17, -2.0, 3.0);
    precise float productValue60 = multiplyAddValue10 * fragmentScalarConstants1.packedValues[27u];
    precise float multiplyAddValue11 = fma(multiplyAddValue7, sumValue14, fragmentVectorConstants1.packedValues[4u].x) - fragmentVectorConstants1.packedValues[6u].x;
    precise float multiplyAddValue12 = fma(multiplyAddValue7, sumValue15, fragmentVectorConstants1.packedValues[4u].y) - fragmentVectorConstants1.packedValues[6u].y;
    precise float multiplyAddValue13 = fma(multiplyAddValue7, sumValue16, fragmentVectorConstants1.packedValues[4u].z) - fragmentVectorConstants1.packedValues[6u].z;
    precise float sumValue27 = multiplyAddValue9 - productValue60;
    precise float multiplyAddValue14 = fma(multiplyAddValue8, multiplyAddValue11, fragmentVectorConstants1.packedValues[6u].x) * fragmentVectorConstants1.packedValues[8u].x;
    precise float multiplyAddValue15 = fma(multiplyAddValue8, multiplyAddValue12, fragmentVectorConstants1.packedValues[6u].y) * fragmentVectorConstants1.packedValues[8u].y;
    precise float multiplyAddValue16 = fma(multiplyAddValue8, multiplyAddValue13, fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[8u].z;
    precise float multiplyAddValue17 = fma(multiplyAddValue8, sumValue27, productValue60) * fragmentVectorConstants1.packedValues[8u].w;
    precise float productValue61 = multiplyAddValue17 * fragmentScalarConstants1.packedValues[12u];
    fragmentColor0.w = productValue61;
    fragmentColor0.x = multiplyAddValue14;
    fragmentColor0.y = multiplyAddValue15;
    fragmentColor0.z = multiplyAddValue16;
    discardIfRequested();
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w)));
    fragmentColor0.w = ((sampledTextureValue.w * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].w) * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.x = (sampledTextureValue.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (sampledTextureValue.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (sampledTextureValue.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[1u].z;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w)));
    float productValue13 = spvNClamp((sampledTextureValue.x - 0.300000011920928955078125) * 5.000000476837158203125, 0.0, 1.0);
    float productValue14 = spvNClamp((sampledTextureValue.y - 0.300000011920928955078125) * 5.000000476837158203125, 0.0, 1.0);
    float productValue15 = spvNClamp((sampledTextureValue.z - 0.300000011920928955078125) * 5.000000476837158203125, 0.0, 1.0);
    float productValue16 = spvNClamp((sampledTextureValue.w - 0.300000011920928955078125) * 5.000000476837158203125, 0.0, 1.0);
    fragmentColor0.w = ((((productValue16 * productValue16) * fma(productValue16, -2.0, 3.0)) * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].w) * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.x = (((productValue13 * productValue13) * fma(productValue13, -2.0, 3.0)) * varyingColor0.x) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (((productValue14 * productValue14) * fma(productValue14, -2.0, 3.0)) * varyingColor0.y) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (((productValue15 * productValue15) * fma(productValue15, -2.0, 3.0)) * varyingColor0.z) * fragmentVectorConstants1.packedValues[1u].z;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.w = ((sampledTextureValue3.w * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].w) * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.x = (sampledTextureValue3.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (sampledTextureValue3.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (sampledTextureValue3.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[1u].z;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM50)
    bool conditionValue = fragmentScalarConstants1.packedValues[8u] > 0.00095000001601874828338623046875;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture0, textureSampler0), vec2(conditionValue ? spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z) : varyingTexCoord0.x, conditionValue ? spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w) : varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue6.x;
    float scalarValue8 = sampledTextureValue6.y;
    float scalarValue9 = spvNMax(spvNMin(sampledTextureValue6.z, spvNMax(scalarValue8, scalarValue7)), spvNMin(scalarValue8, scalarValue7));
    float sumValue7 = spvNMax(fragmentScalarConstants1.packedValues[4u] - fragmentScalarConstants1.packedValues[8u], 0.0);
    float quotientValue2 = spvNClamp((1.0 / (spvNMin(fragmentScalarConstants1.packedValues[4u] + fragmentScalarConstants1.packedValues[8u], 1.0) - sumValue7)) * (scalarValue9 - sumValue7), 0.0, 1.0);
    float multiplyAddValue4 = (quotientValue2 * quotientValue2) * fma(quotientValue2, -2.0, 3.0);
    float sumValue8 = spvNMax(fragmentScalarConstants1.packedValues[20u] - fragmentScalarConstants1.packedValues[8u], 0.0);
    float quotientValue3 = spvNClamp((1.0 / (spvNMin(fragmentScalarConstants1.packedValues[8u] + fragmentScalarConstants1.packedValues[20u], 1.0) - sumValue8)) * (scalarValue9 - sumValue8), 0.0, 1.0);
    float multiplyAddValue5 = (quotientValue3 * quotientValue3) * fma(quotientValue3, -2.0, 3.0);
    float productValue48 = floor(varyingTexCoord0.x * 16.0);
    float productValue49 = floor(varyingTexCoord0.y * 16.0);
    float sumValue9 = spvNMax(fragmentScalarConstants1.packedValues[20u] - fragmentScalarConstants1.packedValues[0u], 0.0);
    float sampledTextureValue7 = spvNClamp((1.0 / (spvNMin(fragmentScalarConstants1.packedValues[0u] + fragmentScalarConstants1.packedValues[20u], 1.0) - sumValue9)) * (texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(fma(productValue48, 0.0625, 0.0625), spvNMax(productValue48 * 0.0625, varyingTexCoord0.x - fragmentVectorConstants1.packedValues[7u].x)), spvNMin(fma(productValue49, 0.0625, 0.0625), spvNMax(productValue49 * 0.0625, varyingTexCoord0.y - fragmentVectorConstants1.packedValues[7u].y)))).w - sumValue9), 0.0, 1.0);
    float multiplyAddValue6 = ((sampledTextureValue7 * sampledTextureValue7) * fma(sampledTextureValue7, -2.0, 3.0)) * fragmentScalarConstants1.packedValues[27u];
    fragmentColor0.w = (fma(multiplyAddValue5, fma(multiplyAddValue5, fma(multiplyAddValue4, varyingColor0.w - fragmentVectorConstants1.packedValues[4u].w, fragmentVectorConstants1.packedValues[4u].w), -multiplyAddValue6), multiplyAddValue6) * fragmentVectorConstants1.packedValues[8u].w) * fragmentScalarConstants1.packedValues[12u];
    fragmentColor0.x = fma(multiplyAddValue5, fma(multiplyAddValue4, varyingColor0.x - fragmentVectorConstants1.packedValues[4u].x, fragmentVectorConstants1.packedValues[4u].x) - fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[6u].x) * fragmentVectorConstants1.packedValues[8u].x;
    fragmentColor0.y = fma(multiplyAddValue5, fma(multiplyAddValue4, varyingColor0.y - fragmentVectorConstants1.packedValues[4u].y, fragmentVectorConstants1.packedValues[4u].y) - fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[6u].y) * fragmentVectorConstants1.packedValues[8u].y;
    fragmentColor0.z = fma(multiplyAddValue5, fma(multiplyAddValue4, varyingColor0.z - fragmentVectorConstants1.packedValues[4u].z, fragmentVectorConstants1.packedValues[4u].z) - fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[8u].z;
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w)));
    float scalarValue19 = sampledTextureValue.w;
    if (scalarValue19 < 0.5)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.w = ((scalarValue19 * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].w) * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.x = (sampledTextureValue.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (sampledTextureValue.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (sampledTextureValue.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[1u].z;
    discardIfRequested();
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w)));
    float productValue13 = spvNClamp((sampledTextureValue.x - 0.300000011920928955078125) * 5.000000476837158203125, 0.0, 1.0);
    float productValue14 = spvNClamp((sampledTextureValue.y - 0.300000011920928955078125) * 5.000000476837158203125, 0.0, 1.0);
    float productValue15 = spvNClamp((sampledTextureValue.z - 0.300000011920928955078125) * 5.000000476837158203125, 0.0, 1.0);
    float productValue16 = spvNClamp((sampledTextureValue.w - 0.300000011920928955078125) * 5.000000476837158203125, 0.0, 1.0);
    float multiplyAddValue18 = (productValue16 * productValue16) * fma(productValue16, -2.0, 3.0);
    if (multiplyAddValue18 < 0.5)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.w = ((multiplyAddValue18 * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].w) * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.x = (((productValue13 * productValue13) * fma(productValue13, -2.0, 3.0)) * varyingColor0.x) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (((productValue14 * productValue14) * fma(productValue14, -2.0, 3.0)) * varyingColor0.y) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (((productValue15 * productValue15) * fma(productValue15, -2.0, 3.0)) * varyingColor0.z) * fragmentVectorConstants1.packedValues[1u].z;
    discardIfRequested();
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue3 = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue21 = sampledTextureValue3.w;
    if (scalarValue21 < 0.5)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.w = ((scalarValue21 * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].w) * fragmentScalarConstants1.packedValues[0u];
    fragmentColor0.x = (sampledTextureValue3.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (sampledTextureValue3.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (sampledTextureValue3.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[1u].z;
    discardIfRequested();
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    bool conditionValue = fragmentScalarConstants1.packedValues[8u] > 0.00095000001601874828338623046875;
    vec4 sampledTextureValue6 = texture(sampler2D(materialTexture0, textureSampler0), vec2(conditionValue ? spvNMin(spvNMax(varyingTexCoord1.x, varyingTexCoord0.x), varyingTexCoord1.z) : varyingTexCoord0.x, conditionValue ? spvNMin(spvNMax(varyingTexCoord1.y, varyingTexCoord0.y), varyingTexCoord1.w) : varyingTexCoord0.y));
    float scalarValue7 = sampledTextureValue6.x;
    float scalarValue8 = sampledTextureValue6.y;
    if (sampledTextureValue6.w < 0.5)
    {
        isFragmentDiscarded = true;
    }
    float scalarValue9 = spvNMax(spvNMin(sampledTextureValue6.z, spvNMax(scalarValue8, scalarValue7)), spvNMin(scalarValue8, scalarValue7));
    float sumValue7 = spvNMax(fragmentScalarConstants1.packedValues[4u] - fragmentScalarConstants1.packedValues[8u], 0.0);
    float quotientValue2 = spvNClamp((1.0 / (spvNMin(fragmentScalarConstants1.packedValues[4u] + fragmentScalarConstants1.packedValues[8u], 1.0) - sumValue7)) * (scalarValue9 - sumValue7), 0.0, 1.0);
    float multiplyAddValue4 = (quotientValue2 * quotientValue2) * fma(quotientValue2, -2.0, 3.0);
    float sumValue8 = spvNMax(fragmentScalarConstants1.packedValues[20u] - fragmentScalarConstants1.packedValues[8u], 0.0);
    float quotientValue3 = spvNClamp((1.0 / (spvNMin(fragmentScalarConstants1.packedValues[8u] + fragmentScalarConstants1.packedValues[20u], 1.0) - sumValue8)) * (scalarValue9 - sumValue8), 0.0, 1.0);
    float multiplyAddValue5 = (quotientValue3 * quotientValue3) * fma(quotientValue3, -2.0, 3.0);
    float productValue48 = floor(varyingTexCoord0.x * 16.0);
    float productValue49 = floor(varyingTexCoord0.y * 16.0);
    float sumValue9 = spvNMax(fragmentScalarConstants1.packedValues[20u] - fragmentScalarConstants1.packedValues[0u], 0.0);
    float sampledTextureValue7 = spvNClamp((1.0 / (spvNMin(fragmentScalarConstants1.packedValues[0u] + fragmentScalarConstants1.packedValues[20u], 1.0) - sumValue9)) * (texture(sampler2D(materialTexture0, textureSampler0), vec2(spvNMin(fma(productValue48, 0.0625, 0.0625), spvNMax(productValue48 * 0.0625, varyingTexCoord0.x - fragmentVectorConstants1.packedValues[7u].x)), spvNMin(fma(productValue49, 0.0625, 0.0625), spvNMax(productValue49 * 0.0625, varyingTexCoord0.y - fragmentVectorConstants1.packedValues[7u].y)))).w - sumValue9), 0.0, 1.0);
    float multiplyAddValue6 = ((sampledTextureValue7 * sampledTextureValue7) * fma(sampledTextureValue7, -2.0, 3.0)) * fragmentScalarConstants1.packedValues[27u];
    fragmentColor0.w = (fma(multiplyAddValue5, fma(multiplyAddValue5, fma(multiplyAddValue4, varyingColor0.w - fragmentVectorConstants1.packedValues[4u].w, fragmentVectorConstants1.packedValues[4u].w), -multiplyAddValue6), multiplyAddValue6) * fragmentVectorConstants1.packedValues[8u].w) * fragmentScalarConstants1.packedValues[12u];
    fragmentColor0.x = fma(multiplyAddValue5, fma(multiplyAddValue4, varyingColor0.x - fragmentVectorConstants1.packedValues[4u].x, fragmentVectorConstants1.packedValues[4u].x) - fragmentVectorConstants1.packedValues[6u].x, fragmentVectorConstants1.packedValues[6u].x) * fragmentVectorConstants1.packedValues[8u].x;
    fragmentColor0.y = fma(multiplyAddValue5, fma(multiplyAddValue4, varyingColor0.y - fragmentVectorConstants1.packedValues[4u].y, fragmentVectorConstants1.packedValues[4u].y) - fragmentVectorConstants1.packedValues[6u].y, fragmentVectorConstants1.packedValues[6u].y) * fragmentVectorConstants1.packedValues[8u].y;
    fragmentColor0.z = fma(multiplyAddValue5, fma(multiplyAddValue4, varyingColor0.z - fragmentVectorConstants1.packedValues[4u].z, fragmentVectorConstants1.packedValues[4u].z) - fragmentVectorConstants1.packedValues[6u].z, fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[8u].z;
    discardIfRequested();
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue1 = texture(sampler2D(glyphTextureTexture, glyphTextureSampler), vec2(spvNMin(spvNMax(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w)));
    fragmentColor0.x = (sampledTextureValue1.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (sampledTextureValue1.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (sampledTextureValue1.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[1u].z;
    fragmentColor0.w = ((sampledTextureValue1.w * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[0u].x;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue1 = texture(sampler2D(glyphTextureTexture, glyphTextureSampler), vec2(spvNMin(spvNMax(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w)));
    float productValue9 = spvNClamp((sampledTextureValue1.x + (-0.300000011920928955078125)) * 5.000000476837158203125, 0.0, 1.0);
    float productValue10 = spvNClamp((sampledTextureValue1.y + (-0.300000011920928955078125)) * 5.000000476837158203125, 0.0, 1.0);
    float productValue11 = spvNClamp((sampledTextureValue1.z + (-0.300000011920928955078125)) * 5.000000476837158203125, 0.0, 1.0);
    float productValue12 = spvNClamp((sampledTextureValue1.w + (-0.300000011920928955078125)) * 5.000000476837158203125, 0.0, 1.0);
    fragmentColor0.x = (((productValue9 * productValue9) * varyingColor0.x) * (3.0 - (productValue9 * 2.0))) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (((productValue10 * productValue10) * varyingColor0.y) * (3.0 - (productValue10 * 2.0))) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (((productValue11 * productValue11) * varyingColor0.z) * (3.0 - (productValue11 * 2.0))) * fragmentVectorConstants1.packedValues[1u].z;
    fragmentColor0.w = ((((productValue12 * productValue12) * varyingColor0.w) * (3.0 - (productValue12 * 2.0))) * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[0u].x;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue2 = texture(sampler2D(glyphTextureTexture, glyphTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    fragmentColor0.x = (sampledTextureValue2.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (sampledTextureValue2.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (sampledTextureValue2.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[1u].z;
    fragmentColor0.w = ((sampledTextureValue2.w * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[0u].x;
#elif (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_OFF && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM65)
    float intermediateValue;
    float intermediateValue1;
    if (fragmentVectorConstants1.packedValues[2u].x > 0.00095000001601874828338623046875)
    {
        intermediateValue = spvNMin(spvNMax(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z);
        intermediateValue1 = spvNMin(spvNMax(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w);
    }
    else
    {
        intermediateValue = varyingTexCoord0.x;
        intermediateValue1 = varyingTexCoord0.y;
    }
    vec4 sampledTextureValue4 = texture(sampler2D(glyphTextureTexture, glyphTextureSampler), vec2(intermediateValue, intermediateValue1));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    float scalarValue6 = spvNMax(spvNMin(scalarValue4, scalarValue5), spvNMin(spvNMax(scalarValue4, scalarValue5), sampledTextureValue4.z));
    float sumValue4 = spvNMax(0.0, fragmentVectorConstants1.packedValues[1u].x - fragmentVectorConstants1.packedValues[2u].x);
    float quotientValue = spvNClamp((scalarValue6 - sumValue4) / (spvNMin(1.0, fragmentVectorConstants1.packedValues[1u].x + fragmentVectorConstants1.packedValues[2u].x) - sumValue4), 0.0, 1.0);
    float productValue43 = (quotientValue * quotientValue) * (3.0 - (quotientValue * 2.0));
    float sumValue5 = spvNMax(0.0, fragmentVectorConstants1.packedValues[5u].x - fragmentVectorConstants1.packedValues[2u].x);
    float quotientValue1 = spvNClamp((scalarValue6 - sumValue5) / (spvNMin(1.0, fragmentVectorConstants1.packedValues[5u].x + fragmentVectorConstants1.packedValues[2u].x) - sumValue5), 0.0, 1.0);
    float productValue44 = (quotientValue1 * quotientValue1) * (3.0 - (quotientValue1 * 2.0));
    float productValue45 = floor(varyingTexCoord0.x * 16.0) * 0.0625;
    float productValue46 = floor(varyingTexCoord0.y * 16.0) * 0.0625;
    float sumValue6 = spvNMax(0.0, fragmentVectorConstants1.packedValues[5u].x - fragmentVectorConstants1.packedValues[0u].x);
    float sampledTextureValue5 = spvNClamp((texture(sampler2D(glyphTextureTexture, glyphTextureSampler), vec2(spvNMin(spvNMax(varyingTexCoord0.x - fragmentVectorConstants1.packedValues[7u].x, productValue45), productValue45 + 0.0625), spvNMin(spvNMax(varyingTexCoord0.y - fragmentVectorConstants1.packedValues[7u].y, productValue46), productValue46 + 0.0625))).w - sumValue6) / (spvNMin(1.0, fragmentVectorConstants1.packedValues[0u].x + fragmentVectorConstants1.packedValues[5u].x) - sumValue6), 0.0, 1.0);
    float productValue47 = ((sampledTextureValue5 * sampledTextureValue5) * (3.0 - (sampledTextureValue5 * 2.0))) * fragmentVectorConstants1.packedValues[6u].w;
    fragmentColor0.x = (((((productValue43 * (varyingColor0.x - fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[4u].x) - fragmentVectorConstants1.packedValues[6u].x) * productValue44) + fragmentVectorConstants1.packedValues[6u].x) * fragmentVectorConstants1.packedValues[8u].x;
    fragmentColor0.y = (((((productValue43 * (varyingColor0.y - fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[4u].y) - fragmentVectorConstants1.packedValues[6u].y) * productValue44) + fragmentVectorConstants1.packedValues[6u].y) * fragmentVectorConstants1.packedValues[8u].y;
    fragmentColor0.z = (((((productValue43 * (varyingColor0.z - fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[4u].z) - fragmentVectorConstants1.packedValues[6u].z) * productValue44) + fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[8u].z;
    fragmentColor0.w = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[8u].w) * ((((productValue44 * ((productValue43 * (varyingColor0.w - fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[4u].w)) - productValue47) * productValue44) + productValue47);
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(glyphTextureTexture, glyphTextureSampler), vec2(spvNMin(spvNMax(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w)));
    float scalarValue18 = sampledTextureValue1.w;
    if (scalarValue18 < 0.5)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = (sampledTextureValue1.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (sampledTextureValue1.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (sampledTextureValue1.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[1u].z;
    fragmentColor0.w = ((scalarValue18 * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[0u].x;
    discardIfRequested();
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_BITMAP_SMOOTH && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(glyphTextureTexture, glyphTextureSampler), vec2(spvNMin(spvNMax(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z), spvNMin(spvNMax(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w)));
    float productValue9 = spvNClamp((sampledTextureValue1.x + (-0.300000011920928955078125)) * 5.000000476837158203125, 0.0, 1.0);
    float productValue10 = spvNClamp((sampledTextureValue1.y + (-0.300000011920928955078125)) * 5.000000476837158203125, 0.0, 1.0);
    float productValue11 = spvNClamp((sampledTextureValue1.z + (-0.300000011920928955078125)) * 5.000000476837158203125, 0.0, 1.0);
    float productValue12 = spvNClamp((sampledTextureValue1.w + (-0.300000011920928955078125)) * 5.000000476837158203125, 0.0, 1.0);
    float productValue62 = (productValue12 * productValue12) * (3.0 - (productValue12 * 2.0));
    if (productValue62 < 0.5)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = (((productValue9 * productValue9) * varyingColor0.x) * (3.0 - (productValue9 * 2.0))) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (((productValue10 * productValue10) * varyingColor0.y) * (3.0 - (productValue10 * 2.0))) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (((productValue11 * productValue11) * varyingColor0.z) * (3.0 - (productValue11 * 2.0))) * fragmentVectorConstants1.packedValues[1u].z;
    fragmentColor0.w = ((productValue62 * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[0u].x;
    discardIfRequested();
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_TRUE_TYPE && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue2 = texture(sampler2D(glyphTextureTexture, glyphTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue20 = sampledTextureValue2.w;
    if (scalarValue20 < 0.5)
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = (sampledTextureValue2.x * varyingColor0.x) * fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = (sampledTextureValue2.y * varyingColor0.y) * fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = (sampledTextureValue2.z * varyingColor0.z) * fragmentVectorConstants1.packedValues[1u].z;
    fragmentColor0.w = ((scalarValue20 * varyingColor0.w) * fragmentVectorConstants1.packedValues[1u].w) * fragmentVectorConstants1.packedValues[0u].x;
    discardIfRequested();
#elif (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_ALPHA_TEST == RD_ON && RD_OPTION_FONT_TYPE == RD_FONT_TYPE_MSDF && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    float intermediateValue;
    float intermediateValue1;
    if (fragmentVectorConstants1.packedValues[2u].x > 0.00095000001601874828338623046875)
    {
        intermediateValue = spvNMin(spvNMax(varyingTexCoord0.x, varyingTexCoord1.x), varyingTexCoord1.z);
        intermediateValue1 = spvNMin(spvNMax(varyingTexCoord0.y, varyingTexCoord1.y), varyingTexCoord1.w);
    }
    else
    {
        intermediateValue = varyingTexCoord0.x;
        intermediateValue1 = varyingTexCoord0.y;
    }
    vec4 sampledTextureValue4 = texture(sampler2D(glyphTextureTexture, glyphTextureSampler), vec2(intermediateValue, intermediateValue1));
    float scalarValue4 = sampledTextureValue4.x;
    float scalarValue5 = sampledTextureValue4.y;
    if (sampledTextureValue4.w < 0.5)
    {
        isFragmentDiscarded = true;
    }
    float scalarValue6 = spvNMax(spvNMin(scalarValue4, scalarValue5), spvNMin(spvNMax(scalarValue4, scalarValue5), sampledTextureValue4.z));
    float sumValue4 = spvNMax(0.0, fragmentVectorConstants1.packedValues[1u].x - fragmentVectorConstants1.packedValues[2u].x);
    float quotientValue7 = spvNClamp((scalarValue6 - sumValue4) / (spvNMin(1.0, fragmentVectorConstants1.packedValues[2u].x + fragmentVectorConstants1.packedValues[1u].x) - sumValue4), 0.0, 1.0);
    float productValue69 = (quotientValue7 * quotientValue7) * (3.0 - (quotientValue7 * 2.0));
    float sumValue5 = spvNMax(0.0, fragmentVectorConstants1.packedValues[5u].x - fragmentVectorConstants1.packedValues[2u].x);
    float quotientValue1 = spvNClamp((scalarValue6 - sumValue5) / (spvNMin(1.0, fragmentVectorConstants1.packedValues[5u].x + fragmentVectorConstants1.packedValues[2u].x) - sumValue5), 0.0, 1.0);
    float productValue44 = (quotientValue1 * quotientValue1) * (3.0 - (quotientValue1 * 2.0));
    float productValue45 = floor(varyingTexCoord0.x * 16.0) * 0.0625;
    float productValue46 = floor(varyingTexCoord0.y * 16.0) * 0.0625;
    float sumValue6 = spvNMax(0.0, fragmentVectorConstants1.packedValues[5u].x - fragmentVectorConstants1.packedValues[0u].x);
    float sampledTextureValue5 = spvNClamp((texture(sampler2D(glyphTextureTexture, glyphTextureSampler), vec2(spvNMin(spvNMax(varyingTexCoord0.x - fragmentVectorConstants1.packedValues[7u].x, productValue45), productValue45 + 0.0625), spvNMin(spvNMax(varyingTexCoord0.y - fragmentVectorConstants1.packedValues[7u].y, productValue46), productValue46 + 0.0625))).w - sumValue6) / (spvNMin(1.0, fragmentVectorConstants1.packedValues[0u].x + fragmentVectorConstants1.packedValues[5u].x) - sumValue6), 0.0, 1.0);
    float productValue47 = ((sampledTextureValue5 * sampledTextureValue5) * (3.0 - (sampledTextureValue5 * 2.0))) * fragmentVectorConstants1.packedValues[6u].w;
    fragmentColor0.x = (((((productValue69 * (varyingColor0.x - fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[4u].x) - fragmentVectorConstants1.packedValues[6u].x) * productValue44) + fragmentVectorConstants1.packedValues[6u].x) * fragmentVectorConstants1.packedValues[8u].x;
    fragmentColor0.y = (((((productValue69 * (varyingColor0.y - fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[4u].y) - fragmentVectorConstants1.packedValues[6u].y) * productValue44) + fragmentVectorConstants1.packedValues[6u].y) * fragmentVectorConstants1.packedValues[8u].y;
    fragmentColor0.z = (((((productValue69 * (varyingColor0.z - fragmentVectorConstants1.packedValues[4u].z)) + fragmentVectorConstants1.packedValues[4u].z) - fragmentVectorConstants1.packedValues[6u].z) * productValue44) + fragmentVectorConstants1.packedValues[6u].z) * fragmentVectorConstants1.packedValues[8u].z;
    fragmentColor0.w = (fragmentVectorConstants1.packedValues[3u].x * fragmentVectorConstants1.packedValues[8u].w) * ((((productValue44 * ((productValue69 * (varyingColor0.w - fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[4u].w)) - productValue47) * productValue44) + productValue47);
    discardIfRequested();
#endif
}
