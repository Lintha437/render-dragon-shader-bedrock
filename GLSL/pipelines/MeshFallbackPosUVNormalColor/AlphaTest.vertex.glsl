#version 460
#extension GL_GOOGLE_include_directive : require
// MeshFallbackPosUVNormalColor / AlphaTest / vertex forward pipeline.
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
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/MeshFallbackPosUVNormalColor/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[104u];
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[10u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[10u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[10u].z;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[12u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[12u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[12u].z;
    precise float productValue3 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue4 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue5 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue6 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue, productValue3)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue, productValue4)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue, productValue5)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue, productValue6)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5, multiplyAddValue6);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[105u];
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue);
    float scalarValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue);
    float scalarValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue);
    precise float sumValue2 = scalarValue3 + vertexScalarConstants0.packedValues[112u];
    varyingColor3.z = scalarValue3;
    gl_Position.x = scalarValue;
    gl_Position.y = scalarValue1;
    gl_Position.z = sumValue2;
    gl_Position.w = scalarValue2;
    varyingColor3.x = scalarValue;
    varyingColor3.y = scalarValue1;
    varyingColor3.w = scalarValue2;
    precise float quotientValue = sumValue2 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue3 = quotientValue - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue10 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u];
    precise float productValue11 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue12 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue13 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, productValue11)) + vertexVectorConstants0.packedValues[13u].x;
    precise float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, productValue12)) + vertexVectorConstants0.packedValues[13u].y;
    precise float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, productValue13)) + vertexVectorConstants0.packedValues[13u].z;
    precise float productValue14 = multiplyAddValue37 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue15 = multiplyAddValue37 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue16 = multiplyAddValue37 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue17 = multiplyAddValue37 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue36;
    varyingTexCoord3.y = multiplyAddValue37;
    varyingTexCoord3.z = multiplyAddValue38;
    precise float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue36, productValue14)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue36, productValue15)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue36, productValue16)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue36, productValue17)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue1 = vec4(multiplyAddValue39, multiplyAddValue40, multiplyAddValue41, multiplyAddValue42);
    float scalarValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue10, vertexScalarConstants0.packedValues[12u]), vectorValue1);
    precise float sumValue11 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u];
    float scalarValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue11, vertexScalarConstants0.packedValues[13u]), vectorValue1);
    float scalarValue8 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue1);
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue1);
    precise float sumValue12 = scalarValue9 + vertexScalarConstants0.packedValues[120u];
    varyingColor3.z = scalarValue9;
    gl_Position.x = scalarValue6;
    gl_Position.y = scalarValue7;
    gl_Position.z = sumValue12;
    gl_Position.w = scalarValue8;
    varyingColor3.x = scalarValue6;
    varyingColor3.y = scalarValue7;
    varyingColor3.w = scalarValue8;
    precise float quotientValue2 = sumValue12 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue13 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[10u].x)) + vertexVectorConstants0.packedValues[12u].x;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[10u].y)) + vertexVectorConstants0.packedValues[12u].y;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[10u].z)) + vertexVectorConstants0.packedValues[12u].z;
    varyingTexCoord3.x = multiplyAddValue18;
    varyingTexCoord3.y = multiplyAddValue19;
    varyingTexCoord3.z = multiplyAddValue20;
    vec4 multiplyAddValue21 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue18, multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue18, multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue18, multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue18, multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[104u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue21);
    float sumValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[105u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue21);
    float scalarValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue21);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue21);
    float sumValue8 = scalarValue5 + vertexScalarConstants0.packedValues[112u];
    varyingColor3.z = scalarValue5;
    gl_Position.x = sumValue6;
    gl_Position.y = sumValue7;
    gl_Position.z = sumValue8;
    gl_Position.w = scalarValue4;
    varyingColor3.x = sumValue6;
    varyingColor3.y = sumValue7;
    varyingColor3.w = scalarValue4;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z)) + vertexVectorConstants0.packedValues[13u].z;
    varyingTexCoord3.x = multiplyAddValue47;
    varyingTexCoord3.y = multiplyAddValue48;
    varyingTexCoord3.z = multiplyAddValue49;
    vec4 multiplyAddValue50 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue47, multiplyAddValue48 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue47, multiplyAddValue48 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue47, multiplyAddValue48 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue47, multiplyAddValue48 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue50);
    float sumValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue50);
    float scalarValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue50);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue50);
    float sumValue16 = scalarValue11 + vertexScalarConstants0.packedValues[120u];
    varyingColor3.z = scalarValue11;
    gl_Position.x = sumValue14;
    gl_Position.y = sumValue15;
    gl_Position.z = sumValue16;
    gl_Position.w = scalarValue10;
    varyingColor3.x = sumValue14;
    varyingColor3.y = sumValue15;
    varyingColor3.w = scalarValue10;
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[9u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[12u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[9u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[12u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[9u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[12u].z;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[26u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[26u].y, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].w)));
    float sumValue5 = vertexVectorConstants0.packedValues[28u].x + multiplyAddValue16;
    gl_Position.x = multiplyAddValue14;
    gl_Position.y = multiplyAddValue15;
    gl_Position.z = sumValue5;
    gl_Position.w = multiplyAddValue17;
    varyingColor3.x = multiplyAddValue14;
    varyingColor3.y = multiplyAddValue15;
    varyingColor3.z = multiplyAddValue16;
    varyingColor3.w = multiplyAddValue17;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].z;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue23, multiplyAddValue22 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue23, multiplyAddValue22 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue23, multiplyAddValue22 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue23, multiplyAddValue22 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[27u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[27u].y, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].w)));
    float sumValue9 = vertexVectorConstants0.packedValues[30u].x + multiplyAddValue31;
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[13u].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].x * vertexNormal0.x)));
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[13u].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].y * vertexNormal0.x)));
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[13u].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].z * vertexNormal0.x)));
    float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue33, multiplyAddValue34, multiplyAddValue35), vec3(multiplyAddValue33, multiplyAddValue34, multiplyAddValue35)));
    float productValue7 = inverseLengthValue * multiplyAddValue33;
    float productValue8 = inverseLengthValue * multiplyAddValue35;
    float productValue9 = ((0.449999988079071044921875 - ((productValue7 * productValue7) * 0.100000001490116119384765625)) + ((productValue8 * productValue8) * 0.100000001490116119384765625)) + ((((inverseLengthValue * multiplyAddValue34) * vertexVectorConstants0.packedValues[28u].w) + 1.0) * 0.2750000059604644775390625);
    float productValue10 = vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375;
    gl_Position.x = multiplyAddValue29;
    gl_Position.y = multiplyAddValue30;
    gl_Position.z = sumValue9;
    gl_Position.w = multiplyAddValue32;
    varyingColor3.x = multiplyAddValue29;
    varyingColor3.y = multiplyAddValue30;
    varyingColor3.z = multiplyAddValue31;
    varyingColor3.w = multiplyAddValue32;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue4 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue3 / sumValue4;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor1.x = 0.0;
    varyingColor1.y = 0.0;
    varyingColor1.z = 0.0;
    varyingColor1.w = 0.0;
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[27u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[27u].w, vertexVectorConstants0.packedValues[27u].y);
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue4 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue13 / sumValue4;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue18 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue19 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue20 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[13u].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, productValue18)));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[13u].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, productValue19)));
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[13u].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, productValue20)));
    vec3 vectorValue2 = vec3(multiplyAddValue43, multiplyAddValue44, multiplyAddValue45);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    precise float productValue21 = inverseLengthValue1 * multiplyAddValue43;
    precise float productValue22 = inverseLengthValue1 * multiplyAddValue44;
    precise float productValue23 = inverseLengthValue1 * multiplyAddValue45;
    precise float productValue24 = productValue21 * productValue21;
    precise float productValue25 = productValue23 * productValue23;
    precise float productValue26 = productValue24 * (-0.100000001490116119384765625);
    precise float multiplyAddValue46 = fma(productValue25, 0.100000001490116119384765625, fma(fma(productValue22, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, productValue26)) + 0.449999988079071044921875;
    precise float productValue27 = multiplyAddValue46 * vertexVectorConstants0.packedValues[28u].x;
    precise float productValue28 = multiplyAddValue46 * vertexVectorConstants0.packedValues[28u].y;
    precise float productValue29 = multiplyAddValue46 * vertexVectorConstants0.packedValues[28u].z;
    varyingColor1.x = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, productValue27);
    varyingColor1.y = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, productValue28);
    varyingColor1.z = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, productValue29);
    varyingColor1.w = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[29u].z, vertexVectorConstants0.packedValues[29u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[29u].w, vertexVectorConstants0.packedValues[29u].y);
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((sumValue8 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor1.x = 0.0;
    varyingColor1.y = 0.0;
    varyingColor1.z = 0.0;
    varyingColor1.w = 0.0;
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[27u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[27u].w, vertexVectorConstants0.packedValues[27u].y);
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((sumValue16 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[13u].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x)));
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[13u].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y)));
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[13u].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z)));
    vec3 vectorValue3 = vec3(multiplyAddValue51, multiplyAddValue52, multiplyAddValue53);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    float productValue30 = inverseLengthValue2 * multiplyAddValue51;
    float productValue31 = inverseLengthValue2 * multiplyAddValue53;
    float multiplyAddValue54 = fma(productValue31 * productValue31, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue52, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, (productValue30 * productValue30) * (-0.100000001490116119384765625))) + 0.449999988079071044921875;
    varyingColor1.x = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue54 * vertexVectorConstants0.packedValues[28u].x);
    varyingColor1.y = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue54 * vertexVectorConstants0.packedValues[28u].y);
    varyingColor1.z = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue54 * vertexVectorConstants0.packedValues[28u].z);
    varyingColor1.w = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[29u].z, vertexVectorConstants0.packedValues[29u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[29u].w, vertexVectorConstants0.packedValues[29u].y);
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor2.w = spvNClamp(((sumValue5 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = 0.0;
    varyingColor1.y = 0.0;
    varyingColor1.z = 0.0;
    varyingColor1.w = 0.0;
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[27u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[27u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((sumValue9 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = (productValue9 * vertexVectorConstants0.packedValues[28u].x) + productValue10;
    varyingColor1.y = (productValue9 * vertexVectorConstants0.packedValues[28u].y) + productValue10;
    varyingColor1.z = (productValue9 * vertexVectorConstants0.packedValues[28u].z) + productValue10;
    varyingColor1.w = productValue10 + 1.0;
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[29u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[29u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[29u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[29u].y;
    varyingTexCoord3.x = multiplyAddValue22;
    varyingTexCoord3.y = multiplyAddValue23;
    varyingTexCoord3.z = multiplyAddValue24;
#endif
}
