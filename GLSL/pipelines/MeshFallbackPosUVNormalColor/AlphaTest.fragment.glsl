#version 460
#extension GL_GOOGLE_include_directive : require
// MeshFallbackPosUVNormalColor / AlphaTest / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 72
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
#extension GL_EXT_scalar_block_layout : require
#extension GL_EXT_spirv_intrinsics : require
#elif (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
#extension GL_EXT_spirv_intrinsics : require
#endif
#if (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE_FLOAT_1 1
#endif

#include "../../include/materials/MeshFallbackPosUVNormalColor/FragmentBindings.glsli"

#if (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    precise float sumValue = fragmentVectorConstants1.packedValues[0u].x - scalarValue;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[0u].y - scalarValue1;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[0u].z - scalarValue2;
    float multiplyAddValue6 = fma(fragmentScalarConstants1.packedValues[3u], sumValue, scalarValue);
    float multiplyAddValue7 = fma(fragmentScalarConstants1.packedValues[3u], sumValue1, scalarValue1);
    float multiplyAddValue8 = fma(fragmentScalarConstants1.packedValues[3u], sumValue2, scalarValue2);
    precise float multiplyAddValue9 = fma(scalarValue3, fma(multiplyAddValue6, varyingColor0.x, -multiplyAddValue6), multiplyAddValue6) * fragmentVectorConstants1.packedValues[3u].x;
    precise float multiplyAddValue10 = fma(scalarValue3, fma(multiplyAddValue7, varyingColor0.y, -multiplyAddValue7), multiplyAddValue7) * fragmentVectorConstants1.packedValues[3u].y;
    precise float multiplyAddValue11 = fma(scalarValue3, fma(multiplyAddValue8, varyingColor0.z, -multiplyAddValue8), multiplyAddValue8) * fragmentVectorConstants1.packedValues[3u].z;
    precise float productValue16 = multiplyAddValue9 * varyingColor0.w;
    precise float productValue17 = multiplyAddValue10 * varyingColor0.w;
    precise float productValue18 = multiplyAddValue11 * varyingColor0.w;
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[8u] != 0.0;
    precise float productValue19 = varyingColor0.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue20 = varyingColor0.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue21 = varyingColor0.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float productValue22 = varyingColor0.w * fragmentVectorConstants1.packedValues[3u].w;
    precise float productValue23 = multiplyAddValue6 * productValue19;
    precise float productValue24 = multiplyAddValue7 * productValue20;
    precise float productValue25 = multiplyAddValue8 * productValue21;
    precise float productValue26 = scalarValue3 * productValue22;
    float comparisonValue2 = comparisonValue1 ? productValue16 : productValue23;
    float comparisonValue3 = comparisonValue1 ? productValue17 : productValue24;
    float comparisonValue4 = comparisonValue1 ? productValue18 : productValue25;
    precise float sumValue3 = varyingColor2.x - comparisonValue2;
    precise float sumValue4 = varyingColor2.y - comparisonValue3;
    precise float sumValue5 = varyingColor2.z - comparisonValue4;
    fragmentColor0.x = fma(varyingColor2.w, sumValue3, comparisonValue2);
    fragmentColor0.y = fma(varyingColor2.w, sumValue4, comparisonValue3);
    fragmentColor0.z = fma(varyingColor2.w, sumValue5, comparisonValue4);
    precise float comparisonValue5 = (comparisonValue1 ? 1.0 : productValue26) * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.w = comparisonValue5;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue6 = fragmentVectorConstants1.packedValues[0u].x - 1.0;
    precise float sumValue7 = fragmentVectorConstants1.packedValues[0u].y - 1.0;
    precise float sumValue8 = fragmentVectorConstants1.packedValues[0u].z - 1.0;
    float multiplyAddValue15 = fma(fragmentScalarConstants1.packedValues[3u], sumValue6, 1.0);
    float multiplyAddValue16 = fma(fragmentScalarConstants1.packedValues[3u], sumValue7, 1.0);
    float multiplyAddValue17 = fma(fragmentScalarConstants1.packedValues[3u], sumValue8, 1.0);
    precise float productValue30 = multiplyAddValue15 * varyingColor0.x;
    precise float productValue31 = multiplyAddValue16 * varyingColor0.y;
    precise float productValue32 = multiplyAddValue17 * varyingColor0.z;
    precise float productValue33 = productValue30 * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue34 = productValue31 * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue35 = productValue32 * fragmentVectorConstants1.packedValues[3u].z;
    precise float productValue36 = productValue33 * varyingColor0.w;
    precise float productValue37 = productValue34 * varyingColor0.w;
    precise float productValue38 = productValue35 * varyingColor0.w;
    precise float productValue19 = varyingColor0.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue20 = varyingColor0.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue21 = varyingColor0.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float productValue22 = varyingColor0.w * fragmentVectorConstants1.packedValues[3u].w;
    precise float productValue39 = multiplyAddValue15 * productValue19;
    precise float productValue40 = multiplyAddValue16 * productValue20;
    precise float productValue41 = multiplyAddValue17 * productValue21;
    precise float productValue42 = productValue22 * 1.0;
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[8u] != 0.0;
    float comparisonValue9 = comparisonValue1 ? productValue36 : productValue39;
    float comparisonValue10 = comparisonValue1 ? productValue37 : productValue40;
    float comparisonValue11 = comparisonValue1 ? productValue38 : productValue41;
    precise float sumValue9 = varyingColor2.x - comparisonValue9;
    precise float sumValue10 = varyingColor2.y - comparisonValue10;
    precise float sumValue11 = varyingColor2.z - comparisonValue11;
    fragmentColor0.x = fma(varyingColor2.w, sumValue9, comparisonValue9);
    fragmentColor0.y = fma(varyingColor2.w, sumValue10, comparisonValue10);
    fragmentColor0.z = fma(varyingColor2.w, sumValue11, comparisonValue11);
    precise float comparisonValue12 = (comparisonValue1 ? 1.0 : productValue42) * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.w = comparisonValue12;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    precise float productValue58 = scalarValue * varyingColor0.x;
    precise float productValue59 = scalarValue * varyingColor0.y;
    precise float productValue60 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    float multiplyAddValue27 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].x, -productValue58), productValue58);
    float multiplyAddValue28 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].y, -productValue59), productValue59);
    float multiplyAddValue29 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].z, -productValue60), productValue60);
    precise float sumValue12 = fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue27;
    precise float sumValue13 = fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue28;
    precise float sumValue14 = fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue29;
    float multiplyAddValue30 = fma(fragmentScalarConstants1.packedValues[7u], sumValue12, multiplyAddValue27);
    float multiplyAddValue31 = fma(fragmentScalarConstants1.packedValues[7u], sumValue13, multiplyAddValue28);
    float multiplyAddValue32 = fma(fragmentScalarConstants1.packedValues[7u], sumValue14, multiplyAddValue29);
    precise float multiplyAddValue33 = fma(scalarValue3, fma(multiplyAddValue30, varyingColor0.x, -multiplyAddValue30), multiplyAddValue30) * fragmentVectorConstants1.packedValues[4u].x;
    precise float multiplyAddValue34 = fma(scalarValue3, fma(multiplyAddValue31, varyingColor0.y, -multiplyAddValue31), multiplyAddValue31) * fragmentVectorConstants1.packedValues[4u].y;
    precise float multiplyAddValue35 = fma(scalarValue3, fma(multiplyAddValue32, varyingColor0.z, -multiplyAddValue32), multiplyAddValue32) * fragmentVectorConstants1.packedValues[4u].z;
    precise float productValue61 = multiplyAddValue33 * varyingColor0.w;
    precise float productValue62 = multiplyAddValue34 * varyingColor0.w;
    precise float productValue63 = multiplyAddValue35 * varyingColor0.w;
    bool comparisonValue13 = fragmentScalarConstants1.packedValues[12u] != 0.0;
    float comparisonValue14 = comparisonValue13 ? productValue61 : multiplyAddValue30;
    float comparisonValue15 = comparisonValue13 ? productValue62 : multiplyAddValue31;
    float comparisonValue16 = comparisonValue13 ? productValue63 : multiplyAddValue32;
    precise float sumValue15 = varyingColor2.x - comparisonValue14;
    precise float sumValue16 = varyingColor2.y - comparisonValue15;
    precise float sumValue17 = varyingColor2.z - comparisonValue16;
    fragmentColor0.x = fma(varyingColor2.w, sumValue15, comparisonValue14);
    fragmentColor0.y = fma(varyingColor2.w, sumValue16, comparisonValue15);
    fragmentColor0.z = fma(varyingColor2.w, sumValue17, comparisonValue16);
    precise float comparisonValue17 = (comparisonValue13 ? 1.0 : scalarValue3) * fragmentScalarConstants1.packedValues[8u];
    fragmentColor0.w = comparisonValue17;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue18 = fragmentVectorConstants1.packedValues[1u].x - fragmentVectorConstants1.packedValues[0u].x;
    precise float sumValue19 = fragmentVectorConstants1.packedValues[1u].y - fragmentVectorConstants1.packedValues[0u].y;
    precise float sumValue20 = fragmentVectorConstants1.packedValues[1u].z - fragmentVectorConstants1.packedValues[0u].z;
    float multiplyAddValue39 = fma(fragmentScalarConstants1.packedValues[7u], sumValue18, fragmentVectorConstants1.packedValues[0u].x);
    float multiplyAddValue40 = fma(fragmentScalarConstants1.packedValues[7u], sumValue19, fragmentVectorConstants1.packedValues[0u].y);
    float multiplyAddValue41 = fma(fragmentScalarConstants1.packedValues[7u], sumValue20, fragmentVectorConstants1.packedValues[0u].z);
    precise float productValue64 = multiplyAddValue39 * varyingColor0.x;
    precise float productValue65 = multiplyAddValue40 * varyingColor0.y;
    precise float productValue66 = multiplyAddValue41 * varyingColor0.z;
    precise float productValue67 = productValue64 * fragmentVectorConstants1.packedValues[4u].x;
    precise float productValue68 = productValue65 * fragmentVectorConstants1.packedValues[4u].y;
    precise float productValue69 = productValue66 * fragmentVectorConstants1.packedValues[4u].z;
    precise float productValue70 = productValue67 * varyingColor0.w;
    precise float productValue71 = productValue68 * varyingColor0.w;
    precise float productValue72 = productValue69 * varyingColor0.w;
    bool comparisonValue13 = fragmentScalarConstants1.packedValues[12u] != 0.0;
    float comparisonValue21 = comparisonValue13 ? productValue70 : multiplyAddValue39;
    float comparisonValue22 = comparisonValue13 ? productValue71 : multiplyAddValue40;
    float comparisonValue23 = comparisonValue13 ? productValue72 : multiplyAddValue41;
    precise float sumValue21 = varyingColor2.x - comparisonValue21;
    precise float sumValue22 = varyingColor2.y - comparisonValue22;
    precise float sumValue23 = varyingColor2.z - comparisonValue23;
    fragmentColor0.x = fma(varyingColor2.w, sumValue21, comparisonValue21);
    fragmentColor0.y = fma(varyingColor2.w, sumValue22, comparisonValue22);
    fragmentColor0.z = fma(varyingColor2.w, sumValue23, comparisonValue23);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[8u];
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    precise float sumValue = fragmentVectorConstants1.packedValues[0u].x - scalarValue;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[0u].y - scalarValue1;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[0u].z - scalarValue2;
    precise float multiplyAddValue48 = fma(fragmentScalarConstants1.packedValues[3u], sumValue, scalarValue) * varyingColor1.x;
    precise float multiplyAddValue49 = fma(fragmentScalarConstants1.packedValues[3u], sumValue1, scalarValue1) * varyingColor1.y;
    precise float multiplyAddValue50 = fma(fragmentScalarConstants1.packedValues[3u], sumValue2, scalarValue2) * varyingColor1.z;
    precise float productValue81 = sampledTextureValue.w * varyingColor1.w;
    precise float multiplyAddValue51 = fma(productValue81, fma(multiplyAddValue48, varyingColor0.x, -multiplyAddValue48), multiplyAddValue48) * fragmentVectorConstants1.packedValues[3u].x;
    precise float multiplyAddValue52 = fma(productValue81, fma(multiplyAddValue49, varyingColor0.y, -multiplyAddValue49), multiplyAddValue49) * fragmentVectorConstants1.packedValues[3u].y;
    precise float multiplyAddValue53 = fma(productValue81, fma(multiplyAddValue50, varyingColor0.z, -multiplyAddValue50), multiplyAddValue50) * fragmentVectorConstants1.packedValues[3u].z;
    precise float productValue82 = multiplyAddValue51 * varyingColor0.w;
    precise float productValue83 = multiplyAddValue52 * varyingColor0.w;
    precise float productValue84 = multiplyAddValue53 * varyingColor0.w;
    precise float productValue19 = varyingColor0.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue20 = varyingColor0.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue21 = varyingColor0.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float productValue22 = varyingColor0.w * fragmentVectorConstants1.packedValues[3u].w;
    precise float productValue85 = multiplyAddValue48 * productValue19;
    precise float productValue86 = multiplyAddValue49 * productValue20;
    precise float productValue87 = multiplyAddValue50 * productValue21;
    precise float productValue88 = productValue81 * productValue22;
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[8u] != 0.0;
    float comparisonValue24 = comparisonValue1 ? productValue82 : productValue85;
    float comparisonValue25 = comparisonValue1 ? productValue83 : productValue86;
    float comparisonValue26 = comparisonValue1 ? productValue84 : productValue87;
    precise float sumValue24 = varyingColor2.x - comparisonValue24;
    precise float sumValue25 = varyingColor2.y - comparisonValue25;
    precise float sumValue26 = varyingColor2.z - comparisonValue26;
    fragmentColor0.x = fma(varyingColor2.w, sumValue24, comparisonValue24);
    fragmentColor0.y = fma(varyingColor2.w, sumValue25, comparisonValue25);
    fragmentColor0.z = fma(varyingColor2.w, sumValue26, comparisonValue26);
    precise float comparisonValue27 = (comparisonValue1 ? 1.0 : productValue88) * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.w = comparisonValue27;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue6 = fragmentVectorConstants1.packedValues[0u].x - 1.0;
    precise float sumValue7 = fragmentVectorConstants1.packedValues[0u].y - 1.0;
    precise float sumValue8 = fragmentVectorConstants1.packedValues[0u].z - 1.0;
    precise float multiplyAddValue60 = fma(fragmentScalarConstants1.packedValues[3u], sumValue6, 1.0) * varyingColor1.x;
    precise float multiplyAddValue61 = fma(fragmentScalarConstants1.packedValues[3u], sumValue7, 1.0) * varyingColor1.y;
    precise float multiplyAddValue62 = fma(fragmentScalarConstants1.packedValues[3u], sumValue8, 1.0) * varyingColor1.z;
    precise float productValue98 = varyingColor1.w * 1.0;
    precise float multiplyAddValue63 = fma(productValue98, fma(multiplyAddValue60, varyingColor0.x, -multiplyAddValue60), multiplyAddValue60) * fragmentVectorConstants1.packedValues[3u].x;
    precise float multiplyAddValue64 = fma(productValue98, fma(multiplyAddValue61, varyingColor0.y, -multiplyAddValue61), multiplyAddValue61) * fragmentVectorConstants1.packedValues[3u].y;
    precise float multiplyAddValue65 = fma(productValue98, fma(multiplyAddValue62, varyingColor0.z, -multiplyAddValue62), multiplyAddValue62) * fragmentVectorConstants1.packedValues[3u].z;
    precise float productValue99 = multiplyAddValue63 * varyingColor0.w;
    precise float productValue100 = multiplyAddValue64 * varyingColor0.w;
    precise float productValue101 = multiplyAddValue65 * varyingColor0.w;
    precise float productValue19 = varyingColor0.x * fragmentVectorConstants1.packedValues[3u].x;
    precise float productValue20 = varyingColor0.y * fragmentVectorConstants1.packedValues[3u].y;
    precise float productValue21 = varyingColor0.z * fragmentVectorConstants1.packedValues[3u].z;
    precise float productValue22 = varyingColor0.w * fragmentVectorConstants1.packedValues[3u].w;
    precise float productValue102 = multiplyAddValue60 * productValue19;
    precise float productValue103 = multiplyAddValue61 * productValue20;
    precise float productValue104 = multiplyAddValue62 * productValue21;
    precise float productValue105 = productValue98 * productValue22;
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[8u] != 0.0;
    float comparisonValue28 = comparisonValue1 ? productValue99 : productValue102;
    float comparisonValue29 = comparisonValue1 ? productValue100 : productValue103;
    float comparisonValue30 = comparisonValue1 ? productValue101 : productValue104;
    precise float sumValue27 = varyingColor2.x - comparisonValue28;
    precise float sumValue28 = varyingColor2.y - comparisonValue29;
    precise float sumValue29 = varyingColor2.z - comparisonValue30;
    fragmentColor0.x = fma(varyingColor2.w, sumValue27, comparisonValue28);
    fragmentColor0.y = fma(varyingColor2.w, sumValue28, comparisonValue29);
    fragmentColor0.z = fma(varyingColor2.w, sumValue29, comparisonValue30);
    precise float comparisonValue31 = (comparisonValue1 ? 1.0 : productValue105) * fragmentScalarConstants1.packedValues[4u];
    fragmentColor0.w = comparisonValue31;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    precise float productValue58 = scalarValue * varyingColor0.x;
    precise float productValue59 = scalarValue * varyingColor0.y;
    precise float productValue60 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    float multiplyAddValue27 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].x, -productValue58), productValue58);
    float multiplyAddValue28 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].y, -productValue59), productValue59);
    float multiplyAddValue29 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].z, -productValue60), productValue60);
    precise float sumValue12 = fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue27;
    precise float sumValue13 = fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue28;
    precise float sumValue14 = fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue29;
    precise float multiplyAddValue66 = fma(fragmentScalarConstants1.packedValues[7u], sumValue12, multiplyAddValue27) * varyingColor1.x;
    precise float multiplyAddValue67 = fma(fragmentScalarConstants1.packedValues[7u], sumValue13, multiplyAddValue28) * varyingColor1.y;
    precise float multiplyAddValue68 = fma(fragmentScalarConstants1.packedValues[7u], sumValue14, multiplyAddValue29) * varyingColor1.z;
    precise float productValue81 = sampledTextureValue.w * varyingColor1.w;
    precise float multiplyAddValue69 = fma(productValue81, fma(multiplyAddValue66, varyingColor0.x, -multiplyAddValue66), multiplyAddValue66) * fragmentVectorConstants1.packedValues[4u].x;
    precise float multiplyAddValue70 = fma(productValue81, fma(multiplyAddValue67, varyingColor0.y, -multiplyAddValue67), multiplyAddValue67) * fragmentVectorConstants1.packedValues[4u].y;
    precise float multiplyAddValue71 = fma(productValue81, fma(multiplyAddValue68, varyingColor0.z, -multiplyAddValue68), multiplyAddValue68) * fragmentVectorConstants1.packedValues[4u].z;
    precise float productValue106 = multiplyAddValue69 * varyingColor0.w;
    precise float productValue107 = multiplyAddValue70 * varyingColor0.w;
    precise float productValue108 = multiplyAddValue71 * varyingColor0.w;
    bool comparisonValue13 = fragmentScalarConstants1.packedValues[12u] != 0.0;
    float comparisonValue32 = comparisonValue13 ? productValue106 : multiplyAddValue66;
    float comparisonValue33 = comparisonValue13 ? productValue107 : multiplyAddValue67;
    float comparisonValue34 = comparisonValue13 ? productValue108 : multiplyAddValue68;
    precise float sumValue30 = varyingColor2.x - comparisonValue32;
    precise float sumValue31 = varyingColor2.y - comparisonValue33;
    precise float sumValue32 = varyingColor2.z - comparisonValue34;
    fragmentColor0.x = fma(varyingColor2.w, sumValue30, comparisonValue32);
    fragmentColor0.y = fma(varyingColor2.w, sumValue31, comparisonValue33);
    fragmentColor0.z = fma(varyingColor2.w, sumValue32, comparisonValue34);
    precise float comparisonValue35 = (comparisonValue13 ? 1.0 : productValue81) * fragmentScalarConstants1.packedValues[8u];
    fragmentColor0.w = comparisonValue35;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue18 = fragmentVectorConstants1.packedValues[1u].x - fragmentVectorConstants1.packedValues[0u].x;
    precise float sumValue19 = fragmentVectorConstants1.packedValues[1u].y - fragmentVectorConstants1.packedValues[0u].y;
    precise float sumValue20 = fragmentVectorConstants1.packedValues[1u].z - fragmentVectorConstants1.packedValues[0u].z;
    precise float multiplyAddValue78 = fma(fragmentScalarConstants1.packedValues[7u], sumValue18, fragmentVectorConstants1.packedValues[0u].x) * varyingColor1.x;
    precise float multiplyAddValue79 = fma(fragmentScalarConstants1.packedValues[7u], sumValue19, fragmentVectorConstants1.packedValues[0u].y) * varyingColor1.y;
    precise float multiplyAddValue80 = fma(fragmentScalarConstants1.packedValues[7u], sumValue20, fragmentVectorConstants1.packedValues[0u].z) * varyingColor1.z;
    precise float productValue98 = varyingColor1.w * 1.0;
    precise float multiplyAddValue81 = fma(productValue98, fma(multiplyAddValue78, varyingColor0.x, -multiplyAddValue78), multiplyAddValue78) * fragmentVectorConstants1.packedValues[4u].x;
    precise float multiplyAddValue82 = fma(productValue98, fma(multiplyAddValue79, varyingColor0.y, -multiplyAddValue79), multiplyAddValue79) * fragmentVectorConstants1.packedValues[4u].y;
    precise float multiplyAddValue83 = fma(productValue98, fma(multiplyAddValue80, varyingColor0.z, -multiplyAddValue80), multiplyAddValue80) * fragmentVectorConstants1.packedValues[4u].z;
    precise float productValue112 = multiplyAddValue81 * varyingColor0.w;
    precise float productValue113 = multiplyAddValue82 * varyingColor0.w;
    precise float productValue114 = multiplyAddValue83 * varyingColor0.w;
    bool comparisonValue13 = fragmentScalarConstants1.packedValues[12u] != 0.0;
    float comparisonValue36 = comparisonValue13 ? productValue112 : multiplyAddValue78;
    float comparisonValue37 = comparisonValue13 ? productValue113 : multiplyAddValue79;
    float comparisonValue38 = comparisonValue13 ? productValue114 : multiplyAddValue80;
    precise float sumValue33 = varyingColor2.x - comparisonValue36;
    precise float sumValue34 = varyingColor2.y - comparisonValue37;
    precise float sumValue35 = varyingColor2.z - comparisonValue38;
    fragmentColor0.x = fma(varyingColor2.w, sumValue33, comparisonValue36);
    fragmentColor0.y = fma(varyingColor2.w, sumValue34, comparisonValue37);
    fragmentColor0.z = fma(varyingColor2.w, sumValue35, comparisonValue38);
    precise float comparisonValue39 = (comparisonValue13 ? 1.0 : productValue98) * fragmentScalarConstants1.packedValues[8u];
    fragmentColor0.w = comparisonValue39;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        precise float reinterpretedBits14 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x);
        precise float reinterpretedBits15 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y);
        precise float reinterpretedBits16 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z);
        float scalarValue13 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16));
        float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
        precise float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[53u])) - reinterpretedBits6;
        precise float sumValue36 = scalarValue13 - reinterpretedBits6;
        precise float quotientValue2 = 1.0 / reinterpretedBits17;
        precise float productValue128 = quotientValue2 * sumValue36;
        float scalarValue14 = spvNClamp(productValue128, 0.0, 1.0);
        precise float productValue129 = scalarValue14 * scalarValue14;
        precise float multiplyAddValue98 = productValue129 * fma(scalarValue14, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
        precise float multiplyAddValue99 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.x);
        precise float multiplyAddValue100 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.y);
        float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[54u]));
        precise float quotientValue5 = multiplyAddValue99 / reinterpretedBits9;
        precise float quotientValue6 = multiplyAddValue100 / reinterpretedBits9;
        precise float productValue130 = floor(quotientValue5) * reinterpretedBits9;
        precise float productValue131 = floor(quotientValue6) * reinterpretedBits9;
        precise float productValue132 = productValue130 * 0.25;
        precise float productValue133 = productValue131 * 0.25;
        precise float productValue134 = productValue130 * 0.5;
        precise float productValue135 = productValue131 * 0.5;
        float scalarValue15 = floor(productValue133);
        float scalarValue16 = floor(productValue135);
        precise float productValue136 = scalarValue15 * scalarValue15;
        precise float productValue137 = scalarValue16 * scalarValue16;
        precise float productValue138 = productValue136 * 0.75;
        precise float productValue139 = productValue137 * 0.75;
        float scalarValue17 = floor(productValue131);
        precise float productValue140 = scalarValue17 * scalarValue17;
        precise float productValue141 = productValue140 * 0.75;
        precise float multiplyAddValue101 = fma(fma(fma(fract(fma(floor(productValue132), 0.5, productValue138)), 0.25, fract(fma(floor(productValue134), 0.5, productValue139))), 0.25, fract(fma(floor(productValue130), 0.5, productValue141))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue101 >= multiplyAddValue98)) || (scalarValue3 <= 0.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits18 = uintBitsToFloat(reinterpretedBits10.x) - scalarValue;
    precise float reinterpretedBits19 = uintBitsToFloat(reinterpretedBits10.y) - scalarValue1;
    precise float reinterpretedBits20 = uintBitsToFloat(reinterpretedBits10.z) - scalarValue2;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue102 = fma(reinterpretedBits11, reinterpretedBits18, scalarValue);
    float multiplyAddValue103 = fma(reinterpretedBits11, reinterpretedBits19, scalarValue1);
    float multiplyAddValue104 = fma(reinterpretedBits11, reinterpretedBits20, scalarValue2);
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue105 = fma(scalarValue3, fma(multiplyAddValue102, varyingColor0.x, -multiplyAddValue102), multiplyAddValue102) * uintBitsToFloat(reinterpretedBits12.x);
    precise float multiplyAddValue106 = fma(scalarValue3, fma(multiplyAddValue103, varyingColor0.y, -multiplyAddValue103), multiplyAddValue103) * uintBitsToFloat(reinterpretedBits12.y);
    precise float multiplyAddValue107 = fma(scalarValue3, fma(multiplyAddValue104, varyingColor0.z, -multiplyAddValue104), multiplyAddValue104) * uintBitsToFloat(reinterpretedBits12.z);
    precise float productValue142 = multiplyAddValue105 * varyingColor0.w;
    precise float productValue143 = multiplyAddValue106 * varyingColor0.w;
    precise float productValue144 = multiplyAddValue107 * varyingColor0.w;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits21 = varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits22 = varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits23 = varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z);
    precise float reinterpretedBits24 = varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w);
    precise float productValue145 = multiplyAddValue102 * reinterpretedBits21;
    precise float productValue146 = multiplyAddValue103 * reinterpretedBits22;
    precise float productValue147 = multiplyAddValue104 * reinterpretedBits23;
    precise float productValue148 = scalarValue3 * reinterpretedBits24;
    float comparisonValue40 = reinterpretedBits ? productValue142 : productValue145;
    float comparisonValue41 = reinterpretedBits ? productValue143 : productValue146;
    float comparisonValue42 = reinterpretedBits ? productValue144 : productValue147;
    precise float reinterpretedBits25 = (reinterpretedBits ? 1.0 : productValue148) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.w = reinterpretedBits25;
    precise float sumValue37 = varyingColor2.x - comparisonValue40;
    precise float sumValue38 = varyingColor2.y - comparisonValue41;
    precise float sumValue39 = varyingColor2.z - comparisonValue42;
    fragmentColor0.x = fma(varyingColor2.w, sumValue37, comparisonValue40);
    fragmentColor0.y = fma(varyingColor2.w, sumValue38, comparisonValue41);
    fragmentColor0.z = fma(varyingColor2.w, sumValue39, comparisonValue42);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        precise float reinterpretedBits14 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x);
        precise float reinterpretedBits15 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y);
        precise float reinterpretedBits16 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z);
        float scalarValue13 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16));
        float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
        precise float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[53u])) - reinterpretedBits6;
        precise float sumValue36 = scalarValue13 - reinterpretedBits6;
        precise float quotientValue2 = 1.0 / reinterpretedBits17;
        precise float productValue128 = quotientValue2 * sumValue36;
        float scalarValue14 = spvNClamp(productValue128, 0.0, 1.0);
        precise float productValue129 = scalarValue14 * scalarValue14;
        precise float multiplyAddValue98 = productValue129 * fma(scalarValue14, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
        precise float multiplyAddValue99 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.x);
        precise float multiplyAddValue100 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.y);
        float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[54u]));
        precise float quotientValue5 = multiplyAddValue99 / reinterpretedBits9;
        precise float quotientValue6 = multiplyAddValue100 / reinterpretedBits9;
        precise float productValue130 = floor(quotientValue5) * reinterpretedBits9;
        precise float productValue131 = floor(quotientValue6) * reinterpretedBits9;
        precise float productValue132 = productValue130 * 0.25;
        precise float productValue133 = productValue131 * 0.25;
        precise float productValue134 = productValue130 * 0.5;
        precise float productValue135 = productValue131 * 0.5;
        float scalarValue15 = floor(productValue133);
        float scalarValue16 = floor(productValue135);
        precise float productValue136 = scalarValue15 * scalarValue15;
        precise float productValue137 = scalarValue16 * scalarValue16;
        precise float productValue138 = productValue136 * 0.75;
        precise float productValue139 = productValue137 * 0.75;
        float scalarValue17 = floor(productValue131);
        precise float productValue140 = scalarValue17 * scalarValue17;
        precise float productValue141 = productValue140 * 0.75;
        precise float multiplyAddValue101 = fma(fma(fma(fract(fma(floor(productValue132), 0.5, productValue138)), 0.25, fract(fma(floor(productValue134), 0.5, productValue139))), 0.25, fract(fma(floor(productValue130), 0.5, productValue141))), 64.0, 0.5) * 0.015625;
        if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue101 >= multiplyAddValue98))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits29 = uintBitsToFloat(reinterpretedBits10.x) - 1.0;
    precise float reinterpretedBits30 = uintBitsToFloat(reinterpretedBits10.y) - 1.0;
    precise float reinterpretedBits31 = uintBitsToFloat(reinterpretedBits10.z) - 1.0;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue111 = fma(reinterpretedBits11, reinterpretedBits29, 1.0);
    float multiplyAddValue112 = fma(reinterpretedBits11, reinterpretedBits30, 1.0);
    float multiplyAddValue113 = fma(reinterpretedBits11, reinterpretedBits31, 1.0);
    precise float productValue152 = multiplyAddValue111 * varyingColor0.x;
    precise float productValue153 = multiplyAddValue112 * varyingColor0.y;
    precise float productValue154 = multiplyAddValue113 * varyingColor0.z;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits32 = productValue152 * uintBitsToFloat(reinterpretedBits12.x);
    precise float reinterpretedBits33 = productValue153 * uintBitsToFloat(reinterpretedBits12.y);
    precise float reinterpretedBits34 = productValue154 * uintBitsToFloat(reinterpretedBits12.z);
    precise float productValue155 = reinterpretedBits32 * varyingColor0.w;
    precise float productValue156 = reinterpretedBits33 * varyingColor0.w;
    precise float productValue157 = reinterpretedBits34 * varyingColor0.w;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits21 = varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits22 = varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits23 = varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z);
    precise float reinterpretedBits24 = varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w);
    precise float productValue158 = multiplyAddValue111 * reinterpretedBits21;
    precise float productValue159 = multiplyAddValue112 * reinterpretedBits22;
    precise float productValue160 = multiplyAddValue113 * reinterpretedBits23;
    precise float productValue161 = reinterpretedBits24 * 1.0;
    float comparisonValue43 = reinterpretedBits ? productValue155 : productValue158;
    float comparisonValue44 = reinterpretedBits ? productValue156 : productValue159;
    float comparisonValue45 = reinterpretedBits ? productValue157 : productValue160;
    precise float reinterpretedBits35 = (reinterpretedBits ? 1.0 : productValue161) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.w = reinterpretedBits35;
    precise float sumValue40 = varyingColor2.x - comparisonValue43;
    precise float sumValue41 = varyingColor2.y - comparisonValue44;
    precise float sumValue42 = varyingColor2.z - comparisonValue45;
    fragmentColor0.x = fma(varyingColor2.w, sumValue40, comparisonValue43);
    fragmentColor0.y = fma(varyingColor2.w, sumValue41, comparisonValue44);
    fragmentColor0.z = fma(varyingColor2.w, sumValue42, comparisonValue45);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        precise float reinterpretedBits46 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x);
        precise float reinterpretedBits47 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y);
        precise float reinterpretedBits48 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z);
        float scalarValue20 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits46, reinterpretedBits47, reinterpretedBits48));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        precise float reinterpretedBits49 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38;
        precise float sumValue43 = scalarValue20 - reinterpretedBits38;
        precise float quotientValue9 = 1.0 / reinterpretedBits49;
        precise float productValue175 = quotientValue9 * sumValue43;
        float scalarValue21 = spvNClamp(productValue175, 0.0, 1.0);
        precise float productValue176 = scalarValue21 * scalarValue21;
        precise float multiplyAddValue125 = productValue176 * fma(scalarValue21, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        precise float multiplyAddValue126 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x);
        precise float multiplyAddValue127 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        precise float quotientValue10 = multiplyAddValue126 / reinterpretedBits41;
        precise float quotientValue11 = multiplyAddValue127 / reinterpretedBits41;
        precise float productValue177 = floor(quotientValue10) * reinterpretedBits41;
        precise float productValue178 = floor(quotientValue11) * reinterpretedBits41;
        precise float productValue179 = productValue177 * 0.25;
        precise float productValue180 = productValue178 * 0.25;
        precise float productValue181 = productValue177 * 0.5;
        precise float productValue182 = productValue178 * 0.5;
        float scalarValue22 = floor(productValue180);
        float scalarValue23 = floor(productValue182);
        precise float productValue183 = scalarValue22 * scalarValue22;
        precise float productValue184 = scalarValue23 * scalarValue23;
        precise float productValue185 = productValue183 * 0.75;
        precise float productValue186 = productValue184 * 0.75;
        float scalarValue24 = floor(productValue178);
        precise float productValue187 = scalarValue24 * scalarValue24;
        precise float productValue188 = productValue187 * 0.75;
        precise float multiplyAddValue128 = fma(fma(fma(fract(fma(floor(productValue179), 0.5, productValue185)), 0.25, fract(fma(floor(productValue181), 0.5, productValue186))), 0.25, fract(fma(floor(productValue177), 0.5, productValue188))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && (multiplyAddValue128 >= multiplyAddValue125)) || (scalarValue3 <= 0.0))
        {
            isFragmentDiscarded = true;
        }
    }
    precise float productValue58 = scalarValue * varyingColor0.x;
    precise float productValue59 = scalarValue * varyingColor0.y;
    precise float productValue60 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue129 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.x), -productValue58), productValue58);
    float multiplyAddValue130 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.y), -productValue59), productValue59);
    float multiplyAddValue131 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.z), -productValue60), productValue60);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits50 = uintBitsToFloat(reinterpretedBits43.x) - multiplyAddValue129;
    precise float reinterpretedBits51 = uintBitsToFloat(reinterpretedBits43.y) - multiplyAddValue130;
    precise float reinterpretedBits52 = uintBitsToFloat(reinterpretedBits43.z) - multiplyAddValue131;
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue132 = fma(reinterpretedBits44, reinterpretedBits50, multiplyAddValue129);
    float multiplyAddValue133 = fma(reinterpretedBits44, reinterpretedBits51, multiplyAddValue130);
    float multiplyAddValue134 = fma(reinterpretedBits44, reinterpretedBits52, multiplyAddValue131);
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float multiplyAddValue135 = fma(scalarValue3, fma(multiplyAddValue132, varyingColor0.x, -multiplyAddValue132), multiplyAddValue132) * uintBitsToFloat(reinterpretedBits45.x);
    precise float multiplyAddValue136 = fma(scalarValue3, fma(multiplyAddValue133, varyingColor0.y, -multiplyAddValue133), multiplyAddValue133) * uintBitsToFloat(reinterpretedBits45.y);
    precise float multiplyAddValue137 = fma(scalarValue3, fma(multiplyAddValue134, varyingColor0.z, -multiplyAddValue134), multiplyAddValue134) * uintBitsToFloat(reinterpretedBits45.z);
    precise float productValue189 = multiplyAddValue135 * varyingColor0.w;
    precise float productValue190 = multiplyAddValue136 * varyingColor0.w;
    precise float productValue191 = multiplyAddValue137 * varyingColor0.w;
    float comparisonValue46 = reinterpretedBits36 ? productValue189 : multiplyAddValue132;
    float comparisonValue47 = reinterpretedBits36 ? productValue190 : multiplyAddValue133;
    float comparisonValue48 = reinterpretedBits36 ? productValue191 : multiplyAddValue134;
    precise float reinterpretedBits53 = (reinterpretedBits36 ? 1.0 : scalarValue3) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.w = reinterpretedBits53;
    precise float sumValue44 = varyingColor2.x - comparisonValue46;
    precise float sumValue45 = varyingColor2.y - comparisonValue47;
    precise float sumValue46 = varyingColor2.z - comparisonValue48;
    fragmentColor0.x = fma(varyingColor2.w, sumValue44, comparisonValue46);
    fragmentColor0.y = fma(varyingColor2.w, sumValue45, comparisonValue47);
    fragmentColor0.z = fma(varyingColor2.w, sumValue46, comparisonValue48);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        precise float reinterpretedBits46 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x);
        precise float reinterpretedBits47 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y);
        precise float reinterpretedBits48 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z);
        float scalarValue20 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits46, reinterpretedBits47, reinterpretedBits48));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        precise float reinterpretedBits49 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38;
        precise float sumValue43 = scalarValue20 - reinterpretedBits38;
        precise float quotientValue9 = 1.0 / reinterpretedBits49;
        precise float productValue175 = quotientValue9 * sumValue43;
        float scalarValue21 = spvNClamp(productValue175, 0.0, 1.0);
        precise float productValue176 = scalarValue21 * scalarValue21;
        precise float multiplyAddValue125 = productValue176 * fma(scalarValue21, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        precise float multiplyAddValue126 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x);
        precise float multiplyAddValue127 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        precise float quotientValue10 = multiplyAddValue126 / reinterpretedBits41;
        precise float quotientValue11 = multiplyAddValue127 / reinterpretedBits41;
        precise float productValue177 = floor(quotientValue10) * reinterpretedBits41;
        precise float productValue178 = floor(quotientValue11) * reinterpretedBits41;
        precise float productValue179 = productValue177 * 0.25;
        precise float productValue180 = productValue178 * 0.25;
        precise float productValue181 = productValue177 * 0.5;
        precise float productValue182 = productValue178 * 0.5;
        float scalarValue22 = floor(productValue180);
        float scalarValue23 = floor(productValue182);
        precise float productValue183 = scalarValue22 * scalarValue22;
        precise float productValue184 = scalarValue23 * scalarValue23;
        precise float productValue185 = productValue183 * 0.75;
        precise float productValue186 = productValue184 * 0.75;
        float scalarValue24 = floor(productValue178);
        precise float productValue187 = scalarValue24 * scalarValue24;
        precise float productValue188 = productValue187 * 0.75;
        precise float multiplyAddValue128 = fma(fma(fma(fract(fma(floor(productValue179), 0.5, productValue185)), 0.25, fract(fma(floor(productValue181), 0.5, productValue186))), 0.25, fract(fma(floor(productValue177), 0.5, productValue188))), 64.0, 0.5) * 0.015625;
        if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && (multiplyAddValue128 >= multiplyAddValue125))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits42.y);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits42.z);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits43.x) - reinterpretedBits54;
    precise float reinterpretedBits58 = uintBitsToFloat(reinterpretedBits43.y) - reinterpretedBits55;
    precise float reinterpretedBits59 = uintBitsToFloat(reinterpretedBits43.z) - reinterpretedBits56;
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue138 = fma(reinterpretedBits44, reinterpretedBits57, reinterpretedBits54);
    float multiplyAddValue139 = fma(reinterpretedBits44, reinterpretedBits58, reinterpretedBits55);
    float multiplyAddValue140 = fma(reinterpretedBits44, reinterpretedBits59, reinterpretedBits56);
    precise float productValue192 = multiplyAddValue138 * varyingColor0.x;
    precise float productValue193 = multiplyAddValue139 * varyingColor0.y;
    precise float productValue194 = multiplyAddValue140 * varyingColor0.z;
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float reinterpretedBits60 = productValue192 * uintBitsToFloat(reinterpretedBits45.x);
    precise float reinterpretedBits61 = productValue193 * uintBitsToFloat(reinterpretedBits45.y);
    precise float reinterpretedBits62 = productValue194 * uintBitsToFloat(reinterpretedBits45.z);
    precise float productValue195 = reinterpretedBits60 * varyingColor0.w;
    precise float productValue196 = reinterpretedBits61 * varyingColor0.w;
    precise float productValue197 = reinterpretedBits62 * varyingColor0.w;
    float comparisonValue49 = reinterpretedBits36 ? productValue195 : multiplyAddValue138;
    float comparisonValue50 = reinterpretedBits36 ? productValue196 : multiplyAddValue139;
    float comparisonValue51 = reinterpretedBits36 ? productValue197 : multiplyAddValue140;
    precise float sumValue47 = varyingColor2.x - comparisonValue49;
    precise float sumValue48 = varyingColor2.y - comparisonValue50;
    precise float sumValue49 = varyingColor2.z - comparisonValue51;
    fragmentColor0.x = fma(varyingColor2.w, sumValue47, comparisonValue49);
    fragmentColor0.y = fma(varyingColor2.w, sumValue48, comparisonValue50);
    fragmentColor0.z = fma(varyingColor2.w, sumValue49, comparisonValue51);
    fragmentColor0.w = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        precise float reinterpretedBits14 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x);
        precise float reinterpretedBits15 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y);
        precise float reinterpretedBits16 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z);
        float scalarValue13 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16));
        float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
        precise float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[53u])) - reinterpretedBits6;
        precise float sumValue36 = scalarValue13 - reinterpretedBits6;
        precise float quotientValue2 = 1.0 / reinterpretedBits17;
        precise float productValue128 = quotientValue2 * sumValue36;
        float scalarValue14 = spvNClamp(productValue128, 0.0, 1.0);
        precise float productValue129 = scalarValue14 * scalarValue14;
        precise float multiplyAddValue98 = productValue129 * fma(scalarValue14, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
        precise float multiplyAddValue99 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.x);
        precise float multiplyAddValue100 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.y);
        float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[54u]));
        precise float quotientValue5 = multiplyAddValue99 / reinterpretedBits9;
        precise float quotientValue6 = multiplyAddValue100 / reinterpretedBits9;
        precise float productValue130 = floor(quotientValue5) * reinterpretedBits9;
        precise float productValue131 = floor(quotientValue6) * reinterpretedBits9;
        precise float productValue132 = productValue130 * 0.25;
        precise float productValue133 = productValue131 * 0.25;
        precise float productValue134 = productValue130 * 0.5;
        precise float productValue135 = productValue131 * 0.5;
        float scalarValue15 = floor(productValue133);
        float scalarValue16 = floor(productValue135);
        precise float productValue136 = scalarValue15 * scalarValue15;
        precise float productValue137 = scalarValue16 * scalarValue16;
        precise float productValue138 = productValue136 * 0.75;
        precise float productValue139 = productValue137 * 0.75;
        float scalarValue17 = floor(productValue131);
        precise float productValue140 = scalarValue17 * scalarValue17;
        precise float productValue141 = productValue140 * 0.75;
        precise float multiplyAddValue101 = fma(fma(fma(fract(fma(floor(productValue132), 0.5, productValue138)), 0.25, fract(fma(floor(productValue134), 0.5, productValue139))), 0.25, fract(fma(floor(productValue130), 0.5, productValue141))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue101 >= multiplyAddValue98)) || (scalarValue3 <= 0.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits18 = uintBitsToFloat(reinterpretedBits10.x) - scalarValue;
    precise float reinterpretedBits19 = uintBitsToFloat(reinterpretedBits10.y) - scalarValue1;
    precise float reinterpretedBits20 = uintBitsToFloat(reinterpretedBits10.z) - scalarValue2;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    precise float multiplyAddValue150 = fma(reinterpretedBits11, reinterpretedBits18, scalarValue) * varyingColor1.x;
    precise float multiplyAddValue151 = fma(reinterpretedBits11, reinterpretedBits19, scalarValue1) * varyingColor1.y;
    precise float multiplyAddValue152 = fma(reinterpretedBits11, reinterpretedBits20, scalarValue2) * varyingColor1.z;
    precise float productValue206 = scalarValue3 * varyingColor1.w;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue153 = fma(productValue206, fma(multiplyAddValue150, varyingColor0.x, -multiplyAddValue150), multiplyAddValue150) * uintBitsToFloat(reinterpretedBits12.x);
    precise float multiplyAddValue154 = fma(productValue206, fma(multiplyAddValue151, varyingColor0.y, -multiplyAddValue151), multiplyAddValue151) * uintBitsToFloat(reinterpretedBits12.y);
    precise float multiplyAddValue155 = fma(productValue206, fma(multiplyAddValue152, varyingColor0.z, -multiplyAddValue152), multiplyAddValue152) * uintBitsToFloat(reinterpretedBits12.z);
    precise float productValue207 = multiplyAddValue153 * varyingColor0.w;
    precise float productValue208 = multiplyAddValue154 * varyingColor0.w;
    precise float productValue209 = multiplyAddValue155 * varyingColor0.w;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits21 = varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits22 = varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits23 = varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z);
    precise float reinterpretedBits24 = varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w);
    precise float productValue210 = multiplyAddValue150 * reinterpretedBits21;
    precise float productValue211 = multiplyAddValue151 * reinterpretedBits22;
    precise float productValue212 = multiplyAddValue152 * reinterpretedBits23;
    precise float productValue213 = productValue206 * reinterpretedBits24;
    float comparisonValue52 = reinterpretedBits ? productValue207 : productValue210;
    float comparisonValue53 = reinterpretedBits ? productValue208 : productValue211;
    float comparisonValue54 = reinterpretedBits ? productValue209 : productValue212;
    precise float reinterpretedBits66 = (reinterpretedBits ? 1.0 : productValue213) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.w = reinterpretedBits66;
    precise float sumValue50 = varyingColor2.x - comparisonValue52;
    precise float sumValue51 = varyingColor2.y - comparisonValue53;
    precise float sumValue52 = varyingColor2.z - comparisonValue54;
    fragmentColor0.x = fma(varyingColor2.w, sumValue50, comparisonValue52);
    fragmentColor0.y = fma(varyingColor2.w, sumValue51, comparisonValue53);
    fragmentColor0.z = fma(varyingColor2.w, sumValue52, comparisonValue54);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        precise float reinterpretedBits14 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x);
        precise float reinterpretedBits15 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y);
        precise float reinterpretedBits16 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z);
        float scalarValue13 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16));
        float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
        precise float reinterpretedBits17 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[53u])) - reinterpretedBits6;
        precise float sumValue36 = scalarValue13 - reinterpretedBits6;
        precise float quotientValue2 = 1.0 / reinterpretedBits17;
        precise float productValue128 = quotientValue2 * sumValue36;
        float scalarValue14 = spvNClamp(productValue128, 0.0, 1.0);
        precise float productValue129 = scalarValue14 * scalarValue14;
        precise float multiplyAddValue98 = productValue129 * fma(scalarValue14, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
        precise float multiplyAddValue99 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.x);
        precise float multiplyAddValue100 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.y);
        float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[54u]));
        precise float quotientValue5 = multiplyAddValue99 / reinterpretedBits9;
        precise float quotientValue6 = multiplyAddValue100 / reinterpretedBits9;
        precise float productValue130 = floor(quotientValue5) * reinterpretedBits9;
        precise float productValue131 = floor(quotientValue6) * reinterpretedBits9;
        precise float productValue132 = productValue130 * 0.25;
        precise float productValue133 = productValue131 * 0.25;
        precise float productValue134 = productValue130 * 0.5;
        precise float productValue135 = productValue131 * 0.5;
        float scalarValue15 = floor(productValue133);
        float scalarValue16 = floor(productValue135);
        precise float productValue136 = scalarValue15 * scalarValue15;
        precise float productValue137 = scalarValue16 * scalarValue16;
        precise float productValue138 = productValue136 * 0.75;
        precise float productValue139 = productValue137 * 0.75;
        float scalarValue17 = floor(productValue131);
        precise float productValue140 = scalarValue17 * scalarValue17;
        precise float productValue141 = productValue140 * 0.75;
        precise float multiplyAddValue101 = fma(fma(fma(fract(fma(floor(productValue132), 0.5, productValue138)), 0.25, fract(fma(floor(productValue134), 0.5, productValue139))), 0.25, fract(fma(floor(productValue130), 0.5, productValue141))), 64.0, 0.5) * 0.015625;
        if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && (multiplyAddValue101 >= multiplyAddValue98))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits29 = uintBitsToFloat(reinterpretedBits10.x) - 1.0;
    precise float reinterpretedBits30 = uintBitsToFloat(reinterpretedBits10.y) - 1.0;
    precise float reinterpretedBits31 = uintBitsToFloat(reinterpretedBits10.z) - 1.0;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    precise float multiplyAddValue162 = fma(reinterpretedBits11, reinterpretedBits29, 1.0) * varyingColor1.x;
    precise float multiplyAddValue163 = fma(reinterpretedBits11, reinterpretedBits30, 1.0) * varyingColor1.y;
    precise float multiplyAddValue164 = fma(reinterpretedBits11, reinterpretedBits31, 1.0) * varyingColor1.z;
    precise float productValue98 = varyingColor1.w * 1.0;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue165 = fma(productValue98, fma(multiplyAddValue162, varyingColor0.x, -multiplyAddValue162), multiplyAddValue162) * uintBitsToFloat(reinterpretedBits12.x);
    precise float multiplyAddValue166 = fma(productValue98, fma(multiplyAddValue163, varyingColor0.y, -multiplyAddValue163), multiplyAddValue163) * uintBitsToFloat(reinterpretedBits12.y);
    precise float multiplyAddValue167 = fma(productValue98, fma(multiplyAddValue164, varyingColor0.z, -multiplyAddValue164), multiplyAddValue164) * uintBitsToFloat(reinterpretedBits12.z);
    precise float productValue223 = multiplyAddValue165 * varyingColor0.w;
    precise float productValue224 = multiplyAddValue166 * varyingColor0.w;
    precise float productValue225 = multiplyAddValue167 * varyingColor0.w;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits21 = varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits22 = varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits23 = varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z);
    precise float reinterpretedBits24 = varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w);
    precise float productValue226 = multiplyAddValue162 * reinterpretedBits21;
    precise float productValue227 = multiplyAddValue163 * reinterpretedBits22;
    precise float productValue228 = multiplyAddValue164 * reinterpretedBits23;
    precise float productValue229 = productValue98 * reinterpretedBits24;
    float comparisonValue55 = reinterpretedBits ? productValue223 : productValue226;
    float comparisonValue56 = reinterpretedBits ? productValue224 : productValue227;
    float comparisonValue57 = reinterpretedBits ? productValue225 : productValue228;
    precise float reinterpretedBits67 = (reinterpretedBits ? 1.0 : productValue229) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.w = reinterpretedBits67;
    precise float sumValue53 = varyingColor2.x - comparisonValue55;
    precise float sumValue54 = varyingColor2.y - comparisonValue56;
    precise float sumValue55 = varyingColor2.z - comparisonValue57;
    fragmentColor0.x = fma(varyingColor2.w, sumValue53, comparisonValue55);
    fragmentColor0.y = fma(varyingColor2.w, sumValue54, comparisonValue56);
    fragmentColor0.z = fma(varyingColor2.w, sumValue55, comparisonValue57);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        precise float reinterpretedBits46 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x);
        precise float reinterpretedBits47 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y);
        precise float reinterpretedBits48 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z);
        float scalarValue20 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits46, reinterpretedBits47, reinterpretedBits48));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        precise float reinterpretedBits49 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38;
        precise float sumValue43 = scalarValue20 - reinterpretedBits38;
        precise float quotientValue9 = 1.0 / reinterpretedBits49;
        precise float productValue175 = quotientValue9 * sumValue43;
        float scalarValue21 = spvNClamp(productValue175, 0.0, 1.0);
        precise float productValue176 = scalarValue21 * scalarValue21;
        precise float multiplyAddValue125 = productValue176 * fma(scalarValue21, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        precise float multiplyAddValue126 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x);
        precise float multiplyAddValue127 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        precise float quotientValue10 = multiplyAddValue126 / reinterpretedBits41;
        precise float quotientValue11 = multiplyAddValue127 / reinterpretedBits41;
        precise float productValue177 = floor(quotientValue10) * reinterpretedBits41;
        precise float productValue178 = floor(quotientValue11) * reinterpretedBits41;
        precise float productValue179 = productValue177 * 0.25;
        precise float productValue180 = productValue178 * 0.25;
        precise float productValue181 = productValue177 * 0.5;
        precise float productValue182 = productValue178 * 0.5;
        float scalarValue22 = floor(productValue180);
        float scalarValue23 = floor(productValue182);
        precise float productValue183 = scalarValue22 * scalarValue22;
        precise float productValue184 = scalarValue23 * scalarValue23;
        precise float productValue185 = productValue183 * 0.75;
        precise float productValue186 = productValue184 * 0.75;
        float scalarValue24 = floor(productValue178);
        precise float productValue187 = scalarValue24 * scalarValue24;
        precise float productValue188 = productValue187 * 0.75;
        precise float multiplyAddValue128 = fma(fma(fma(fract(fma(floor(productValue179), 0.5, productValue185)), 0.25, fract(fma(floor(productValue181), 0.5, productValue186))), 0.25, fract(fma(floor(productValue177), 0.5, productValue188))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && (multiplyAddValue128 >= multiplyAddValue125)) || (scalarValue3 <= 0.0))
        {
            isFragmentDiscarded = true;
        }
    }
    precise float productValue58 = scalarValue * varyingColor0.x;
    precise float productValue59 = scalarValue * varyingColor0.y;
    precise float productValue60 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue129 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.x), -productValue58), productValue58);
    float multiplyAddValue130 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.y), -productValue59), productValue59);
    float multiplyAddValue131 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.z), -productValue60), productValue60);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits50 = uintBitsToFloat(reinterpretedBits43.x) - multiplyAddValue129;
    precise float reinterpretedBits51 = uintBitsToFloat(reinterpretedBits43.y) - multiplyAddValue130;
    precise float reinterpretedBits52 = uintBitsToFloat(reinterpretedBits43.z) - multiplyAddValue131;
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    precise float multiplyAddValue168 = fma(reinterpretedBits44, reinterpretedBits50, multiplyAddValue129) * varyingColor1.x;
    precise float multiplyAddValue169 = fma(reinterpretedBits44, reinterpretedBits51, multiplyAddValue130) * varyingColor1.y;
    precise float multiplyAddValue170 = fma(reinterpretedBits44, reinterpretedBits52, multiplyAddValue131) * varyingColor1.z;
    precise float productValue206 = scalarValue3 * varyingColor1.w;
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float multiplyAddValue171 = fma(productValue206, fma(multiplyAddValue168, varyingColor0.x, -multiplyAddValue168), multiplyAddValue168) * uintBitsToFloat(reinterpretedBits45.x);
    precise float multiplyAddValue172 = fma(productValue206, fma(multiplyAddValue169, varyingColor0.y, -multiplyAddValue169), multiplyAddValue169) * uintBitsToFloat(reinterpretedBits45.y);
    precise float multiplyAddValue173 = fma(productValue206, fma(multiplyAddValue170, varyingColor0.z, -multiplyAddValue170), multiplyAddValue170) * uintBitsToFloat(reinterpretedBits45.z);
    precise float productValue230 = multiplyAddValue171 * varyingColor0.w;
    precise float productValue231 = multiplyAddValue172 * varyingColor0.w;
    precise float productValue232 = multiplyAddValue173 * varyingColor0.w;
    float comparisonValue58 = reinterpretedBits36 ? productValue230 : multiplyAddValue168;
    float comparisonValue59 = reinterpretedBits36 ? productValue231 : multiplyAddValue169;
    float comparisonValue60 = reinterpretedBits36 ? productValue232 : multiplyAddValue170;
    precise float reinterpretedBits68 = (reinterpretedBits36 ? 1.0 : productValue206) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.w = reinterpretedBits68;
    precise float sumValue56 = varyingColor2.x - comparisonValue58;
    precise float sumValue57 = varyingColor2.y - comparisonValue59;
    precise float sumValue58 = varyingColor2.z - comparisonValue60;
    fragmentColor0.x = fma(varyingColor2.w, sumValue56, comparisonValue58);
    fragmentColor0.y = fma(varyingColor2.w, sumValue57, comparisonValue59);
    fragmentColor0.z = fma(varyingColor2.w, sumValue58, comparisonValue60);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        precise float reinterpretedBits46 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x);
        precise float reinterpretedBits47 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y);
        precise float reinterpretedBits48 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z);
        float scalarValue20 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits46, reinterpretedBits47, reinterpretedBits48));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        precise float reinterpretedBits49 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38;
        precise float sumValue43 = scalarValue20 - reinterpretedBits38;
        precise float quotientValue9 = 1.0 / reinterpretedBits49;
        precise float productValue175 = quotientValue9 * sumValue43;
        float scalarValue21 = spvNClamp(productValue175, 0.0, 1.0);
        precise float productValue176 = scalarValue21 * scalarValue21;
        precise float multiplyAddValue125 = productValue176 * fma(scalarValue21, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        precise float multiplyAddValue126 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x);
        precise float multiplyAddValue127 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        precise float quotientValue10 = multiplyAddValue126 / reinterpretedBits41;
        precise float quotientValue11 = multiplyAddValue127 / reinterpretedBits41;
        precise float productValue177 = floor(quotientValue10) * reinterpretedBits41;
        precise float productValue178 = floor(quotientValue11) * reinterpretedBits41;
        precise float productValue179 = productValue177 * 0.25;
        precise float productValue180 = productValue178 * 0.25;
        precise float productValue181 = productValue177 * 0.5;
        precise float productValue182 = productValue178 * 0.5;
        float scalarValue22 = floor(productValue180);
        float scalarValue23 = floor(productValue182);
        precise float productValue183 = scalarValue22 * scalarValue22;
        precise float productValue184 = scalarValue23 * scalarValue23;
        precise float productValue185 = productValue183 * 0.75;
        precise float productValue186 = productValue184 * 0.75;
        float scalarValue24 = floor(productValue178);
        precise float productValue187 = scalarValue24 * scalarValue24;
        precise float productValue188 = productValue187 * 0.75;
        precise float multiplyAddValue128 = fma(fma(fma(fract(fma(floor(productValue179), 0.5, productValue185)), 0.25, fract(fma(floor(productValue181), 0.5, productValue186))), 0.25, fract(fma(floor(productValue177), 0.5, productValue188))), 64.0, 0.5) * 0.015625;
        if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && (multiplyAddValue128 >= multiplyAddValue125))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits42.y);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits42.z);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits43.x) - reinterpretedBits54;
    precise float reinterpretedBits58 = uintBitsToFloat(reinterpretedBits43.y) - reinterpretedBits55;
    precise float reinterpretedBits59 = uintBitsToFloat(reinterpretedBits43.z) - reinterpretedBits56;
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    precise float multiplyAddValue180 = fma(reinterpretedBits44, reinterpretedBits57, reinterpretedBits54) * varyingColor1.x;
    precise float multiplyAddValue181 = fma(reinterpretedBits44, reinterpretedBits58, reinterpretedBits55) * varyingColor1.y;
    precise float multiplyAddValue182 = fma(reinterpretedBits44, reinterpretedBits59, reinterpretedBits56) * varyingColor1.z;
    precise float productValue98 = varyingColor1.w * 1.0;
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float multiplyAddValue183 = fma(productValue98, fma(multiplyAddValue180, varyingColor0.x, -multiplyAddValue180), multiplyAddValue180) * uintBitsToFloat(reinterpretedBits45.x);
    precise float multiplyAddValue184 = fma(productValue98, fma(multiplyAddValue181, varyingColor0.y, -multiplyAddValue181), multiplyAddValue181) * uintBitsToFloat(reinterpretedBits45.y);
    precise float multiplyAddValue185 = fma(productValue98, fma(multiplyAddValue182, varyingColor0.z, -multiplyAddValue182), multiplyAddValue182) * uintBitsToFloat(reinterpretedBits45.z);
    precise float productValue236 = multiplyAddValue183 * varyingColor0.w;
    precise float productValue237 = multiplyAddValue184 * varyingColor0.w;
    precise float productValue238 = multiplyAddValue185 * varyingColor0.w;
    float comparisonValue61 = reinterpretedBits36 ? productValue236 : multiplyAddValue180;
    float comparisonValue62 = reinterpretedBits36 ? productValue237 : multiplyAddValue181;
    float comparisonValue63 = reinterpretedBits36 ? productValue238 : multiplyAddValue182;
    precise float reinterpretedBits69 = (reinterpretedBits36 ? 1.0 : productValue98) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.w = reinterpretedBits69;
    precise float sumValue59 = varyingColor2.x - comparisonValue61;
    precise float sumValue60 = varyingColor2.y - comparisonValue62;
    precise float sumValue61 = varyingColor2.z - comparisonValue63;
    fragmentColor0.x = fma(varyingColor2.w, sumValue59, comparisonValue61);
    fragmentColor0.y = fma(varyingColor2.w, sumValue60, comparisonValue62);
    fragmentColor0.z = fma(varyingColor2.w, sumValue61, comparisonValue63);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        precise float reinterpretedBits14 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x);
        precise float reinterpretedBits15 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y);
        precise float reinterpretedBits16 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z);
        float scalarValue13 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        precise float reinterpretedBits49 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38;
        precise float sumValue62 = scalarValue13 - reinterpretedBits38;
        precise float quotientValue9 = 1.0 / reinterpretedBits49;
        precise float productValue239 = quotientValue9 * sumValue62;
        float scalarValue25 = spvNClamp(productValue239, 0.0, 1.0);
        precise float productValue240 = scalarValue25 * scalarValue25;
        precise float multiplyAddValue192 = productValue240 * fma(scalarValue25, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        precise float multiplyAddValue126 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x);
        precise float multiplyAddValue127 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        precise float quotientValue10 = multiplyAddValue126 / reinterpretedBits41;
        precise float quotientValue11 = multiplyAddValue127 / reinterpretedBits41;
        precise float productValue177 = floor(quotientValue10) * reinterpretedBits41;
        precise float productValue178 = floor(quotientValue11) * reinterpretedBits41;
        precise float productValue179 = productValue177 * 0.25;
        precise float productValue180 = productValue178 * 0.25;
        precise float productValue181 = productValue177 * 0.5;
        precise float productValue182 = productValue178 * 0.5;
        float scalarValue22 = floor(productValue180);
        float scalarValue23 = floor(productValue182);
        precise float productValue183 = scalarValue22 * scalarValue22;
        precise float productValue184 = scalarValue23 * scalarValue23;
        precise float productValue185 = productValue183 * 0.75;
        precise float productValue186 = productValue184 * 0.75;
        float scalarValue24 = floor(productValue178);
        precise float productValue187 = scalarValue24 * scalarValue24;
        precise float productValue188 = productValue187 * 0.75;
        precise float multiplyAddValue128 = fma(fma(fma(fract(fma(floor(productValue179), 0.5, productValue185)), 0.25, fract(fma(floor(productValue181), 0.5, productValue186))), 0.25, fract(fma(floor(productValue177), 0.5, productValue188))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && (multiplyAddValue128 >= multiplyAddValue192)) || (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]))))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits18 = uintBitsToFloat(reinterpretedBits10.x) - scalarValue;
    precise float reinterpretedBits19 = uintBitsToFloat(reinterpretedBits10.y) - scalarValue1;
    precise float reinterpretedBits20 = uintBitsToFloat(reinterpretedBits10.z) - scalarValue2;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue102 = fma(reinterpretedBits11, reinterpretedBits18, scalarValue);
    float multiplyAddValue103 = fma(reinterpretedBits11, reinterpretedBits19, scalarValue1);
    float multiplyAddValue104 = fma(reinterpretedBits11, reinterpretedBits20, scalarValue2);
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue105 = fma(scalarValue3, fma(multiplyAddValue102, varyingColor0.x, -multiplyAddValue102), multiplyAddValue102) * uintBitsToFloat(reinterpretedBits12.x);
    precise float multiplyAddValue106 = fma(scalarValue3, fma(multiplyAddValue103, varyingColor0.y, -multiplyAddValue103), multiplyAddValue103) * uintBitsToFloat(reinterpretedBits12.y);
    precise float multiplyAddValue107 = fma(scalarValue3, fma(multiplyAddValue104, varyingColor0.z, -multiplyAddValue104), multiplyAddValue104) * uintBitsToFloat(reinterpretedBits12.z);
    precise float productValue142 = multiplyAddValue105 * varyingColor0.w;
    precise float productValue143 = multiplyAddValue106 * varyingColor0.w;
    precise float productValue144 = multiplyAddValue107 * varyingColor0.w;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits21 = varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits22 = varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits23 = varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z);
    precise float reinterpretedBits24 = varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w);
    precise float productValue145 = multiplyAddValue102 * reinterpretedBits21;
    precise float productValue146 = multiplyAddValue103 * reinterpretedBits22;
    precise float productValue147 = multiplyAddValue104 * reinterpretedBits23;
    precise float productValue148 = scalarValue3 * reinterpretedBits24;
    float comparisonValue40 = reinterpretedBits ? productValue142 : productValue145;
    float comparisonValue41 = reinterpretedBits ? productValue143 : productValue146;
    float comparisonValue42 = reinterpretedBits ? productValue144 : productValue147;
    precise float reinterpretedBits25 = (reinterpretedBits ? 1.0 : productValue148) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.w = reinterpretedBits25;
    precise float sumValue37 = varyingColor2.x - comparisonValue40;
    precise float sumValue38 = varyingColor2.y - comparisonValue41;
    precise float sumValue39 = varyingColor2.z - comparisonValue42;
    fragmentColor0.x = fma(varyingColor2.w, sumValue37, comparisonValue40);
    fragmentColor0.y = fma(varyingColor2.w, sumValue38, comparisonValue41);
    fragmentColor0.z = fma(varyingColor2.w, sumValue39, comparisonValue42);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        precise float reinterpretedBits14 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x);
        precise float reinterpretedBits15 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y);
        precise float reinterpretedBits16 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z);
        float scalarValue13 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        precise float reinterpretedBits49 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38;
        precise float sumValue62 = scalarValue13 - reinterpretedBits38;
        precise float quotientValue9 = 1.0 / reinterpretedBits49;
        precise float productValue239 = quotientValue9 * sumValue62;
        float scalarValue25 = spvNClamp(productValue239, 0.0, 1.0);
        precise float productValue240 = scalarValue25 * scalarValue25;
        precise float multiplyAddValue192 = productValue240 * fma(scalarValue25, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        precise float multiplyAddValue126 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x);
        precise float multiplyAddValue127 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        precise float quotientValue10 = multiplyAddValue126 / reinterpretedBits41;
        precise float quotientValue11 = multiplyAddValue127 / reinterpretedBits41;
        precise float productValue177 = floor(quotientValue10) * reinterpretedBits41;
        precise float productValue178 = floor(quotientValue11) * reinterpretedBits41;
        precise float productValue179 = productValue177 * 0.25;
        precise float productValue180 = productValue178 * 0.25;
        precise float productValue181 = productValue177 * 0.5;
        precise float productValue182 = productValue178 * 0.5;
        float scalarValue22 = floor(productValue180);
        float scalarValue23 = floor(productValue182);
        precise float productValue183 = scalarValue22 * scalarValue22;
        precise float productValue184 = scalarValue23 * scalarValue23;
        precise float productValue185 = productValue183 * 0.75;
        precise float productValue186 = productValue184 * 0.75;
        float scalarValue24 = floor(productValue178);
        precise float productValue187 = scalarValue24 * scalarValue24;
        precise float productValue188 = productValue187 * 0.75;
        precise float multiplyAddValue128 = fma(fma(fma(fract(fma(floor(productValue179), 0.5, productValue185)), 0.25, fract(fma(floor(productValue181), 0.5, productValue186))), 0.25, fract(fma(floor(productValue177), 0.5, productValue188))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && (multiplyAddValue128 >= multiplyAddValue192)) || (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits29 = uintBitsToFloat(reinterpretedBits10.x) - 1.0;
    precise float reinterpretedBits30 = uintBitsToFloat(reinterpretedBits10.y) - 1.0;
    precise float reinterpretedBits31 = uintBitsToFloat(reinterpretedBits10.z) - 1.0;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue111 = fma(reinterpretedBits11, reinterpretedBits29, 1.0);
    float multiplyAddValue112 = fma(reinterpretedBits11, reinterpretedBits30, 1.0);
    float multiplyAddValue113 = fma(reinterpretedBits11, reinterpretedBits31, 1.0);
    precise float productValue152 = multiplyAddValue111 * varyingColor0.x;
    precise float productValue153 = multiplyAddValue112 * varyingColor0.y;
    precise float productValue154 = multiplyAddValue113 * varyingColor0.z;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits32 = productValue152 * uintBitsToFloat(reinterpretedBits12.x);
    precise float reinterpretedBits33 = productValue153 * uintBitsToFloat(reinterpretedBits12.y);
    precise float reinterpretedBits34 = productValue154 * uintBitsToFloat(reinterpretedBits12.z);
    precise float productValue155 = reinterpretedBits32 * varyingColor0.w;
    precise float productValue156 = reinterpretedBits33 * varyingColor0.w;
    precise float productValue157 = reinterpretedBits34 * varyingColor0.w;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits21 = varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits22 = varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits23 = varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z);
    precise float reinterpretedBits24 = varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w);
    precise float productValue158 = multiplyAddValue111 * reinterpretedBits21;
    precise float productValue159 = multiplyAddValue112 * reinterpretedBits22;
    precise float productValue160 = multiplyAddValue113 * reinterpretedBits23;
    precise float productValue161 = reinterpretedBits24 * 1.0;
    float comparisonValue43 = reinterpretedBits ? productValue155 : productValue158;
    float comparisonValue44 = reinterpretedBits ? productValue156 : productValue159;
    float comparisonValue45 = reinterpretedBits ? productValue157 : productValue160;
    precise float reinterpretedBits35 = (reinterpretedBits ? 1.0 : productValue161) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.w = reinterpretedBits35;
    precise float sumValue40 = varyingColor2.x - comparisonValue43;
    precise float sumValue41 = varyingColor2.y - comparisonValue44;
    precise float sumValue42 = varyingColor2.z - comparisonValue45;
    fragmentColor0.x = fma(varyingColor2.w, sumValue40, comparisonValue43);
    fragmentColor0.y = fma(varyingColor2.w, sumValue41, comparisonValue44);
    fragmentColor0.z = fma(varyingColor2.w, sumValue42, comparisonValue45);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        precise float reinterpretedBits46 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x);
        precise float reinterpretedBits47 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y);
        precise float reinterpretedBits48 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z);
        float scalarValue20 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits46, reinterpretedBits47, reinterpretedBits48));
        float reinterpretedBits71 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
        precise float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[61u])) - reinterpretedBits71;
        precise float sumValue63 = scalarValue20 - reinterpretedBits71;
        precise float quotientValue14 = 1.0 / reinterpretedBits72;
        precise float productValue243 = quotientValue14 * sumValue63;
        float scalarValue27 = spvNClamp(productValue243, 0.0, 1.0);
        precise float productValue244 = scalarValue27 * scalarValue27;
        precise float multiplyAddValue193 = productValue244 * fma(scalarValue27, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits73 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
        precise float multiplyAddValue194 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.x);
        precise float multiplyAddValue195 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.y);
        float reinterpretedBits74 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[62u]));
        precise float quotientValue15 = multiplyAddValue194 / reinterpretedBits74;
        precise float quotientValue16 = multiplyAddValue195 / reinterpretedBits74;
        precise float productValue245 = floor(quotientValue15) * reinterpretedBits74;
        precise float productValue246 = floor(quotientValue16) * reinterpretedBits74;
        precise float productValue247 = productValue245 * 0.25;
        precise float productValue248 = productValue246 * 0.25;
        precise float productValue249 = productValue245 * 0.5;
        precise float productValue250 = productValue246 * 0.5;
        float scalarValue28 = floor(productValue248);
        float scalarValue29 = floor(productValue250);
        precise float productValue251 = scalarValue28 * scalarValue28;
        precise float productValue252 = scalarValue29 * scalarValue29;
        precise float productValue253 = productValue251 * 0.75;
        precise float productValue254 = productValue252 * 0.75;
        float scalarValue30 = floor(productValue246);
        precise float productValue255 = scalarValue30 * scalarValue30;
        precise float productValue256 = productValue255 * 0.75;
        precise float multiplyAddValue196 = fma(fma(fma(fract(fma(floor(productValue247), 0.5, productValue253)), 0.25, fract(fma(floor(productValue249), 0.5, productValue254))), 0.25, fract(fma(floor(productValue245), 0.5, productValue256))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u])) != 0.0) && (multiplyAddValue196 >= multiplyAddValue193)) || (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]))))
        {
            isFragmentDiscarded = true;
        }
    }
    precise float productValue58 = scalarValue * varyingColor0.x;
    precise float productValue59 = scalarValue * varyingColor0.y;
    precise float productValue60 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue129 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.x), -productValue58), productValue58);
    float multiplyAddValue130 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.y), -productValue59), productValue59);
    float multiplyAddValue131 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.z), -productValue60), productValue60);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits50 = uintBitsToFloat(reinterpretedBits43.x) - multiplyAddValue129;
    precise float reinterpretedBits51 = uintBitsToFloat(reinterpretedBits43.y) - multiplyAddValue130;
    precise float reinterpretedBits52 = uintBitsToFloat(reinterpretedBits43.z) - multiplyAddValue131;
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue132 = fma(reinterpretedBits44, reinterpretedBits50, multiplyAddValue129);
    float multiplyAddValue133 = fma(reinterpretedBits44, reinterpretedBits51, multiplyAddValue130);
    float multiplyAddValue134 = fma(reinterpretedBits44, reinterpretedBits52, multiplyAddValue131);
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float multiplyAddValue135 = fma(scalarValue3, fma(multiplyAddValue132, varyingColor0.x, -multiplyAddValue132), multiplyAddValue132) * uintBitsToFloat(reinterpretedBits45.x);
    precise float multiplyAddValue136 = fma(scalarValue3, fma(multiplyAddValue133, varyingColor0.y, -multiplyAddValue133), multiplyAddValue133) * uintBitsToFloat(reinterpretedBits45.y);
    precise float multiplyAddValue137 = fma(scalarValue3, fma(multiplyAddValue134, varyingColor0.z, -multiplyAddValue134), multiplyAddValue134) * uintBitsToFloat(reinterpretedBits45.z);
    precise float productValue189 = multiplyAddValue135 * varyingColor0.w;
    precise float productValue190 = multiplyAddValue136 * varyingColor0.w;
    precise float productValue191 = multiplyAddValue137 * varyingColor0.w;
    float comparisonValue46 = reinterpretedBits36 ? productValue189 : multiplyAddValue132;
    float comparisonValue47 = reinterpretedBits36 ? productValue190 : multiplyAddValue133;
    float comparisonValue48 = reinterpretedBits36 ? productValue191 : multiplyAddValue134;
    precise float reinterpretedBits53 = (reinterpretedBits36 ? 1.0 : scalarValue3) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.w = reinterpretedBits53;
    precise float sumValue44 = varyingColor2.x - comparisonValue46;
    precise float sumValue45 = varyingColor2.y - comparisonValue47;
    precise float sumValue46 = varyingColor2.z - comparisonValue48;
    fragmentColor0.x = fma(varyingColor2.w, sumValue44, comparisonValue46);
    fragmentColor0.y = fma(varyingColor2.w, sumValue45, comparisonValue47);
    fragmentColor0.z = fma(varyingColor2.w, sumValue46, comparisonValue48);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        precise float reinterpretedBits46 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x);
        precise float reinterpretedBits47 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y);
        precise float reinterpretedBits48 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z);
        float scalarValue20 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits46, reinterpretedBits47, reinterpretedBits48));
        float reinterpretedBits71 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
        precise float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[61u])) - reinterpretedBits71;
        precise float sumValue63 = scalarValue20 - reinterpretedBits71;
        precise float quotientValue14 = 1.0 / reinterpretedBits72;
        precise float productValue243 = quotientValue14 * sumValue63;
        float scalarValue27 = spvNClamp(productValue243, 0.0, 1.0);
        precise float productValue244 = scalarValue27 * scalarValue27;
        precise float multiplyAddValue193 = productValue244 * fma(scalarValue27, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits73 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
        precise float multiplyAddValue194 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.x);
        precise float multiplyAddValue195 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.y);
        float reinterpretedBits74 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[62u]));
        precise float quotientValue15 = multiplyAddValue194 / reinterpretedBits74;
        precise float quotientValue16 = multiplyAddValue195 / reinterpretedBits74;
        precise float productValue245 = floor(quotientValue15) * reinterpretedBits74;
        precise float productValue246 = floor(quotientValue16) * reinterpretedBits74;
        precise float productValue247 = productValue245 * 0.25;
        precise float productValue248 = productValue246 * 0.25;
        precise float productValue249 = productValue245 * 0.5;
        precise float productValue250 = productValue246 * 0.5;
        float scalarValue28 = floor(productValue248);
        float scalarValue29 = floor(productValue250);
        precise float productValue251 = scalarValue28 * scalarValue28;
        precise float productValue252 = scalarValue29 * scalarValue29;
        precise float productValue253 = productValue251 * 0.75;
        precise float productValue254 = productValue252 * 0.75;
        float scalarValue30 = floor(productValue246);
        precise float productValue255 = scalarValue30 * scalarValue30;
        precise float productValue256 = productValue255 * 0.75;
        precise float multiplyAddValue196 = fma(fma(fma(fract(fma(floor(productValue247), 0.5, productValue253)), 0.25, fract(fma(floor(productValue249), 0.5, productValue254))), 0.25, fract(fma(floor(productValue245), 0.5, productValue256))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u])) != 0.0) && (multiplyAddValue196 >= multiplyAddValue193)) || (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits42.y);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits42.z);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits43.x) - reinterpretedBits54;
    precise float reinterpretedBits58 = uintBitsToFloat(reinterpretedBits43.y) - reinterpretedBits55;
    precise float reinterpretedBits59 = uintBitsToFloat(reinterpretedBits43.z) - reinterpretedBits56;
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue138 = fma(reinterpretedBits44, reinterpretedBits57, reinterpretedBits54);
    float multiplyAddValue139 = fma(reinterpretedBits44, reinterpretedBits58, reinterpretedBits55);
    float multiplyAddValue140 = fma(reinterpretedBits44, reinterpretedBits59, reinterpretedBits56);
    precise float productValue192 = multiplyAddValue138 * varyingColor0.x;
    precise float productValue193 = multiplyAddValue139 * varyingColor0.y;
    precise float productValue194 = multiplyAddValue140 * varyingColor0.z;
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float reinterpretedBits60 = productValue192 * uintBitsToFloat(reinterpretedBits45.x);
    precise float reinterpretedBits61 = productValue193 * uintBitsToFloat(reinterpretedBits45.y);
    precise float reinterpretedBits62 = productValue194 * uintBitsToFloat(reinterpretedBits45.z);
    precise float productValue195 = reinterpretedBits60 * varyingColor0.w;
    precise float productValue196 = reinterpretedBits61 * varyingColor0.w;
    precise float productValue197 = reinterpretedBits62 * varyingColor0.w;
    float comparisonValue49 = reinterpretedBits36 ? productValue195 : multiplyAddValue138;
    float comparisonValue50 = reinterpretedBits36 ? productValue196 : multiplyAddValue139;
    float comparisonValue51 = reinterpretedBits36 ? productValue197 : multiplyAddValue140;
    precise float sumValue47 = varyingColor2.x - comparisonValue49;
    precise float sumValue48 = varyingColor2.y - comparisonValue50;
    precise float sumValue49 = varyingColor2.z - comparisonValue51;
    fragmentColor0.x = fma(varyingColor2.w, sumValue47, comparisonValue49);
    fragmentColor0.y = fma(varyingColor2.w, sumValue48, comparisonValue50);
    fragmentColor0.z = fma(varyingColor2.w, sumValue49, comparisonValue51);
    fragmentColor0.w = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        precise float reinterpretedBits14 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x);
        precise float reinterpretedBits15 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y);
        precise float reinterpretedBits16 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z);
        float scalarValue13 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        precise float reinterpretedBits49 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38;
        precise float sumValue62 = scalarValue13 - reinterpretedBits38;
        precise float quotientValue9 = 1.0 / reinterpretedBits49;
        precise float productValue239 = quotientValue9 * sumValue62;
        float scalarValue25 = spvNClamp(productValue239, 0.0, 1.0);
        precise float productValue240 = scalarValue25 * scalarValue25;
        precise float multiplyAddValue192 = productValue240 * fma(scalarValue25, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        precise float multiplyAddValue126 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x);
        precise float multiplyAddValue127 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        precise float quotientValue10 = multiplyAddValue126 / reinterpretedBits41;
        precise float quotientValue11 = multiplyAddValue127 / reinterpretedBits41;
        precise float productValue177 = floor(quotientValue10) * reinterpretedBits41;
        precise float productValue178 = floor(quotientValue11) * reinterpretedBits41;
        precise float productValue179 = productValue177 * 0.25;
        precise float productValue180 = productValue178 * 0.25;
        precise float productValue181 = productValue177 * 0.5;
        precise float productValue182 = productValue178 * 0.5;
        float scalarValue22 = floor(productValue180);
        float scalarValue23 = floor(productValue182);
        precise float productValue183 = scalarValue22 * scalarValue22;
        precise float productValue184 = scalarValue23 * scalarValue23;
        precise float productValue185 = productValue183 * 0.75;
        precise float productValue186 = productValue184 * 0.75;
        float scalarValue24 = floor(productValue178);
        precise float productValue187 = scalarValue24 * scalarValue24;
        precise float productValue188 = productValue187 * 0.75;
        precise float multiplyAddValue128 = fma(fma(fma(fract(fma(floor(productValue179), 0.5, productValue185)), 0.25, fract(fma(floor(productValue181), 0.5, productValue186))), 0.25, fract(fma(floor(productValue177), 0.5, productValue188))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && (multiplyAddValue128 >= multiplyAddValue192)) || (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]))))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits18 = uintBitsToFloat(reinterpretedBits10.x) - scalarValue;
    precise float reinterpretedBits19 = uintBitsToFloat(reinterpretedBits10.y) - scalarValue1;
    precise float reinterpretedBits20 = uintBitsToFloat(reinterpretedBits10.z) - scalarValue2;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    precise float multiplyAddValue150 = fma(reinterpretedBits11, reinterpretedBits18, scalarValue) * varyingColor1.x;
    precise float multiplyAddValue151 = fma(reinterpretedBits11, reinterpretedBits19, scalarValue1) * varyingColor1.y;
    precise float multiplyAddValue152 = fma(reinterpretedBits11, reinterpretedBits20, scalarValue2) * varyingColor1.z;
    precise float productValue206 = scalarValue3 * varyingColor1.w;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue153 = fma(productValue206, fma(multiplyAddValue150, varyingColor0.x, -multiplyAddValue150), multiplyAddValue150) * uintBitsToFloat(reinterpretedBits12.x);
    precise float multiplyAddValue154 = fma(productValue206, fma(multiplyAddValue151, varyingColor0.y, -multiplyAddValue151), multiplyAddValue151) * uintBitsToFloat(reinterpretedBits12.y);
    precise float multiplyAddValue155 = fma(productValue206, fma(multiplyAddValue152, varyingColor0.z, -multiplyAddValue152), multiplyAddValue152) * uintBitsToFloat(reinterpretedBits12.z);
    precise float productValue207 = multiplyAddValue153 * varyingColor0.w;
    precise float productValue208 = multiplyAddValue154 * varyingColor0.w;
    precise float productValue209 = multiplyAddValue155 * varyingColor0.w;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits21 = varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits22 = varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits23 = varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z);
    precise float reinterpretedBits24 = varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w);
    precise float productValue210 = multiplyAddValue150 * reinterpretedBits21;
    precise float productValue211 = multiplyAddValue151 * reinterpretedBits22;
    precise float productValue212 = multiplyAddValue152 * reinterpretedBits23;
    precise float productValue213 = productValue206 * reinterpretedBits24;
    float comparisonValue52 = reinterpretedBits ? productValue207 : productValue210;
    float comparisonValue53 = reinterpretedBits ? productValue208 : productValue211;
    float comparisonValue54 = reinterpretedBits ? productValue209 : productValue212;
    precise float reinterpretedBits66 = (reinterpretedBits ? 1.0 : productValue213) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.w = reinterpretedBits66;
    precise float sumValue50 = varyingColor2.x - comparisonValue52;
    precise float sumValue51 = varyingColor2.y - comparisonValue53;
    precise float sumValue52 = varyingColor2.z - comparisonValue54;
    fragmentColor0.x = fma(varyingColor2.w, sumValue50, comparisonValue52);
    fragmentColor0.y = fma(varyingColor2.w, sumValue51, comparisonValue53);
    fragmentColor0.z = fma(varyingColor2.w, sumValue52, comparisonValue54);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        precise float reinterpretedBits14 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x);
        precise float reinterpretedBits15 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y);
        precise float reinterpretedBits16 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z);
        float scalarValue13 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits14, reinterpretedBits15, reinterpretedBits16));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        precise float reinterpretedBits49 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38;
        precise float sumValue62 = scalarValue13 - reinterpretedBits38;
        precise float quotientValue9 = 1.0 / reinterpretedBits49;
        precise float productValue239 = quotientValue9 * sumValue62;
        float scalarValue25 = spvNClamp(productValue239, 0.0, 1.0);
        precise float productValue240 = scalarValue25 * scalarValue25;
        precise float multiplyAddValue192 = productValue240 * fma(scalarValue25, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        precise float multiplyAddValue126 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x);
        precise float multiplyAddValue127 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        precise float quotientValue10 = multiplyAddValue126 / reinterpretedBits41;
        precise float quotientValue11 = multiplyAddValue127 / reinterpretedBits41;
        precise float productValue177 = floor(quotientValue10) * reinterpretedBits41;
        precise float productValue178 = floor(quotientValue11) * reinterpretedBits41;
        precise float productValue179 = productValue177 * 0.25;
        precise float productValue180 = productValue178 * 0.25;
        precise float productValue181 = productValue177 * 0.5;
        precise float productValue182 = productValue178 * 0.5;
        float scalarValue22 = floor(productValue180);
        float scalarValue23 = floor(productValue182);
        precise float productValue183 = scalarValue22 * scalarValue22;
        precise float productValue184 = scalarValue23 * scalarValue23;
        precise float productValue185 = productValue183 * 0.75;
        precise float productValue186 = productValue184 * 0.75;
        float scalarValue24 = floor(productValue178);
        precise float productValue187 = scalarValue24 * scalarValue24;
        precise float productValue188 = productValue187 * 0.75;
        precise float multiplyAddValue128 = fma(fma(fma(fract(fma(floor(productValue179), 0.5, productValue185)), 0.25, fract(fma(floor(productValue181), 0.5, productValue186))), 0.25, fract(fma(floor(productValue177), 0.5, productValue188))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && (multiplyAddValue128 >= multiplyAddValue192)) || (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    precise float reinterpretedBits29 = uintBitsToFloat(reinterpretedBits10.x) - 1.0;
    precise float reinterpretedBits30 = uintBitsToFloat(reinterpretedBits10.y) - 1.0;
    precise float reinterpretedBits31 = uintBitsToFloat(reinterpretedBits10.z) - 1.0;
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    precise float multiplyAddValue162 = fma(reinterpretedBits11, reinterpretedBits29, 1.0) * varyingColor1.x;
    precise float multiplyAddValue163 = fma(reinterpretedBits11, reinterpretedBits30, 1.0) * varyingColor1.y;
    precise float multiplyAddValue164 = fma(reinterpretedBits11, reinterpretedBits31, 1.0) * varyingColor1.z;
    precise float productValue98 = varyingColor1.w * 1.0;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float multiplyAddValue165 = fma(productValue98, fma(multiplyAddValue162, varyingColor0.x, -multiplyAddValue162), multiplyAddValue162) * uintBitsToFloat(reinterpretedBits12.x);
    precise float multiplyAddValue166 = fma(productValue98, fma(multiplyAddValue163, varyingColor0.y, -multiplyAddValue163), multiplyAddValue163) * uintBitsToFloat(reinterpretedBits12.y);
    precise float multiplyAddValue167 = fma(productValue98, fma(multiplyAddValue164, varyingColor0.z, -multiplyAddValue164), multiplyAddValue164) * uintBitsToFloat(reinterpretedBits12.z);
    precise float productValue223 = multiplyAddValue165 * varyingColor0.w;
    precise float productValue224 = multiplyAddValue166 * varyingColor0.w;
    precise float productValue225 = multiplyAddValue167 * varyingColor0.w;
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    precise float reinterpretedBits21 = varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x);
    precise float reinterpretedBits22 = varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y);
    precise float reinterpretedBits23 = varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z);
    precise float reinterpretedBits24 = varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w);
    precise float productValue226 = multiplyAddValue162 * reinterpretedBits21;
    precise float productValue227 = multiplyAddValue163 * reinterpretedBits22;
    precise float productValue228 = multiplyAddValue164 * reinterpretedBits23;
    precise float productValue229 = productValue98 * reinterpretedBits24;
    float comparisonValue55 = reinterpretedBits ? productValue223 : productValue226;
    float comparisonValue56 = reinterpretedBits ? productValue224 : productValue227;
    float comparisonValue57 = reinterpretedBits ? productValue225 : productValue228;
    precise float reinterpretedBits67 = (reinterpretedBits ? 1.0 : productValue229) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.w = reinterpretedBits67;
    precise float sumValue53 = varyingColor2.x - comparisonValue55;
    precise float sumValue54 = varyingColor2.y - comparisonValue56;
    precise float sumValue55 = varyingColor2.z - comparisonValue57;
    fragmentColor0.x = fma(varyingColor2.w, sumValue53, comparisonValue55);
    fragmentColor0.y = fma(varyingColor2.w, sumValue54, comparisonValue56);
    fragmentColor0.z = fma(varyingColor2.w, sumValue55, comparisonValue57);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        precise float reinterpretedBits46 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x);
        precise float reinterpretedBits47 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y);
        precise float reinterpretedBits48 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z);
        float scalarValue20 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits46, reinterpretedBits47, reinterpretedBits48));
        float reinterpretedBits71 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
        precise float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[61u])) - reinterpretedBits71;
        precise float sumValue63 = scalarValue20 - reinterpretedBits71;
        precise float quotientValue14 = 1.0 / reinterpretedBits72;
        precise float productValue243 = quotientValue14 * sumValue63;
        float scalarValue27 = spvNClamp(productValue243, 0.0, 1.0);
        precise float productValue244 = scalarValue27 * scalarValue27;
        precise float multiplyAddValue193 = productValue244 * fma(scalarValue27, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits73 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
        precise float multiplyAddValue194 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.x);
        precise float multiplyAddValue195 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.y);
        float reinterpretedBits74 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[62u]));
        precise float quotientValue15 = multiplyAddValue194 / reinterpretedBits74;
        precise float quotientValue16 = multiplyAddValue195 / reinterpretedBits74;
        precise float productValue245 = floor(quotientValue15) * reinterpretedBits74;
        precise float productValue246 = floor(quotientValue16) * reinterpretedBits74;
        precise float productValue247 = productValue245 * 0.25;
        precise float productValue248 = productValue246 * 0.25;
        precise float productValue249 = productValue245 * 0.5;
        precise float productValue250 = productValue246 * 0.5;
        float scalarValue28 = floor(productValue248);
        float scalarValue29 = floor(productValue250);
        precise float productValue251 = scalarValue28 * scalarValue28;
        precise float productValue252 = scalarValue29 * scalarValue29;
        precise float productValue253 = productValue251 * 0.75;
        precise float productValue254 = productValue252 * 0.75;
        float scalarValue30 = floor(productValue246);
        precise float productValue255 = scalarValue30 * scalarValue30;
        precise float productValue256 = productValue255 * 0.75;
        precise float multiplyAddValue196 = fma(fma(fma(fract(fma(floor(productValue247), 0.5, productValue253)), 0.25, fract(fma(floor(productValue249), 0.5, productValue254))), 0.25, fract(fma(floor(productValue245), 0.5, productValue256))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u])) != 0.0) && (multiplyAddValue196 >= multiplyAddValue193)) || (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]))))
        {
            isFragmentDiscarded = true;
        }
    }
    precise float productValue58 = scalarValue * varyingColor0.x;
    precise float productValue59 = scalarValue * varyingColor0.y;
    precise float productValue60 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue129 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.x), -productValue58), productValue58);
    float multiplyAddValue130 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.y), -productValue59), productValue59);
    float multiplyAddValue131 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.z), -productValue60), productValue60);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits50 = uintBitsToFloat(reinterpretedBits43.x) - multiplyAddValue129;
    precise float reinterpretedBits51 = uintBitsToFloat(reinterpretedBits43.y) - multiplyAddValue130;
    precise float reinterpretedBits52 = uintBitsToFloat(reinterpretedBits43.z) - multiplyAddValue131;
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    precise float multiplyAddValue168 = fma(reinterpretedBits44, reinterpretedBits50, multiplyAddValue129) * varyingColor1.x;
    precise float multiplyAddValue169 = fma(reinterpretedBits44, reinterpretedBits51, multiplyAddValue130) * varyingColor1.y;
    precise float multiplyAddValue170 = fma(reinterpretedBits44, reinterpretedBits52, multiplyAddValue131) * varyingColor1.z;
    precise float productValue206 = scalarValue3 * varyingColor1.w;
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float multiplyAddValue171 = fma(productValue206, fma(multiplyAddValue168, varyingColor0.x, -multiplyAddValue168), multiplyAddValue168) * uintBitsToFloat(reinterpretedBits45.x);
    precise float multiplyAddValue172 = fma(productValue206, fma(multiplyAddValue169, varyingColor0.y, -multiplyAddValue169), multiplyAddValue169) * uintBitsToFloat(reinterpretedBits45.y);
    precise float multiplyAddValue173 = fma(productValue206, fma(multiplyAddValue170, varyingColor0.z, -multiplyAddValue170), multiplyAddValue170) * uintBitsToFloat(reinterpretedBits45.z);
    precise float productValue230 = multiplyAddValue171 * varyingColor0.w;
    precise float productValue231 = multiplyAddValue172 * varyingColor0.w;
    precise float productValue232 = multiplyAddValue173 * varyingColor0.w;
    float comparisonValue58 = reinterpretedBits36 ? productValue230 : multiplyAddValue168;
    float comparisonValue59 = reinterpretedBits36 ? productValue231 : multiplyAddValue169;
    float comparisonValue60 = reinterpretedBits36 ? productValue232 : multiplyAddValue170;
    precise float reinterpretedBits68 = (reinterpretedBits36 ? 1.0 : productValue206) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.w = reinterpretedBits68;
    precise float sumValue56 = varyingColor2.x - comparisonValue58;
    precise float sumValue57 = varyingColor2.y - comparisonValue59;
    precise float sumValue58 = varyingColor2.z - comparisonValue60;
    fragmentColor0.x = fma(varyingColor2.w, sumValue56, comparisonValue58);
    fragmentColor0.y = fma(varyingColor2.w, sumValue57, comparisonValue59);
    fragmentColor0.z = fma(varyingColor2.w, sumValue58, comparisonValue60);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM40)
    isFragmentDiscarded = false;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        precise float productValue125 = inverseLengthValue1 * reinterpretedBits1;
        precise float productValue126 = inverseLengthValue1 * reinterpretedBits2;
        precise float productValue127 = inverseLengthValue1 * reinterpretedBits3;
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        precise float reinterpretedBits46 = varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x);
        precise float reinterpretedBits47 = varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y);
        precise float reinterpretedBits48 = varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z);
        float scalarValue20 = rdDot3Precise(vec3(-productValue125, -productValue126, -productValue127), vec3(reinterpretedBits46, reinterpretedBits47, reinterpretedBits48));
        float reinterpretedBits71 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
        precise float reinterpretedBits72 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[61u])) - reinterpretedBits71;
        precise float sumValue63 = scalarValue20 - reinterpretedBits71;
        precise float quotientValue14 = 1.0 / reinterpretedBits72;
        precise float productValue243 = quotientValue14 * sumValue63;
        float scalarValue27 = spvNClamp(productValue243, 0.0, 1.0);
        precise float productValue244 = scalarValue27 * scalarValue27;
        precise float multiplyAddValue193 = productValue244 * fma(scalarValue27, -2.0, 3.0);
        precise float quotientValue3 = varyingColor3.x / varyingColor3.w;
        precise float quotientValue4 = varyingColor3.y / varyingColor3.w;
        uvec4 reinterpretedBits73 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
        precise float multiplyAddValue194 = fma(quotientValue3, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.x);
        precise float multiplyAddValue195 = fma(quotientValue4, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.y);
        float reinterpretedBits74 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[62u]));
        precise float quotientValue15 = multiplyAddValue194 / reinterpretedBits74;
        precise float quotientValue16 = multiplyAddValue195 / reinterpretedBits74;
        precise float productValue245 = floor(quotientValue15) * reinterpretedBits74;
        precise float productValue246 = floor(quotientValue16) * reinterpretedBits74;
        precise float productValue247 = productValue245 * 0.25;
        precise float productValue248 = productValue246 * 0.25;
        precise float productValue249 = productValue245 * 0.5;
        precise float productValue250 = productValue246 * 0.5;
        float scalarValue28 = floor(productValue248);
        float scalarValue29 = floor(productValue250);
        precise float productValue251 = scalarValue28 * scalarValue28;
        precise float productValue252 = scalarValue29 * scalarValue29;
        precise float productValue253 = productValue251 * 0.75;
        precise float productValue254 = productValue252 * 0.75;
        float scalarValue30 = floor(productValue246);
        precise float productValue255 = scalarValue30 * scalarValue30;
        precise float productValue256 = productValue255 * 0.75;
        precise float multiplyAddValue196 = fma(fma(fma(fract(fma(floor(productValue247), 0.5, productValue253)), 0.25, fract(fma(floor(productValue249), 0.5, productValue254))), 0.25, fract(fma(floor(productValue245), 0.5, productValue256))), 64.0, 0.5) * 0.015625;
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u])) != 0.0) && (multiplyAddValue196 >= multiplyAddValue193)) || (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits42.y);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits42.z);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    precise float reinterpretedBits57 = uintBitsToFloat(reinterpretedBits43.x) - reinterpretedBits54;
    precise float reinterpretedBits58 = uintBitsToFloat(reinterpretedBits43.y) - reinterpretedBits55;
    precise float reinterpretedBits59 = uintBitsToFloat(reinterpretedBits43.z) - reinterpretedBits56;
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    precise float multiplyAddValue180 = fma(reinterpretedBits44, reinterpretedBits57, reinterpretedBits54) * varyingColor1.x;
    precise float multiplyAddValue181 = fma(reinterpretedBits44, reinterpretedBits58, reinterpretedBits55) * varyingColor1.y;
    precise float multiplyAddValue182 = fma(reinterpretedBits44, reinterpretedBits59, reinterpretedBits56) * varyingColor1.z;
    precise float productValue98 = varyingColor1.w * 1.0;
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    precise float multiplyAddValue183 = fma(productValue98, fma(multiplyAddValue180, varyingColor0.x, -multiplyAddValue180), multiplyAddValue180) * uintBitsToFloat(reinterpretedBits45.x);
    precise float multiplyAddValue184 = fma(productValue98, fma(multiplyAddValue181, varyingColor0.y, -multiplyAddValue181), multiplyAddValue181) * uintBitsToFloat(reinterpretedBits45.y);
    precise float multiplyAddValue185 = fma(productValue98, fma(multiplyAddValue182, varyingColor0.z, -multiplyAddValue182), multiplyAddValue182) * uintBitsToFloat(reinterpretedBits45.z);
    precise float productValue236 = multiplyAddValue183 * varyingColor0.w;
    precise float productValue237 = multiplyAddValue184 * varyingColor0.w;
    precise float productValue238 = multiplyAddValue185 * varyingColor0.w;
    float comparisonValue61 = reinterpretedBits36 ? productValue236 : multiplyAddValue180;
    float comparisonValue62 = reinterpretedBits36 ? productValue237 : multiplyAddValue181;
    float comparisonValue63 = reinterpretedBits36 ? productValue238 : multiplyAddValue182;
    precise float reinterpretedBits69 = (reinterpretedBits36 ? 1.0 : productValue98) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.w = reinterpretedBits69;
    precise float sumValue59 = varyingColor2.x - comparisonValue61;
    precise float sumValue60 = varyingColor2.y - comparisonValue62;
    precise float sumValue61 = varyingColor2.z - comparisonValue63;
    fragmentColor0.x = fma(varyingColor2.w, sumValue59, comparisonValue61);
    fragmentColor0.y = fma(varyingColor2.w, sumValue60, comparisonValue62);
    fragmentColor0.z = fma(varyingColor2.w, sumValue61, comparisonValue63);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - scalarValue, scalarValue);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - scalarValue1, scalarValue1);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - scalarValue2, scalarValue2);
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[8u] != 0.0;
    float multiplyAddValue3 = comparisonValue1 ? ((fma(scalarValue3, fma(multiplyAddValue, varyingColor0.x, -multiplyAddValue), multiplyAddValue) * fragmentVectorConstants1.packedValues[3u].x) * varyingColor0.w) : (multiplyAddValue * (varyingColor0.x * fragmentVectorConstants1.packedValues[3u].x));
    float multiplyAddValue4 = comparisonValue1 ? ((fma(scalarValue3, fma(multiplyAddValue1, varyingColor0.y, -multiplyAddValue1), multiplyAddValue1) * fragmentVectorConstants1.packedValues[3u].y) * varyingColor0.w) : (multiplyAddValue1 * (varyingColor0.y * fragmentVectorConstants1.packedValues[3u].y));
    float multiplyAddValue5 = comparisonValue1 ? ((fma(scalarValue3, fma(multiplyAddValue2, varyingColor0.z, -multiplyAddValue2), multiplyAddValue2) * fragmentVectorConstants1.packedValues[3u].z) * varyingColor0.w) : (multiplyAddValue2 * (varyingColor0.z * fragmentVectorConstants1.packedValues[3u].z));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue3, multiplyAddValue3);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue4, multiplyAddValue4);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue5, multiplyAddValue5);
    fragmentColor0.w = (comparisonValue1 ? 1.0 : (scalarValue3 * (varyingColor0.w * fragmentVectorConstants1.packedValues[3u].w))) * fragmentScalarConstants1.packedValues[4u];
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue12 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - 1.0, 1.0);
    float multiplyAddValue13 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - 1.0, 1.0);
    float multiplyAddValue14 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - 1.0, 1.0);
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[8u] != 0.0;
    float comparisonValue6 = comparisonValue1 ? (((multiplyAddValue12 * varyingColor0.x) * fragmentVectorConstants1.packedValues[3u].x) * varyingColor0.w) : (multiplyAddValue12 * (varyingColor0.x * fragmentVectorConstants1.packedValues[3u].x));
    float comparisonValue7 = comparisonValue1 ? (((multiplyAddValue13 * varyingColor0.y) * fragmentVectorConstants1.packedValues[3u].y) * varyingColor0.w) : (multiplyAddValue13 * (varyingColor0.y * fragmentVectorConstants1.packedValues[3u].y));
    float comparisonValue8 = comparisonValue1 ? (((multiplyAddValue14 * varyingColor0.z) * fragmentVectorConstants1.packedValues[3u].z) * varyingColor0.w) : (multiplyAddValue14 * (varyingColor0.z * fragmentVectorConstants1.packedValues[3u].z));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - comparisonValue6, comparisonValue6);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - comparisonValue7, comparisonValue7);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - comparisonValue8, comparisonValue8);
    fragmentColor0.w = (comparisonValue1 ? 1.0 : (varyingColor0.w * fragmentVectorConstants1.packedValues[3u].w)) * fragmentScalarConstants1.packedValues[4u];
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    float productValue52 = scalarValue * varyingColor0.x;
    float productValue53 = scalarValue * varyingColor0.y;
    float productValue54 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    float multiplyAddValue18 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].x, -productValue52), productValue52);
    float multiplyAddValue19 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].y, -productValue53), productValue53);
    float multiplyAddValue20 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].z, -productValue54), productValue54);
    float multiplyAddValue21 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue18, multiplyAddValue18);
    float multiplyAddValue22 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue19, multiplyAddValue19);
    float multiplyAddValue23 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue20, multiplyAddValue20);
    bool comparisonValue13 = fragmentScalarConstants1.packedValues[12u] != 0.0;
    float multiplyAddValue24 = comparisonValue13 ? ((fma(scalarValue3, fma(multiplyAddValue21, varyingColor0.x, -multiplyAddValue21), multiplyAddValue21) * fragmentVectorConstants1.packedValues[4u].x) * varyingColor0.w) : multiplyAddValue21;
    float multiplyAddValue25 = comparisonValue13 ? ((fma(scalarValue3, fma(multiplyAddValue22, varyingColor0.y, -multiplyAddValue22), multiplyAddValue22) * fragmentVectorConstants1.packedValues[4u].y) * varyingColor0.w) : multiplyAddValue22;
    float multiplyAddValue26 = comparisonValue13 ? ((fma(scalarValue3, fma(multiplyAddValue23, varyingColor0.z, -multiplyAddValue23), multiplyAddValue23) * fragmentVectorConstants1.packedValues[4u].z) * varyingColor0.w) : multiplyAddValue23;
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue24, multiplyAddValue24);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue25, multiplyAddValue25);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue26, multiplyAddValue26);
    fragmentColor0.w = (comparisonValue13 ? 1.0 : scalarValue3) * fragmentScalarConstants1.packedValues[8u];
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue36 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].x - fragmentVectorConstants1.packedValues[0u].x, fragmentVectorConstants1.packedValues[0u].x);
    float multiplyAddValue37 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].y - fragmentVectorConstants1.packedValues[0u].y, fragmentVectorConstants1.packedValues[0u].y);
    float multiplyAddValue38 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].z - fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[0u].z);
    bool comparisonValue13 = fragmentScalarConstants1.packedValues[12u] != 0.0;
    float comparisonValue18 = comparisonValue13 ? (((multiplyAddValue36 * varyingColor0.x) * fragmentVectorConstants1.packedValues[4u].x) * varyingColor0.w) : multiplyAddValue36;
    float comparisonValue19 = comparisonValue13 ? (((multiplyAddValue37 * varyingColor0.y) * fragmentVectorConstants1.packedValues[4u].y) * varyingColor0.w) : multiplyAddValue37;
    float comparisonValue20 = comparisonValue13 ? (((multiplyAddValue38 * varyingColor0.z) * fragmentVectorConstants1.packedValues[4u].z) * varyingColor0.w) : multiplyAddValue38;
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - comparisonValue18, comparisonValue18);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - comparisonValue19, comparisonValue19);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - comparisonValue20, comparisonValue20);
    fragmentColor0.w = fragmentScalarConstants1.packedValues[8u];
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float multiplyAddValue42 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - scalarValue, scalarValue) * varyingColor1.x;
    float multiplyAddValue43 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - scalarValue1, scalarValue1) * varyingColor1.y;
    float multiplyAddValue44 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - scalarValue2, scalarValue2) * varyingColor1.z;
    float productValue80 = sampledTextureValue.w * varyingColor1.w;
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[8u] != 0.0;
    float multiplyAddValue45 = comparisonValue1 ? ((fma(productValue80, fma(multiplyAddValue42, varyingColor0.x, -multiplyAddValue42), multiplyAddValue42) * fragmentVectorConstants1.packedValues[3u].x) * varyingColor0.w) : (multiplyAddValue42 * (varyingColor0.x * fragmentVectorConstants1.packedValues[3u].x));
    float multiplyAddValue46 = comparisonValue1 ? ((fma(productValue80, fma(multiplyAddValue43, varyingColor0.y, -multiplyAddValue43), multiplyAddValue43) * fragmentVectorConstants1.packedValues[3u].y) * varyingColor0.w) : (multiplyAddValue43 * (varyingColor0.y * fragmentVectorConstants1.packedValues[3u].y));
    float multiplyAddValue47 = comparisonValue1 ? ((fma(productValue80, fma(multiplyAddValue44, varyingColor0.z, -multiplyAddValue44), multiplyAddValue44) * fragmentVectorConstants1.packedValues[3u].z) * varyingColor0.w) : (multiplyAddValue44 * (varyingColor0.z * fragmentVectorConstants1.packedValues[3u].z));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue45, multiplyAddValue45);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue46, multiplyAddValue46);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue47, multiplyAddValue47);
    fragmentColor0.w = (comparisonValue1 ? 1.0 : (productValue80 * (varyingColor0.w * fragmentVectorConstants1.packedValues[3u].w))) * fragmentScalarConstants1.packedValues[4u];
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue54 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - 1.0, 1.0) * varyingColor1.x;
    float multiplyAddValue55 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - 1.0, 1.0) * varyingColor1.y;
    float multiplyAddValue56 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - 1.0, 1.0) * varyingColor1.z;
    bool comparisonValue1 = fragmentScalarConstants1.packedValues[8u] != 0.0;
    float multiplyAddValue57 = comparisonValue1 ? ((fma(varyingColor1.w, fma(multiplyAddValue54, varyingColor0.x, -multiplyAddValue54), multiplyAddValue54) * fragmentVectorConstants1.packedValues[3u].x) * varyingColor0.w) : (multiplyAddValue54 * (varyingColor0.x * fragmentVectorConstants1.packedValues[3u].x));
    float multiplyAddValue58 = comparisonValue1 ? ((fma(varyingColor1.w, fma(multiplyAddValue55, varyingColor0.y, -multiplyAddValue55), multiplyAddValue55) * fragmentVectorConstants1.packedValues[3u].y) * varyingColor0.w) : (multiplyAddValue55 * (varyingColor0.y * fragmentVectorConstants1.packedValues[3u].y));
    float multiplyAddValue59 = comparisonValue1 ? ((fma(varyingColor1.w, fma(multiplyAddValue56, varyingColor0.z, -multiplyAddValue56), multiplyAddValue56) * fragmentVectorConstants1.packedValues[3u].z) * varyingColor0.w) : (multiplyAddValue56 * (varyingColor0.z * fragmentVectorConstants1.packedValues[3u].z));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue57, multiplyAddValue57);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue58, multiplyAddValue58);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue59, multiplyAddValue59);
    fragmentColor0.w = (comparisonValue1 ? 1.0 : (varyingColor1.w * (varyingColor0.w * fragmentVectorConstants1.packedValues[3u].w))) * fragmentScalarConstants1.packedValues[4u];
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float productValue52 = scalarValue * varyingColor0.x;
    float productValue53 = scalarValue * varyingColor0.y;
    float productValue54 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    float multiplyAddValue18 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].x, -productValue52), productValue52);
    float multiplyAddValue19 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].y, -productValue53), productValue53);
    float multiplyAddValue20 = fma(scalarValue9, fma(scalarValue1, fragmentVectorConstants1.packedValues[0u].z, -productValue54), productValue54);
    float multiplyAddValue72 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].x - multiplyAddValue18, multiplyAddValue18) * varyingColor1.x;
    float multiplyAddValue73 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].y - multiplyAddValue19, multiplyAddValue19) * varyingColor1.y;
    float multiplyAddValue74 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].z - multiplyAddValue20, multiplyAddValue20) * varyingColor1.z;
    float productValue80 = sampledTextureValue.w * varyingColor1.w;
    bool comparisonValue13 = fragmentScalarConstants1.packedValues[12u] != 0.0;
    float multiplyAddValue75 = comparisonValue13 ? ((fma(productValue80, fma(multiplyAddValue72, varyingColor0.x, -multiplyAddValue72), multiplyAddValue72) * fragmentVectorConstants1.packedValues[4u].x) * varyingColor0.w) : multiplyAddValue72;
    float multiplyAddValue76 = comparisonValue13 ? ((fma(productValue80, fma(multiplyAddValue73, varyingColor0.y, -multiplyAddValue73), multiplyAddValue73) * fragmentVectorConstants1.packedValues[4u].y) * varyingColor0.w) : multiplyAddValue73;
    float multiplyAddValue77 = comparisonValue13 ? ((fma(productValue80, fma(multiplyAddValue74, varyingColor0.z, -multiplyAddValue74), multiplyAddValue74) * fragmentVectorConstants1.packedValues[4u].z) * varyingColor0.w) : multiplyAddValue74;
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue75, multiplyAddValue75);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue76, multiplyAddValue76);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue77, multiplyAddValue77);
    fragmentColor0.w = (comparisonValue13 ? 1.0 : productValue80) * fragmentScalarConstants1.packedValues[8u];
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue84 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].x - fragmentVectorConstants1.packedValues[0u].x, fragmentVectorConstants1.packedValues[0u].x) * varyingColor1.x;
    float multiplyAddValue85 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].y - fragmentVectorConstants1.packedValues[0u].y, fragmentVectorConstants1.packedValues[0u].y) * varyingColor1.y;
    float multiplyAddValue86 = fma(fragmentScalarConstants1.packedValues[7u], fragmentVectorConstants1.packedValues[1u].z - fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[0u].z) * varyingColor1.z;
    bool comparisonValue13 = fragmentScalarConstants1.packedValues[12u] != 0.0;
    float multiplyAddValue87 = comparisonValue13 ? ((fma(varyingColor1.w, fma(multiplyAddValue84, varyingColor0.x, -multiplyAddValue84), multiplyAddValue84) * fragmentVectorConstants1.packedValues[4u].x) * varyingColor0.w) : multiplyAddValue84;
    float multiplyAddValue88 = comparisonValue13 ? ((fma(varyingColor1.w, fma(multiplyAddValue85, varyingColor0.y, -multiplyAddValue85), multiplyAddValue85) * fragmentVectorConstants1.packedValues[4u].y) * varyingColor0.w) : multiplyAddValue85;
    float multiplyAddValue89 = comparisonValue13 ? ((fma(varyingColor1.w, fma(multiplyAddValue86, varyingColor0.z, -multiplyAddValue86), multiplyAddValue86) * fragmentVectorConstants1.packedValues[4u].z) * varyingColor0.w) : multiplyAddValue86;
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue87, multiplyAddValue87);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue88, multiplyAddValue88);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue89, multiplyAddValue89);
    fragmentColor0.w = (comparisonValue13 ? 1.0 : varyingColor1.w) * fragmentScalarConstants1.packedValues[8u];
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        float reinterpretedBits5 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z)));
        float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
        float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[53u])) - reinterpretedBits6)) * (reinterpretedBits5 - reinterpretedBits6), 0.0, 1.0);
        uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
        float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[54u]));
        float multiplyAddValue90 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.x)) / reinterpretedBits9) * reinterpretedBits9;
        float multiplyAddValue91 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.y)) / reinterpretedBits9) * reinterpretedBits9;
        float productValue123 = floor(multiplyAddValue91 * 0.25);
        float productValue124 = floor(multiplyAddValue91 * 0.5);
        float scalarValue12 = floor(multiplyAddValue91);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue90 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue90 * 0.5), 0.5, (productValue124 * productValue124) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue90), 0.5, (scalarValue12 * scalarValue12) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0)))) || (scalarValue3 <= 0.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue92 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - scalarValue, scalarValue);
    float multiplyAddValue93 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - scalarValue1, scalarValue1);
    float multiplyAddValue94 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - scalarValue2, scalarValue2);
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue95 = reinterpretedBits ? ((fma(scalarValue3, fma(multiplyAddValue92, varyingColor0.x, -multiplyAddValue92), multiplyAddValue92) * uintBitsToFloat(reinterpretedBits12.x)) * varyingColor0.w) : (multiplyAddValue92 * (varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x)));
    float multiplyAddValue96 = reinterpretedBits ? ((fma(scalarValue3, fma(multiplyAddValue93, varyingColor0.y, -multiplyAddValue93), multiplyAddValue93) * uintBitsToFloat(reinterpretedBits12.y)) * varyingColor0.w) : (multiplyAddValue93 * (varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y)));
    float multiplyAddValue97 = reinterpretedBits ? ((fma(scalarValue3, fma(multiplyAddValue94, varyingColor0.z, -multiplyAddValue94), multiplyAddValue94) * uintBitsToFloat(reinterpretedBits12.z)) * varyingColor0.w) : (multiplyAddValue94 * (varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z)));
    fragmentColor0.w = (reinterpretedBits ? 1.0 : (scalarValue3 * (varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w)))) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue95, multiplyAddValue95);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue96, multiplyAddValue96);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue97, multiplyAddValue97);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        float reinterpretedBits5 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z)));
        float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
        float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[53u])) - reinterpretedBits6)) * (reinterpretedBits5 - reinterpretedBits6), 0.0, 1.0);
        uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
        float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[54u]));
        float multiplyAddValue90 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.x)) / reinterpretedBits9) * reinterpretedBits9;
        float multiplyAddValue91 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.y)) / reinterpretedBits9) * reinterpretedBits9;
        float productValue123 = floor(multiplyAddValue91 * 0.25);
        float productValue124 = floor(multiplyAddValue91 * 0.5);
        float scalarValue12 = floor(multiplyAddValue91);
        if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue90 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue90 * 0.5), 0.5, (productValue124 * productValue124) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue90), 0.5, (scalarValue12 * scalarValue12) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0))))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue108 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - 1.0, 1.0);
    float multiplyAddValue109 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - 1.0, 1.0);
    float multiplyAddValue110 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - 1.0, 1.0);
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float reinterpretedBits26 = reinterpretedBits ? (((multiplyAddValue108 * varyingColor0.x) * uintBitsToFloat(reinterpretedBits12.x)) * varyingColor0.w) : (multiplyAddValue108 * (varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x)));
    float reinterpretedBits27 = reinterpretedBits ? (((multiplyAddValue109 * varyingColor0.y) * uintBitsToFloat(reinterpretedBits12.y)) * varyingColor0.w) : (multiplyAddValue109 * (varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y)));
    float reinterpretedBits28 = reinterpretedBits ? (((multiplyAddValue110 * varyingColor0.z) * uintBitsToFloat(reinterpretedBits12.z)) * varyingColor0.w) : (multiplyAddValue110 * (varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z)));
    fragmentColor0.w = (reinterpretedBits ? 1.0 : (varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w))) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - reinterpretedBits26, reinterpretedBits26);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - reinterpretedBits27, reinterpretedBits27);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - reinterpretedBits28, reinterpretedBits28);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        float reinterpretedBits37 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z)));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        float reinterpretedBits39 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38)) * (reinterpretedBits37 - reinterpretedBits38), 0.0, 1.0);
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        float multiplyAddValue114 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x)) / reinterpretedBits41) * reinterpretedBits41;
        float multiplyAddValue115 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y)) / reinterpretedBits41) * reinterpretedBits41;
        float productValue170 = floor(multiplyAddValue115 * 0.25);
        float productValue171 = floor(multiplyAddValue115 * 0.5);
        float scalarValue19 = floor(multiplyAddValue115);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue114 * 0.25), 0.5, (productValue170 * productValue170) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue114 * 0.5), 0.5, (productValue171 * productValue171) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue114), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits39 * reinterpretedBits39) * fma(reinterpretedBits39, -2.0, 3.0)))) || (scalarValue3 <= 0.0))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue52 = scalarValue * varyingColor0.x;
    float productValue53 = scalarValue * varyingColor0.y;
    float productValue54 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue116 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.x), -productValue52), productValue52);
    float multiplyAddValue117 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.y), -productValue53), productValue53);
    float multiplyAddValue118 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.z), -productValue54), productValue54);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue119 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.x) - multiplyAddValue116, multiplyAddValue116);
    float multiplyAddValue120 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.y) - multiplyAddValue117, multiplyAddValue117);
    float multiplyAddValue121 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.z) - multiplyAddValue118, multiplyAddValue118);
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue122 = reinterpretedBits36 ? ((fma(scalarValue3, fma(multiplyAddValue119, varyingColor0.x, -multiplyAddValue119), multiplyAddValue119) * uintBitsToFloat(reinterpretedBits45.x)) * varyingColor0.w) : multiplyAddValue119;
    float multiplyAddValue123 = reinterpretedBits36 ? ((fma(scalarValue3, fma(multiplyAddValue120, varyingColor0.y, -multiplyAddValue120), multiplyAddValue120) * uintBitsToFloat(reinterpretedBits45.y)) * varyingColor0.w) : multiplyAddValue120;
    float multiplyAddValue124 = reinterpretedBits36 ? ((fma(scalarValue3, fma(multiplyAddValue121, varyingColor0.z, -multiplyAddValue121), multiplyAddValue121) * uintBitsToFloat(reinterpretedBits45.z)) * varyingColor0.w) : multiplyAddValue121;
    fragmentColor0.w = (reinterpretedBits36 ? 1.0 : scalarValue3) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue122, multiplyAddValue122);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue123, multiplyAddValue123);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue124, multiplyAddValue124);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        float reinterpretedBits37 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z)));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        float reinterpretedBits39 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38)) * (reinterpretedBits37 - reinterpretedBits38), 0.0, 1.0);
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        float multiplyAddValue114 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x)) / reinterpretedBits41) * reinterpretedBits41;
        float multiplyAddValue115 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y)) / reinterpretedBits41) * reinterpretedBits41;
        float productValue170 = floor(multiplyAddValue115 * 0.25);
        float productValue171 = floor(multiplyAddValue115 * 0.5);
        float scalarValue19 = floor(multiplyAddValue115);
        if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue114 * 0.25), 0.5, (productValue170 * productValue170) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue114 * 0.5), 0.5, (productValue171 * productValue171) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue114), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits39 * reinterpretedBits39) * fma(reinterpretedBits39, -2.0, 3.0))))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits42.y);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits42.z);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue141 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.x) - reinterpretedBits54, reinterpretedBits54);
    float multiplyAddValue142 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.y) - reinterpretedBits55, reinterpretedBits55);
    float multiplyAddValue143 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.z) - reinterpretedBits56, reinterpretedBits56);
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float reinterpretedBits63 = reinterpretedBits36 ? (((multiplyAddValue141 * varyingColor0.x) * uintBitsToFloat(reinterpretedBits45.x)) * varyingColor0.w) : multiplyAddValue141;
    float reinterpretedBits64 = reinterpretedBits36 ? (((multiplyAddValue142 * varyingColor0.y) * uintBitsToFloat(reinterpretedBits45.y)) * varyingColor0.w) : multiplyAddValue142;
    float reinterpretedBits65 = reinterpretedBits36 ? (((multiplyAddValue143 * varyingColor0.z) * uintBitsToFloat(reinterpretedBits45.z)) * varyingColor0.w) : multiplyAddValue143;
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - reinterpretedBits63, reinterpretedBits63);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - reinterpretedBits64, reinterpretedBits64);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - reinterpretedBits65, reinterpretedBits65);
    fragmentColor0.w = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        float reinterpretedBits5 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z)));
        float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
        float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[53u])) - reinterpretedBits6)) * (reinterpretedBits5 - reinterpretedBits6), 0.0, 1.0);
        uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
        float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[54u]));
        float multiplyAddValue90 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.x)) / reinterpretedBits9) * reinterpretedBits9;
        float multiplyAddValue91 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.y)) / reinterpretedBits9) * reinterpretedBits9;
        float productValue123 = floor(multiplyAddValue91 * 0.25);
        float productValue124 = floor(multiplyAddValue91 * 0.5);
        float scalarValue12 = floor(multiplyAddValue91);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue90 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue90 * 0.5), 0.5, (productValue124 * productValue124) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue90), 0.5, (scalarValue12 * scalarValue12) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0)))) || (scalarValue3 <= 0.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue144 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - scalarValue, scalarValue) * varyingColor1.x;
    float multiplyAddValue145 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - scalarValue1, scalarValue1) * varyingColor1.y;
    float multiplyAddValue146 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - scalarValue2, scalarValue2) * varyingColor1.z;
    float productValue205 = scalarValue3 * varyingColor1.w;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue147 = reinterpretedBits ? ((fma(productValue205, fma(multiplyAddValue144, varyingColor0.x, -multiplyAddValue144), multiplyAddValue144) * uintBitsToFloat(reinterpretedBits12.x)) * varyingColor0.w) : (multiplyAddValue144 * (varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x)));
    float multiplyAddValue148 = reinterpretedBits ? ((fma(productValue205, fma(multiplyAddValue145, varyingColor0.y, -multiplyAddValue145), multiplyAddValue145) * uintBitsToFloat(reinterpretedBits12.y)) * varyingColor0.w) : (multiplyAddValue145 * (varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y)));
    float multiplyAddValue149 = reinterpretedBits ? ((fma(productValue205, fma(multiplyAddValue146, varyingColor0.z, -multiplyAddValue146), multiplyAddValue146) * uintBitsToFloat(reinterpretedBits12.z)) * varyingColor0.w) : (multiplyAddValue146 * (varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z)));
    fragmentColor0.w = (reinterpretedBits ? 1.0 : (productValue205 * (varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w)))) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue147, multiplyAddValue147);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue148, multiplyAddValue148);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue149, multiplyAddValue149);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        float reinterpretedBits5 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z)));
        float reinterpretedBits6 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]));
        float reinterpretedBits7 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[53u])) - reinterpretedBits6)) * (reinterpretedBits5 - reinterpretedBits6), 0.0, 1.0);
        uvec4 reinterpretedBits8 = floatBitsToUint(fragmentVectorConstants1.packedValues[15u]);
        float reinterpretedBits9 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[54u]));
        float multiplyAddValue90 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.x)) / reinterpretedBits9) * reinterpretedBits9;
        float multiplyAddValue91 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits8.y)) / reinterpretedBits9) * reinterpretedBits9;
        float productValue123 = floor(multiplyAddValue91 * 0.25);
        float productValue124 = floor(multiplyAddValue91 * 0.5);
        float scalarValue12 = floor(multiplyAddValue91);
        if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[64u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue90 * 0.25), 0.5, (productValue123 * productValue123) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue90 * 0.5), 0.5, (productValue124 * productValue124) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue90), 0.5, (scalarValue12 * scalarValue12) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits7 * reinterpretedBits7) * fma(reinterpretedBits7, -2.0, 3.0))))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue156 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - 1.0, 1.0) * varyingColor1.x;
    float multiplyAddValue157 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - 1.0, 1.0) * varyingColor1.y;
    float multiplyAddValue158 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - 1.0, 1.0) * varyingColor1.z;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue159 = reinterpretedBits ? ((fma(varyingColor1.w, fma(multiplyAddValue156, varyingColor0.x, -multiplyAddValue156), multiplyAddValue156) * uintBitsToFloat(reinterpretedBits12.x)) * varyingColor0.w) : (multiplyAddValue156 * (varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x)));
    float multiplyAddValue160 = reinterpretedBits ? ((fma(varyingColor1.w, fma(multiplyAddValue157, varyingColor0.y, -multiplyAddValue157), multiplyAddValue157) * uintBitsToFloat(reinterpretedBits12.y)) * varyingColor0.w) : (multiplyAddValue157 * (varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y)));
    float multiplyAddValue161 = reinterpretedBits ? ((fma(varyingColor1.w, fma(multiplyAddValue158, varyingColor0.z, -multiplyAddValue158), multiplyAddValue158) * uintBitsToFloat(reinterpretedBits12.z)) * varyingColor0.w) : (multiplyAddValue158 * (varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z)));
    fragmentColor0.w = (reinterpretedBits ? 1.0 : (varyingColor1.w * (varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w)))) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue159, multiplyAddValue159);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue160, multiplyAddValue160);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue161, multiplyAddValue161);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        float reinterpretedBits37 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z)));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        float reinterpretedBits39 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38)) * (reinterpretedBits37 - reinterpretedBits38), 0.0, 1.0);
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        float multiplyAddValue114 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x)) / reinterpretedBits41) * reinterpretedBits41;
        float multiplyAddValue115 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y)) / reinterpretedBits41) * reinterpretedBits41;
        float productValue170 = floor(multiplyAddValue115 * 0.25);
        float productValue171 = floor(multiplyAddValue115 * 0.5);
        float scalarValue19 = floor(multiplyAddValue115);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue114 * 0.25), 0.5, (productValue170 * productValue170) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue114 * 0.5), 0.5, (productValue171 * productValue171) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue114), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits39 * reinterpretedBits39) * fma(reinterpretedBits39, -2.0, 3.0)))) || (scalarValue3 <= 0.0))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue52 = scalarValue * varyingColor0.x;
    float productValue53 = scalarValue * varyingColor0.y;
    float productValue54 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue116 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.x), -productValue52), productValue52);
    float multiplyAddValue117 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.y), -productValue53), productValue53);
    float multiplyAddValue118 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.z), -productValue54), productValue54);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue174 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.x) - multiplyAddValue116, multiplyAddValue116) * varyingColor1.x;
    float multiplyAddValue175 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.y) - multiplyAddValue117, multiplyAddValue117) * varyingColor1.y;
    float multiplyAddValue176 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.z) - multiplyAddValue118, multiplyAddValue118) * varyingColor1.z;
    float productValue205 = scalarValue3 * varyingColor1.w;
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue177 = reinterpretedBits36 ? ((fma(productValue205, fma(multiplyAddValue174, varyingColor0.x, -multiplyAddValue174), multiplyAddValue174) * uintBitsToFloat(reinterpretedBits45.x)) * varyingColor0.w) : multiplyAddValue174;
    float multiplyAddValue178 = reinterpretedBits36 ? ((fma(productValue205, fma(multiplyAddValue175, varyingColor0.y, -multiplyAddValue175), multiplyAddValue175) * uintBitsToFloat(reinterpretedBits45.y)) * varyingColor0.w) : multiplyAddValue175;
    float multiplyAddValue179 = reinterpretedBits36 ? ((fma(productValue205, fma(multiplyAddValue176, varyingColor0.z, -multiplyAddValue176), multiplyAddValue176) * uintBitsToFloat(reinterpretedBits45.z)) * varyingColor0.w) : multiplyAddValue176;
    fragmentColor0.w = (reinterpretedBits36 ? 1.0 : productValue205) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue177, multiplyAddValue177);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue178, multiplyAddValue178);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue179, multiplyAddValue179);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        float reinterpretedBits37 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z)));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        float reinterpretedBits39 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38)) * (reinterpretedBits37 - reinterpretedBits38), 0.0, 1.0);
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        float multiplyAddValue114 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x)) / reinterpretedBits41) * reinterpretedBits41;
        float multiplyAddValue115 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y)) / reinterpretedBits41) * reinterpretedBits41;
        float productValue170 = floor(multiplyAddValue115 * 0.25);
        float productValue171 = floor(multiplyAddValue115 * 0.5);
        float scalarValue19 = floor(multiplyAddValue115);
        if ((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue114 * 0.25), 0.5, (productValue170 * productValue170) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue114 * 0.5), 0.5, (productValue171 * productValue171) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue114), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits39 * reinterpretedBits39) * fma(reinterpretedBits39, -2.0, 3.0))))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits42.y);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits42.z);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue186 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.x) - reinterpretedBits54, reinterpretedBits54) * varyingColor1.x;
    float multiplyAddValue187 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.y) - reinterpretedBits55, reinterpretedBits55) * varyingColor1.y;
    float multiplyAddValue188 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.z) - reinterpretedBits56, reinterpretedBits56) * varyingColor1.z;
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue189 = reinterpretedBits36 ? ((fma(varyingColor1.w, fma(multiplyAddValue186, varyingColor0.x, -multiplyAddValue186), multiplyAddValue186) * uintBitsToFloat(reinterpretedBits45.x)) * varyingColor0.w) : multiplyAddValue186;
    float multiplyAddValue190 = reinterpretedBits36 ? ((fma(varyingColor1.w, fma(multiplyAddValue187, varyingColor0.y, -multiplyAddValue187), multiplyAddValue187) * uintBitsToFloat(reinterpretedBits45.y)) * varyingColor0.w) : multiplyAddValue187;
    float multiplyAddValue191 = reinterpretedBits36 ? ((fma(varyingColor1.w, fma(multiplyAddValue188, varyingColor0.z, -multiplyAddValue188), multiplyAddValue188) * uintBitsToFloat(reinterpretedBits45.z)) * varyingColor0.w) : multiplyAddValue188;
    fragmentColor0.w = (reinterpretedBits36 ? 1.0 : varyingColor1.w) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue189, multiplyAddValue189);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue190, multiplyAddValue190);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue191, multiplyAddValue191);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        float reinterpretedBits5 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z)));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        float reinterpretedBits70 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38)) * (reinterpretedBits5 - reinterpretedBits38), 0.0, 1.0);
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        float multiplyAddValue114 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x)) / reinterpretedBits41) * reinterpretedBits41;
        float multiplyAddValue115 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y)) / reinterpretedBits41) * reinterpretedBits41;
        float productValue170 = floor(multiplyAddValue115 * 0.25);
        float productValue171 = floor(multiplyAddValue115 * 0.5);
        float scalarValue19 = floor(multiplyAddValue115);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue114 * 0.25), 0.5, (productValue170 * productValue170) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue114 * 0.5), 0.5, (productValue171 * productValue171) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue114), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits70 * reinterpretedBits70) * fma(reinterpretedBits70, -2.0, 3.0)))) || (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]))))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue92 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - scalarValue, scalarValue);
    float multiplyAddValue93 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - scalarValue1, scalarValue1);
    float multiplyAddValue94 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - scalarValue2, scalarValue2);
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue95 = reinterpretedBits ? ((fma(scalarValue3, fma(multiplyAddValue92, varyingColor0.x, -multiplyAddValue92), multiplyAddValue92) * uintBitsToFloat(reinterpretedBits12.x)) * varyingColor0.w) : (multiplyAddValue92 * (varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x)));
    float multiplyAddValue96 = reinterpretedBits ? ((fma(scalarValue3, fma(multiplyAddValue93, varyingColor0.y, -multiplyAddValue93), multiplyAddValue93) * uintBitsToFloat(reinterpretedBits12.y)) * varyingColor0.w) : (multiplyAddValue93 * (varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y)));
    float multiplyAddValue97 = reinterpretedBits ? ((fma(scalarValue3, fma(multiplyAddValue94, varyingColor0.z, -multiplyAddValue94), multiplyAddValue94) * uintBitsToFloat(reinterpretedBits12.z)) * varyingColor0.w) : (multiplyAddValue94 * (varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z)));
    fragmentColor0.w = (reinterpretedBits ? 1.0 : (scalarValue3 * (varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w)))) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue95, multiplyAddValue95);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue96, multiplyAddValue96);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue97, multiplyAddValue97);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        float reinterpretedBits5 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z)));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        float reinterpretedBits70 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38)) * (reinterpretedBits5 - reinterpretedBits38), 0.0, 1.0);
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        float multiplyAddValue114 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x)) / reinterpretedBits41) * reinterpretedBits41;
        float multiplyAddValue115 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y)) / reinterpretedBits41) * reinterpretedBits41;
        float productValue170 = floor(multiplyAddValue115 * 0.25);
        float productValue171 = floor(multiplyAddValue115 * 0.5);
        float scalarValue19 = floor(multiplyAddValue115);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue114 * 0.25), 0.5, (productValue170 * productValue170) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue114 * 0.5), 0.5, (productValue171 * productValue171) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue114), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits70 * reinterpretedBits70) * fma(reinterpretedBits70, -2.0, 3.0)))) || (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue108 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - 1.0, 1.0);
    float multiplyAddValue109 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - 1.0, 1.0);
    float multiplyAddValue110 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - 1.0, 1.0);
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float reinterpretedBits26 = reinterpretedBits ? (((multiplyAddValue108 * varyingColor0.x) * uintBitsToFloat(reinterpretedBits12.x)) * varyingColor0.w) : (multiplyAddValue108 * (varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x)));
    float reinterpretedBits27 = reinterpretedBits ? (((multiplyAddValue109 * varyingColor0.y) * uintBitsToFloat(reinterpretedBits12.y)) * varyingColor0.w) : (multiplyAddValue109 * (varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y)));
    float reinterpretedBits28 = reinterpretedBits ? (((multiplyAddValue110 * varyingColor0.z) * uintBitsToFloat(reinterpretedBits12.z)) * varyingColor0.w) : (multiplyAddValue110 * (varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z)));
    fragmentColor0.w = (reinterpretedBits ? 1.0 : (varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w))) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - reinterpretedBits26, reinterpretedBits26);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - reinterpretedBits27, reinterpretedBits27);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - reinterpretedBits28, reinterpretedBits28);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        float reinterpretedBits37 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z)));
        float reinterpretedBits71 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
        float reinterpretedBits75 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[61u])) - reinterpretedBits71)) * (reinterpretedBits37 - reinterpretedBits71), 0.0, 1.0);
        uvec4 reinterpretedBits73 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
        float reinterpretedBits74 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[62u]));
        float multiplyAddValue197 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.x)) / reinterpretedBits74) * reinterpretedBits74;
        float multiplyAddValue198 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.y)) / reinterpretedBits74) * reinterpretedBits74;
        float productValue257 = floor(multiplyAddValue198 * 0.25);
        float productValue258 = floor(multiplyAddValue198 * 0.5);
        float scalarValue31 = floor(multiplyAddValue198);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue197 * 0.25), 0.5, (productValue257 * productValue257) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue197 * 0.5), 0.5, (productValue258 * productValue258) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue197), 0.5, (scalarValue31 * scalarValue31) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits75 * reinterpretedBits75) * fma(reinterpretedBits75, -2.0, 3.0)))) || (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]))))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue52 = scalarValue * varyingColor0.x;
    float productValue53 = scalarValue * varyingColor0.y;
    float productValue54 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue116 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.x), -productValue52), productValue52);
    float multiplyAddValue117 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.y), -productValue53), productValue53);
    float multiplyAddValue118 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.z), -productValue54), productValue54);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue119 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.x) - multiplyAddValue116, multiplyAddValue116);
    float multiplyAddValue120 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.y) - multiplyAddValue117, multiplyAddValue117);
    float multiplyAddValue121 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.z) - multiplyAddValue118, multiplyAddValue118);
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue122 = reinterpretedBits36 ? ((fma(scalarValue3, fma(multiplyAddValue119, varyingColor0.x, -multiplyAddValue119), multiplyAddValue119) * uintBitsToFloat(reinterpretedBits45.x)) * varyingColor0.w) : multiplyAddValue119;
    float multiplyAddValue123 = reinterpretedBits36 ? ((fma(scalarValue3, fma(multiplyAddValue120, varyingColor0.y, -multiplyAddValue120), multiplyAddValue120) * uintBitsToFloat(reinterpretedBits45.y)) * varyingColor0.w) : multiplyAddValue120;
    float multiplyAddValue124 = reinterpretedBits36 ? ((fma(scalarValue3, fma(multiplyAddValue121, varyingColor0.z, -multiplyAddValue121), multiplyAddValue121) * uintBitsToFloat(reinterpretedBits45.z)) * varyingColor0.w) : multiplyAddValue121;
    fragmentColor0.w = (reinterpretedBits36 ? 1.0 : scalarValue3) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue122, multiplyAddValue122);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue123, multiplyAddValue123);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue124, multiplyAddValue124);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        float reinterpretedBits37 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z)));
        float reinterpretedBits71 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
        float reinterpretedBits75 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[61u])) - reinterpretedBits71)) * (reinterpretedBits37 - reinterpretedBits71), 0.0, 1.0);
        uvec4 reinterpretedBits73 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
        float reinterpretedBits74 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[62u]));
        float multiplyAddValue197 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.x)) / reinterpretedBits74) * reinterpretedBits74;
        float multiplyAddValue198 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.y)) / reinterpretedBits74) * reinterpretedBits74;
        float productValue257 = floor(multiplyAddValue198 * 0.25);
        float productValue258 = floor(multiplyAddValue198 * 0.5);
        float scalarValue31 = floor(multiplyAddValue198);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue197 * 0.25), 0.5, (productValue257 * productValue257) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue197 * 0.5), 0.5, (productValue258 * productValue258) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue197), 0.5, (scalarValue31 * scalarValue31) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits75 * reinterpretedBits75) * fma(reinterpretedBits75, -2.0, 3.0)))) || (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits42.y);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits42.z);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue141 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.x) - reinterpretedBits54, reinterpretedBits54);
    float multiplyAddValue142 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.y) - reinterpretedBits55, reinterpretedBits55);
    float multiplyAddValue143 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.z) - reinterpretedBits56, reinterpretedBits56);
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float reinterpretedBits63 = reinterpretedBits36 ? (((multiplyAddValue141 * varyingColor0.x) * uintBitsToFloat(reinterpretedBits45.x)) * varyingColor0.w) : multiplyAddValue141;
    float reinterpretedBits64 = reinterpretedBits36 ? (((multiplyAddValue142 * varyingColor0.y) * uintBitsToFloat(reinterpretedBits45.y)) * varyingColor0.w) : multiplyAddValue142;
    float reinterpretedBits65 = reinterpretedBits36 ? (((multiplyAddValue143 * varyingColor0.z) * uintBitsToFloat(reinterpretedBits45.z)) * varyingColor0.w) : multiplyAddValue143;
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - reinterpretedBits63, reinterpretedBits63);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - reinterpretedBits64, reinterpretedBits64);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - reinterpretedBits65, reinterpretedBits65);
    fragmentColor0.w = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue2 = sampledTextureValue.z;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        float reinterpretedBits5 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z)));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        float reinterpretedBits70 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38)) * (reinterpretedBits5 - reinterpretedBits38), 0.0, 1.0);
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        float multiplyAddValue114 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x)) / reinterpretedBits41) * reinterpretedBits41;
        float multiplyAddValue115 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y)) / reinterpretedBits41) * reinterpretedBits41;
        float productValue170 = floor(multiplyAddValue115 * 0.25);
        float productValue171 = floor(multiplyAddValue115 * 0.5);
        float scalarValue19 = floor(multiplyAddValue115);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue114 * 0.25), 0.5, (productValue170 * productValue170) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue114 * 0.5), 0.5, (productValue171 * productValue171) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue114), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits70 * reinterpretedBits70) * fma(reinterpretedBits70, -2.0, 3.0)))) || (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u]))))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue144 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - scalarValue, scalarValue) * varyingColor1.x;
    float multiplyAddValue145 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - scalarValue1, scalarValue1) * varyingColor1.y;
    float multiplyAddValue146 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - scalarValue2, scalarValue2) * varyingColor1.z;
    float productValue205 = scalarValue3 * varyingColor1.w;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue147 = reinterpretedBits ? ((fma(productValue205, fma(multiplyAddValue144, varyingColor0.x, -multiplyAddValue144), multiplyAddValue144) * uintBitsToFloat(reinterpretedBits12.x)) * varyingColor0.w) : (multiplyAddValue144 * (varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x)));
    float multiplyAddValue148 = reinterpretedBits ? ((fma(productValue205, fma(multiplyAddValue145, varyingColor0.y, -multiplyAddValue145), multiplyAddValue145) * uintBitsToFloat(reinterpretedBits12.y)) * varyingColor0.w) : (multiplyAddValue145 * (varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y)));
    float multiplyAddValue149 = reinterpretedBits ? ((fma(productValue205, fma(multiplyAddValue146, varyingColor0.z, -multiplyAddValue146), multiplyAddValue146) * uintBitsToFloat(reinterpretedBits12.z)) * varyingColor0.w) : (multiplyAddValue146 * (varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z)));
    fragmentColor0.w = (reinterpretedBits ? 1.0 : (productValue205 * (varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w)))) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue147, multiplyAddValue147);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue148, multiplyAddValue148);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue149, multiplyAddValue149);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    bool reinterpretedBits = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u])) != 0.0;
    if (!reinterpretedBits)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits4 = floatBitsToUint(fragmentVectorConstants1.packedValues[7u]);
        float reinterpretedBits5 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits4.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits4.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits4.z)));
        float reinterpretedBits38 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[56u]));
        float reinterpretedBits70 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[57u])) - reinterpretedBits38)) * (reinterpretedBits5 - reinterpretedBits38), 0.0, 1.0);
        uvec4 reinterpretedBits40 = floatBitsToUint(fragmentVectorConstants1.packedValues[16u]);
        float reinterpretedBits41 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[58u]));
        float multiplyAddValue114 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.x)) / reinterpretedBits41) * reinterpretedBits41;
        float multiplyAddValue115 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits40.y)) / reinterpretedBits41) * reinterpretedBits41;
        float productValue170 = floor(multiplyAddValue115 * 0.25);
        float productValue171 = floor(multiplyAddValue115 * 0.5);
        float scalarValue19 = floor(multiplyAddValue115);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[68u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue114 * 0.25), 0.5, (productValue170 * productValue170) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue114 * 0.5), 0.5, (productValue171 * productValue171) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue114), 0.5, (scalarValue19 * scalarValue19) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits70 * reinterpretedBits70) * fma(reinterpretedBits70, -2.0, 3.0)))) || (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[48u])) > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
    float reinterpretedBits11 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[35u]));
    float multiplyAddValue156 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.x) - 1.0, 1.0) * varyingColor1.x;
    float multiplyAddValue157 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.y) - 1.0, 1.0) * varyingColor1.y;
    float multiplyAddValue158 = fma(reinterpretedBits11, uintBitsToFloat(reinterpretedBits10.z) - 1.0, 1.0) * varyingColor1.z;
    uvec4 reinterpretedBits12 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    uvec4 reinterpretedBits13 = floatBitsToUint(fragmentVectorConstants1.packedValues[11u]);
    float multiplyAddValue159 = reinterpretedBits ? ((fma(varyingColor1.w, fma(multiplyAddValue156, varyingColor0.x, -multiplyAddValue156), multiplyAddValue156) * uintBitsToFloat(reinterpretedBits12.x)) * varyingColor0.w) : (multiplyAddValue156 * (varyingColor0.x * uintBitsToFloat(reinterpretedBits13.x)));
    float multiplyAddValue160 = reinterpretedBits ? ((fma(varyingColor1.w, fma(multiplyAddValue157, varyingColor0.y, -multiplyAddValue157), multiplyAddValue157) * uintBitsToFloat(reinterpretedBits12.y)) * varyingColor0.w) : (multiplyAddValue157 * (varyingColor0.y * uintBitsToFloat(reinterpretedBits13.y)));
    float multiplyAddValue161 = reinterpretedBits ? ((fma(varyingColor1.w, fma(multiplyAddValue158, varyingColor0.z, -multiplyAddValue158), multiplyAddValue158) * uintBitsToFloat(reinterpretedBits12.z)) * varyingColor0.w) : (multiplyAddValue158 * (varyingColor0.z * uintBitsToFloat(reinterpretedBits13.z)));
    fragmentColor0.w = (reinterpretedBits ? 1.0 : (varyingColor1.w * (varyingColor0.w * uintBitsToFloat(reinterpretedBits13.w)))) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[36u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue159, multiplyAddValue159);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue160, multiplyAddValue160);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue161, multiplyAddValue161);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue = texture(sampler2D(materialTexture0, textureSampler0), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue = sampledTextureValue.x;
    float scalarValue1 = sampledTextureValue.y;
    float scalarValue3 = sampledTextureValue.w;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        float reinterpretedBits37 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z)));
        float reinterpretedBits71 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
        float reinterpretedBits75 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[61u])) - reinterpretedBits71)) * (reinterpretedBits37 - reinterpretedBits71), 0.0, 1.0);
        uvec4 reinterpretedBits73 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
        float reinterpretedBits74 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[62u]));
        float multiplyAddValue197 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.x)) / reinterpretedBits74) * reinterpretedBits74;
        float multiplyAddValue198 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.y)) / reinterpretedBits74) * reinterpretedBits74;
        float productValue257 = floor(multiplyAddValue198 * 0.25);
        float productValue258 = floor(multiplyAddValue198 * 0.5);
        float scalarValue31 = floor(multiplyAddValue198);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue197 * 0.25), 0.5, (productValue257 * productValue257) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue197 * 0.5), 0.5, (productValue258 * productValue258) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue197), 0.5, (scalarValue31 * scalarValue31) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits75 * reinterpretedBits75) * fma(reinterpretedBits75, -2.0, 3.0)))) || (scalarValue3 < uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u]))))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue52 = scalarValue * varyingColor0.x;
    float productValue53 = scalarValue * varyingColor0.y;
    float productValue54 = scalarValue * varyingColor0.z;
    float scalarValue9 = ceil(scalarValue1);
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float multiplyAddValue116 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.x), -productValue52), productValue52);
    float multiplyAddValue117 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.y), -productValue53), productValue53);
    float multiplyAddValue118 = fma(scalarValue9, fma(scalarValue1, uintBitsToFloat(reinterpretedBits42.z), -productValue54), productValue54);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue174 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.x) - multiplyAddValue116, multiplyAddValue116) * varyingColor1.x;
    float multiplyAddValue175 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.y) - multiplyAddValue117, multiplyAddValue117) * varyingColor1.y;
    float multiplyAddValue176 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.z) - multiplyAddValue118, multiplyAddValue118) * varyingColor1.z;
    float productValue205 = scalarValue3 * varyingColor1.w;
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue177 = reinterpretedBits36 ? ((fma(productValue205, fma(multiplyAddValue174, varyingColor0.x, -multiplyAddValue174), multiplyAddValue174) * uintBitsToFloat(reinterpretedBits45.x)) * varyingColor0.w) : multiplyAddValue174;
    float multiplyAddValue178 = reinterpretedBits36 ? ((fma(productValue205, fma(multiplyAddValue175, varyingColor0.y, -multiplyAddValue175), multiplyAddValue175) * uintBitsToFloat(reinterpretedBits45.y)) * varyingColor0.w) : multiplyAddValue175;
    float multiplyAddValue179 = reinterpretedBits36 ? ((fma(productValue205, fma(multiplyAddValue176, varyingColor0.z, -multiplyAddValue176), multiplyAddValue176) * uintBitsToFloat(reinterpretedBits45.z)) * varyingColor0.w) : multiplyAddValue176;
    fragmentColor0.w = (reinterpretedBits36 ? 1.0 : productValue205) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue177, multiplyAddValue177);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue178, multiplyAddValue178);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue179, multiplyAddValue179);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM50)
    isFragmentDiscarded = false;
    bool reinterpretedBits36 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[44u])) != 0.0;
    if (!reinterpretedBits36)
    {
        float reinterpretedBits1 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[2u]));
        float reinterpretedBits2 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[6u]));
        float reinterpretedBits3 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[10u]));
        vec3 vectorValue = vec3(reinterpretedBits1, reinterpretedBits2, reinterpretedBits3);
        float scalarValue11 = rdDot3Precise(vectorValue, vectorValue);
        float inverseLengthValue1 = inversesqrt(scalarValue11);
        uvec4 reinterpretedBits10 = floatBitsToUint(fragmentVectorConstants1.packedValues[8u]);
        float reinterpretedBits37 = rdDot3Precise(vec3(-(inverseLengthValue1 * reinterpretedBits1), -(inverseLengthValue1 * reinterpretedBits2), -(inverseLengthValue1 * reinterpretedBits3)), vec3(varyingTexCoord3.x - uintBitsToFloat(reinterpretedBits10.x), varyingTexCoord3.y - uintBitsToFloat(reinterpretedBits10.y), varyingTexCoord3.z - uintBitsToFloat(reinterpretedBits10.z)));
        float reinterpretedBits71 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[60u]));
        float reinterpretedBits75 = spvNClamp((1.0 / (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[61u])) - reinterpretedBits71)) * (reinterpretedBits37 - reinterpretedBits71), 0.0, 1.0);
        uvec4 reinterpretedBits73 = floatBitsToUint(fragmentVectorConstants1.packedValues[17u]);
        float reinterpretedBits74 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[62u]));
        float multiplyAddValue197 = floor((fma(varyingColor3.x / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.x)) / reinterpretedBits74) * reinterpretedBits74;
        float multiplyAddValue198 = floor((fma(varyingColor3.y / varyingColor3.w, 0.5, 0.5) * uintBitsToFloat(reinterpretedBits73.y)) / reinterpretedBits74) * reinterpretedBits74;
        float productValue257 = floor(multiplyAddValue198 * 0.25);
        float productValue258 = floor(multiplyAddValue198 * 0.5);
        float scalarValue31 = floor(multiplyAddValue198);
        if (((uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[72u])) != 0.0) && ((fma(fma(fma(fract(fma(floor(multiplyAddValue197 * 0.25), 0.5, (productValue257 * productValue257) * 0.75)), 0.25, fract(fma(floor(multiplyAddValue197 * 0.5), 0.5, (productValue258 * productValue258) * 0.75))), 0.25, fract(fma(floor(multiplyAddValue197), 0.5, (scalarValue31 * scalarValue31) * 0.75))), 64.0, 0.5) * 0.015625) >= ((reinterpretedBits75 * reinterpretedBits75) * fma(reinterpretedBits75, -2.0, 3.0)))) || (uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[52u])) > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    uvec4 reinterpretedBits42 = floatBitsToUint(fragmentVectorConstants1.packedValues[4u]);
    float reinterpretedBits54 = uintBitsToFloat(reinterpretedBits42.x);
    float reinterpretedBits55 = uintBitsToFloat(reinterpretedBits42.y);
    float reinterpretedBits56 = uintBitsToFloat(reinterpretedBits42.z);
    uvec4 reinterpretedBits43 = floatBitsToUint(fragmentVectorConstants1.packedValues[9u]);
    float reinterpretedBits44 = uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[39u]));
    float multiplyAddValue186 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.x) - reinterpretedBits54, reinterpretedBits54) * varyingColor1.x;
    float multiplyAddValue187 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.y) - reinterpretedBits55, reinterpretedBits55) * varyingColor1.y;
    float multiplyAddValue188 = fma(reinterpretedBits44, uintBitsToFloat(reinterpretedBits43.z) - reinterpretedBits56, reinterpretedBits56) * varyingColor1.z;
    uvec4 reinterpretedBits45 = floatBitsToUint(fragmentVectorConstants1.packedValues[12u]);
    float multiplyAddValue189 = reinterpretedBits36 ? ((fma(varyingColor1.w, fma(multiplyAddValue186, varyingColor0.x, -multiplyAddValue186), multiplyAddValue186) * uintBitsToFloat(reinterpretedBits45.x)) * varyingColor0.w) : multiplyAddValue186;
    float multiplyAddValue190 = reinterpretedBits36 ? ((fma(varyingColor1.w, fma(multiplyAddValue187, varyingColor0.y, -multiplyAddValue187), multiplyAddValue187) * uintBitsToFloat(reinterpretedBits45.y)) * varyingColor0.w) : multiplyAddValue187;
    float multiplyAddValue191 = reinterpretedBits36 ? ((fma(varyingColor1.w, fma(multiplyAddValue188, varyingColor0.z, -multiplyAddValue188), multiplyAddValue188) * uintBitsToFloat(reinterpretedBits45.z)) * varyingColor0.w) : multiplyAddValue188;
    fragmentColor0.w = (reinterpretedBits36 ? 1.0 : varyingColor1.w) * uintBitsToFloat(floatBitsToUint(fragmentScalarConstants1.packedValues[40u]));
    fragmentColor0.x = fma(varyingColor2.w, varyingColor2.x - multiplyAddValue189, multiplyAddValue189);
    fragmentColor0.y = fma(varyingColor2.w, varyingColor2.y - multiplyAddValue190, multiplyAddValue190);
    fragmentColor0.z = fma(varyingColor2.w, varyingColor2.z - multiplyAddValue191, multiplyAddValue191);
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    float productValue = ((fragmentVectorConstants1.packedValues[0u].x - scalarValue4) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue4;
    float productValue1 = ((fragmentVectorConstants1.packedValues[0u].y - scalarValue5) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue5;
    float productValue2 = ((fragmentVectorConstants1.packedValues[0u].z - scalarValue6) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue6;
    float productValue13 = productValue * varyingColor0.x;
    float productValue14 = productValue1 * varyingColor0.y;
    float productValue15 = productValue2 * varyingColor0.z;
    float productValue6;
    float productValue7;
    float productValue8;
    float intermediateValue4;
    if (fragmentVectorConstants1.packedValues[2u].x != 0.0)
    {
        productValue6 = (fragmentVectorConstants1.packedValues[3u].x * varyingColor0.w) * (((productValue13 - productValue) * scalarValue7) + productValue);
        productValue7 = (fragmentVectorConstants1.packedValues[3u].y * varyingColor0.w) * (((productValue14 - productValue1) * scalarValue7) + productValue1);
        productValue8 = (fragmentVectorConstants1.packedValues[3u].z * varyingColor0.w) * (((productValue15 - productValue2) * scalarValue7) + productValue2);
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue6 = productValue13 * fragmentVectorConstants1.packedValues[3u].x;
        productValue7 = productValue14 * fragmentVectorConstants1.packedValues[3u].y;
        productValue8 = productValue15 * fragmentVectorConstants1.packedValues[3u].z;
        intermediateValue4 = (scalarValue7 * varyingColor0.w) * fragmentVectorConstants1.packedValues[3u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].x * intermediateValue4;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue27 = (((fragmentVectorConstants1.packedValues[0u].x + (-1.0)) * fragmentVectorConstants1.packedValues[0u].w) + 1.0) * varyingColor0.x;
    float productValue28 = (((fragmentVectorConstants1.packedValues[0u].y + (-1.0)) * fragmentVectorConstants1.packedValues[0u].w) + 1.0) * varyingColor0.y;
    float productValue29 = (((fragmentVectorConstants1.packedValues[0u].z + (-1.0)) * fragmentVectorConstants1.packedValues[0u].w) + 1.0) * varyingColor0.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue;
    if (fragmentVectorConstants1.packedValues[2u].x != 0.0)
    {
        productValue3 = (productValue27 * fragmentVectorConstants1.packedValues[3u].x) * varyingColor0.w;
        productValue4 = (productValue28 * fragmentVectorConstants1.packedValues[3u].y) * varyingColor0.w;
        productValue5 = (productValue29 * fragmentVectorConstants1.packedValues[3u].z) * varyingColor0.w;
        intermediateValue = 1.0;
    }
    else
    {
        productValue3 = productValue27 * fragmentVectorConstants1.packedValues[3u].x;
        productValue4 = productValue28 * fragmentVectorConstants1.packedValues[3u].y;
        productValue5 = productValue29 * fragmentVectorConstants1.packedValues[3u].z;
        intermediateValue = fragmentVectorConstants1.packedValues[3u].w * varyingColor0.w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].x * intermediateValue;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.w;
    float productValue43 = scalarValue4 * varyingColor0.x;
    float productValue44 = scalarValue4 * varyingColor0.y;
    float productValue45 = scalarValue4 * varyingColor0.z;
    float scalarValue8 = ceil(scalarValue5);
    float productValue46 = (((fragmentVectorConstants1.packedValues[0u].x * scalarValue5) - productValue43) * scalarValue8) + productValue43;
    float productValue47 = (((fragmentVectorConstants1.packedValues[0u].y * scalarValue5) - productValue44) * scalarValue8) + productValue44;
    float productValue48 = (((fragmentVectorConstants1.packedValues[0u].z * scalarValue5) - productValue45) * scalarValue8) + productValue45;
    float productValue49 = ((fragmentVectorConstants1.packedValues[1u].x - productValue46) * fragmentVectorConstants1.packedValues[1u].w) + productValue46;
    float productValue50 = ((fragmentVectorConstants1.packedValues[1u].y - productValue47) * fragmentVectorConstants1.packedValues[1u].w) + productValue47;
    float productValue51 = ((fragmentVectorConstants1.packedValues[1u].z - productValue48) * fragmentVectorConstants1.packedValues[1u].w) + productValue48;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue4;
    if (fragmentVectorConstants1.packedValues[3u].x != 0.0)
    {
        productValue9 = (((((productValue49 * varyingColor0.x) - productValue49) * scalarValue7) + productValue49) * varyingColor0.w) * fragmentVectorConstants1.packedValues[4u].x;
        productValue10 = (((((productValue50 * varyingColor0.y) - productValue50) * scalarValue7) + productValue50) * varyingColor0.w) * fragmentVectorConstants1.packedValues[4u].y;
        productValue11 = (((((productValue51 * varyingColor0.z) - productValue51) * scalarValue7) + productValue51) * varyingColor0.w) * fragmentVectorConstants1.packedValues[4u].z;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue9 = productValue49;
        productValue10 = productValue50;
        productValue11 = productValue51;
        intermediateValue4 = scalarValue7;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].x * intermediateValue4;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue55 = ((fragmentVectorConstants1.packedValues[1u].x - fragmentVectorConstants1.packedValues[0u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[0u].x;
    float productValue56 = ((fragmentVectorConstants1.packedValues[1u].y - fragmentVectorConstants1.packedValues[0u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[0u].y;
    float productValue57 = ((fragmentVectorConstants1.packedValues[1u].z - fragmentVectorConstants1.packedValues[0u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[0u].z;
    float productValue3;
    float productValue4;
    float productValue5;
    if (fragmentVectorConstants1.packedValues[3u].x != 0.0)
    {
        productValue3 = ((productValue55 * varyingColor0.w) * varyingColor0.x) * fragmentVectorConstants1.packedValues[4u].x;
        productValue4 = ((productValue56 * varyingColor0.w) * varyingColor0.y) * fragmentVectorConstants1.packedValues[4u].y;
        productValue5 = ((productValue57 * varyingColor0.w) * varyingColor0.z) * fragmentVectorConstants1.packedValues[4u].z;
    }
    else
    {
        productValue3 = productValue55;
        productValue4 = productValue56;
        productValue5 = productValue57;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].x;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float productValue73 = (((fragmentVectorConstants1.packedValues[0u].x - scalarValue4) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue4) * varyingColor1.x;
    float productValue74 = (((fragmentVectorConstants1.packedValues[0u].y - scalarValue5) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue5) * varyingColor1.y;
    float productValue75 = (((fragmentVectorConstants1.packedValues[0u].z - scalarValue6) * fragmentVectorConstants1.packedValues[0u].w) + scalarValue6) * varyingColor1.z;
    float productValue76 = sampledTextureValue1.w * varyingColor1.w;
    float productValue77 = productValue73 * varyingColor0.x;
    float productValue78 = productValue74 * varyingColor0.y;
    float productValue79 = productValue75 * varyingColor0.z;
    float productValue7;
    float productValue8;
    float productValue9;
    float intermediateValue3;
    if (fragmentVectorConstants1.packedValues[2u].x != 0.0)
    {
        productValue7 = (fragmentVectorConstants1.packedValues[3u].x * varyingColor0.w) * (((productValue77 - productValue73) * productValue76) + productValue73);
        productValue8 = (fragmentVectorConstants1.packedValues[3u].y * varyingColor0.w) * (((productValue78 - productValue74) * productValue76) + productValue74);
        productValue9 = (fragmentVectorConstants1.packedValues[3u].z * varyingColor0.w) * (((productValue79 - productValue75) * productValue76) + productValue75);
        intermediateValue3 = 1.0;
    }
    else
    {
        productValue7 = productValue77 * fragmentVectorConstants1.packedValues[3u].x;
        productValue8 = productValue78 * fragmentVectorConstants1.packedValues[3u].y;
        productValue9 = productValue79 * fragmentVectorConstants1.packedValues[3u].z;
        intermediateValue3 = (productValue76 * varyingColor0.w) * fragmentVectorConstants1.packedValues[3u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.y = ((varyingColor2.y - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.z = ((varyingColor2.z - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].x * intermediateValue3;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue89 = (((fragmentVectorConstants1.packedValues[0u].x + (-1.0)) * fragmentVectorConstants1.packedValues[0u].w) + 1.0) * varyingColor1.x;
    float productValue90 = (((fragmentVectorConstants1.packedValues[0u].y + (-1.0)) * fragmentVectorConstants1.packedValues[0u].w) + 1.0) * varyingColor1.y;
    float productValue91 = (((fragmentVectorConstants1.packedValues[0u].z + (-1.0)) * fragmentVectorConstants1.packedValues[0u].w) + 1.0) * varyingColor1.z;
    float productValue92 = productValue89 * varyingColor0.x;
    float productValue93 = productValue90 * varyingColor0.y;
    float productValue94 = productValue91 * varyingColor0.z;
    float productValue6;
    float productValue7;
    float productValue8;
    float intermediateValue;
    if (fragmentVectorConstants1.packedValues[2u].x != 0.0)
    {
        productValue6 = (fragmentVectorConstants1.packedValues[3u].x * varyingColor0.w) * (((productValue92 - productValue89) * varyingColor1.w) + productValue89);
        productValue7 = (fragmentVectorConstants1.packedValues[3u].y * varyingColor0.w) * (((productValue93 - productValue90) * varyingColor1.w) + productValue90);
        productValue8 = (fragmentVectorConstants1.packedValues[3u].z * varyingColor0.w) * (((productValue94 - productValue91) * varyingColor1.w) + productValue91);
        intermediateValue = 1.0;
    }
    else
    {
        productValue6 = productValue92 * fragmentVectorConstants1.packedValues[3u].x;
        productValue7 = productValue93 * fragmentVectorConstants1.packedValues[3u].y;
        productValue8 = productValue94 * fragmentVectorConstants1.packedValues[3u].z;
        intermediateValue = (varyingColor0.w * varyingColor1.w) * fragmentVectorConstants1.packedValues[3u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.y = ((varyingColor2.y - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.z = ((varyingColor2.z - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].x * intermediateValue;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float productValue43 = scalarValue4 * varyingColor0.x;
    float productValue44 = scalarValue4 * varyingColor0.y;
    float productValue45 = scalarValue4 * varyingColor0.z;
    float scalarValue8 = ceil(scalarValue5);
    float productValue46 = (((fragmentVectorConstants1.packedValues[0u].x * scalarValue5) - productValue43) * scalarValue8) + productValue43;
    float productValue47 = (((fragmentVectorConstants1.packedValues[0u].y * scalarValue5) - productValue44) * scalarValue8) + productValue44;
    float productValue48 = (((fragmentVectorConstants1.packedValues[0u].z * scalarValue5) - productValue45) * scalarValue8) + productValue45;
    float productValue95 = (((fragmentVectorConstants1.packedValues[1u].x - productValue46) * fragmentVectorConstants1.packedValues[1u].w) + productValue46) * varyingColor1.x;
    float productValue96 = (((fragmentVectorConstants1.packedValues[1u].y - productValue47) * fragmentVectorConstants1.packedValues[1u].w) + productValue47) * varyingColor1.y;
    float productValue97 = (((fragmentVectorConstants1.packedValues[1u].z - productValue48) * fragmentVectorConstants1.packedValues[1u].w) + productValue48) * varyingColor1.z;
    float productValue76 = sampledTextureValue1.w * varyingColor1.w;
    float productValue10;
    float productValue11;
    float productValue12;
    float intermediateValue3;
    if (fragmentVectorConstants1.packedValues[3u].x != 0.0)
    {
        productValue10 = (((((productValue95 * varyingColor0.x) - productValue95) * productValue76) + productValue95) * varyingColor0.w) * fragmentVectorConstants1.packedValues[4u].x;
        productValue11 = (((((productValue96 * varyingColor0.y) - productValue96) * productValue76) + productValue96) * varyingColor0.w) * fragmentVectorConstants1.packedValues[4u].y;
        productValue12 = (((((productValue97 * varyingColor0.z) - productValue97) * productValue76) + productValue97) * varyingColor0.w) * fragmentVectorConstants1.packedValues[4u].z;
        intermediateValue3 = 1.0;
    }
    else
    {
        productValue10 = productValue95;
        productValue11 = productValue96;
        productValue12 = productValue97;
        intermediateValue3 = productValue76;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.y = ((varyingColor2.y - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.z = ((varyingColor2.z - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].x * intermediateValue3;
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue109 = (((fragmentVectorConstants1.packedValues[1u].x - fragmentVectorConstants1.packedValues[0u].x) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[0u].x) * varyingColor1.x;
    float productValue110 = (((fragmentVectorConstants1.packedValues[1u].y - fragmentVectorConstants1.packedValues[0u].y) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[0u].y) * varyingColor1.y;
    float productValue111 = (((fragmentVectorConstants1.packedValues[1u].z - fragmentVectorConstants1.packedValues[0u].z) * fragmentVectorConstants1.packedValues[1u].w) + fragmentVectorConstants1.packedValues[0u].z) * varyingColor1.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue;
    if (fragmentVectorConstants1.packedValues[3u].x != 0.0)
    {
        productValue3 = (fragmentVectorConstants1.packedValues[4u].x * varyingColor0.w) * ((((varyingColor0.x * productValue109) - productValue109) * varyingColor1.w) + productValue109);
        productValue4 = (fragmentVectorConstants1.packedValues[4u].y * varyingColor0.w) * ((((varyingColor0.y * productValue110) - productValue110) * varyingColor1.w) + productValue110);
        productValue5 = (((((varyingColor0.z * productValue111) - productValue111) * varyingColor1.w) + productValue111) * varyingColor0.w) * fragmentVectorConstants1.packedValues[4u].z;
        intermediateValue = 1.0;
    }
    else
    {
        productValue3 = productValue109;
        productValue4 = productValue110;
        productValue5 = productValue111;
        intermediateValue = varyingColor1.w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[2u].x * intermediateValue;
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    if (!(fragmentVectorConstants1.packedValues[10u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
            float productValue115 = floor(quotientValue1 * 0.25);
            float productValue116 = floor(quotientValue1 * 0.5);
            float scalarValue10 = floor(quotientValue1);
            comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue116 * productValue116) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue115 * productValue115) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue10 * scalarValue10) * 0.75) + (floor(quotientValue) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if ((scalarValue7 <= 0.0) || comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue117 = ((fragmentVectorConstants1.packedValues[8u].x - scalarValue4) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue4;
    float productValue118 = ((fragmentVectorConstants1.packedValues[8u].y - scalarValue5) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue5;
    float productValue119 = ((fragmentVectorConstants1.packedValues[8u].z - scalarValue6) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue6;
    float productValue120 = productValue117 * varyingColor0.x;
    float productValue121 = productValue118 * varyingColor0.y;
    float productValue122 = productValue119 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue5;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue8 = (fragmentVectorConstants1.packedValues[11u].x * varyingColor0.w) * (((productValue120 - productValue117) * scalarValue7) + productValue117);
        productValue9 = (fragmentVectorConstants1.packedValues[11u].y * varyingColor0.w) * (((productValue121 - productValue118) * scalarValue7) + productValue118);
        productValue10 = (fragmentVectorConstants1.packedValues[11u].z * varyingColor0.w) * (((productValue122 - productValue119) * scalarValue7) + productValue119);
        intermediateValue5 = 1.0;
    }
    else
    {
        productValue8 = productValue120 * fragmentVectorConstants1.packedValues[11u].x;
        productValue9 = productValue121 * fragmentVectorConstants1.packedValues[11u].y;
        productValue10 = productValue122 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue5 = (scalarValue7 * varyingColor0.w) * fragmentVectorConstants1.packedValues[11u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.y = ((varyingColor2.y - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.z = ((varyingColor2.z - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue5;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    if (!(fragmentVectorConstants1.packedValues[10u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
            float productValue115 = floor(quotientValue1 * 0.25);
            float productValue116 = floor(quotientValue1 * 0.5);
            float scalarValue10 = floor(quotientValue1);
            comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue116 * productValue116) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue115 * productValue115) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue10 * scalarValue10) * 0.75) + (floor(quotientValue) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue149 = (((fragmentVectorConstants1.packedValues[8u].x + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor0.x;
    float productValue150 = (((fragmentVectorConstants1.packedValues[8u].y + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor0.y;
    float productValue151 = (((fragmentVectorConstants1.packedValues[8u].z + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor0.z;
    float productValue5;
    float productValue6;
    float productValue7;
    float intermediateValue1;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue5 = (productValue149 * fragmentVectorConstants1.packedValues[11u].x) * varyingColor0.w;
        productValue6 = (productValue150 * fragmentVectorConstants1.packedValues[11u].y) * varyingColor0.w;
        productValue7 = (productValue151 * fragmentVectorConstants1.packedValues[11u].z) * varyingColor0.w;
        intermediateValue1 = 1.0;
    }
    else
    {
        productValue5 = productValue149 * fragmentVectorConstants1.packedValues[11u].x;
        productValue6 = productValue150 * fragmentVectorConstants1.packedValues[11u].y;
        productValue7 = productValue151 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue1 = fragmentVectorConstants1.packedValues[11u].w * varyingColor0.w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.y = ((varyingColor2.y - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.z = ((varyingColor2.z - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue1;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.w;
    if (!(fragmentVectorConstants1.packedValues[11u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[14u].x) / (fragmentVectorConstants1.packedValues[14u].y - fragmentVectorConstants1.packedValues[14u].x), 0.0, 1.0);
            float quotientValue7 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float quotientValue8 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float productValue162 = floor(quotientValue8 * 0.25);
            float productValue163 = floor(quotientValue8 * 0.5);
            float scalarValue18 = floor(quotientValue8);
            comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue163 * productValue163) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue162 * productValue162) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if ((scalarValue7 <= 0.0) || comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue43 = scalarValue4 * varyingColor0.x;
    float productValue44 = scalarValue4 * varyingColor0.y;
    float productValue45 = scalarValue4 * varyingColor0.z;
    float scalarValue8 = ceil(scalarValue5);
    float productValue164 = (((fragmentVectorConstants1.packedValues[4u].x * scalarValue5) - productValue43) * scalarValue8) + productValue43;
    float productValue165 = (((fragmentVectorConstants1.packedValues[4u].y * scalarValue5) - productValue44) * scalarValue8) + productValue44;
    float productValue166 = (((fragmentVectorConstants1.packedValues[4u].z * scalarValue5) - productValue45) * scalarValue8) + productValue45;
    float productValue167 = ((fragmentVectorConstants1.packedValues[9u].x - productValue164) * fragmentVectorConstants1.packedValues[9u].w) + productValue164;
    float productValue168 = ((fragmentVectorConstants1.packedValues[9u].y - productValue165) * fragmentVectorConstants1.packedValues[9u].w) + productValue165;
    float productValue169 = ((fragmentVectorConstants1.packedValues[9u].z - productValue166) * fragmentVectorConstants1.packedValues[9u].w) + productValue166;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue4;
    if (fragmentVectorConstants1.packedValues[11u].x != 0.0)
    {
        productValue9 = (((((productValue167 * varyingColor0.x) - productValue167) * scalarValue7) + productValue167) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].x;
        productValue10 = (((((productValue168 * varyingColor0.y) - productValue168) * scalarValue7) + productValue168) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].y;
        productValue11 = (((((productValue169 * varyingColor0.z) - productValue169) * scalarValue7) + productValue169) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].z;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue9 = productValue167;
        productValue10 = productValue168;
        productValue11 = productValue169;
        intermediateValue4 = scalarValue7;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[10u].x * intermediateValue4;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    if (!(fragmentVectorConstants1.packedValues[11u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[14u].x) / (fragmentVectorConstants1.packedValues[14u].y - fragmentVectorConstants1.packedValues[14u].x), 0.0, 1.0);
            float quotientValue7 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float quotientValue8 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float productValue162 = floor(quotientValue8 * 0.25);
            float productValue163 = floor(quotientValue8 * 0.5);
            float scalarValue18 = floor(quotientValue8);
            comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue163 * productValue163) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue162 * productValue162) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue172 = ((fragmentVectorConstants1.packedValues[9u].x - fragmentVectorConstants1.packedValues[4u].x) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].x;
    float productValue173 = ((fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[4u].y) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].y;
    float productValue174 = ((fragmentVectorConstants1.packedValues[9u].z - fragmentVectorConstants1.packedValues[4u].z) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].z;
    float productValue3;
    float productValue4;
    float productValue5;
    if (fragmentVectorConstants1.packedValues[11u].x != 0.0)
    {
        productValue3 = ((varyingColor0.w * varyingColor0.x) * productValue172) * fragmentVectorConstants1.packedValues[12u].x;
        productValue4 = ((varyingColor0.w * varyingColor0.y) * productValue173) * fragmentVectorConstants1.packedValues[12u].y;
        productValue5 = ((varyingColor0.w * varyingColor0.z) * productValue174) * fragmentVectorConstants1.packedValues[12u].z;
    }
    else
    {
        productValue3 = productValue172;
        productValue4 = productValue173;
        productValue5 = productValue174;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[10u].x;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    if (!(fragmentVectorConstants1.packedValues[10u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
            float productValue115 = floor(quotientValue1 * 0.25);
            float productValue116 = floor(quotientValue1 * 0.5);
            float scalarValue10 = floor(quotientValue1);
            comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue116 * productValue116) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue115 * productValue115) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue10 * scalarValue10) * 0.75) + (floor(quotientValue) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if ((scalarValue7 <= 0.0) || comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue198 = (((fragmentVectorConstants1.packedValues[8u].x - scalarValue4) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue4) * varyingColor1.x;
    float productValue199 = (((fragmentVectorConstants1.packedValues[8u].y - scalarValue5) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue5) * varyingColor1.y;
    float productValue200 = (((fragmentVectorConstants1.packedValues[8u].z - scalarValue6) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue6) * varyingColor1.z;
    float productValue201 = scalarValue7 * varyingColor1.w;
    float productValue202 = productValue198 * varyingColor0.x;
    float productValue203 = productValue199 * varyingColor0.y;
    float productValue204 = productValue200 * varyingColor0.z;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue5;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue9 = (fragmentVectorConstants1.packedValues[11u].x * varyingColor0.w) * (((productValue202 - productValue198) * productValue201) + productValue198);
        productValue10 = (fragmentVectorConstants1.packedValues[11u].y * varyingColor0.w) * (((productValue203 - productValue199) * productValue201) + productValue199);
        productValue11 = (fragmentVectorConstants1.packedValues[11u].z * varyingColor0.w) * (((productValue204 - productValue200) * productValue201) + productValue200);
        intermediateValue5 = 1.0;
    }
    else
    {
        productValue9 = productValue202 * fragmentVectorConstants1.packedValues[11u].x;
        productValue10 = productValue203 * fragmentVectorConstants1.packedValues[11u].y;
        productValue11 = productValue204 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue5 = (productValue201 * varyingColor0.w) * fragmentVectorConstants1.packedValues[11u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue5;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    if (!(fragmentVectorConstants1.packedValues[10u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[16u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[13u].x) / (fragmentVectorConstants1.packedValues[13u].y - fragmentVectorConstants1.packedValues[13u].x), 0.0, 1.0);
            float quotientValue = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].x) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
            float quotientValue1 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[15u].y) / fragmentVectorConstants1.packedValues[13u].z) * fragmentVectorConstants1.packedValues[13u].z;
            float productValue115 = floor(quotientValue1 * 0.25);
            float productValue116 = floor(quotientValue1 * 0.5);
            float scalarValue10 = floor(quotientValue1);
            comparisonValue = ((dotProductValue * dotProductValue) * (3.0 - (dotProductValue * 2.0))) <= ((((fract(((productValue116 * productValue116) * 0.75) + (floor(quotientValue * 0.5) * 0.5)) + (fract(((productValue115 * productValue115) * 0.75) + (floor(quotientValue * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue10 * scalarValue10) * 0.75) + (floor(quotientValue) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue214 = (((fragmentVectorConstants1.packedValues[8u].x + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor1.x;
    float productValue215 = (((fragmentVectorConstants1.packedValues[8u].y + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor1.y;
    float productValue216 = (((fragmentVectorConstants1.packedValues[8u].z + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor1.z;
    float productValue217 = productValue214 * varyingColor0.x;
    float productValue218 = productValue215 * varyingColor0.y;
    float productValue219 = productValue216 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue1;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue8 = (fragmentVectorConstants1.packedValues[11u].x * varyingColor0.w) * (((productValue217 - productValue214) * varyingColor1.w) + productValue214);
        productValue9 = (fragmentVectorConstants1.packedValues[11u].y * varyingColor0.w) * (((productValue218 - productValue215) * varyingColor1.w) + productValue215);
        productValue10 = (fragmentVectorConstants1.packedValues[11u].z * varyingColor0.w) * (((productValue219 - productValue216) * varyingColor1.w) + productValue216);
        intermediateValue1 = 1.0;
    }
    else
    {
        productValue8 = productValue217 * fragmentVectorConstants1.packedValues[11u].x;
        productValue9 = productValue218 * fragmentVectorConstants1.packedValues[11u].y;
        productValue10 = productValue219 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue1 = (varyingColor0.w * varyingColor1.w) * fragmentVectorConstants1.packedValues[11u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.y = ((varyingColor2.y - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.z = ((varyingColor2.z - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue1;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.w;
    if (!(fragmentVectorConstants1.packedValues[11u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[14u].x) / (fragmentVectorConstants1.packedValues[14u].y - fragmentVectorConstants1.packedValues[14u].x), 0.0, 1.0);
            float quotientValue7 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float quotientValue8 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float productValue162 = floor(quotientValue8 * 0.25);
            float productValue163 = floor(quotientValue8 * 0.5);
            float scalarValue18 = floor(quotientValue8);
            comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue163 * productValue163) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue162 * productValue162) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if ((scalarValue7 <= 0.0) || comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue43 = scalarValue4 * varyingColor0.x;
    float productValue44 = scalarValue4 * varyingColor0.y;
    float productValue45 = scalarValue4 * varyingColor0.z;
    float scalarValue8 = ceil(scalarValue5);
    float productValue164 = (((fragmentVectorConstants1.packedValues[4u].x * scalarValue5) - productValue43) * scalarValue8) + productValue43;
    float productValue165 = (((fragmentVectorConstants1.packedValues[4u].y * scalarValue5) - productValue44) * scalarValue8) + productValue44;
    float productValue166 = (((fragmentVectorConstants1.packedValues[4u].z * scalarValue5) - productValue45) * scalarValue8) + productValue45;
    float productValue220 = (((fragmentVectorConstants1.packedValues[9u].x - productValue164) * fragmentVectorConstants1.packedValues[9u].w) + productValue164) * varyingColor1.x;
    float productValue221 = (((fragmentVectorConstants1.packedValues[9u].y - productValue165) * fragmentVectorConstants1.packedValues[9u].w) + productValue165) * varyingColor1.y;
    float productValue222 = (((fragmentVectorConstants1.packedValues[9u].z - productValue166) * fragmentVectorConstants1.packedValues[9u].w) + productValue166) * varyingColor1.z;
    float productValue201 = scalarValue7 * varyingColor1.w;
    float productValue10;
    float productValue11;
    float productValue12;
    float intermediateValue4;
    if (fragmentVectorConstants1.packedValues[11u].x != 0.0)
    {
        productValue10 = (((((productValue220 * varyingColor0.x) - productValue220) * productValue201) + productValue220) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].x;
        productValue11 = (((((productValue221 * varyingColor0.y) - productValue221) * productValue201) + productValue221) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].y;
        productValue12 = (((((productValue222 * varyingColor0.z) - productValue222) * productValue201) + productValue222) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].z;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue10 = productValue220;
        productValue11 = productValue221;
        productValue12 = productValue222;
        intermediateValue4 = productValue201;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.y = ((varyingColor2.y - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.z = ((varyingColor2.z - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[10u].x * intermediateValue4;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_VERTEX_TINT_MASK_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    if (!(fragmentVectorConstants1.packedValues[11u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue1 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[14u].x) / (fragmentVectorConstants1.packedValues[14u].y - fragmentVectorConstants1.packedValues[14u].x), 0.0, 1.0);
            float quotientValue7 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float quotientValue8 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float productValue162 = floor(quotientValue8 * 0.25);
            float productValue163 = floor(quotientValue8 * 0.5);
            float scalarValue18 = floor(quotientValue8);
            comparisonValue = ((dotProductValue1 * dotProductValue1) * (3.0 - (dotProductValue1 * 2.0))) <= ((((fract(((productValue163 * productValue163) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue162 * productValue162) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue)
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue233 = (((fragmentVectorConstants1.packedValues[9u].x - fragmentVectorConstants1.packedValues[4u].x) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].x) * varyingColor1.x;
    float productValue234 = (((fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[4u].y) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].y) * varyingColor1.y;
    float productValue235 = (((fragmentVectorConstants1.packedValues[9u].z - fragmentVectorConstants1.packedValues[4u].z) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].z) * varyingColor1.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue;
    if (fragmentVectorConstants1.packedValues[11u].x != 0.0)
    {
        productValue3 = (((((productValue233 * varyingColor0.x) - productValue233) * varyingColor1.w) + productValue233) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].x;
        productValue4 = (((((productValue234 * varyingColor0.y) - productValue234) * varyingColor1.w) + productValue234) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].y;
        productValue5 = (((((productValue235 * varyingColor0.z) - productValue235) * varyingColor1.w) + productValue235) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].z;
        intermediateValue = 1.0;
    }
    else
    {
        productValue3 = productValue233;
        productValue4 = productValue234;
        productValue5 = productValue235;
        intermediateValue = varyingColor1.w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[10u].x * intermediateValue;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    if (!(fragmentVectorConstants1.packedValues[10u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[14u].x) / (fragmentVectorConstants1.packedValues[14u].y - fragmentVectorConstants1.packedValues[14u].x), 0.0, 1.0);
            float quotientValue7 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float quotientValue8 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float productValue162 = floor(quotientValue8 * 0.25);
            float productValue163 = floor(quotientValue8 * 0.5);
            float scalarValue18 = floor(quotientValue8);
            comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue163 * productValue163) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue162 * productValue162) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (scalarValue7 < fragmentVectorConstants1.packedValues[12u].x))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue117 = ((fragmentVectorConstants1.packedValues[8u].x - scalarValue4) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue4;
    float productValue118 = ((fragmentVectorConstants1.packedValues[8u].y - scalarValue5) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue5;
    float productValue119 = ((fragmentVectorConstants1.packedValues[8u].z - scalarValue6) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue6;
    float productValue120 = productValue117 * varyingColor0.x;
    float productValue121 = productValue118 * varyingColor0.y;
    float productValue122 = productValue119 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue5;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue8 = (fragmentVectorConstants1.packedValues[11u].x * varyingColor0.w) * (((productValue120 - productValue117) * scalarValue7) + productValue117);
        productValue9 = (fragmentVectorConstants1.packedValues[11u].y * varyingColor0.w) * (((productValue121 - productValue118) * scalarValue7) + productValue118);
        productValue10 = (fragmentVectorConstants1.packedValues[11u].z * varyingColor0.w) * (((productValue122 - productValue119) * scalarValue7) + productValue119);
        intermediateValue5 = 1.0;
    }
    else
    {
        productValue8 = productValue120 * fragmentVectorConstants1.packedValues[11u].x;
        productValue9 = productValue121 * fragmentVectorConstants1.packedValues[11u].y;
        productValue10 = productValue122 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue5 = (scalarValue7 * varyingColor0.w) * fragmentVectorConstants1.packedValues[11u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.y = ((varyingColor2.y - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.z = ((varyingColor2.z - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue5;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    if (!(fragmentVectorConstants1.packedValues[10u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[14u].x) / (fragmentVectorConstants1.packedValues[14u].y - fragmentVectorConstants1.packedValues[14u].x), 0.0, 1.0);
            float quotientValue7 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float quotientValue8 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float productValue162 = floor(quotientValue8 * 0.25);
            float productValue163 = floor(quotientValue8 * 0.5);
            float scalarValue18 = floor(quotientValue8);
            comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue163 * productValue163) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue162 * productValue162) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (fragmentVectorConstants1.packedValues[12u].x > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue149 = (((fragmentVectorConstants1.packedValues[8u].x + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor0.x;
    float productValue150 = (((fragmentVectorConstants1.packedValues[8u].y + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor0.y;
    float productValue151 = (((fragmentVectorConstants1.packedValues[8u].z + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor0.z;
    float productValue5;
    float productValue6;
    float productValue7;
    float intermediateValue1;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue5 = (productValue149 * fragmentVectorConstants1.packedValues[11u].x) * varyingColor0.w;
        productValue6 = (productValue150 * fragmentVectorConstants1.packedValues[11u].y) * varyingColor0.w;
        productValue7 = (productValue151 * fragmentVectorConstants1.packedValues[11u].z) * varyingColor0.w;
        intermediateValue1 = 1.0;
    }
    else
    {
        productValue5 = productValue149 * fragmentVectorConstants1.packedValues[11u].x;
        productValue6 = productValue150 * fragmentVectorConstants1.packedValues[11u].y;
        productValue7 = productValue151 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue1 = fragmentVectorConstants1.packedValues[11u].w * varyingColor0.w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.y = ((varyingColor2.y - productValue6) * varyingColor2.w) + productValue6;
    fragmentColor0.z = ((varyingColor2.z - productValue7) * varyingColor2.w) + productValue7;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue1;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.w;
    if (!(fragmentVectorConstants1.packedValues[11u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[18u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue3 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[15u].x) / (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[15u].x), 0.0, 1.0);
            float quotientValue12 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[17u].x) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
            float quotientValue13 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[17u].y) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
            float productValue241 = floor(quotientValue13 * 0.25);
            float productValue242 = floor(quotientValue13 * 0.5);
            float scalarValue26 = floor(quotientValue13);
            comparisonValue = ((dotProductValue3 * dotProductValue3) * (3.0 - (dotProductValue3 * 2.0))) <= ((((fract(((productValue242 * productValue242) * 0.75) + (floor(quotientValue12 * 0.5) * 0.5)) + (fract(((productValue241 * productValue241) * 0.75) + (floor(quotientValue12 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue12) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (scalarValue7 < fragmentVectorConstants1.packedValues[13u].x))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue43 = scalarValue4 * varyingColor0.x;
    float productValue44 = scalarValue4 * varyingColor0.y;
    float productValue45 = scalarValue4 * varyingColor0.z;
    float scalarValue8 = ceil(scalarValue5);
    float productValue164 = (((fragmentVectorConstants1.packedValues[4u].x * scalarValue5) - productValue43) * scalarValue8) + productValue43;
    float productValue165 = (((fragmentVectorConstants1.packedValues[4u].y * scalarValue5) - productValue44) * scalarValue8) + productValue44;
    float productValue166 = (((fragmentVectorConstants1.packedValues[4u].z * scalarValue5) - productValue45) * scalarValue8) + productValue45;
    float productValue167 = ((fragmentVectorConstants1.packedValues[9u].x - productValue164) * fragmentVectorConstants1.packedValues[9u].w) + productValue164;
    float productValue168 = ((fragmentVectorConstants1.packedValues[9u].y - productValue165) * fragmentVectorConstants1.packedValues[9u].w) + productValue165;
    float productValue169 = ((fragmentVectorConstants1.packedValues[9u].z - productValue166) * fragmentVectorConstants1.packedValues[9u].w) + productValue166;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue4;
    if (fragmentVectorConstants1.packedValues[11u].x != 0.0)
    {
        productValue9 = (((((productValue167 * varyingColor0.x) - productValue167) * scalarValue7) + productValue167) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].x;
        productValue10 = (((((productValue168 * varyingColor0.y) - productValue168) * scalarValue7) + productValue168) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].y;
        productValue11 = (((((productValue169 * varyingColor0.z) - productValue169) * scalarValue7) + productValue169) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].z;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue9 = productValue167;
        productValue10 = productValue168;
        productValue11 = productValue169;
        intermediateValue4 = scalarValue7;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[10u].x * intermediateValue4;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    if (!(fragmentVectorConstants1.packedValues[11u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[18u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue3 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[15u].x) / (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[15u].x), 0.0, 1.0);
            float quotientValue12 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[17u].x) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
            float quotientValue13 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[17u].y) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
            float productValue241 = floor(quotientValue13 * 0.25);
            float productValue242 = floor(quotientValue13 * 0.5);
            float scalarValue26 = floor(quotientValue13);
            comparisonValue = ((dotProductValue3 * dotProductValue3) * (3.0 - (dotProductValue3 * 2.0))) <= ((((fract(((productValue242 * productValue242) * 0.75) + (floor(quotientValue12 * 0.5) * 0.5)) + (fract(((productValue241 * productValue241) * 0.75) + (floor(quotientValue12 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue12) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (fragmentVectorConstants1.packedValues[13u].x > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue172 = ((fragmentVectorConstants1.packedValues[9u].x - fragmentVectorConstants1.packedValues[4u].x) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].x;
    float productValue173 = ((fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[4u].y) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].y;
    float productValue174 = ((fragmentVectorConstants1.packedValues[9u].z - fragmentVectorConstants1.packedValues[4u].z) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].z;
    float productValue3;
    float productValue4;
    float productValue5;
    if (fragmentVectorConstants1.packedValues[11u].x != 0.0)
    {
        productValue3 = ((varyingColor0.w * varyingColor0.x) * productValue172) * fragmentVectorConstants1.packedValues[12u].x;
        productValue4 = ((varyingColor0.w * varyingColor0.y) * productValue173) * fragmentVectorConstants1.packedValues[12u].y;
        productValue5 = ((varyingColor0.w * varyingColor0.z) * productValue174) * fragmentVectorConstants1.packedValues[12u].z;
    }
    else
    {
        productValue3 = productValue172;
        productValue4 = productValue173;
        productValue5 = productValue174;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[10u].x;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue6 = sampledTextureValue1.z;
    float scalarValue7 = sampledTextureValue1.w;
    if (!(fragmentVectorConstants1.packedValues[10u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[14u].x) / (fragmentVectorConstants1.packedValues[14u].y - fragmentVectorConstants1.packedValues[14u].x), 0.0, 1.0);
            float quotientValue7 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float quotientValue8 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float productValue162 = floor(quotientValue8 * 0.25);
            float productValue163 = floor(quotientValue8 * 0.5);
            float scalarValue18 = floor(quotientValue8);
            comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue163 * productValue163) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue162 * productValue162) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (scalarValue7 < fragmentVectorConstants1.packedValues[12u].x))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue198 = (((fragmentVectorConstants1.packedValues[8u].x - scalarValue4) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue4) * varyingColor1.x;
    float productValue199 = (((fragmentVectorConstants1.packedValues[8u].y - scalarValue5) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue5) * varyingColor1.y;
    float productValue200 = (((fragmentVectorConstants1.packedValues[8u].z - scalarValue6) * fragmentVectorConstants1.packedValues[8u].w) + scalarValue6) * varyingColor1.z;
    float productValue201 = scalarValue7 * varyingColor1.w;
    float productValue202 = productValue198 * varyingColor0.x;
    float productValue203 = productValue199 * varyingColor0.y;
    float productValue204 = productValue200 * varyingColor0.z;
    float productValue9;
    float productValue10;
    float productValue11;
    float intermediateValue5;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue9 = (fragmentVectorConstants1.packedValues[11u].x * varyingColor0.w) * (((productValue202 - productValue198) * productValue201) + productValue198);
        productValue10 = (fragmentVectorConstants1.packedValues[11u].y * varyingColor0.w) * (((productValue203 - productValue199) * productValue201) + productValue199);
        productValue11 = (fragmentVectorConstants1.packedValues[11u].z * varyingColor0.w) * (((productValue204 - productValue200) * productValue201) + productValue200);
        intermediateValue5 = 1.0;
    }
    else
    {
        productValue9 = productValue202 * fragmentVectorConstants1.packedValues[11u].x;
        productValue10 = productValue203 * fragmentVectorConstants1.packedValues[11u].y;
        productValue11 = productValue204 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue5 = (productValue201 * varyingColor0.w) * fragmentVectorConstants1.packedValues[11u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.y = ((varyingColor2.y - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.z = ((varyingColor2.z - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue5;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_OFF && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    if (!(fragmentVectorConstants1.packedValues[10u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[17u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue2 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[7u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[7u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[7u].z)) - fragmentVectorConstants1.packedValues[14u].x) / (fragmentVectorConstants1.packedValues[14u].y - fragmentVectorConstants1.packedValues[14u].x), 0.0, 1.0);
            float quotientValue7 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].x) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float quotientValue8 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[16u].y) / fragmentVectorConstants1.packedValues[14u].z) * fragmentVectorConstants1.packedValues[14u].z;
            float productValue162 = floor(quotientValue8 * 0.25);
            float productValue163 = floor(quotientValue8 * 0.5);
            float scalarValue18 = floor(quotientValue8);
            comparisonValue = ((dotProductValue2 * dotProductValue2) * (3.0 - (dotProductValue2 * 2.0))) <= ((((fract(((productValue163 * productValue163) * 0.75) + (floor(quotientValue7 * 0.5) * 0.5)) + (fract(((productValue162 * productValue162) * 0.75) + (floor(quotientValue7 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue18 * scalarValue18) * 0.75) + (floor(quotientValue7) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (fragmentVectorConstants1.packedValues[12u].x > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue214 = (((fragmentVectorConstants1.packedValues[8u].x + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor1.x;
    float productValue215 = (((fragmentVectorConstants1.packedValues[8u].y + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor1.y;
    float productValue216 = (((fragmentVectorConstants1.packedValues[8u].z + (-1.0)) * fragmentVectorConstants1.packedValues[8u].w) + 1.0) * varyingColor1.z;
    float productValue217 = productValue214 * varyingColor0.x;
    float productValue218 = productValue215 * varyingColor0.y;
    float productValue219 = productValue216 * varyingColor0.z;
    float productValue8;
    float productValue9;
    float productValue10;
    float intermediateValue1;
    if (fragmentVectorConstants1.packedValues[10u].x != 0.0)
    {
        productValue8 = (fragmentVectorConstants1.packedValues[11u].x * varyingColor0.w) * (((productValue217 - productValue214) * varyingColor1.w) + productValue214);
        productValue9 = (fragmentVectorConstants1.packedValues[11u].y * varyingColor0.w) * (((productValue218 - productValue215) * varyingColor1.w) + productValue215);
        productValue10 = (fragmentVectorConstants1.packedValues[11u].z * varyingColor0.w) * (((productValue219 - productValue216) * varyingColor1.w) + productValue216);
        intermediateValue1 = 1.0;
    }
    else
    {
        productValue8 = productValue217 * fragmentVectorConstants1.packedValues[11u].x;
        productValue9 = productValue218 * fragmentVectorConstants1.packedValues[11u].y;
        productValue10 = productValue219 * fragmentVectorConstants1.packedValues[11u].z;
        intermediateValue1 = (varyingColor0.w * varyingColor1.w) * fragmentVectorConstants1.packedValues[11u].w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue8) * varyingColor2.w) + productValue8;
    fragmentColor0.y = ((varyingColor2.y - productValue9) * varyingColor2.w) + productValue9;
    fragmentColor0.z = ((varyingColor2.z - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[9u].x * intermediateValue1;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_ON && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    vec4 sampledTextureValue1 = texture(sampler2D(matTextureTexture, matTextureSampler), vec2(varyingTexCoord0.x, varyingTexCoord0.y));
    float scalarValue4 = sampledTextureValue1.x;
    float scalarValue5 = sampledTextureValue1.y;
    float scalarValue7 = sampledTextureValue1.w;
    if (!(fragmentVectorConstants1.packedValues[11u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[18u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue3 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[15u].x) / (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[15u].x), 0.0, 1.0);
            float quotientValue12 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[17u].x) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
            float quotientValue13 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[17u].y) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
            float productValue241 = floor(quotientValue13 * 0.25);
            float productValue242 = floor(quotientValue13 * 0.5);
            float scalarValue26 = floor(quotientValue13);
            comparisonValue = ((dotProductValue3 * dotProductValue3) * (3.0 - (dotProductValue3 * 2.0))) <= ((((fract(((productValue242 * productValue242) * 0.75) + (floor(quotientValue12 * 0.5) * 0.5)) + (fract(((productValue241 * productValue241) * 0.75) + (floor(quotientValue12 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue12) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (scalarValue7 < fragmentVectorConstants1.packedValues[13u].x))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue43 = scalarValue4 * varyingColor0.x;
    float productValue44 = scalarValue4 * varyingColor0.y;
    float productValue45 = scalarValue4 * varyingColor0.z;
    float scalarValue8 = ceil(scalarValue5);
    float productValue164 = (((fragmentVectorConstants1.packedValues[4u].x * scalarValue5) - productValue43) * scalarValue8) + productValue43;
    float productValue165 = (((fragmentVectorConstants1.packedValues[4u].y * scalarValue5) - productValue44) * scalarValue8) + productValue44;
    float productValue166 = (((fragmentVectorConstants1.packedValues[4u].z * scalarValue5) - productValue45) * scalarValue8) + productValue45;
    float productValue220 = (((fragmentVectorConstants1.packedValues[9u].x - productValue164) * fragmentVectorConstants1.packedValues[9u].w) + productValue164) * varyingColor1.x;
    float productValue221 = (((fragmentVectorConstants1.packedValues[9u].y - productValue165) * fragmentVectorConstants1.packedValues[9u].w) + productValue165) * varyingColor1.y;
    float productValue222 = (((fragmentVectorConstants1.packedValues[9u].z - productValue166) * fragmentVectorConstants1.packedValues[9u].w) + productValue166) * varyingColor1.z;
    float productValue201 = scalarValue7 * varyingColor1.w;
    float productValue10;
    float productValue11;
    float productValue12;
    float intermediateValue4;
    if (fragmentVectorConstants1.packedValues[11u].x != 0.0)
    {
        productValue10 = (((((productValue220 * varyingColor0.x) - productValue220) * productValue201) + productValue220) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].x;
        productValue11 = (((((productValue221 * varyingColor0.y) - productValue221) * productValue201) + productValue221) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].y;
        productValue12 = (((((productValue222 * varyingColor0.z) - productValue222) * productValue201) + productValue222) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].z;
        intermediateValue4 = 1.0;
    }
    else
    {
        productValue10 = productValue220;
        productValue11 = productValue221;
        productValue12 = productValue222;
        intermediateValue4 = productValue201;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue10) * varyingColor2.w) + productValue10;
    fragmentColor0.y = ((varyingColor2.y - productValue11) * varyingColor2.w) + productValue11;
    fragmentColor0.z = ((varyingColor2.z - productValue12) * varyingColor2.w) + productValue12;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[10u].x * intermediateValue4;
    discardIfRequested();
#elif (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_FEATURE_MULTI_COLOR_TINT == RD_ON && RD_FEATURE_USE_TEXTURES == RD_OFF && RD_OPTION_ALPHA_TEST == RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED && RD_PLATFORM == RD_PLATFORM_SM65)
    isFragmentDiscarded = false;
    if (!(fragmentVectorConstants1.packedValues[11u].x != 0.0))
    {
        bool comparisonValue;
        if (fragmentVectorConstants1.packedValues[18u].x != 0.0)
        {
            float inverseLengthValue = inversesqrt(dot(vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z), vec3(fragmentVectorConstants1.packedValues[0u].z, fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[2u].z)));
            float dotProductValue3 = spvNClamp((dot(vec3((-0.0) - (fragmentVectorConstants1.packedValues[0u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[1u].z * inverseLengthValue), (-0.0) - (fragmentVectorConstants1.packedValues[2u].z * inverseLengthValue)), vec3(varyingTexCoord3.x - fragmentVectorConstants1.packedValues[8u].x, varyingTexCoord3.y - fragmentVectorConstants1.packedValues[8u].y, varyingTexCoord3.z - fragmentVectorConstants1.packedValues[8u].z)) - fragmentVectorConstants1.packedValues[15u].x) / (fragmentVectorConstants1.packedValues[15u].y - fragmentVectorConstants1.packedValues[15u].x), 0.0, 1.0);
            float quotientValue12 = floor(((((varyingColor3.x / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[17u].x) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
            float quotientValue13 = floor(((((varyingColor3.y / varyingColor3.w) * 0.5) + 0.5) * fragmentVectorConstants1.packedValues[17u].y) / fragmentVectorConstants1.packedValues[15u].z) * fragmentVectorConstants1.packedValues[15u].z;
            float productValue241 = floor(quotientValue13 * 0.25);
            float productValue242 = floor(quotientValue13 * 0.5);
            float scalarValue26 = floor(quotientValue13);
            comparisonValue = ((dotProductValue3 * dotProductValue3) * (3.0 - (dotProductValue3 * 2.0))) <= ((((fract(((productValue242 * productValue242) * 0.75) + (floor(quotientValue12 * 0.5) * 0.5)) + (fract(((productValue241 * productValue241) * 0.75) + (floor(quotientValue12 * 0.25) * 0.5)) * 0.25)) * 0.25) + 0.0078125) + fract(((scalarValue26 * scalarValue26) * 0.75) + (floor(quotientValue12) * 0.5)));
        }
        else
        {
            comparisonValue = false;
        }
        if (comparisonValue || (fragmentVectorConstants1.packedValues[13u].x > 1.0))
        {
            isFragmentDiscarded = true;
        }
    }
    float productValue233 = (((fragmentVectorConstants1.packedValues[9u].x - fragmentVectorConstants1.packedValues[4u].x) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].x) * varyingColor1.x;
    float productValue234 = (((fragmentVectorConstants1.packedValues[9u].y - fragmentVectorConstants1.packedValues[4u].y) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].y) * varyingColor1.y;
    float productValue235 = (((fragmentVectorConstants1.packedValues[9u].z - fragmentVectorConstants1.packedValues[4u].z) * fragmentVectorConstants1.packedValues[9u].w) + fragmentVectorConstants1.packedValues[4u].z) * varyingColor1.z;
    float productValue3;
    float productValue4;
    float productValue5;
    float intermediateValue;
    if (fragmentVectorConstants1.packedValues[11u].x != 0.0)
    {
        productValue3 = (((((productValue233 * varyingColor0.x) - productValue233) * varyingColor1.w) + productValue233) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].x;
        productValue4 = (((((productValue234 * varyingColor0.y) - productValue234) * varyingColor1.w) + productValue234) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].y;
        productValue5 = (((((productValue235 * varyingColor0.z) - productValue235) * varyingColor1.w) + productValue235) * varyingColor0.w) * fragmentVectorConstants1.packedValues[12u].z;
        intermediateValue = 1.0;
    }
    else
    {
        productValue3 = productValue233;
        productValue4 = productValue234;
        productValue5 = productValue235;
        intermediateValue = varyingColor1.w;
    }
    fragmentColor0.x = ((varyingColor2.x - productValue3) * varyingColor2.w) + productValue3;
    fragmentColor0.y = ((varyingColor2.y - productValue4) * varyingColor2.w) + productValue4;
    fragmentColor0.z = ((varyingColor2.z - productValue5) * varyingColor2.w) + productValue5;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[10u].x * intermediateValue;
    discardIfRequested();
#endif
}
