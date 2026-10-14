#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandColorGlint / DepthOnlyOpaque / vertex forward pipeline.
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
    precise float sumValue5 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u];
    precise float productValue7 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue8 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue9 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, productValue7)) + vertexVectorConstants0.packedValues[13u].x;
    precise float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, productValue8)) + vertexVectorConstants0.packedValues[13u].y;
    precise float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, productValue9)) + vertexVectorConstants0.packedValues[13u].z;
    precise float productValue10 = multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue11 = multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue12 = multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue13 = multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue18;
    varyingTexCoord3.y = multiplyAddValue19;
    varyingTexCoord3.z = multiplyAddValue20;
    precise float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue18, productValue10)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue18, productValue11)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue18, productValue12)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue18, productValue13)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(multiplyAddValue21, multiplyAddValue22, multiplyAddValue23, multiplyAddValue24);
    float scalarValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue5, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue6 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u];
    float scalarValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue6, vertexScalarConstants0.packedValues[13u]), vectorValue);
    float scalarValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue);
    gl_Position.x = scalarValue2;
    gl_Position.y = scalarValue3;
    gl_Position.z = scalarValue5;
    gl_Position.w = scalarValue4;
    varyingColor3.x = scalarValue2;
    varyingColor3.y = scalarValue3;
    varyingColor3.z = scalarValue5;
    varyingColor3.w = scalarValue4;
    precise float quotientValue = scalarValue5 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue7 = quotientValue - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue17 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u];
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue10 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue28 = scalarValue10 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue29 = scalarValue10 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue30 = scalarValue10 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue31 = scalarValue10 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue11 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue12 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue11;
    varyingTexCoord3.y = scalarValue10;
    varyingTexCoord3.z = scalarValue12;
    precise float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue11, productValue28)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue11, productValue29)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue11, productValue30)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue11, productValue31)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue3 = vec4(multiplyAddValue46, multiplyAddValue47, multiplyAddValue48, multiplyAddValue49);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue17, vertexScalarConstants0.packedValues[12u]), vectorValue3);
    precise float sumValue18 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u];
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue18, vertexScalarConstants0.packedValues[13u]), vectorValue3);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue3);
    float scalarValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue3);
    gl_Position.x = scalarValue13;
    gl_Position.y = scalarValue14;
    gl_Position.z = scalarValue16;
    gl_Position.w = scalarValue15;
    varyingColor3.x = scalarValue13;
    varyingColor3.y = scalarValue14;
    varyingColor3.z = scalarValue16;
    varyingColor3.w = scalarValue15;
    precise float quotientValue2 = scalarValue16 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue19 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue5 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u];
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue10 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue28 = scalarValue10 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue29 = scalarValue10 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue30 = scalarValue10 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue31 = scalarValue10 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue11 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue12 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue11;
    varyingTexCoord3.y = scalarValue10;
    varyingTexCoord3.z = scalarValue12;
    precise float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue11, productValue28)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue11, productValue29)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue11, productValue30)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue11, productValue31)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue3 = vec4(multiplyAddValue46, multiplyAddValue47, multiplyAddValue48, multiplyAddValue49);
    float scalarValue19 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue5, vertexScalarConstants0.packedValues[12u]), vectorValue3);
    precise float sumValue6 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u];
    float scalarValue20 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue6, vertexScalarConstants0.packedValues[13u]), vectorValue3);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue3);
    float scalarValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue3);
    gl_Position.x = scalarValue19;
    gl_Position.y = scalarValue20;
    gl_Position.z = scalarValue16;
    gl_Position.w = scalarValue15;
    varyingColor3.x = scalarValue19;
    varyingColor3.y = scalarValue20;
    varyingColor3.z = scalarValue16;
    varyingColor3.w = scalarValue15;
    precise float quotientValue2 = scalarValue16 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue19 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z)) + vertexVectorConstants0.packedValues[13u].z;
    varyingTexCoord3.x = multiplyAddValue11;
    varyingTexCoord3.y = multiplyAddValue12;
    varyingTexCoord3.z = multiplyAddValue13;
    vec4 multiplyAddValue14 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue14);
    float sumValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue14);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue14);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue14);
    gl_Position.x = sumValue2;
    gl_Position.y = sumValue3;
    gl_Position.z = scalarValue1;
    gl_Position.w = scalarValue;
    varyingColor3.x = sumValue2;
    varyingColor3.y = sumValue3;
    varyingColor3.z = scalarValue1;
    varyingColor3.w = scalarValue;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue10 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue11 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue12 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue11;
    varyingTexCoord3.y = scalarValue10;
    varyingTexCoord3.z = scalarValue12;
    vec4 multiplyAddValue50 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue11, scalarValue10 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue11, scalarValue10 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue11, scalarValue10 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue11, scalarValue10 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue26 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue50);
    float sumValue27 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue50);
    float scalarValue17 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue50);
    float scalarValue18 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue50);
    gl_Position.x = sumValue26;
    gl_Position.y = sumValue27;
    gl_Position.z = scalarValue18;
    gl_Position.w = scalarValue17;
    varyingColor3.x = sumValue26;
    varyingColor3.y = sumValue27;
    varyingColor3.z = scalarValue18;
    varyingColor3.w = scalarValue17;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue10 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue11 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue12 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue11;
    varyingTexCoord3.y = scalarValue10;
    varyingTexCoord3.z = scalarValue12;
    vec4 multiplyAddValue50 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue11, scalarValue10 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue11, scalarValue10 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue11, scalarValue10 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue12, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue11, scalarValue10 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue28 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue50);
    float sumValue29 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue50);
    float scalarValue17 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue50);
    float scalarValue18 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue50);
    gl_Position.x = sumValue28;
    gl_Position.y = sumValue29;
    gl_Position.z = scalarValue18;
    gl_Position.w = scalarValue17;
    varyingColor3.x = sumValue28;
    varyingColor3.y = sumValue29;
    varyingColor3.z = scalarValue18;
    varyingColor3.w = scalarValue17;
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
    uint productValue3 = uint(roundEven(bitwiseValue * 65535.0));
    uint productValue4 = uint(roundEven(bitwiseValue1 * 65535.0));
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
    float multiplyAddValue31 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue32 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue33 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[12u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[12u].y, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue3 = uint(roundEven(bitwiseValue * 65535.0));
    uint productValue4 = uint(roundEven(bitwiseValue1 * 65535.0));
    gl_Position.x = multiplyAddValue38;
    gl_Position.y = multiplyAddValue39;
    gl_Position.z = multiplyAddValue40;
    gl_Position.w = multiplyAddValue41;
    varyingColor3.x = multiplyAddValue38;
    varyingColor3.y = multiplyAddValue39;
    varyingColor3.z = multiplyAddValue40;
    varyingColor3.w = multiplyAddValue41;
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
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].x * vertexNormal0.x));
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].y * vertexNormal0.x));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].z * vertexNormal0.x));
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].w, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].w * vertexNormal0.x));
    float inverseLengthValue = inversesqrt(dot(vec4(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44, multiplyAddValue45), vec4(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44, multiplyAddValue45)));
    float productValue25 = inverseLengthValue * multiplyAddValue42;
    float productValue26 = inverseLengthValue * multiplyAddValue44;
    float productValue27 = (((0.449999988079071044921875 - ((productValue25 * productValue25) * 0.100000001490116119384765625)) + ((productValue26 * productValue26) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue43 * vertexVectorConstants0.packedValues[29u].w) * inverseLengthValue) + 1.0) * 0.2750000059604644775390625);
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
    uint productValue3 = uint(roundEven(bitwiseValue * 65535.0));
    uint productValue4 = uint(roundEven(bitwiseValue1 * 65535.0));
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
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].x * vertexNormal0.x));
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].y * vertexNormal0.x));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].z * vertexNormal0.x));
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].w, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].w * vertexNormal0.x));
    float inverseLengthValue = inversesqrt(dot(vec4(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44, multiplyAddValue45), vec4(multiplyAddValue42, multiplyAddValue43, multiplyAddValue44, multiplyAddValue45)));
    float productValue25 = inverseLengthValue * multiplyAddValue42;
    float productValue26 = inverseLengthValue * multiplyAddValue44;
    float productValue27 = (((0.449999988079071044921875 - ((productValue25 * productValue25) * 0.100000001490116119384765625)) + ((productValue26 * productValue26) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue43 * vertexVectorConstants0.packedValues[29u].w) * inverseLengthValue) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue31 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue32 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue33 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue62 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue63 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue3 = uint(roundEven(bitwiseValue * 65535.0));
    uint productValue4 = uint(roundEven(bitwiseValue1 * 65535.0));
    gl_Position.x = multiplyAddValue62;
    gl_Position.y = multiplyAddValue63;
    gl_Position.z = multiplyAddValue40;
    gl_Position.w = multiplyAddValue41;
    varyingColor3.x = multiplyAddValue62;
    varyingColor3.y = multiplyAddValue63;
    varyingColor3.z = multiplyAddValue40;
    varyingColor3.w = multiplyAddValue41;
#endif
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#if (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue8 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue7 / sumValue8;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue14 = vertexTexCoord0.x * 65535.0;
    precise float productValue15 = vertexTexCoord0.y * 65535.0;
    uint scalarValue6 = uint(roundEven(productValue14));
    uint scalarValue7 = uint(roundEven(productValue15));
    precise float multiplyAddValue25 = fma(rdEvaluateFloatExpression((scalarValue6 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue26 = fma(rdEvaluateFloatExpression((scalarValue7 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    float multiplyAddValue27 = fma(rdEvaluateFloatExpression((scalarValue6 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue25);
    float multiplyAddValue28 = fma(rdEvaluateFloatExpression((scalarValue7 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue26);
    precise float sumValue9 = multiplyAddValue27 - 0.5;
    precise float sumValue10 = multiplyAddValue28 - 0.5;
    precise float productValue16 = multiplyAddValue27 * 65535.0;
    precise float productValue17 = multiplyAddValue28 * 65535.0;
    uint scalarValue8 = uint(roundEven(productValue16));
    uint scalarValue9 = uint(roundEven(productValue17));
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 vectorValue1 = vec2(sumValue9, sumValue10);
    precise float sumValue11 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u];
    precise float sumValue12 = sumValue11 + 0.5;
    precise float sumValue13 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5;
    precise float productValue18 = sumValue12 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue19 = sumValue13 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.x = productValue18;
    varyingTexCoord2.y = productValue19;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    precise float sumValue14 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u];
    precise float sumValue15 = sumValue14 + 0.5;
    precise float sumValue16 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5;
    precise float productValue20 = sumValue15 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue21 = sumValue16 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.z = productValue20;
    varyingTexCoord2.w = productValue21;
    float multiplyAddValue17 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue22 = multiplyAddValue17 * vertexVectorConstants0.packedValues[29u].x;
    precise float productValue23 = multiplyAddValue17 * vertexVectorConstants0.packedValues[29u].y;
    precise float productValue24 = multiplyAddValue17 * vertexVectorConstants0.packedValues[29u].z;
    varyingColor1.x = productValue22;
    varyingColor1.y = productValue23;
    varyingColor1.z = productValue24;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue8 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue19 / sumValue8;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    precise float productValue14 = vertexTexCoord0.x * 65535.0;
    precise float productValue15 = vertexTexCoord0.y * 65535.0;
    uint scalarValue6 = uint(roundEven(productValue14));
    uint scalarValue7 = uint(roundEven(productValue15));
    precise float multiplyAddValue25 = fma(rdEvaluateFloatExpression((scalarValue6 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue26 = fma(rdEvaluateFloatExpression((scalarValue7 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    float multiplyAddValue27 = fma(rdEvaluateFloatExpression((scalarValue6 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue25);
    float multiplyAddValue28 = fma(rdEvaluateFloatExpression((scalarValue7 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue26);
    precise float sumValue9 = multiplyAddValue27 - 0.5;
    precise float sumValue10 = multiplyAddValue28 - 0.5;
    precise float productValue16 = multiplyAddValue27 * 65535.0;
    precise float productValue17 = multiplyAddValue28 * 65535.0;
    uint scalarValue8 = uint(roundEven(productValue16));
    uint scalarValue9 = uint(roundEven(productValue17));
    float wavePhaseValue12 = sin(vertexScalarConstants0.packedValues[58u]);
    float wavePhaseValue13 = cos(vertexScalarConstants0.packedValues[58u]);
    vec2 vectorValue1 = vec2(sumValue9, sumValue10);
    precise float sumValue20 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue13, wavePhaseValue12)) + vertexScalarConstants0.packedValues[56u];
    precise float sumValue21 = sumValue20 + 0.5;
    precise float sumValue22 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue12, wavePhaseValue13)) + 0.5;
    precise float productValue32 = sumValue21 * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue33 = sumValue22 * vertexVectorConstants0.packedValues[11u].y;
    varyingTexCoord2.x = productValue32;
    varyingTexCoord2.y = productValue33;
    float wavePhaseValue14 = sin(vertexScalarConstants0.packedValues[59u]);
    float wavePhaseValue15 = cos(vertexScalarConstants0.packedValues[59u]);
    precise float sumValue23 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue15, wavePhaseValue14)) + vertexScalarConstants0.packedValues[57u];
    precise float sumValue24 = sumValue23 + 0.5;
    precise float sumValue25 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue14, wavePhaseValue15)) + 0.5;
    precise float productValue34 = sumValue24 * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue35 = sumValue25 * vertexVectorConstants0.packedValues[11u].y;
    varyingTexCoord2.z = productValue34;
    varyingTexCoord2.w = productValue35;
    float multiplyAddValue17 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue36 = multiplyAddValue17 * vertexVectorConstants0.packedValues[13u].x;
    precise float productValue37 = multiplyAddValue17 * vertexVectorConstants0.packedValues[13u].y;
    precise float productValue38 = multiplyAddValue17 * vertexVectorConstants0.packedValues[13u].z;
    varyingColor1.x = productValue36;
    varyingColor1.y = productValue37;
    varyingColor1.z = productValue38;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue8 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue7 / sumValue8;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue14 = vertexTexCoord0.x * 65535.0;
    precise float productValue15 = vertexTexCoord0.y * 65535.0;
    uint scalarValue6 = uint(roundEven(productValue14));
    uint scalarValue7 = uint(roundEven(productValue15));
    precise float multiplyAddValue25 = fma(rdEvaluateFloatExpression((scalarValue6 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue26 = fma(rdEvaluateFloatExpression((scalarValue7 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    float multiplyAddValue27 = fma(rdEvaluateFloatExpression((scalarValue6 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue25);
    float multiplyAddValue28 = fma(rdEvaluateFloatExpression((scalarValue7 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue26);
    precise float sumValue9 = multiplyAddValue27 - 0.5;
    precise float sumValue10 = multiplyAddValue28 - 0.5;
    precise float productValue16 = multiplyAddValue27 * 65535.0;
    precise float productValue17 = multiplyAddValue28 * 65535.0;
    uint scalarValue8 = uint(roundEven(productValue16));
    uint scalarValue9 = uint(roundEven(productValue17));
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 vectorValue1 = vec2(sumValue9, sumValue10);
    precise float sumValue11 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u];
    precise float sumValue12 = sumValue11 + 0.5;
    precise float sumValue13 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5;
    precise float productValue18 = sumValue12 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue19 = sumValue13 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.x = productValue18;
    varyingTexCoord2.y = productValue19;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    precise float sumValue14 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u];
    precise float sumValue15 = sumValue14 + 0.5;
    precise float sumValue16 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5;
    precise float productValue20 = sumValue15 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue21 = sumValue16 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.z = productValue20;
    varyingTexCoord2.w = productValue21;
    precise float productValue39 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue40 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue41 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float productValue42 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w;
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, productValue39));
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, productValue40));
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, productValue41));
    vec4 multiplyAddValue54 = vec4(multiplyAddValue51, multiplyAddValue52, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, productValue42)));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue54, multiplyAddValue54));
    precise float productValue43 = inverseLengthValue1 * multiplyAddValue51;
    precise float productValue44 = inverseLengthValue1 * multiplyAddValue52;
    precise float productValue45 = inverseLengthValue1 * multiplyAddValue53;
    precise float productValue46 = productValue43 * productValue43;
    precise float productValue47 = productValue45 * productValue45;
    precise float productValue48 = productValue46 * (-0.100000001490116119384765625);
    precise float multiplyAddValue55 = fma(productValue47, 0.100000001490116119384765625, fma(fma(productValue44, vertexScalarConstants0.packedValues[119u], 1.0), 0.2750000059604644775390625, productValue48)) + 0.449999988079071044921875;
    float multiplyAddValue56 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue55);
    precise float productValue49 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].x;
    precise float productValue50 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].y;
    precise float productValue51 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].z;
    varyingColor1.x = productValue49;
    varyingColor1.y = productValue50;
    varyingColor1.z = productValue51;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue8 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue19 / sumValue8;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue14 = vertexTexCoord0.x * 65535.0;
    precise float productValue15 = vertexTexCoord0.y * 65535.0;
    uint scalarValue6 = uint(roundEven(productValue14));
    uint scalarValue7 = uint(roundEven(productValue15));
    precise float multiplyAddValue25 = fma(rdEvaluateFloatExpression((scalarValue6 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue26 = fma(rdEvaluateFloatExpression((scalarValue7 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    float multiplyAddValue27 = fma(rdEvaluateFloatExpression((scalarValue6 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue25);
    float multiplyAddValue28 = fma(rdEvaluateFloatExpression((scalarValue7 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue26);
    precise float sumValue9 = multiplyAddValue27 - 0.5;
    precise float sumValue10 = multiplyAddValue28 - 0.5;
    precise float productValue16 = multiplyAddValue27 * 65535.0;
    precise float productValue17 = multiplyAddValue28 * 65535.0;
    uint scalarValue8 = uint(roundEven(productValue16));
    uint scalarValue9 = uint(roundEven(productValue17));
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 vectorValue1 = vec2(sumValue9, sumValue10);
    precise float sumValue11 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u];
    precise float sumValue12 = sumValue11 + 0.5;
    precise float sumValue13 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5;
    precise float productValue18 = sumValue12 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue19 = sumValue13 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.x = productValue18;
    varyingTexCoord2.y = productValue19;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    precise float sumValue14 = rdDot2Precise(vectorValue1, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u];
    precise float sumValue15 = sumValue14 + 0.5;
    precise float sumValue16 = rdDot2Precise(vectorValue1, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5;
    precise float productValue20 = sumValue15 * vertexVectorConstants0.packedValues[27u].x;
    precise float productValue21 = sumValue16 * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.z = productValue20;
    varyingTexCoord2.w = productValue21;
    precise float productValue39 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue40 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue41 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float productValue42 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w;
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, productValue39));
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, productValue40));
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, productValue41));
    vec4 multiplyAddValue54 = vec4(multiplyAddValue51, multiplyAddValue52, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, productValue42)));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue54, multiplyAddValue54));
    precise float productValue43 = inverseLengthValue1 * multiplyAddValue51;
    precise float productValue44 = inverseLengthValue1 * multiplyAddValue52;
    precise float productValue45 = inverseLengthValue1 * multiplyAddValue53;
    precise float productValue46 = productValue43 * productValue43;
    precise float productValue47 = productValue45 * productValue45;
    precise float productValue48 = productValue46 * (-0.100000001490116119384765625);
    precise float multiplyAddValue55 = fma(productValue47, 0.100000001490116119384765625, fma(fma(productValue44, vertexScalarConstants0.packedValues[119u], 1.0), 0.2750000059604644775390625, productValue48)) + 0.449999988079071044921875;
    float multiplyAddValue56 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue55);
    precise float productValue49 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].x;
    precise float productValue50 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].y;
    precise float productValue51 = multiplyAddValue56 * vertexVectorConstants0.packedValues[29u].z;
    varyingColor1.x = productValue49;
    varyingColor1.y = productValue50;
    varyingColor1.z = productValue51;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue1 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float multiplyAddValue15 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    float multiplyAddValue16 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    uint productValue5 = uint(roundEven(multiplyAddValue15 * 65535.0));
    uint productValue6 = uint(roundEven(multiplyAddValue16 * 65535.0));
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 sumValue4 = vec2(multiplyAddValue15 - 0.5, multiplyAddValue16 - 0.5);
    varyingTexCoord2.x = ((rdDot2Precise(sumValue4, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.y = (rdDot2Precise(sumValue4, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    varyingTexCoord2.z = ((rdDot2Precise(sumValue4, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.w = (rdDot2Precise(sumValue4, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float multiplyAddValue17 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor1.x = multiplyAddValue17 * vertexVectorConstants0.packedValues[29u].x;
    varyingColor1.y = multiplyAddValue17 * vertexVectorConstants0.packedValues[29u].y;
    varyingColor1.z = multiplyAddValue17 * vertexVectorConstants0.packedValues[29u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue18 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float multiplyAddValue15 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    float multiplyAddValue16 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    uint productValue5 = uint(roundEven(multiplyAddValue15 * 65535.0));
    uint productValue6 = uint(roundEven(multiplyAddValue16 * 65535.0));
    float wavePhaseValue12 = sin(vertexScalarConstants0.packedValues[58u]);
    float wavePhaseValue13 = cos(vertexScalarConstants0.packedValues[58u]);
    vec2 sumValue4 = vec2(multiplyAddValue15 - 0.5, multiplyAddValue16 - 0.5);
    varyingTexCoord2.x = ((rdDot2Precise(sumValue4, vec2(wavePhaseValue13, wavePhaseValue12)) + vertexScalarConstants0.packedValues[56u]) + 0.5) * vertexVectorConstants0.packedValues[11u].x;
    varyingTexCoord2.y = (rdDot2Precise(sumValue4, vec2(-wavePhaseValue12, wavePhaseValue13)) + 0.5) * vertexVectorConstants0.packedValues[11u].y;
    float wavePhaseValue14 = sin(vertexScalarConstants0.packedValues[59u]);
    float wavePhaseValue15 = cos(vertexScalarConstants0.packedValues[59u]);
    varyingTexCoord2.z = ((rdDot2Precise(sumValue4, vec2(wavePhaseValue15, wavePhaseValue14)) + vertexScalarConstants0.packedValues[57u]) + 0.5) * vertexVectorConstants0.packedValues[11u].x;
    varyingTexCoord2.w = (rdDot2Precise(sumValue4, vec2(-wavePhaseValue14, wavePhaseValue15)) + 0.5) * vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue17 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor1.x = multiplyAddValue17 * vertexVectorConstants0.packedValues[13u].x;
    varyingColor1.y = multiplyAddValue17 * vertexVectorConstants0.packedValues[13u].y;
    varyingColor1.z = multiplyAddValue17 * vertexVectorConstants0.packedValues[13u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue1 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float multiplyAddValue15 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    float multiplyAddValue16 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    uint productValue5 = uint(roundEven(multiplyAddValue15 * 65535.0));
    uint productValue6 = uint(roundEven(multiplyAddValue16 * 65535.0));
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 sumValue4 = vec2(multiplyAddValue15 - 0.5, multiplyAddValue16 - 0.5);
    varyingTexCoord2.x = ((rdDot2Precise(sumValue4, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.y = (rdDot2Precise(sumValue4, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    varyingTexCoord2.z = ((rdDot2Precise(sumValue4, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.w = (rdDot2Precise(sumValue4, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float multiplyAddValue57 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x));
    float multiplyAddValue58 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y));
    float multiplyAddValue59 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z));
    vec4 multiplyAddValue60 = vec4(multiplyAddValue57, multiplyAddValue58, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w)));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue60, multiplyAddValue60));
    float productValue52 = inverseLengthValue2 * multiplyAddValue57;
    float productValue53 = inverseLengthValue2 * multiplyAddValue59;
    float multiplyAddValue61 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue53 * productValue53, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue58, vertexScalarConstants0.packedValues[119u], 1.0), 0.2750000059604644775390625, (productValue52 * productValue52) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor1.x = multiplyAddValue61 * vertexVectorConstants0.packedValues[29u].x;
    varyingColor1.y = multiplyAddValue61 * vertexVectorConstants0.packedValues[29u].y;
    varyingColor1.z = multiplyAddValue61 * vertexVectorConstants0.packedValues[29u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue18 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float multiplyAddValue15 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    float multiplyAddValue16 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    uint productValue5 = uint(roundEven(multiplyAddValue15 * 65535.0));
    uint productValue6 = uint(roundEven(multiplyAddValue16 * 65535.0));
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 sumValue4 = vec2(multiplyAddValue15 - 0.5, multiplyAddValue16 - 0.5);
    varyingTexCoord2.x = ((rdDot2Precise(sumValue4, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[120u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.y = (rdDot2Precise(sumValue4, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[123u]);
    varyingTexCoord2.z = ((rdDot2Precise(sumValue4, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[121u]) + 0.5) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.w = (rdDot2Precise(sumValue4, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    float multiplyAddValue57 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x));
    float multiplyAddValue58 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y));
    float multiplyAddValue59 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z));
    vec4 multiplyAddValue60 = vec4(multiplyAddValue57, multiplyAddValue58, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w)));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue60, multiplyAddValue60));
    float productValue52 = inverseLengthValue2 * multiplyAddValue57;
    float productValue53 = inverseLengthValue2 * multiplyAddValue59;
    float multiplyAddValue61 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue53 * productValue53, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue58, vertexScalarConstants0.packedValues[119u], 1.0), 0.2750000059604644775390625, (productValue52 * productValue52) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
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
    varyingColor2.w = spvNClamp(((multiplyAddValue40 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
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
    varyingColor1.x = productValue27 * vertexVectorConstants0.packedValues[29u].x;
    varyingColor1.y = productValue27 * vertexVectorConstants0.packedValues[29u].y;
    varyingColor1.z = productValue27 * vertexVectorConstants0.packedValues[29u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue40 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingTexCoord2.x = ((vertexVectorConstants0.packedValues[30u].x + 0.5) + fma(sumValue1, wavePhaseValue, sumValue * wavePhaseValue1)) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.y = (fma(sumValue1, wavePhaseValue1, (-0.0) - (wavePhaseValue * sumValue)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.z = ((vertexVectorConstants0.packedValues[30u].y + 0.5) + fma(sumValue1, wavePhaseValue2, wavePhaseValue3 * sumValue)) * vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord2.w = (fma(sumValue1, wavePhaseValue3, (-0.0) - (wavePhaseValue2 * sumValue)) + 0.5) * vertexVectorConstants0.packedValues[27u].y;
    varyingColor1.x = productValue27 * vertexVectorConstants0.packedValues[29u].x;
    varyingColor1.y = productValue27 * vertexVectorConstants0.packedValues[29u].y;
    varyingColor1.z = productValue27 * vertexVectorConstants0.packedValues[29u].z;
#endif
    varyingColor1.w = 1.0;
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float multiplyAddValue29 = fma(rdEvaluateFloatExpression((scalarValue8 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue30 = fma(rdEvaluateFloatExpression((scalarValue9 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression((scalarValue8 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue29);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression((scalarValue9 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue30);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue5, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue5, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue6, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue6, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = ((float((productValue3 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue4 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue4 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = ((float((productValue3 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue4 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue4 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue31;
    varyingTexCoord3.y = multiplyAddValue32;
    varyingTexCoord3.z = multiplyAddValue33;
#endif
}
