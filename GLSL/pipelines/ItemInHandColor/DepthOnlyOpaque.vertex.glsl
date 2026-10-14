#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandColor / DepthOnlyOpaque / vertex forward pipeline.
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
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/ItemInHandColor/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u];
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue3 = vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[13u].x;
    precise float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[13u].y;
    precise float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, productValue3)) + vertexVectorConstants0.packedValues[13u].z;
    precise float productValue4 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue5 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue6 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue7 = multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue11;
    varyingTexCoord3.y = multiplyAddValue12;
    varyingTexCoord3.z = multiplyAddValue13;
    precise float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue11, productValue4)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue11, productValue5)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue11, productValue6)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue11, productValue7)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16, multiplyAddValue17);
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
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue14 = scalarValue6 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue15 = scalarValue6 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue16 = scalarValue6 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue17 = scalarValue6 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    precise float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, productValue14)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, productValue15)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, productValue16)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, productValue17)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue38, multiplyAddValue39, multiplyAddValue40, multiplyAddValue41);
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue6, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue7 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u];
    float scalarValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue7, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    gl_Position.x = scalarValue9;
    gl_Position.y = scalarValue10;
    gl_Position.z = scalarValue12;
    gl_Position.w = scalarValue11;
    varyingColor3.x = scalarValue9;
    varyingColor3.y = scalarValue10;
    varyingColor3.z = scalarValue12;
    varyingColor3.w = scalarValue11;
    precise float quotientValue2 = scalarValue12 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue8 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u];
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue14 = scalarValue6 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue15 = scalarValue6 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue16 = scalarValue6 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue17 = scalarValue6 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    precise float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, productValue14)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, productValue15)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, productValue16)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, productValue17)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue38, multiplyAddValue39, multiplyAddValue40, multiplyAddValue41);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u];
    float scalarValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    gl_Position.x = scalarValue15;
    gl_Position.y = scalarValue16;
    gl_Position.z = scalarValue12;
    gl_Position.w = scalarValue11;
    varyingColor3.x = scalarValue15;
    varyingColor3.y = scalarValue16;
    varyingColor3.z = scalarValue12;
    varyingColor3.w = scalarValue11;
    precise float quotientValue2 = scalarValue12 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue8 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].y)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[11u].z)) + vertexVectorConstants0.packedValues[13u].z;
    varyingTexCoord3.x = multiplyAddValue19;
    varyingTexCoord3.y = multiplyAddValue20;
    varyingTexCoord3.z = multiplyAddValue21;
    vec4 multiplyAddValue22 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue22);
    float sumValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue22);
    float scalarValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue22);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue22);
    gl_Position.x = sumValue4;
    gl_Position.y = sumValue5;
    gl_Position.z = scalarValue5;
    gl_Position.w = scalarValue4;
    varyingColor3.x = sumValue4;
    varyingColor3.y = sumValue5;
    varyingColor3.z = scalarValue5;
    varyingColor3.w = scalarValue4;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    vec4 multiplyAddValue42 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue42);
    float sumValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue42);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue42);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue42);
    gl_Position.x = sumValue9;
    gl_Position.y = sumValue10;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue13;
    varyingColor3.x = sumValue9;
    varyingColor3.y = sumValue10;
    varyingColor3.z = scalarValue14;
    varyingColor3.w = scalarValue13;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    vec4 multiplyAddValue42 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue42);
    float sumValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue42);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue42);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue42);
    gl_Position.x = sumValue11;
    gl_Position.y = sumValue12;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue13;
    varyingColor3.x = sumValue11;
    varyingColor3.y = sumValue12;
    varyingColor3.z = scalarValue14;
    varyingColor3.w = scalarValue13;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[27u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[27u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].y)));
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
    float productValue = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue23 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue24 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue25 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[11u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue27, multiplyAddValue26 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[11u].y, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue27, multiplyAddValue26 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue27, multiplyAddValue26 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue27, multiplyAddValue26 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue30;
    gl_Position.y = multiplyAddValue31;
    gl_Position.z = multiplyAddValue32;
    gl_Position.w = multiplyAddValue33;
    varyingColor3.x = multiplyAddValue30;
    varyingColor3.y = multiplyAddValue31;
    varyingColor3.z = multiplyAddValue32;
    varyingColor3.w = multiplyAddValue33;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].x * vertexNormal0.x));
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].y * vertexNormal0.x));
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].z * vertexNormal0.x));
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].w, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].w * vertexNormal0.x));
    float inverseLengthValue = inversesqrt(dot(vec4(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36, multiplyAddValue37), vec4(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36, multiplyAddValue37)));
    float productValue11 = inverseLengthValue * multiplyAddValue34;
    float productValue12 = inverseLengthValue * multiplyAddValue36;
    float productValue13 = (((0.449999988079071044921875 - ((productValue11 * productValue11) * 0.100000001490116119384765625)) + ((productValue12 * productValue12) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue35 * vertexVectorConstants0.packedValues[28u].w) * inverseLengthValue) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[12u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[12u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[12u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[10u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[13u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[27u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[27u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].y)));
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
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].x * vertexNormal0.x));
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].y * vertexNormal0.x));
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].z * vertexNormal0.x));
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[11u].w, vertexNormal0.y, vertexVectorConstants0.packedValues[10u].w * vertexNormal0.x));
    float inverseLengthValue = inversesqrt(dot(vec4(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36, multiplyAddValue37), vec4(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36, multiplyAddValue37)));
    float productValue11 = inverseLengthValue * multiplyAddValue34;
    float productValue12 = inverseLengthValue * multiplyAddValue36;
    float productValue13 = (((0.449999988079071044921875 - ((productValue11 * productValue11) * 0.100000001490116119384765625)) + ((productValue12 * productValue12) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue35 * vertexVectorConstants0.packedValues[28u].w) * inverseLengthValue) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue23 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue24 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue25 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue54 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[27u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue27, multiplyAddValue26 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue55 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[27u].y, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue27, multiplyAddValue26 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue27, multiplyAddValue26 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue27, multiplyAddValue26 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue54;
    gl_Position.y = multiplyAddValue55;
    gl_Position.z = multiplyAddValue32;
    gl_Position.w = multiplyAddValue33;
    varyingColor3.x = multiplyAddValue54;
    varyingColor3.y = multiplyAddValue55;
    varyingColor3.z = multiplyAddValue32;
    varyingColor3.w = multiplyAddValue33;
#endif
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#if (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue2 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue18 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue8 = multiplyAddValue18 * vertexVectorConstants0.packedValues[28u].x;
    precise float productValue9 = multiplyAddValue18 * vertexVectorConstants0.packedValues[28u].y;
    precise float productValue10 = multiplyAddValue18 * vertexVectorConstants0.packedValues[28u].z;
    varyingColor1.x = productValue8;
    varyingColor1.y = productValue9;
    varyingColor1.z = productValue10;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue8 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue18 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue18 = multiplyAddValue18 * vertexVectorConstants0.packedValues[12u].x;
    precise float productValue19 = multiplyAddValue18 * vertexVectorConstants0.packedValues[12u].y;
    precise float productValue20 = multiplyAddValue18 * vertexVectorConstants0.packedValues[12u].z;
    varyingColor1.x = productValue18;
    varyingColor1.y = productValue19;
    varyingColor1.z = productValue20;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue2 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue21 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue22 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue23 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float productValue24 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w;
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, productValue21));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, productValue22));
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, productValue23));
    vec4 multiplyAddValue46 = vec4(multiplyAddValue43, multiplyAddValue44, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, productValue24)));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue46, multiplyAddValue46));
    precise float productValue25 = inverseLengthValue1 * multiplyAddValue43;
    precise float productValue26 = inverseLengthValue1 * multiplyAddValue44;
    precise float productValue27 = inverseLengthValue1 * multiplyAddValue45;
    precise float productValue28 = productValue25 * productValue25;
    precise float productValue29 = productValue27 * productValue27;
    precise float productValue30 = productValue28 * (-0.100000001490116119384765625);
    precise float multiplyAddValue47 = fma(productValue29, 0.100000001490116119384765625, fma(fma(productValue26, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, productValue30)) + 0.449999988079071044921875;
    float multiplyAddValue48 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue47);
    precise float productValue31 = multiplyAddValue48 * vertexVectorConstants0.packedValues[28u].x;
    precise float productValue32 = multiplyAddValue48 * vertexVectorConstants0.packedValues[28u].y;
    precise float productValue33 = multiplyAddValue48 * vertexVectorConstants0.packedValues[28u].z;
    varyingColor1.x = productValue31;
    varyingColor1.y = productValue32;
    varyingColor1.z = productValue33;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue8 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue21 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x;
    precise float productValue22 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y;
    precise float productValue23 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z;
    precise float productValue24 = vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w;
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, productValue21));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, productValue22));
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, productValue23));
    vec4 multiplyAddValue46 = vec4(multiplyAddValue43, multiplyAddValue44, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, productValue24)));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue46, multiplyAddValue46));
    precise float productValue25 = inverseLengthValue1 * multiplyAddValue43;
    precise float productValue26 = inverseLengthValue1 * multiplyAddValue44;
    precise float productValue27 = inverseLengthValue1 * multiplyAddValue45;
    precise float productValue28 = productValue25 * productValue25;
    precise float productValue29 = productValue27 * productValue27;
    precise float productValue30 = productValue28 * (-0.100000001490116119384765625);
    precise float multiplyAddValue47 = fma(productValue29, 0.100000001490116119384765625, fma(fma(productValue26, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, productValue30)) + 0.449999988079071044921875;
    float multiplyAddValue48 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue47);
    precise float productValue31 = multiplyAddValue48 * vertexVectorConstants0.packedValues[28u].x;
    precise float productValue32 = multiplyAddValue48 * vertexVectorConstants0.packedValues[28u].y;
    precise float productValue33 = multiplyAddValue48 * vertexVectorConstants0.packedValues[28u].z;
    varyingColor1.x = productValue31;
    varyingColor1.y = productValue32;
    varyingColor1.z = productValue33;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue5 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue18 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor1.x = multiplyAddValue18 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = multiplyAddValue18 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = multiplyAddValue18 * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue14 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue18 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor1.x = multiplyAddValue18 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor1.y = multiplyAddValue18 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor1.z = multiplyAddValue18 * vertexVectorConstants0.packedValues[12u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue5 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x));
    float multiplyAddValue50 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y));
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z));
    vec4 multiplyAddValue52 = vec4(multiplyAddValue49, multiplyAddValue50, multiplyAddValue51, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w)));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue52, multiplyAddValue52));
    float productValue34 = inverseLengthValue2 * multiplyAddValue49;
    float productValue35 = inverseLengthValue2 * multiplyAddValue51;
    float multiplyAddValue53 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue35 * productValue35, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue50, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, (productValue34 * productValue34) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor1.x = multiplyAddValue53 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = multiplyAddValue53 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = multiplyAddValue53 * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue14 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[12u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].x));
    float multiplyAddValue50 = fma(vertexVectorConstants0.packedValues[12u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].y));
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[12u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].z));
    vec4 multiplyAddValue52 = vec4(multiplyAddValue49, multiplyAddValue50, multiplyAddValue51, fma(vertexVectorConstants0.packedValues[12u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[11u].w)));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue52, multiplyAddValue52));
    float productValue34 = inverseLengthValue2 * multiplyAddValue49;
    float productValue35 = inverseLengthValue2 * multiplyAddValue51;
    float multiplyAddValue53 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue35 * productValue35, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue50, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, (productValue34 * productValue34) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor1.x = multiplyAddValue53 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = multiplyAddValue53 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = multiplyAddValue53 * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue9 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = productValue * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = productValue * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = productValue * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue32 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = productValue * vertexVectorConstants0.packedValues[12u].x;
    varyingColor1.y = productValue * vertexVectorConstants0.packedValues[12u].y;
    varyingColor1.z = productValue * vertexVectorConstants0.packedValues[12u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue9 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = productValue13 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = productValue13 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = productValue13 * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue32 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor1.x = productValue13 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = productValue13 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = productValue13 * vertexVectorConstants0.packedValues[28u].z;
#endif
    varyingColor1.w = 1.0;
    varyingTexCoord0.x = -3.0517578125e-05;
    varyingTexCoord0.y = -3.0517578125e-05;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue23;
    varyingTexCoord3.y = multiplyAddValue24;
    varyingTexCoord3.z = multiplyAddValue25;
#endif
}
