#version 460
#extension GL_GOOGLE_include_directive : require
// SingleBlockForwardPBR / Opaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 17
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#if (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/SingleBlockForwardPBR/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    vec4 multiplyAddValue3 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue3);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue3);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue3);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue3);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue9 = multiplyAddValue + 0.5;
    float sumValue10 = multiplyAddValue1 + 0.5;
    float sumValue11 = multiplyAddValue2 + 0.5;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    float sumValue12 = sumValue11 - vertexVectorConstants0.packedValues[24u].z;
    float sumValue13 = sumValue9 - vertexVectorConstants0.packedValues[24u].x;
    float sumValue14 = sumValue10 - vertexVectorConstants0.packedValues[24u].y;
    vec3 vectorValue = vec3(sumValue12, sumValue13, sumValue14);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue11 = inverseLengthValue2 * sumValue12;
    float productValue12 = inverseLengthValue2 * sumValue13;
    float productValue13 = inverseLengthValue2 * sumValue14;
    float scalarValue = -productValue12;
    vec2 vectorValue1 = vec2(productValue11, scalarValue);
    float inverseLengthValue3 = inversesqrt(rdDot2Precise(vectorValue1, vectorValue1));
    float productValue14 = inverseLengthValue3 * productValue11;
    float productValue15 = inverseLengthValue3 * scalarValue;
    float sumValue15 = vertexColor0.z - 0.5;
    float sumValue16 = vertexColor0.x - 0.5;
    float multiplyAddValue15 = sumValue9 - fma(productValue13 * productValue15, sumValue15, productValue14 * sumValue16);
    float multiplyAddValue16 = sumValue10 - (fma(productValue11, productValue14, -(productValue12 * productValue15)) * sumValue15);
    float multiplyAddValue17 = sumValue11 - fma(-(productValue13 * productValue14), sumValue15, productValue15 * sumValue16);
    vec4 multiplyAddValue18 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[100u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue18);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[101u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue18);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue18);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue18);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue1 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue2 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    vec4 multiplyAddValue19 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[32u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue19);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[33u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue19);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue19);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue19);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue1 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float sumValue24 = scalarValue2 + 0.5;
    float sumValue25 = scalarValue1 + 0.5;
    float sumValue26 = scalarValue3 + 0.5;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    float sumValue27 = sumValue26 - vertexVectorConstants0.packedValues[8u].z;
    float sumValue28 = sumValue24 - vertexVectorConstants0.packedValues[8u].x;
    float sumValue29 = sumValue25 - vertexVectorConstants0.packedValues[8u].y;
    vec3 vectorValue3 = vec3(sumValue27, sumValue28, sumValue29);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    float productValue24 = inverseLengthValue6 * sumValue27;
    float productValue25 = inverseLengthValue6 * sumValue28;
    float productValue26 = inverseLengthValue6 * sumValue29;
    float scalarValue4 = -productValue25;
    vec2 vectorValue4 = vec2(productValue24, scalarValue4);
    float inverseLengthValue7 = inversesqrt(rdDot2Precise(vectorValue4, vectorValue4));
    float productValue27 = inverseLengthValue7 * productValue24;
    float productValue28 = inverseLengthValue7 * scalarValue4;
    float sumValue15 = vertexColor0.z - 0.5;
    float sumValue16 = vertexColor0.x - 0.5;
    float multiplyAddValue31 = sumValue24 - fma(productValue26 * productValue28, sumValue15, productValue27 * sumValue16);
    float multiplyAddValue32 = sumValue25 - (fma(productValue24, productValue27, -(productValue25 * productValue28)) * sumValue15);
    float multiplyAddValue33 = sumValue26 - fma(-(productValue26 * productValue27), sumValue15, productValue28 * sumValue16);
    vec4 multiplyAddValue34 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue31, multiplyAddValue32 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue31, multiplyAddValue32 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue31, multiplyAddValue32 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue31, multiplyAddValue32 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[36u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue34);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[37u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue34);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue34);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue34);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue1 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue2 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    uint productValue = uint(roundEven(vertexTexCoord1.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].w)));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue = multiplyAddValue4 + 0.5;
    float sumValue1 = multiplyAddValue5 + 0.5;
    float sumValue2 = multiplyAddValue6 + 0.5;
    float sumValue3 = sumValue - vertexVectorConstants0.packedValues[24u].x;
    float sumValue4 = sumValue1 - vertexVectorConstants0.packedValues[24u].y;
    float sumValue5 = sumValue2 - vertexVectorConstants0.packedValues[24u].z;
    float inverseLengthValue = inversesqrt(dot(vec3(sumValue3, sumValue4, sumValue5), vec3(sumValue3, sumValue4, sumValue5)));
    float productValue3 = sumValue3 * inverseLengthValue;
    float productValue4 = sumValue5 * inverseLengthValue;
    float sumValue6 = (-0.0) - productValue3;
    float inverseLengthValue1 = inversesqrt(dot(vec3(productValue4, 0.0, sumValue6), vec3(productValue4, 0.0, sumValue6)));
    float productValue5 = inverseLengthValue1 * productValue4;
    float productValue6 = inverseLengthValue1 * sumValue6;
    float sumValue7 = vertexColor0.z + (-0.5);
    float productValue7 = (inverseLengthValue * sumValue7) * sumValue4;
    float sumValue8 = vertexColor0.x + (-0.5);
    float productValue8 = (sumValue - (productValue5 * sumValue8)) - (productValue6 * productValue7);
    float productValue9 = sumValue1 - (((productValue5 * productValue4) - (productValue6 * productValue3)) * sumValue7);
    float productValue10 = sumValue2 - ((productValue6 * sumValue8) - (productValue5 * productValue7));
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].x, productValue10, fma(vertexVectorConstants0.packedValues[5u].x, productValue9, productValue8 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].y, productValue10, fma(vertexVectorConstants0.packedValues[5u].y, productValue9, productValue8 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].z, productValue10, fma(vertexVectorConstants0.packedValues[5u].z, productValue9, productValue8 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].w, productValue10, fma(vertexVectorConstants0.packedValues[5u].w, productValue9, productValue8 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue1 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue2 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    uint productValue = uint(roundEven(vertexTexCoord1.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[25u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[25u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].w)));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue20 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue21 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue22 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue1 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue2 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    uint productValue = uint(roundEven(vertexTexCoord1.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[8u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[8u].y, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].w)));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue20 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue21 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue22 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue17 = multiplyAddValue20 + 0.5;
    float sumValue18 = multiplyAddValue21 + 0.5;
    float sumValue19 = multiplyAddValue22 + 0.5;
    float sumValue20 = sumValue17 - vertexVectorConstants0.packedValues[8u].x;
    float sumValue21 = sumValue18 - vertexVectorConstants0.packedValues[8u].y;
    float sumValue22 = sumValue19 - vertexVectorConstants0.packedValues[8u].z;
    float inverseLengthValue4 = inversesqrt(dot(vec3(sumValue20, sumValue21, sumValue22), vec3(sumValue20, sumValue21, sumValue22)));
    float productValue16 = sumValue20 * inverseLengthValue4;
    float productValue17 = sumValue22 * inverseLengthValue4;
    float sumValue23 = (-0.0) - productValue16;
    float inverseLengthValue5 = inversesqrt(dot(vec3(productValue17, 0.0, sumValue23), vec3(productValue17, 0.0, sumValue23)));
    float productValue18 = inverseLengthValue5 * productValue17;
    float productValue19 = inverseLengthValue5 * sumValue23;
    float sumValue7 = vertexColor0.z + (-0.5);
    float productValue20 = (inverseLengthValue4 * sumValue7) * sumValue21;
    float sumValue8 = vertexColor0.x + (-0.5);
    float productValue21 = (sumValue17 - (productValue18 * sumValue8)) - (productValue19 * productValue20);
    float productValue22 = sumValue18 - (((productValue18 * productValue17) - (productValue19 * productValue16)) * sumValue7);
    float productValue23 = sumValue19 - ((productValue19 * sumValue8) - (productValue18 * productValue20));
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].x, productValue23, fma(vertexVectorConstants0.packedValues[5u].x, productValue22, productValue21 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].y, productValue23, fma(vertexVectorConstants0.packedValues[5u].y, productValue22, productValue21 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[6u].z, productValue23, fma(vertexVectorConstants0.packedValues[5u].z, productValue22, productValue21 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[6u].w, productValue23, fma(vertexVectorConstants0.packedValues[5u].w, productValue22, productValue21 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue1 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue2 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    uint productValue = uint(roundEven(vertexTexCoord1.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[9u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[9u].y, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue28, multiplyAddValue27 * vertexVectorConstants0.packedValues[0u].w)));
#endif
    varyingBitangent0.x = 0.0;
    varyingBitangent0.y = 0.0;
    varyingBitangent0.z = 0.0;
#if (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    uint productValue = uint(roundEven(vertexTexCoord1.y * 65535.0));
#elif (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
    uint productValue = uint(roundEven(vertexTexCoord1.y * 65535.0));
#elif (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#elif (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#endif
    varyingTexCoord2.x = float((uint(roundEven(vertexTexCoord1.x * 65535.0)) & 256u) != 0u);
    varyingTexCoord2.y = float((productValue & 256u) != 0u);
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue & 15u) * 0.066666670143604278564453125;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord1.x = float((productValue >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue & 15u) * 0.066666670143604278564453125;
#endif
    varyingNormal0.x = 0.0;
    varyingNormal0.y = 0.0;
    varyingNormal0.z = 0.0;
    varyingTexCoord4 = int(0u);
    varyingTangent0.x = 0.0;
    varyingTangent0.y = 0.0;
    varyingTangent0.z = 0.0;
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue1 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue2 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue2, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue2, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue2 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue2 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue4;
    varyingTexCoord3.y = multiplyAddValue5;
    varyingTexCoord3.z = multiplyAddValue6;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue2 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue2 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue20;
    varyingTexCoord3.y = multiplyAddValue21;
    varyingTexCoord3.z = multiplyAddValue22;
#endif
}
