#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandColorGlint / AlphaTest / vertex forward pipeline.
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
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/ItemInHandColorGlint/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue2 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u];
    precise float productValue3 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue4 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue5 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, productValue3)) + vertexVectorConstants0.packedValues[13u].x;
    precise float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, productValue4)) + vertexVectorConstants0.packedValues[13u].y;
    precise float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, productValue5)) + vertexVectorConstants0.packedValues[13u].z;
    precise float productValue6 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue7 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue8 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue9 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue11;
    varyingTexCoord3.y = multiplyAddValue12;
    varyingTexCoord3.z = multiplyAddValue13;
    precise float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue11, productValue6)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue11, productValue7)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue11, productValue8)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue11, productValue9)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16, multiplyAddValue17);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue2, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue3 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u];
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue3, vertexScalarConstants0.packedValues[13u]), vectorValue);
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
    precise float sumValue4 = quotientValue - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue17 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u];
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue8 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue19 = scalarValue8 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue20 = scalarValue8 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue21 = scalarValue8 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue22 = scalarValue8 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue9 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    precise float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, productValue19)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, productValue20)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, productValue21)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, productValue22)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue3 = vec4(multiplyAddValue40, multiplyAddValue41, multiplyAddValue42, multiplyAddValue43);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue17, vertexScalarConstants0.packedValues[12u]), vectorValue3);
    precise float sumValue18 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u];
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue18, vertexScalarConstants0.packedValues[13u]), vectorValue3);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue3);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue3);
    gl_Position.x = scalarValue11;
    gl_Position.y = scalarValue12;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue13;
    varyingColor3.x = scalarValue11;
    varyingColor3.y = scalarValue12;
    varyingColor3.z = scalarValue14;
    varyingColor3.w = scalarValue13;
    precise float quotientValue2 = scalarValue14 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue19 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue2 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u];
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue8 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue19 = scalarValue8 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue20 = scalarValue8 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue21 = scalarValue8 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue22 = scalarValue8 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue9 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    precise float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, productValue19)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, productValue20)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, productValue21)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, productValue22)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue3 = vec4(multiplyAddValue40, multiplyAddValue41, multiplyAddValue42, multiplyAddValue43);
    float scalarValue17 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue2, vertexScalarConstants0.packedValues[12u]), vectorValue3);
    precise float sumValue3 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u];
    float scalarValue18 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue3, vertexScalarConstants0.packedValues[13u]), vectorValue3);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue3);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue3);
    gl_Position.x = scalarValue17;
    gl_Position.y = scalarValue18;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue13;
    varyingColor3.x = scalarValue17;
    varyingColor3.y = scalarValue18;
    varyingColor3.z = scalarValue14;
    varyingColor3.w = scalarValue13;
    precise float quotientValue2 = scalarValue14 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue19 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z)) + vertexVectorConstants0.packedValues[13u].z;
    varyingTexCoord3.x = multiplyAddValue23;
    varyingTexCoord3.y = multiplyAddValue24;
    varyingTexCoord3.z = multiplyAddValue25;
    vec4 multiplyAddValue26 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue23, multiplyAddValue24 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue23, multiplyAddValue24 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue23, multiplyAddValue24 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue23, multiplyAddValue24 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue26);
    float sumValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue26);
    float scalarValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue26);
    float scalarValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue26);
    gl_Position.x = sumValue14;
    gl_Position.y = sumValue15;
    gl_Position.z = scalarValue7;
    gl_Position.w = scalarValue6;
    varyingColor3.x = sumValue14;
    varyingColor3.y = sumValue15;
    varyingColor3.z = scalarValue7;
    varyingColor3.w = scalarValue6;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue8 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue9 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    vec4 multiplyAddValue44 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue26 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue44);
    float sumValue27 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue44);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue44);
    float scalarValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue44);
    gl_Position.x = sumValue26;
    gl_Position.y = sumValue27;
    gl_Position.z = scalarValue16;
    gl_Position.w = scalarValue15;
    varyingColor3.x = sumValue26;
    varyingColor3.y = sumValue27;
    varyingColor3.z = scalarValue16;
    varyingColor3.w = scalarValue15;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue8 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue9 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    vec4 multiplyAddValue44 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue28 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue44);
    float sumValue29 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue44);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue44);
    float scalarValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue44);
    gl_Position.x = sumValue28;
    gl_Position.y = sumValue29;
    gl_Position.z = scalarValue16;
    gl_Position.w = scalarValue15;
    varyingColor3.x = sumValue28;
    varyingColor3.y = sumValue29;
    varyingColor3.z = scalarValue16;
    varyingColor3.w = scalarValue15;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float bitwiseValue = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float bitwiseValue1 = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float sumValue = bitwiseValue + (-0.5);
    float sumValue1 = bitwiseValue1 + (-0.5);
    float wavePhaseValue = sin(vertexVectorConstants0.packedValues[30u].z);
    float wavePhaseValue1 = cos(vertexVectorConstants0.packedValues[30u].z);
    float wavePhaseValue2 = sin(vertexVectorConstants0.packedValues[30u].w);
    float wavePhaseValue3 = cos(vertexVectorConstants0.packedValues[30u].w);
    float productValue2 = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue7;
    gl_Position.y = multiplyAddValue8;
    gl_Position.z = multiplyAddValue9;
    gl_Position.w = multiplyAddValue10;
    varyingColor3.x = multiplyAddValue7;
    varyingColor3.y = multiplyAddValue8;
    varyingColor3.z = multiplyAddValue9;
    varyingColor3.w = multiplyAddValue10;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float bitwiseValue = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float bitwiseValue1 = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float sumValue = bitwiseValue + (-0.5);
    float sumValue1 = bitwiseValue1 + (-0.5);
    float wavePhaseValue8 = sin(vertexVectorConstants0.packedValues[14u].z);
    float wavePhaseValue9 = cos(vertexVectorConstants0.packedValues[14u].z);
    float wavePhaseValue10 = sin(vertexVectorConstants0.packedValues[14u].w);
    float wavePhaseValue11 = cos(vertexVectorConstants0.packedValues[14u].w);
    float productValue2 = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue29 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue30 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue31 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[12u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[12u].y, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue36;
    gl_Position.y = multiplyAddValue37;
    gl_Position.z = multiplyAddValue38;
    gl_Position.w = multiplyAddValue39;
    varyingColor3.x = multiplyAddValue36;
    varyingColor3.y = multiplyAddValue37;
    varyingColor3.z = multiplyAddValue38;
    varyingColor3.w = multiplyAddValue39;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float bitwiseValue = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float bitwiseValue1 = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float sumValue = bitwiseValue + (-0.5);
    float sumValue1 = bitwiseValue1 + (-0.5);
    float wavePhaseValue = sin(vertexVectorConstants0.packedValues[30u].z);
    float wavePhaseValue1 = cos(vertexVectorConstants0.packedValues[30u].z);
    float wavePhaseValue2 = sin(vertexVectorConstants0.packedValues[30u].w);
    float wavePhaseValue3 = cos(vertexVectorConstants0.packedValues[30u].w);
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].x * vertexNormal0.x));
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].y * vertexNormal0.x));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].z * vertexNormal0.x));
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].w, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].w * vertexNormal0.x));
    float inverseLengthValue = inversesqrt(dot(vec4(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47, multiplyAddValue48), vec4(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47, multiplyAddValue48)));
    float productValue30 = inverseLengthValue * multiplyAddValue45;
    float productValue31 = inverseLengthValue * multiplyAddValue47;
    float productValue32 = (((0.449999988079071044921875 - ((productValue30 * productValue30) * 0.100000001490116119384765625)) + ((productValue31 * productValue31) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue46 * vertexVectorConstants0.packedValues[29u].w) * inverseLengthValue) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue7;
    gl_Position.y = multiplyAddValue8;
    gl_Position.z = multiplyAddValue9;
    gl_Position.w = multiplyAddValue10;
    varyingColor3.x = multiplyAddValue7;
    varyingColor3.y = multiplyAddValue8;
    varyingColor3.z = multiplyAddValue9;
    varyingColor3.w = multiplyAddValue10;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float bitwiseValue = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float bitwiseValue1 = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float sumValue = bitwiseValue + (-0.5);
    float sumValue1 = bitwiseValue1 + (-0.5);
    float wavePhaseValue = sin(vertexVectorConstants0.packedValues[30u].z);
    float wavePhaseValue1 = cos(vertexVectorConstants0.packedValues[30u].z);
    float wavePhaseValue2 = sin(vertexVectorConstants0.packedValues[30u].w);
    float wavePhaseValue3 = cos(vertexVectorConstants0.packedValues[30u].w);
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].x * vertexNormal0.x));
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].y * vertexNormal0.x));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].z * vertexNormal0.x));
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].w, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].w * vertexNormal0.x));
    float inverseLengthValue = inversesqrt(dot(vec4(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47, multiplyAddValue48), vec4(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47, multiplyAddValue48)));
    float productValue30 = inverseLengthValue * multiplyAddValue45;
    float productValue31 = inverseLengthValue * multiplyAddValue47;
    float productValue32 = (((0.449999988079071044921875 - ((productValue30 * productValue30) * 0.100000001490116119384765625)) + ((productValue31 * productValue31) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue46 * vertexVectorConstants0.packedValues[29u].w) * inverseLengthValue) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue29 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue30 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue31 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue50 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue49;
    gl_Position.y = multiplyAddValue50;
    gl_Position.z = multiplyAddValue38;
    gl_Position.w = multiplyAddValue39;
    varyingColor3.x = multiplyAddValue49;
    varyingColor3.y = multiplyAddValue50;
    varyingColor3.z = multiplyAddValue38;
    varyingColor3.w = multiplyAddValue39;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue5 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue4 / sumValue5;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue10 = vertexTexCoord0.x * 65535.0;
    precise float productValue11 = vertexTexCoord0.y * 65535.0;
    uint scalarValue4 = uint(roundEven(productValue10));
    uint scalarValue5 = uint(roundEven(productValue11));
    precise float multiplyAddValue18 = fma(rdEvaluateFloatExpression((scalarValue4 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue19 = fma(rdEvaluateFloatExpression((scalarValue5 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    float multiplyAddValue20 = fma(rdEvaluateFloatExpression((scalarValue4 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue18);
    float multiplyAddValue21 = fma(rdEvaluateFloatExpression((scalarValue5 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue19);
    precise float sumValue6 = multiplyAddValue20 - 0.5;
    precise float sumValue7 = multiplyAddValue21 - 0.5;
    varyingTexCoord0.x = multiplyAddValue20;
    varyingTexCoord0.y = multiplyAddValue21;
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 vectorValue1 = vec2(sumValue6, sumValue7);
    precise float sumValue8 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u];
    precise float sumValue9 = sumValue8 + 0.5;
    precise float sumValue10 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5;
    precise float productValue12 = sumValue9 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue13 = sumValue10 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.x = productValue12;
    varyingTexCoord2.y = productValue13;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    precise float sumValue11 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u];
    precise float sumValue12 = sumValue11 + 0.5;
    precise float sumValue13 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5;
    precise float productValue14 = sumValue12 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue15 = sumValue13 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.z = productValue14;
    varyingTexCoord2.w = productValue15;
    float multiplyAddValue22 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue16 = multiplyAddValue22 * vertexVectorConstants0.packedValues[29u].x;
    precise float productValue17 = multiplyAddValue22 * vertexVectorConstants0.packedValues[29u].y;
    precise float productValue18 = multiplyAddValue22 * vertexVectorConstants0.packedValues[29u].z;
    varyingColor1.x = productValue16;
    varyingColor1.y = productValue17;
    varyingColor1.z = productValue18;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue5 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue19 / sumValue5;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    precise float productValue10 = vertexTexCoord0.x * 65535.0;
    precise float productValue11 = vertexTexCoord0.y * 65535.0;
    uint scalarValue4 = uint(roundEven(productValue10));
    uint scalarValue5 = uint(roundEven(productValue11));
    precise float multiplyAddValue18 = fma(rdEvaluateFloatExpression((scalarValue4 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue19 = fma(rdEvaluateFloatExpression((scalarValue5 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    float multiplyAddValue20 = fma(rdEvaluateFloatExpression((scalarValue4 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue18);
    float multiplyAddValue21 = fma(rdEvaluateFloatExpression((scalarValue5 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue19);
    precise float sumValue6 = multiplyAddValue20 - 0.5;
    precise float sumValue7 = multiplyAddValue21 - 0.5;
    varyingTexCoord0.x = multiplyAddValue20;
    varyingTexCoord0.y = multiplyAddValue21;
    float wavePhaseValue12 = sin(vertexScalarConstants0.packedValues[58u]);
    float wavePhaseValue13 = cos(vertexScalarConstants0.packedValues[58u]);
    vec2 vectorValue1 = vec2(sumValue6, sumValue7);
    precise float sumValue20 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue13, wavePhaseValue12)) + vertexScalarConstants0.packedValues[56u];
    precise float sumValue21 = sumValue20 + 0.5;
    precise float sumValue22 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue12, wavePhaseValue13)) + 0.5;
    precise float productValue23 = sumValue21 * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue24 = sumValue22 * vertexVectorConstants0.packedValues[11u].y;
    varyingTexCoord2.x = productValue23;
    varyingTexCoord2.y = productValue24;
    float wavePhaseValue14 = sin(vertexScalarConstants0.packedValues[59u]);
    float wavePhaseValue15 = cos(vertexScalarConstants0.packedValues[59u]);
    precise float sumValue23 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue15, wavePhaseValue14)) + vertexScalarConstants0.packedValues[57u];
    precise float sumValue24 = sumValue23 + 0.5;
    precise float sumValue25 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue14, wavePhaseValue15)) + 0.5;
    precise float productValue25 = sumValue24 * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue26 = sumValue25 * vertexVectorConstants0.packedValues[11u].y;
    varyingTexCoord2.z = productValue25;
    varyingTexCoord2.w = productValue26;
    float multiplyAddValue22 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue27 = multiplyAddValue22 * vertexVectorConstants0.packedValues[13u].x;
    precise float productValue28 = multiplyAddValue22 * vertexVectorConstants0.packedValues[13u].y;
    precise float productValue29 = multiplyAddValue22 * vertexVectorConstants0.packedValues[13u].z;
    varyingColor1.x = productValue27;
    varyingColor1.y = productValue28;
    varyingColor1.z = productValue29;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue5 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue4 / sumValue5;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue10 = vertexTexCoord0.x * 65535.0;
    precise float productValue11 = vertexTexCoord0.y * 65535.0;
    uint scalarValue4 = uint(roundEven(productValue10));
    uint scalarValue5 = uint(roundEven(productValue11));
    precise float multiplyAddValue18 = fma(rdEvaluateFloatExpression((scalarValue4 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue19 = fma(rdEvaluateFloatExpression((scalarValue5 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    float multiplyAddValue20 = fma(rdEvaluateFloatExpression((scalarValue4 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue18);
    float multiplyAddValue21 = fma(rdEvaluateFloatExpression((scalarValue5 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue19);
    precise float sumValue6 = multiplyAddValue20 - 0.5;
    precise float sumValue7 = multiplyAddValue21 - 0.5;
    varyingTexCoord0.x = multiplyAddValue20;
    varyingTexCoord0.y = multiplyAddValue21;
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 vectorValue1 = vec2(sumValue6, sumValue7);
    precise float sumValue8 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u];
    precise float sumValue9 = sumValue8 + 0.5;
    precise float sumValue10 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5;
    precise float productValue12 = sumValue9 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue13 = sumValue10 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.x = productValue12;
    varyingTexCoord2.y = productValue13;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    precise float sumValue11 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u];
    precise float sumValue12 = sumValue11 + 0.5;
    precise float sumValue13 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5;
    precise float productValue14 = sumValue12 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue15 = sumValue13 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.z = productValue14;
    varyingTexCoord2.w = productValue15;
    precise float productValue33 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue34 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue35 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float productValue36 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w;
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, productValue33));
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, productValue34));
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, productValue35));
    vec4 multiplyAddValue54 = vec4(multiplyAddValue51, multiplyAddValue52, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, productValue36)));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue54, multiplyAddValue54));
    precise float productValue37 = inverseLengthValue1 * multiplyAddValue51;
    precise float productValue38 = inverseLengthValue1 * multiplyAddValue52;
    precise float productValue39 = inverseLengthValue1 * multiplyAddValue53;
    precise float productValue40 = productValue37 * productValue37;
    precise float productValue41 = productValue39 * productValue39;
    precise float productValue42 = productValue40 * (-0.100000001490116119384765625);
    precise float multiplyAddValue55 = fma(productValue41, 0.100000001490116119384765625, fma(fma(productValue38, vertexScalarConstants0.packedValues[119u], 1.0), 0.2750000059604644775390625, productValue42)) + 0.449999988079071044921875;
    float multiplyAddValue56 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue55);
    precise float productValue43 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].x;
    precise float productValue44 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].y;
    precise float productValue45 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].z;
    varyingColor1.x = productValue43;
    varyingColor1.y = productValue44;
    varyingColor1.z = productValue45;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue5 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue19 / sumValue5;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue10 = vertexTexCoord0.x * 65535.0;
    precise float productValue11 = vertexTexCoord0.y * 65535.0;
    uint scalarValue4 = uint(roundEven(productValue10));
    uint scalarValue5 = uint(roundEven(productValue11));
    precise float multiplyAddValue18 = fma(rdEvaluateFloatExpression((scalarValue4 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue19 = fma(rdEvaluateFloatExpression((scalarValue5 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    float multiplyAddValue20 = fma(rdEvaluateFloatExpression((scalarValue4 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue18);
    float multiplyAddValue21 = fma(rdEvaluateFloatExpression((scalarValue5 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue19);
    precise float sumValue6 = multiplyAddValue20 - 0.5;
    precise float sumValue7 = multiplyAddValue21 - 0.5;
    varyingTexCoord0.x = multiplyAddValue20;
    varyingTexCoord0.y = multiplyAddValue21;
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 vectorValue1 = vec2(sumValue6, sumValue7);
    precise float sumValue8 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u];
    precise float sumValue9 = sumValue8 + 0.5;
    precise float sumValue10 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5;
    precise float productValue12 = sumValue9 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue13 = sumValue10 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.x = productValue12;
    varyingTexCoord2.y = productValue13;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    precise float sumValue11 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u];
    precise float sumValue12 = sumValue11 + 0.5;
    precise float sumValue13 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5;
    precise float productValue14 = sumValue12 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue15 = sumValue13 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.z = productValue14;
    varyingTexCoord2.w = productValue15;
    precise float productValue33 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue34 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue35 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float productValue36 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w;
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, productValue33));
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, productValue34));
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, productValue35));
    vec4 multiplyAddValue54 = vec4(multiplyAddValue51, multiplyAddValue52, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, productValue36)));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue54, multiplyAddValue54));
    precise float productValue37 = inverseLengthValue1 * multiplyAddValue51;
    precise float productValue38 = inverseLengthValue1 * multiplyAddValue52;
    precise float productValue39 = inverseLengthValue1 * multiplyAddValue53;
    precise float productValue40 = productValue37 * productValue37;
    precise float productValue41 = productValue39 * productValue39;
    precise float productValue42 = productValue40 * (-0.100000001490116119384765625);
    precise float multiplyAddValue55 = fma(productValue41, 0.100000001490116119384765625, fma(fma(productValue38, vertexScalarConstants0.packedValues[119u], 1.0), 0.2750000059604644775390625, productValue42)) + 0.449999988079071044921875;
    float multiplyAddValue56 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue55);
    precise float productValue43 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].x;
    precise float productValue44 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].y;
    precise float productValue45 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].z;
    varyingColor1.x = productValue43;
    varyingColor1.y = productValue44;
    varyingColor1.z = productValue45;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue7 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float multiplyAddValue27 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    float multiplyAddValue28 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.x = multiplyAddValue27;
    varyingTexCoord0.y = multiplyAddValue28;
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 sumValue16 = vec2(multiplyAddValue27 - 0.5, multiplyAddValue28 - 0.5);
    varyingTexCoord2.x = ((rdDot2Precise(sumValue16, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.y = (rdDot2Precise(sumValue16, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    varyingTexCoord2.z = ((rdDot2Precise(sumValue16, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.w = (rdDot2Precise(sumValue16, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float multiplyAddValue22 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor1.x = multiplyAddValue22 * vertexVectorConstants0.packedValues[29u].x;
    varyingColor1.y = multiplyAddValue22 * vertexVectorConstants0.packedValues[29u].y;
    varyingColor1.z = multiplyAddValue22 * vertexVectorConstants0.packedValues[29u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue16 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float multiplyAddValue27 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    float multiplyAddValue28 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.x = multiplyAddValue27;
    varyingTexCoord0.y = multiplyAddValue28;
    float wavePhaseValue12 = sin(vertexScalarConstants0.packedValues[58u]);
    float wavePhaseValue13 = cos(vertexScalarConstants0.packedValues[58u]);
    vec2 sumValue16 = vec2(multiplyAddValue27 - 0.5, multiplyAddValue28 - 0.5);
    varyingTexCoord2.x = ((rdDot2Precise(sumValue16, vec2(wavePhaseValue13, wavePhaseValue12)) + vertexScalarConstants0.packedValues[56u]) + 0.5) * vertexVectorConstants0.packedValues[11u].x;
    varyingTexCoord2.y = (rdDot2Precise(sumValue16, vec2(-wavePhaseValue12, wavePhaseValue13)) + 0.5) * vertexVectorConstants0.packedValues[11u].y;
    float wavePhaseValue14 = sin(vertexScalarConstants0.packedValues[59u]);
    float wavePhaseValue15 = cos(vertexScalarConstants0.packedValues[59u]);
    varyingTexCoord2.z = ((rdDot2Precise(sumValue16, vec2(wavePhaseValue15, wavePhaseValue14)) + vertexScalarConstants0.packedValues[57u]) + 0.5) * vertexVectorConstants0.packedValues[11u].x;
    varyingTexCoord2.w = (rdDot2Precise(sumValue16, vec2(-wavePhaseValue14, wavePhaseValue15)) + 0.5) * vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue22 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor1.x = multiplyAddValue22 * vertexVectorConstants0.packedValues[13u].x;
    varyingColor1.y = multiplyAddValue22 * vertexVectorConstants0.packedValues[13u].y;
    varyingColor1.z = multiplyAddValue22 * vertexVectorConstants0.packedValues[13u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue7 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float multiplyAddValue27 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    float multiplyAddValue28 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.x = multiplyAddValue27;
    varyingTexCoord0.y = multiplyAddValue28;
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 sumValue16 = vec2(multiplyAddValue27 - 0.5, multiplyAddValue28 - 0.5);
    varyingTexCoord2.x = ((rdDot2Precise(sumValue16, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.y = (rdDot2Precise(sumValue16, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    varyingTexCoord2.z = ((rdDot2Precise(sumValue16, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.w = (rdDot2Precise(sumValue16, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float multiplyAddValue57 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x));
    float multiplyAddValue58 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y));
    float multiplyAddValue59 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z));
    vec4 multiplyAddValue60 = vec4(multiplyAddValue57, multiplyAddValue58, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w)));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue60, multiplyAddValue60));
    float productValue46 = inverseLengthValue2 * multiplyAddValue57;
    float productValue47 = inverseLengthValue2 * multiplyAddValue59;
    float multiplyAddValue61 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue47 * productValue47, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue58, vertexScalarConstants0.packedValues[119u], 1.0), 0.2750000059604644775390625, (productValue46 * productValue46) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor1.x = multiplyAddValue61 * vertexVectorConstants0.packedValues[29u].x;
    varyingColor1.y = multiplyAddValue61 * vertexVectorConstants0.packedValues[29u].y;
    varyingColor1.z = multiplyAddValue61 * vertexVectorConstants0.packedValues[29u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue16 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float multiplyAddValue27 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    float multiplyAddValue28 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.x = multiplyAddValue27;
    varyingTexCoord0.y = multiplyAddValue28;
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 sumValue16 = vec2(multiplyAddValue27 - 0.5, multiplyAddValue28 - 0.5);
    varyingTexCoord2.x = ((rdDot2Precise(sumValue16, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.y = (rdDot2Precise(sumValue16, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    varyingTexCoord2.z = ((rdDot2Precise(sumValue16, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.w = (rdDot2Precise(sumValue16, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float multiplyAddValue57 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x));
    float multiplyAddValue58 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y));
    float multiplyAddValue59 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z));
    vec4 multiplyAddValue60 = vec4(multiplyAddValue57, multiplyAddValue58, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w)));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue60, multiplyAddValue60));
    float productValue46 = inverseLengthValue2 * multiplyAddValue57;
    float productValue47 = inverseLengthValue2 * multiplyAddValue59;
    float multiplyAddValue61 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue47 * productValue47, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue58, vertexScalarConstants0.packedValues[119u], 1.0), 0.2750000059604644775390625, (productValue46 * productValue46) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor1.x = multiplyAddValue61 * vertexVectorConstants0.packedValues[29u].x;
    varyingColor1.y = multiplyAddValue61 * vertexVectorConstants0.packedValues[29u].y;
    varyingColor1.z = multiplyAddValue61 * vertexVectorConstants0.packedValues[29u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue9 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingTexCoord2.x = ((vertexVectorConstants0.packedValues[30u].x + 0.5) + fma(sumValue1, wavePhaseValue, sumValue * wavePhaseValue1)) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.y = (fma(sumValue1, wavePhaseValue1, (-0.0) - (wavePhaseValue * sumValue)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.z = ((vertexVectorConstants0.packedValues[30u].y + 0.5) + fma(sumValue1, wavePhaseValue2, wavePhaseValue3 * sumValue)) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.w = (fma(sumValue1, wavePhaseValue3, (-0.0) - (wavePhaseValue2 * sumValue)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    varyingColor1.x = productValue2 * vertexVectorConstants0.packedValues[29u].x;
    varyingColor1.y = productValue2 * vertexVectorConstants0.packedValues[29u].y;
    varyingColor1.z = productValue2 * vertexVectorConstants0.packedValues[29u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue38 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingTexCoord2.x = ((vertexVectorConstants0.packedValues[14u].x + 0.5) + fma(sumValue1, wavePhaseValue8, sumValue * wavePhaseValue9)) * vertexVectorConstants0.packedValues[11u].x;
    varyingTexCoord2.y = (fma(sumValue1, wavePhaseValue9, (-0.0) - (wavePhaseValue8 * sumValue)) + 0.5) * vertexVectorConstants0.packedValues[11u].y;
    varyingTexCoord2.z = ((vertexVectorConstants0.packedValues[14u].y + 0.5) + fma(sumValue1, wavePhaseValue10, wavePhaseValue11 * sumValue)) * vertexVectorConstants0.packedValues[11u].x;
    varyingTexCoord2.w = (fma(sumValue1, wavePhaseValue11, (-0.0) - (wavePhaseValue10 * sumValue)) + 0.5) * vertexVectorConstants0.packedValues[11u].y;
    varyingColor1.x = productValue2 * vertexVectorConstants0.packedValues[13u].x;
    varyingColor1.y = productValue2 * vertexVectorConstants0.packedValues[13u].y;
    varyingColor1.z = productValue2 * vertexVectorConstants0.packedValues[13u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue9 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingTexCoord2.x = ((vertexVectorConstants0.packedValues[30u].x + 0.5) + fma(sumValue1, wavePhaseValue, sumValue * wavePhaseValue1)) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.y = (fma(sumValue1, wavePhaseValue1, (-0.0) - (wavePhaseValue * sumValue)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.z = ((vertexVectorConstants0.packedValues[30u].y + 0.5) + fma(sumValue1, wavePhaseValue2, wavePhaseValue3 * sumValue)) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.w = (fma(sumValue1, wavePhaseValue3, (-0.0) - (wavePhaseValue2 * sumValue)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    varyingColor1.x = productValue32 * vertexVectorConstants0.packedValues[29u].x;
    varyingColor1.y = productValue32 * vertexVectorConstants0.packedValues[29u].y;
    varyingColor1.z = productValue32 * vertexVectorConstants0.packedValues[29u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue38 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingTexCoord2.x = ((vertexVectorConstants0.packedValues[30u].x + 0.5) + fma(sumValue1, wavePhaseValue, sumValue * wavePhaseValue1)) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.y = (fma(sumValue1, wavePhaseValue1, (-0.0) - (wavePhaseValue * sumValue)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.z = ((vertexVectorConstants0.packedValues[30u].y + 0.5) + fma(sumValue1, wavePhaseValue2, wavePhaseValue3 * sumValue)) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.w = (fma(sumValue1, wavePhaseValue3, (-0.0) - (wavePhaseValue2 * sumValue)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    varyingColor1.x = productValue32 * vertexVectorConstants0.packedValues[29u].x;
    varyingColor1.y = productValue32 * vertexVectorConstants0.packedValues[29u].y;
    varyingColor1.z = productValue32 * vertexVectorConstants0.packedValues[29u].z;
#endif
    varyingColor1.w = 1.0;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = bitwiseValue;
    varyingTexCoord0.y = bitwiseValue1;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = bitwiseValue;
    varyingTexCoord0.y = bitwiseValue1;
    varyingTexCoord3.x = multiplyAddValue29;
    varyingTexCoord3.y = multiplyAddValue30;
    varyingTexCoord3.z = multiplyAddValue31;
#endif
}
