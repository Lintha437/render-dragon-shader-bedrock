#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandColor / AlphaTest / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
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
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/ItemInHandColor/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u];
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[13u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[13u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[13u].z;
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
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u];
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue);
    float scalarValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue);
    float scalarValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue);
    gl_Position.x = scalarValue;
    gl_Position.y = scalarValue1;
    gl_Position.z = scalarValue3;
    gl_Position.w = scalarValue2;
    varyingColor3.x = scalarValue;
    varyingColor3.y = scalarValue1;
    varyingColor3.z = scalarValue3;
    varyingColor3.w = scalarValue2;
    precise float quotientValue = scalarValue3 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue2 = quotientValue - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue6 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u];
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue15 = scalarValue8 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue16 = scalarValue8 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue17 = scalarValue8 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue18 = scalarValue8 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue9 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    precise float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, productValue15)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, productValue16)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, productValue17)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, productValue18)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38, multiplyAddValue39);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue6, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue7 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u];
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue7, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    gl_Position.x = scalarValue11;
    gl_Position.y = scalarValue12;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue13;
    varyingColor3.x = scalarValue11;
    varyingColor3.y = scalarValue12;
    varyingColor3.z = scalarValue14;
    varyingColor3.w = scalarValue13;
    precise float quotientValue2 = scalarValue14 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue8 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u];
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue15 = scalarValue8 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue16 = scalarValue8 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue17 = scalarValue8 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue18 = scalarValue8 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue9 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    precise float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, productValue15)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, productValue16)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, productValue17)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, productValue18)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38, multiplyAddValue39);
    float scalarValue17 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u];
    float scalarValue18 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    gl_Position.x = scalarValue17;
    gl_Position.y = scalarValue18;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue13;
    varyingColor3.x = scalarValue17;
    varyingColor3.y = scalarValue18;
    varyingColor3.z = scalarValue14;
    varyingColor3.w = scalarValue13;
    precise float quotientValue2 = scalarValue14 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue8 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z)) + vertexVectorConstants0.packedValues[13u].z;
    varyingTexCoord3.x = multiplyAddValue10;
    varyingTexCoord3.y = multiplyAddValue11;
    varyingTexCoord3.z = multiplyAddValue12;
    vec4 multiplyAddValue13 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue13);
    float sumValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue13);
    float scalarValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue13);
    float scalarValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue13);
    gl_Position.x = sumValue4;
    gl_Position.y = sumValue5;
    gl_Position.z = scalarValue7;
    gl_Position.w = scalarValue6;
    varyingColor3.x = sumValue4;
    varyingColor3.y = sumValue5;
    varyingColor3.z = scalarValue7;
    varyingColor3.w = scalarValue6;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue9 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    vec4 multiplyAddValue40 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue40);
    float sumValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue40);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue40);
    float scalarValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue40);
    gl_Position.x = sumValue9;
    gl_Position.y = sumValue10;
    gl_Position.z = scalarValue16;
    gl_Position.w = scalarValue15;
    varyingColor3.x = sumValue9;
    varyingColor3.y = sumValue10;
    varyingColor3.z = scalarValue16;
    varyingColor3.w = scalarValue15;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue9 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    vec4 multiplyAddValue40 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue40);
    float sumValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue40);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue40);
    float scalarValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue40);
    gl_Position.x = sumValue11;
    gl_Position.y = sumValue12;
    gl_Position.z = scalarValue16;
    gl_Position.w = scalarValue15;
    varyingColor3.x = sumValue11;
    varyingColor3.y = sumValue12;
    varyingColor3.z = scalarValue16;
    varyingColor3.w = scalarValue15;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue14 = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].z;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[27u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[27u].y, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue12 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue13 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = multiplyAddValue21;
    gl_Position.y = multiplyAddValue22;
    gl_Position.z = multiplyAddValue23;
    gl_Position.w = multiplyAddValue24;
    varyingColor3.x = multiplyAddValue21;
    varyingColor3.y = multiplyAddValue22;
    varyingColor3.z = multiplyAddValue23;
    varyingColor3.w = multiplyAddValue24;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue14 = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue25 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue26 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue27 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[11u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[11u].y, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue12 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue13 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = multiplyAddValue32;
    gl_Position.y = multiplyAddValue33;
    gl_Position.z = multiplyAddValue34;
    gl_Position.w = multiplyAddValue35;
    varyingColor3.x = multiplyAddValue32;
    varyingColor3.y = multiplyAddValue33;
    varyingColor3.z = multiplyAddValue34;
    varyingColor3.w = multiplyAddValue35;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].x * vertexNormal0.x));
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].y * vertexNormal0.x));
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].z * vertexNormal0.x));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].w, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].w * vertexNormal0.x));
    float inverseLengthValue = inversesqrt(dot(vec4(multiplyAddValue41, multiplyAddValue42, multiplyAddValue43, multiplyAddValue44), vec4(multiplyAddValue41, multiplyAddValue42, multiplyAddValue43, multiplyAddValue44)));
    float productValue22 = inverseLengthValue * multiplyAddValue41;
    float productValue23 = inverseLengthValue * multiplyAddValue43;
    float productValue24 = (((0.449999988079071044921875 - ((productValue22 * productValue22) * 0.100000001490116119384765625)) + ((productValue23 * productValue23) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue42 * vertexVectorConstants0.packedValues[28u].w) * inverseLengthValue) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].z;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[27u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[27u].y, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue12 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue13 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = multiplyAddValue21;
    gl_Position.y = multiplyAddValue22;
    gl_Position.z = multiplyAddValue23;
    gl_Position.w = multiplyAddValue24;
    varyingColor3.x = multiplyAddValue21;
    varyingColor3.y = multiplyAddValue22;
    varyingColor3.z = multiplyAddValue23;
    varyingColor3.w = multiplyAddValue24;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].x * vertexNormal0.x));
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].y * vertexNormal0.x));
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].z * vertexNormal0.x));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].w, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].w * vertexNormal0.x));
    float inverseLengthValue = inversesqrt(dot(vec4(multiplyAddValue41, multiplyAddValue42, multiplyAddValue43, multiplyAddValue44), vec4(multiplyAddValue41, multiplyAddValue42, multiplyAddValue43, multiplyAddValue44)));
    float productValue22 = inverseLengthValue * multiplyAddValue41;
    float productValue23 = inverseLengthValue * multiplyAddValue43;
    float productValue24 = (((0.449999988079071044921875 - ((productValue22 * productValue22) * 0.100000001490116119384765625)) + ((productValue23 * productValue23) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue42 * vertexVectorConstants0.packedValues[28u].w) * inverseLengthValue) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue25 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue26 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue27 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[27u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[27u].y, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue12 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue13 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = multiplyAddValue51;
    gl_Position.y = multiplyAddValue52;
    gl_Position.z = multiplyAddValue34;
    gl_Position.w = multiplyAddValue35;
    varyingColor3.x = multiplyAddValue51;
    varyingColor3.y = multiplyAddValue52;
    varyingColor3.z = multiplyAddValue34;
    varyingColor3.w = multiplyAddValue35;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue2 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue7 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue7 = multiplyAddValue7 * vertexVectorConstants0.packedValues[28u].x;
    precise float productValue8 = multiplyAddValue7 * vertexVectorConstants0.packedValues[28u].y;
    precise float productValue9 = multiplyAddValue7 * vertexVectorConstants0.packedValues[28u].z;
    varyingColor1.x = productValue7;
    varyingColor1.y = productValue8;
    varyingColor1.z = productValue9;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue8 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue7 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue19 = multiplyAddValue7 * vertexVectorConstants0.packedValues[12u].x;
    precise float productValue20 = multiplyAddValue7 * vertexVectorConstants0.packedValues[12u].y;
    precise float productValue21 = multiplyAddValue7 * vertexVectorConstants0.packedValues[12u].z;
    varyingColor1.x = productValue19;
    varyingColor1.y = productValue20;
    varyingColor1.z = productValue21;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue2 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue25 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue26 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue27 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float productValue28 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w;
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, productValue25));
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, productValue26));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, productValue27));
    vec4 multiplyAddValue48 = vec4(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, productValue28)));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue48, multiplyAddValue48));
    precise float productValue29 = inverseLengthValue1 * multiplyAddValue45;
    precise float productValue30 = inverseLengthValue1 * multiplyAddValue46;
    precise float productValue31 = inverseLengthValue1 * multiplyAddValue47;
    precise float productValue32 = productValue29 * productValue29;
    precise float productValue33 = productValue31 * productValue31;
    precise float productValue34 = productValue32 * (-0.100000001490116119384765625);
    precise float multiplyAddValue49 = fma(productValue33, 0.100000001490116119384765625, fma(fma(productValue30, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, productValue34)) + 0.449999988079071044921875;
    float multiplyAddValue50 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue49);
    precise float productValue35 = multiplyAddValue50 * vertexVectorConstants0.packedValues[28u].x;
    precise float productValue36 = multiplyAddValue50 * vertexVectorConstants0.packedValues[28u].y;
    precise float productValue37 = multiplyAddValue50 * vertexVectorConstants0.packedValues[28u].z;
    varyingColor1.x = productValue35;
    varyingColor1.y = productValue36;
    varyingColor1.z = productValue37;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue8 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue25 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue26 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue27 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float productValue28 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w;
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, productValue25));
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, productValue26));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, productValue27));
    vec4 multiplyAddValue48 = vec4(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, productValue28)));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue48, multiplyAddValue48));
    precise float productValue29 = inverseLengthValue1 * multiplyAddValue45;
    precise float productValue30 = inverseLengthValue1 * multiplyAddValue46;
    precise float productValue31 = inverseLengthValue1 * multiplyAddValue47;
    precise float productValue32 = productValue29 * productValue29;
    precise float productValue33 = productValue31 * productValue31;
    precise float productValue34 = productValue32 * (-0.100000001490116119384765625);
    precise float multiplyAddValue49 = fma(productValue33, 0.100000001490116119384765625, fma(fma(productValue30, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, productValue34)) + 0.449999988079071044921875;
    float multiplyAddValue50 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue49);
    precise float productValue35 = multiplyAddValue50 * vertexVectorConstants0.packedValues[28u].x;
    precise float productValue36 = multiplyAddValue50 * vertexVectorConstants0.packedValues[28u].y;
    precise float productValue37 = multiplyAddValue50 * vertexVectorConstants0.packedValues[28u].z;
    varyingColor1.x = productValue35;
    varyingColor1.y = productValue36;
    varyingColor1.z = productValue37;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue7 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue7 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor1.x = multiplyAddValue7 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = multiplyAddValue7 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = multiplyAddValue7 * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue16 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue7 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor1.x = multiplyAddValue7 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor1.y = multiplyAddValue7 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor1.z = multiplyAddValue7 * vertexVectorConstants0.packedValues[12u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue7 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x));
    float multiplyAddValue54 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y));
    float multiplyAddValue55 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z));
    vec4 multiplyAddValue56 = vec4(multiplyAddValue53, multiplyAddValue54, multiplyAddValue55, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w)));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue56, multiplyAddValue56));
    float productValue38 = inverseLengthValue2 * multiplyAddValue53;
    float productValue39 = inverseLengthValue2 * multiplyAddValue55;
    float multiplyAddValue57 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue39 * productValue39, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue54, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, (productValue38 * productValue38) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor1.x = multiplyAddValue57 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = multiplyAddValue57 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = multiplyAddValue57 * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue16 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x));
    float multiplyAddValue54 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y));
    float multiplyAddValue55 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z));
    vec4 multiplyAddValue56 = vec4(multiplyAddValue53, multiplyAddValue54, multiplyAddValue55, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w)));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue56, multiplyAddValue56));
    float productValue38 = inverseLengthValue2 * multiplyAddValue53;
    float productValue39 = inverseLengthValue2 * multiplyAddValue55;
    float multiplyAddValue57 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue39 * productValue39, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue54, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, (productValue38 * productValue38) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor1.x = multiplyAddValue57 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = multiplyAddValue57 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = multiplyAddValue57 * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue23 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = productValue14 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = productValue14 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = productValue14 * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue34 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = productValue14 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor1.y = productValue14 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor1.z = productValue14 * vertexVectorConstants0.packedValues[12u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue23 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = productValue24 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = productValue24 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = productValue24 * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue34 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = productValue24 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = productValue24 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = productValue24 * vertexVectorConstants0.packedValues[28u].z;
#endif
    varyingColor1.w = 1.0;
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue10 = vertexTexCoord0.x * 65535.0;
    precise float productValue11 = vertexTexCoord0.y * 65535.0;
    uint scalarValue4 = uint(roundEven(productValue10));
    uint scalarValue5 = uint(roundEven(productValue11));
    precise float multiplyAddValue8 = fma(rdEvaluateFloatExpression((scalarValue4 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue9 = fma(rdEvaluateFloatExpression((scalarValue5 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression((scalarValue4 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue8);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression((scalarValue5 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue9);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue12 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue13 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue12, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue12, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue13, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue13, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = ((float((productValue12 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue12 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue13 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue13 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue14;
    varyingTexCoord3.y = multiplyAddValue15;
    varyingTexCoord3.z = multiplyAddValue16;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = ((float((productValue12 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue12 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue13 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue13 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue25;
    varyingTexCoord3.y = multiplyAddValue26;
    varyingTexCoord3.z = multiplyAddValue27;
#endif
}
