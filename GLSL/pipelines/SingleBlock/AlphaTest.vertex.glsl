#version 460
#extension GL_GOOGLE_include_directive : require
// SingleBlock / AlphaTest / vertex forward pipeline.
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/SingleBlock/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue1 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[104u];
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[10u].x;
    precise float productValue3 = vertexPosition0.y * vertexVectorConstants0.packedValues[10u].y;
    precise float productValue4 = vertexPosition0.y * vertexVectorConstants0.packedValues[10u].z;
    precise float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[12u].x;
    precise float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.x, productValue3)) + vertexVectorConstants0.packedValues[12u].y;
    precise float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.x, productValue4)) + vertexVectorConstants0.packedValues[12u].z;
    precise float productValue5 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue6 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue7 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue8 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue11;
    varyingTexCoord3.y = multiplyAddValue12;
    varyingTexCoord3.z = multiplyAddValue13;
    precise float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue11, productValue5)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue11, productValue6)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue11, productValue7)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue11, productValue8)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16, multiplyAddValue17);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue1, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue2 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[105u];
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue2, vertexScalarConstants0.packedValues[13u]), vectorValue);
    float scalarValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue);
    float scalarValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue);
    precise float sumValue3 = scalarValue3 + vertexScalarConstants0.packedValues[112u];
    varyingColor3.z = scalarValue3;
    gl_Position.x = scalarValue;
    gl_Position.y = scalarValue1;
    gl_Position.z = sumValue3;
    gl_Position.w = scalarValue2;
    varyingColor3.x = scalarValue;
    varyingColor3.y = scalarValue1;
    varyingColor3.w = scalarValue2;
    precise float quotientValue = sumValue3 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue4 = quotientValue - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue10 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u];
    precise float productValue15 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue16 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue17 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, productValue15)) + vertexVectorConstants0.packedValues[13u].x;
    precise float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, productValue16)) + vertexVectorConstants0.packedValues[13u].y;
    precise float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, productValue17)) + vertexVectorConstants0.packedValues[13u].z;
    precise float productValue18 = multiplyAddValue39 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue19 = multiplyAddValue39 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue20 = multiplyAddValue39 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue21 = multiplyAddValue39 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue38;
    varyingTexCoord3.y = multiplyAddValue39;
    varyingTexCoord3.z = multiplyAddValue40;
    precise float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue38, productValue18)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue38, productValue19)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue38, productValue20)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue38, productValue21)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue1 = vec4(multiplyAddValue41, multiplyAddValue42, multiplyAddValue43, multiplyAddValue44);
    float scalarValue8 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue10, vertexScalarConstants0.packedValues[12u]), vectorValue1);
    precise float sumValue11 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u];
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue11, vertexScalarConstants0.packedValues[13u]), vectorValue1);
    float scalarValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue1);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue1);
    precise float sumValue12 = scalarValue11 + vertexScalarConstants0.packedValues[120u];
    varyingColor3.z = scalarValue11;
    gl_Position.x = scalarValue8;
    gl_Position.y = scalarValue9;
    gl_Position.z = sumValue12;
    gl_Position.w = scalarValue10;
    varyingColor3.x = scalarValue8;
    varyingColor3.y = scalarValue9;
    varyingColor3.w = scalarValue10;
    precise float quotientValue2 = sumValue12 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue13 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[10u].x)) + vertexVectorConstants0.packedValues[12u].x;
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[10u].y)) + vertexVectorConstants0.packedValues[12u].y;
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[10u].z)) + vertexVectorConstants0.packedValues[12u].z;
    varyingTexCoord3.x = multiplyAddValue20;
    varyingTexCoord3.y = multiplyAddValue21;
    varyingTexCoord3.z = multiplyAddValue22;
    vec4 multiplyAddValue23 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[104u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue23);
    float sumValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[105u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue23);
    float scalarValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue23);
    float scalarValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue23);
    float sumValue8 = scalarValue7 + vertexScalarConstants0.packedValues[112u];
    varyingColor3.z = scalarValue7;
    gl_Position.x = sumValue6;
    gl_Position.y = sumValue7;
    gl_Position.z = sumValue8;
    gl_Position.w = scalarValue6;
    varyingColor3.x = sumValue6;
    varyingColor3.y = sumValue7;
    varyingColor3.w = scalarValue6;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue50 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z)) + vertexVectorConstants0.packedValues[13u].z;
    varyingTexCoord3.x = multiplyAddValue49;
    varyingTexCoord3.y = multiplyAddValue50;
    varyingTexCoord3.z = multiplyAddValue51;
    vec4 multiplyAddValue52 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue51, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue49, multiplyAddValue50 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue51, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue49, multiplyAddValue50 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue51, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue49, multiplyAddValue50 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue51, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue49, multiplyAddValue50 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue52);
    float sumValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue52);
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue52);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue52);
    float sumValue16 = scalarValue13 + vertexScalarConstants0.packedValues[120u];
    varyingColor3.z = scalarValue13;
    gl_Position.x = sumValue14;
    gl_Position.y = sumValue15;
    gl_Position.z = sumValue16;
    gl_Position.w = scalarValue12;
    varyingColor3.x = sumValue14;
    varyingColor3.y = sumValue15;
    varyingColor3.w = scalarValue12;
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[9u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[12u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[9u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[12u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[9u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[12u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[26u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[26u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float sumValue = vertexVectorConstants0.packedValues[28u].x + multiplyAddValue9;
    gl_Position.x = multiplyAddValue7;
    gl_Position.y = multiplyAddValue8;
    gl_Position.z = sumValue;
    gl_Position.w = multiplyAddValue10;
    varyingColor3.x = multiplyAddValue7;
    varyingColor3.y = multiplyAddValue8;
    varyingColor3.z = multiplyAddValue9;
    varyingColor3.w = multiplyAddValue10;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].z;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue25, multiplyAddValue24 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue25, multiplyAddValue24 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue25, multiplyAddValue24 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue25, multiplyAddValue24 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[27u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[27u].y, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float sumValue9 = vertexVectorConstants0.packedValues[30u].x + multiplyAddValue33;
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[13u].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].x * vertexNormal0.x)));
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[13u].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].y * vertexNormal0.x)));
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[13u].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].z * vertexNormal0.x)));
    float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37), vec3(multiplyAddValue35, multiplyAddValue36, multiplyAddValue37)));
    float productValue11 = inverseLengthValue * multiplyAddValue35;
    float productValue12 = inverseLengthValue * multiplyAddValue37;
    float productValue13 = ((0.449999988079071044921875 - ((productValue11 * productValue11) * 0.100000001490116119384765625)) + ((productValue12 * productValue12) * 0.100000001490116119384765625)) + ((((inverseLengthValue * multiplyAddValue36) * vertexVectorConstants0.packedValues[28u].w) + 1.0) * 0.2750000059604644775390625);
    float productValue14 = vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375;
    gl_Position.x = multiplyAddValue31;
    gl_Position.y = multiplyAddValue32;
    gl_Position.z = sumValue9;
    gl_Position.w = multiplyAddValue34;
    varyingColor3.x = multiplyAddValue31;
    varyingColor3.y = multiplyAddValue32;
    varyingColor3.z = multiplyAddValue33;
    varyingColor3.w = multiplyAddValue34;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue5 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue4 / sumValue5;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor1.x = 0.0;
    varyingColor1.y = 0.0;
    varyingColor1.z = 0.0;
    varyingColor1.w = 0.0;
    precise float productValue9 = vertexTexCoord0.x * 65535.0;
    precise float productValue10 = vertexTexCoord0.y * 65535.0;
    uint scalarValue4 = uint(roundEven(productValue9));
    uint scalarValue5 = uint(roundEven(productValue10));
    precise float multiplyAddValue18 = fma(rdEvaluateFloatExpression((scalarValue4 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue19 = fma(rdEvaluateFloatExpression((scalarValue5 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(fma(rdEvaluateFloatExpression((scalarValue4 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue18), vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[27u].x);
    varyingTexCoord0.y = fma(fma(rdEvaluateFloatExpression((scalarValue5 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue19), vertexVectorConstants0.packedValues[27u].w, vertexVectorConstants0.packedValues[27u].y);
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue5 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue13 / sumValue5;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue22 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue23 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue24 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[13u].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, productValue22)));
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[13u].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, productValue23)));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[13u].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, productValue24)));
    vec3 vectorValue2 = vec3(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47);
    float inverseLengthValue1 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    precise float productValue25 = inverseLengthValue1 * multiplyAddValue45;
    precise float productValue26 = inverseLengthValue1 * multiplyAddValue46;
    precise float productValue27 = inverseLengthValue1 * multiplyAddValue47;
    precise float productValue28 = productValue25 * productValue25;
    precise float productValue29 = productValue27 * productValue27;
    precise float productValue30 = productValue28 * (-0.100000001490116119384765625);
    precise float multiplyAddValue48 = fma(productValue29, 0.100000001490116119384765625, fma(fma(productValue26, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, productValue30)) + 0.449999988079071044921875;
    precise float productValue31 = multiplyAddValue48 * vertexVectorConstants0.packedValues[28u].x;
    precise float productValue32 = multiplyAddValue48 * vertexVectorConstants0.packedValues[28u].y;
    precise float productValue33 = multiplyAddValue48 * vertexVectorConstants0.packedValues[28u].z;
    varyingColor1.x = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, productValue31);
    varyingColor1.y = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, productValue32);
    varyingColor1.z = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, productValue33);
    varyingColor1.w = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue9 = vertexTexCoord0.x * 65535.0;
    precise float productValue10 = vertexTexCoord0.y * 65535.0;
    uint scalarValue4 = uint(roundEven(productValue9));
    uint scalarValue5 = uint(roundEven(productValue10));
    precise float multiplyAddValue18 = fma(rdEvaluateFloatExpression((scalarValue4 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue19 = fma(rdEvaluateFloatExpression((scalarValue5 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(fma(rdEvaluateFloatExpression((scalarValue4 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue18), vertexVectorConstants0.packedValues[29u].z, vertexVectorConstants0.packedValues[29u].x);
    varyingTexCoord0.y = fma(fma(rdEvaluateFloatExpression((scalarValue5 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue19), vertexVectorConstants0.packedValues[29u].w, vertexVectorConstants0.packedValues[29u].y);
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((sumValue8 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor1.x = 0.0;
    varyingColor1.y = 0.0;
    varyingColor1.z = 0.0;
    varyingColor1.w = 0.0;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05), vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[27u].x);
    varyingTexCoord0.y = fma(fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05), vertexVectorConstants0.packedValues[27u].w, vertexVectorConstants0.packedValues[27u].y);
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((sumValue16 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[13u].x, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x)));
    float multiplyAddValue54 = fma(vertexVectorConstants0.packedValues[13u].y, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y)));
    float multiplyAddValue55 = fma(vertexVectorConstants0.packedValues[13u].z, vertexNormal0.w, fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z)));
    vec3 vectorValue3 = vec3(multiplyAddValue53, multiplyAddValue54, multiplyAddValue55);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    float productValue34 = inverseLengthValue2 * multiplyAddValue53;
    float productValue35 = inverseLengthValue2 * multiplyAddValue55;
    float multiplyAddValue56 = fma(productValue35 * productValue35, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue54, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, (productValue34 * productValue34) * (-0.100000001490116119384765625))) + 0.449999988079071044921875;
    varyingColor1.x = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue56 * vertexVectorConstants0.packedValues[28u].x);
    varyingColor1.y = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue56 * vertexVectorConstants0.packedValues[28u].y);
    varyingColor1.z = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue56 * vertexVectorConstants0.packedValues[28u].z);
    varyingColor1.w = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05), vertexVectorConstants0.packedValues[29u].z, vertexVectorConstants0.packedValues[29u].x);
    varyingTexCoord0.y = fma(fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05), vertexVectorConstants0.packedValues[29u].w, vertexVectorConstants0.packedValues[29u].y);
#elif (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor2.w = spvNClamp(((sumValue / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = 0.0;
    varyingColor1.y = 0.0;
    varyingColor1.z = 0.0;
    varyingColor1.w = 0.0;
    varyingTexCoord0.x = ((((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05)) * vertexVectorConstants0.packedValues[27u].z) + vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord0.y = ((((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05)) * vertexVectorConstants0.packedValues[27u].w) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_LIT == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((sumValue9 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = (productValue13 * vertexVectorConstants0.packedValues[28u].x) + productValue14;
    varyingColor1.y = (productValue13 * vertexVectorConstants0.packedValues[28u].y) + productValue14;
    varyingColor1.z = (productValue13 * vertexVectorConstants0.packedValues[28u].z) + productValue14;
    varyingColor1.w = productValue14 + 1.0;
    varyingTexCoord0.x = ((((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05)) * vertexVectorConstants0.packedValues[29u].z) + vertexVectorConstants0.packedValues[29u].x;
    varyingTexCoord0.y = ((((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05)) * vertexVectorConstants0.packedValues[29u].w) + vertexVectorConstants0.packedValues[29u].y;
    varyingTexCoord3.x = multiplyAddValue24;
    varyingTexCoord3.y = multiplyAddValue25;
    varyingTexCoord3.z = multiplyAddValue26;
#endif
}
