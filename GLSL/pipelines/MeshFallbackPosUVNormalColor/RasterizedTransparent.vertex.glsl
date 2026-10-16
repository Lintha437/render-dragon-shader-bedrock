#version 460
#extension GL_GOOGLE_include_directive : require
// MeshFallbackPosUVNormalColor / RasterizedTransparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/MeshFallbackPosUVNormalColor/VertexBindings.glsli"

#if (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue4 = vertexPosition0.y * vertexVectorConstants0.packedValues[6u].x;
    precise float productValue5 = vertexPosition0.y * vertexVectorConstants0.packedValues[6u].y;
    precise float productValue6 = vertexPosition0.y * vertexVectorConstants0.packedValues[6u].z;
    precise float productValue7 = vertexPosition0.y * vertexVectorConstants0.packedValues[6u].w;
    precise float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[7u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.x, productValue4)) + vertexVectorConstants0.packedValues[8u].x;
    precise float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[7u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.x, productValue5)) + vertexVectorConstants0.packedValues[8u].y;
    precise float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[7u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.x, productValue6)) + vertexVectorConstants0.packedValues[8u].z;
    precise float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[7u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].w, vertexPosition0.x, productValue7)) + vertexVectorConstants0.packedValues[8u].w;
    precise float productValue8 = multiplyAddValue28 * vertexVectorConstants0.packedValues[2u].x;
    precise float productValue9 = multiplyAddValue28 * vertexVectorConstants0.packedValues[2u].y;
    precise float productValue10 = multiplyAddValue28 * vertexVectorConstants0.packedValues[2u].z;
    precise float productValue11 = multiplyAddValue28 * vertexVectorConstants0.packedValues[2u].w;
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue27, productValue8)));
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue27, productValue9)));
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue27, productValue10)));
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue27, productValue11)));
    varyingTexCoord3.x = multiplyAddValue27;
    varyingTexCoord3.y = multiplyAddValue28;
    varyingTexCoord3.z = multiplyAddValue29;
    gl_Position.x = multiplyAddValue31;
    gl_Position.y = multiplyAddValue32;
    gl_Position.w = multiplyAddValue34;
    precise float sumValue3 = multiplyAddValue33 + vertexScalarConstants0.packedValues[92u];
    varyingColor3.x = multiplyAddValue31;
    varyingColor3.y = multiplyAddValue32;
    varyingColor3.z = multiplyAddValue33;
    varyingColor3.w = multiplyAddValue34;
    gl_Position.z = sumValue3;
    precise float quotientValue = sumValue3 / vertexScalarConstants0.packedValues[2u];
    precise float sumValue4 = quotientValue - vertexScalarConstants0.packedValues[0u];
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue14 = vertexPosition0.y * vertexVectorConstants0.packedValues[7u].x;
    precise float productValue15 = vertexPosition0.y * vertexVectorConstants0.packedValues[7u].y;
    precise float productValue16 = vertexPosition0.y * vertexVectorConstants0.packedValues[7u].z;
    precise float productValue17 = vertexPosition0.y * vertexVectorConstants0.packedValues[7u].w;
    precise float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.x, productValue14)) + vertexVectorConstants0.packedValues[9u].x;
    precise float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.x, productValue15)) + vertexVectorConstants0.packedValues[9u].y;
    precise float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.x, productValue16)) + vertexVectorConstants0.packedValues[9u].z;
    precise float multiplyAddValue50 = fma(vertexVectorConstants0.packedValues[8u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.x, productValue17)) + vertexVectorConstants0.packedValues[9u].w;
    precise float productValue18 = multiplyAddValue48 * vertexVectorConstants0.packedValues[2u].x;
    precise float productValue19 = multiplyAddValue48 * vertexVectorConstants0.packedValues[2u].y;
    precise float productValue20 = multiplyAddValue48 * vertexVectorConstants0.packedValues[2u].z;
    precise float productValue21 = multiplyAddValue48 * vertexVectorConstants0.packedValues[2u].w;
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue50, fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue47, productValue18)));
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue50, fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue47, productValue19)));
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue50, fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue47, productValue20)));
    float multiplyAddValue54 = fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue50, fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue47, productValue21)));
    varyingTexCoord3.x = multiplyAddValue47;
    varyingTexCoord3.y = multiplyAddValue48;
    varyingTexCoord3.z = multiplyAddValue49;
    gl_Position.x = multiplyAddValue51;
    gl_Position.y = multiplyAddValue52;
    gl_Position.w = multiplyAddValue54;
    precise float sumValue7 = multiplyAddValue53 + vertexScalarConstants0.packedValues[100u];
    varyingColor3.x = multiplyAddValue51;
    varyingColor3.y = multiplyAddValue52;
    varyingColor3.z = multiplyAddValue53;
    varyingColor3.w = multiplyAddValue54;
    gl_Position.z = sumValue7;
    precise float quotientValue2 = sumValue7 / vertexScalarConstants0.packedValues[2u];
    precise float sumValue8 = quotientValue2 - vertexScalarConstants0.packedValues[0u];
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[7u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[6u].x)) + vertexVectorConstants0.packedValues[8u].x;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[7u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[6u].y)) + vertexVectorConstants0.packedValues[8u].y;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[7u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[6u].z)) + vertexVectorConstants0.packedValues[8u].z;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[7u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].w, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[6u].w)) + vertexVectorConstants0.packedValues[8u].w;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue8, multiplyAddValue9 * vertexVectorConstants0.packedValues[2u].x)));
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue8, multiplyAddValue9 * vertexVectorConstants0.packedValues[2u].y)));
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue8, multiplyAddValue9 * vertexVectorConstants0.packedValues[2u].z)));
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue8, multiplyAddValue9 * vertexVectorConstants0.packedValues[2u].w)));
    varyingTexCoord3.x = multiplyAddValue8;
    varyingTexCoord3.y = multiplyAddValue9;
    varyingTexCoord3.z = multiplyAddValue10;
    gl_Position.x = multiplyAddValue12;
    gl_Position.y = multiplyAddValue13;
    gl_Position.w = multiplyAddValue15;
    float sumValue1 = multiplyAddValue14 + vertexScalarConstants0.packedValues[92u];
    varyingColor3.x = multiplyAddValue12;
    varyingColor3.y = multiplyAddValue13;
    varyingColor3.z = multiplyAddValue14;
    varyingColor3.w = multiplyAddValue15;
    gl_Position.z = sumValue1;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[7u].x)) + vertexVectorConstants0.packedValues[9u].x;
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[7u].y)) + vertexVectorConstants0.packedValues[9u].y;
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[7u].z)) + vertexVectorConstants0.packedValues[9u].z;
    float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[8u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[7u].w)) + vertexVectorConstants0.packedValues[9u].w;
    float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue35, multiplyAddValue36 * vertexVectorConstants0.packedValues[2u].x)));
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue35, multiplyAddValue36 * vertexVectorConstants0.packedValues[2u].y)));
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue35, multiplyAddValue36 * vertexVectorConstants0.packedValues[2u].z)));
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue35, multiplyAddValue36 * vertexVectorConstants0.packedValues[2u].w)));
    varyingTexCoord3.x = multiplyAddValue35;
    varyingTexCoord3.y = multiplyAddValue36;
    varyingTexCoord3.z = multiplyAddValue37;
    gl_Position.x = multiplyAddValue39;
    gl_Position.y = multiplyAddValue40;
    gl_Position.w = multiplyAddValue42;
    float sumValue6 = multiplyAddValue41 + vertexScalarConstants0.packedValues[100u];
    varyingColor3.x = multiplyAddValue39;
    varyingColor3.y = multiplyAddValue40;
    varyingColor3.z = multiplyAddValue41;
    varyingColor3.w = multiplyAddValue42;
    gl_Position.z = sumValue6;
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[7u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[5u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[8u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[7u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[5u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[8u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[7u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[5u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[8u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[7u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.y, vertexVectorConstants0.packedValues[5u].w * vertexPosition0.x)) + vertexVectorConstants0.packedValues[8u].w;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[1u].x)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[1u].y)));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[1u].z)));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[1u].w)));
    float sumValue = vertexVectorConstants0.packedValues[23u].x + multiplyAddValue6;
    gl_Position.x = multiplyAddValue4;
    gl_Position.y = multiplyAddValue5;
    gl_Position.z = sumValue;
    gl_Position.w = multiplyAddValue7;
    varyingColor3.x = multiplyAddValue4;
    varyingColor3.y = multiplyAddValue5;
    varyingColor3.z = multiplyAddValue6;
    varyingColor3.w = multiplyAddValue7;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[7u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[6u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[9u].x;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[7u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[6u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[9u].y;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[7u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[6u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[9u].z;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[8u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[7u].w, vertexPosition0.y, vertexVectorConstants0.packedValues[6u].w * vertexPosition0.x)) + vertexVectorConstants0.packedValues[9u].w;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].x)));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].y)));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].z)));
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].w)));
    float sumValue2 = vertexVectorConstants0.packedValues[25u].x + multiplyAddValue22;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[7u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[6u].x * vertexNormal0.x)));
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[7u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[6u].y * vertexNormal0.x)));
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[7u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[6u].z * vertexNormal0.x)));
    float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26), vec3(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26)));
    float productValue = inverseLengthValue * multiplyAddValue24;
    float productValue1 = inverseLengthValue * multiplyAddValue26;
    float productValue2 = ((0.449999988079071044921875 - ((productValue * productValue) * 0.100000001490116119384765625)) + ((productValue1 * productValue1) * 0.100000001490116119384765625)) + ((((inverseLengthValue * multiplyAddValue25) * vertexVectorConstants0.packedValues[23u].w) + 1.0) * 0.2750000059604644775390625);
    float productValue3 = vertexVectorConstants0.packedValues[5u].w * 0.3499999940395355224609375;
    gl_Position.x = multiplyAddValue20;
    gl_Position.y = multiplyAddValue21;
    gl_Position.z = sumValue2;
    gl_Position.w = multiplyAddValue23;
    varyingColor3.x = multiplyAddValue20;
    varyingColor3.y = multiplyAddValue21;
    varyingColor3.z = multiplyAddValue22;
    varyingColor3.w = multiplyAddValue23;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue5 = vertexScalarConstants0.packedValues[1u] - vertexScalarConstants0.packedValues[0u];
    precise float quotientValue1 = sumValue4 / sumValue5;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[21u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[21u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[21u].z;
    varyingColor1.x = 0.0;
    varyingColor1.y = 0.0;
    varyingColor1.z = 0.0;
    varyingColor1.w = 0.0;
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[22u].z, vertexVectorConstants0.packedValues[22u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[22u].w, vertexVectorConstants0.packedValues[22u].y);
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue5 = vertexScalarConstants0.packedValues[1u] - vertexScalarConstants0.packedValues[0u];
    precise float quotientValue3 = sumValue8 / sumValue5;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[22u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[22u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[22u].z;
    precise float productValue22 = vertexNormal0.y * vertexVectorConstants0.packedValues[7u].x;
    precise float productValue23 = vertexNormal0.y * vertexVectorConstants0.packedValues[7u].y;
    precise float productValue24 = vertexNormal0.y * vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue55 = fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.x, productValue22)));
    float multiplyAddValue56 = fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.x, productValue23)));
    float multiplyAddValue57 = fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.x, productValue24)));
    vec3 vectorValue1 = vec3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    precise float productValue25 = inverseLengthValue2 * multiplyAddValue55;
    precise float productValue26 = inverseLengthValue2 * multiplyAddValue56;
    precise float productValue27 = inverseLengthValue2 * multiplyAddValue57;
    precise float productValue28 = productValue25 * productValue25;
    precise float productValue29 = productValue27 * productValue27;
    precise float productValue30 = productValue28 * (-0.100000001490116119384765625);
    precise float multiplyAddValue58 = fma(productValue29, 0.100000001490116119384765625, fma(fma(productValue26, vertexScalarConstants0.packedValues[95u], 1.0), 0.2750000059604644775390625, productValue30)) + 0.449999988079071044921875;
    precise float productValue31 = multiplyAddValue58 * vertexVectorConstants0.packedValues[23u].x;
    precise float productValue32 = multiplyAddValue58 * vertexVectorConstants0.packedValues[23u].y;
    precise float productValue33 = multiplyAddValue58 * vertexVectorConstants0.packedValues[23u].z;
    varyingColor1.x = fma(vertexScalarConstants0.packedValues[23u], 0.3499999940395355224609375, productValue31);
    varyingColor1.y = fma(vertexScalarConstants0.packedValues[23u], 0.3499999940395355224609375, productValue32);
    varyingColor1.z = fma(vertexScalarConstants0.packedValues[23u], 0.3499999940395355224609375, productValue33);
    varyingColor1.w = fma(vertexScalarConstants0.packedValues[23u], 0.3499999940395355224609375, 1.0);
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[24u].z, vertexVectorConstants0.packedValues[24u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[24u].w, vertexVectorConstants0.packedValues[24u].y);
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((sumValue1 / vertexScalarConstants0.packedValues[2u]) - vertexScalarConstants0.packedValues[0u]) / (vertexScalarConstants0.packedValues[1u] - vertexScalarConstants0.packedValues[0u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[21u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[21u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[21u].z;
    varyingColor1.x = 0.0;
    varyingColor1.y = 0.0;
    varyingColor1.z = 0.0;
    varyingColor1.w = 0.0;
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[22u].z, vertexVectorConstants0.packedValues[22u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[22u].w, vertexVectorConstants0.packedValues[22u].y);
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((sumValue6 / vertexScalarConstants0.packedValues[2u]) - vertexScalarConstants0.packedValues[0u]) / (vertexScalarConstants0.packedValues[1u] - vertexScalarConstants0.packedValues[0u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[22u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[22u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[22u].z;
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[7u].x)));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[7u].y)));
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[7u].z)));
    vec3 vectorValue = vec3(multiplyAddValue43, multiplyAddValue44, multiplyAddValue45);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue12 = inverseLengthValue1 * multiplyAddValue43;
    float productValue13 = inverseLengthValue1 * multiplyAddValue45;
    float multiplyAddValue46 = fma(productValue13 * productValue13, 0.100000001490116119384765625, fma(fma(inverseLengthValue1 * multiplyAddValue44, vertexScalarConstants0.packedValues[95u], 1.0), 0.2750000059604644775390625, (productValue12 * productValue12) * (-0.100000001490116119384765625))) + 0.449999988079071044921875;
    varyingColor1.x = fma(vertexScalarConstants0.packedValues[23u], 0.3499999940395355224609375, multiplyAddValue46 * vertexVectorConstants0.packedValues[23u].x);
    varyingColor1.y = fma(vertexScalarConstants0.packedValues[23u], 0.3499999940395355224609375, multiplyAddValue46 * vertexVectorConstants0.packedValues[23u].y);
    varyingColor1.z = fma(vertexScalarConstants0.packedValues[23u], 0.3499999940395355224609375, multiplyAddValue46 * vertexVectorConstants0.packedValues[23u].z);
    varyingColor1.w = fma(vertexScalarConstants0.packedValues[23u], 0.3499999940395355224609375, 1.0);
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[24u].z, vertexVectorConstants0.packedValues[24u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[24u].w, vertexVectorConstants0.packedValues[24u].y);
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[21u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[21u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[21u].z;
    varyingColor2.w = spvNClamp(((sumValue / vertexVectorConstants0.packedValues[0u].z) - vertexVectorConstants0.packedValues[0u].x) / (vertexVectorConstants0.packedValues[0u].y - vertexVectorConstants0.packedValues[0u].x), 0.0, 1.0);
    varyingColor1.x = 0.0;
    varyingColor1.y = 0.0;
    varyingColor1.z = 0.0;
    varyingColor1.w = 0.0;
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[22u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[22u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[22u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[22u].y;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[22u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[22u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[22u].z;
    varyingColor2.w = spvNClamp(((sumValue2 / vertexVectorConstants0.packedValues[0u].z) - vertexVectorConstants0.packedValues[0u].x) / (vertexVectorConstants0.packedValues[0u].y - vertexVectorConstants0.packedValues[0u].x), 0.0, 1.0);
    varyingColor1.x = (productValue2 * vertexVectorConstants0.packedValues[23u].x) + productValue3;
    varyingColor1.y = (productValue2 * vertexVectorConstants0.packedValues[23u].y) + productValue3;
    varyingColor1.z = (productValue2 * vertexVectorConstants0.packedValues[23u].z) + productValue3;
    varyingColor1.w = productValue3 + 1.0;
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[24u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[24u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[24u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[24u].y;
    varyingTexCoord3.x = multiplyAddValue16;
    varyingTexCoord3.y = multiplyAddValue17;
    varyingTexCoord3.z = multiplyAddValue18;
#endif
}
