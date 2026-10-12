#version 460
#extension GL_GOOGLE_include_directive : require
// SingleBlockPrepass / GeometryPrepass / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 12
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

#include "../../include/materials/SingleBlockPrepass/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    varyingTexCoord3.x = multiplyAddValue11;
    varyingTexCoord3.y = multiplyAddValue12;
    varyingTexCoord3.z = multiplyAddValue13;
    vec4 multiplyAddValue14 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue14);
    float sumValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue14);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue14);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue14);
    gl_Position.x = sumValue;
    gl_Position.y = sumValue1;
    gl_Position.z = scalarValue;
    gl_Position.w = scalarValue1;
    varyingColor1.x = sumValue;
    varyingColor1.y = sumValue1;
    varyingColor1.z = scalarValue;
    varyingColor1.w = scalarValue1;
    float multiplyAddValue15 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue16 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue17 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].z));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue18 = (fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x) + 0.5;
    float multiplyAddValue19 = (fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y) + 0.5;
    float multiplyAddValue20 = (fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z) + 0.5;
    float sumValue2 = multiplyAddValue20 - vertexVectorConstants0.packedValues[25u].z;
    float sumValue3 = multiplyAddValue18 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue4 = multiplyAddValue19 - vertexVectorConstants0.packedValues[25u].y;
    vec3 vectorValue = vec3(sumValue2, sumValue3, sumValue4);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue5 = inverseLengthValue * sumValue2;
    float productValue6 = inverseLengthValue * sumValue3;
    float productValue7 = inverseLengthValue * sumValue4;
    float scalarValue2 = -productValue6;
    vec2 vectorValue1 = vec2(productValue5, scalarValue2);
    float inverseLengthValue1 = inversesqrt(rdDot2Precise(vectorValue1, vectorValue1));
    float productValue8 = inverseLengthValue1 * productValue5;
    float productValue9 = inverseLengthValue1 * scalarValue2;
    float sumValue5 = vertexColor0.z - 0.5;
    float sumValue6 = vertexColor0.x - 0.5;
    float multiplyAddValue21 = multiplyAddValue18 - fma(productValue7 * productValue9, sumValue5, productValue8 * sumValue6);
    float multiplyAddValue22 = multiplyAddValue19 - (fma(productValue5, productValue8, -(productValue6 * productValue9)) * sumValue5);
    float multiplyAddValue23 = multiplyAddValue20 - fma(-(productValue7 * productValue8), sumValue5, productValue9 * sumValue6);
    varyingTexCoord3.x = multiplyAddValue21;
    varyingTexCoord3.y = multiplyAddValue22;
    varyingTexCoord3.z = multiplyAddValue23;
    vec4 multiplyAddValue24 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue21, multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue21, multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue21, multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue21, multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue24);
    float sumValue8 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue24);
    float scalarValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue24);
    float scalarValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue24);
    gl_Position.x = sumValue7;
    gl_Position.y = sumValue8;
    gl_Position.z = scalarValue3;
    gl_Position.w = scalarValue4;
    varyingColor1.x = sumValue7;
    varyingColor1.y = sumValue8;
    varyingColor1.z = scalarValue3;
    varyingColor1.w = scalarValue4;
    float multiplyAddValue15 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue16 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue17 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].z));
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue5 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue6 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue7 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue6;
    varyingTexCoord3.y = scalarValue5;
    varyingTexCoord3.z = scalarValue7;
    vec4 multiplyAddValue36 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue7, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue6, scalarValue5 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue7, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue6, scalarValue5 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue7, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue6, scalarValue5 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue7, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue6, scalarValue5 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue36);
    float sumValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue36);
    float scalarValue8 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue36);
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue36);
    gl_Position.x = sumValue15;
    gl_Position.y = sumValue16;
    gl_Position.z = scalarValue8;
    gl_Position.w = scalarValue9;
    varyingColor1.x = sumValue15;
    varyingColor1.y = sumValue16;
    varyingColor1.z = scalarValue8;
    varyingColor1.w = scalarValue9;
    float multiplyAddValue15 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue16 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue17 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].z));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float sumValue21 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w)) + 0.5;
    float sumValue22 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w)) + 0.5;
    float sumValue23 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w)) + 0.5;
    float sumValue24 = sumValue23 - vertexVectorConstants0.packedValues[25u].z;
    float sumValue25 = sumValue21 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue26 = sumValue22 - vertexVectorConstants0.packedValues[25u].y;
    vec3 vectorValue3 = vec3(sumValue24, sumValue25, sumValue26);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    float productValue26 = inverseLengthValue6 * sumValue24;
    float productValue27 = inverseLengthValue6 * sumValue25;
    float productValue28 = inverseLengthValue6 * sumValue26;
    float scalarValue10 = -productValue27;
    vec2 vectorValue4 = vec2(productValue26, scalarValue10);
    float inverseLengthValue7 = inversesqrt(rdDot2Precise(vectorValue4, vectorValue4));
    float productValue29 = inverseLengthValue7 * productValue26;
    float productValue30 = inverseLengthValue7 * scalarValue10;
    float sumValue5 = vertexColor0.z - 0.5;
    float sumValue6 = vertexColor0.x - 0.5;
    float multiplyAddValue59 = sumValue21 - fma(productValue28 * productValue30, sumValue5, productValue29 * sumValue6);
    float multiplyAddValue60 = sumValue22 - (fma(productValue26, productValue29, -(productValue27 * productValue30)) * sumValue5);
    float multiplyAddValue61 = sumValue23 - fma(-(productValue28 * productValue29), sumValue5, productValue30 * sumValue6);
    varyingTexCoord3.x = multiplyAddValue59;
    varyingTexCoord3.y = multiplyAddValue60;
    varyingTexCoord3.z = multiplyAddValue61;
    vec4 multiplyAddValue62 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue61, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue59, multiplyAddValue60 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue61, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue59, multiplyAddValue60 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue61, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue59, multiplyAddValue60 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue61, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue59, multiplyAddValue60 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue27 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue62);
    float sumValue28 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue62);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue62);
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue62);
    gl_Position.x = sumValue27;
    gl_Position.y = sumValue28;
    gl_Position.z = scalarValue11;
    gl_Position.w = scalarValue12;
    varyingColor1.x = sumValue27;
    varyingColor1.y = sumValue28;
    varyingColor1.z = scalarValue11;
    varyingColor1.w = scalarValue12;
    float multiplyAddValue15 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue16 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue17 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].z));
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue7;
    gl_Position.y = multiplyAddValue8;
    gl_Position.z = multiplyAddValue9;
    gl_Position.w = multiplyAddValue10;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue4, fma(vertexVectorConstants0.packedValues[9u].x, productValue3, vertexVectorConstants0.packedValues[8u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue4, fma(vertexVectorConstants0.packedValues[9u].y, productValue3, vertexVectorConstants0.packedValues[8u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue4, fma(vertexVectorConstants0.packedValues[9u].z, productValue3, vertexVectorConstants0.packedValues[8u].z * productValue2));
    varyingColor1.x = multiplyAddValue7;
    varyingColor1.y = multiplyAddValue8;
    varyingColor1.z = multiplyAddValue9;
    varyingColor1.w = multiplyAddValue10;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue25 = (vertexVectorConstants0.packedValues[11u].x + 0.5) + fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x));
    float multiplyAddValue26 = (vertexVectorConstants0.packedValues[11u].y + 0.5) + fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x));
    float multiplyAddValue27 = (vertexVectorConstants0.packedValues[11u].z + 0.5) + fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x));
    float sumValue9 = multiplyAddValue25 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue10 = multiplyAddValue26 - vertexVectorConstants0.packedValues[25u].y;
    float sumValue11 = multiplyAddValue27 - vertexVectorConstants0.packedValues[25u].z;
    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue9, sumValue10, sumValue11), vec3(sumValue9, sumValue10, sumValue11)));
    float productValue10 = sumValue9 * inverseLengthValue2;
    float productValue11 = sumValue11 * inverseLengthValue2;
    float sumValue12 = (-0.0) - productValue10;
    float inverseLengthValue3 = inversesqrt(dot(vec3(productValue11, 0.0, sumValue12), vec3(productValue11, 0.0, sumValue12)));
    float productValue12 = inverseLengthValue3 * productValue11;
    float productValue13 = inverseLengthValue3 * sumValue12;
    float sumValue13 = vertexColor0.z + (-0.5);
    float productValue14 = (inverseLengthValue2 * sumValue13) * sumValue10;
    float sumValue14 = vertexColor0.x + (-0.5);
    float productValue15 = (multiplyAddValue25 - (productValue12 * sumValue14)) - (productValue13 * productValue14);
    float productValue16 = multiplyAddValue26 - (((productValue12 * productValue11) - (productValue13 * productValue10)) * sumValue13);
    float productValue17 = multiplyAddValue27 - ((productValue13 * sumValue14) - (productValue12 * productValue14));
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].x, productValue17, fma(vertexVectorConstants0.packedValues[5u].x, productValue16, productValue15 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[6u].y, productValue17, fma(vertexVectorConstants0.packedValues[5u].y, productValue16, productValue15 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[6u].z, productValue17, fma(vertexVectorConstants0.packedValues[5u].z, productValue16, productValue15 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[6u].w, productValue17, fma(vertexVectorConstants0.packedValues[5u].w, productValue16, productValue15 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue32;
    gl_Position.y = multiplyAddValue33;
    gl_Position.z = multiplyAddValue34;
    gl_Position.w = multiplyAddValue35;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue4, fma(vertexVectorConstants0.packedValues[9u].x, productValue3, vertexVectorConstants0.packedValues[8u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue4, fma(vertexVectorConstants0.packedValues[9u].y, productValue3, vertexVectorConstants0.packedValues[8u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue4, fma(vertexVectorConstants0.packedValues[9u].z, productValue3, vertexVectorConstants0.packedValues[8u].z * productValue2));
    varyingColor1.x = multiplyAddValue32;
    varyingColor1.y = multiplyAddValue33;
    varyingColor1.z = multiplyAddValue34;
    varyingColor1.w = multiplyAddValue35;
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue37 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue38 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue39 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue38, multiplyAddValue37 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue38, multiplyAddValue37 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue38, multiplyAddValue37 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue38, multiplyAddValue37 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue43, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue41, multiplyAddValue40 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue43, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue41, multiplyAddValue40 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue43, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue41, multiplyAddValue40 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue43, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue41, multiplyAddValue40 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue44;
    gl_Position.y = multiplyAddValue45;
    gl_Position.z = multiplyAddValue46;
    gl_Position.w = multiplyAddValue47;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue4, fma(vertexVectorConstants0.packedValues[9u].x, productValue3, vertexVectorConstants0.packedValues[8u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue4, fma(vertexVectorConstants0.packedValues[9u].y, productValue3, vertexVectorConstants0.packedValues[8u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue4, fma(vertexVectorConstants0.packedValues[9u].z, productValue3, vertexVectorConstants0.packedValues[8u].z * productValue2));
    varyingColor1.x = multiplyAddValue44;
    varyingColor1.y = multiplyAddValue45;
    varyingColor1.z = multiplyAddValue46;
    varyingColor1.w = multiplyAddValue47;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue48 = (vertexTexCoord7.w + 0.5) + fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x));
    float multiplyAddValue49 = (vertexTexCoord6.w + 0.5) + fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x));
    float multiplyAddValue50 = (vertexTexCoord5.w + 0.5) + fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x));
    float sumValue17 = multiplyAddValue48 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue18 = multiplyAddValue49 - vertexVectorConstants0.packedValues[25u].y;
    float sumValue19 = multiplyAddValue50 - vertexVectorConstants0.packedValues[25u].z;
    float inverseLengthValue4 = inversesqrt(dot(vec3(sumValue17, sumValue18, sumValue19), vec3(sumValue17, sumValue18, sumValue19)));
    float productValue18 = sumValue17 * inverseLengthValue4;
    float productValue19 = sumValue19 * inverseLengthValue4;
    float sumValue20 = (-0.0) - productValue18;
    float inverseLengthValue5 = inversesqrt(dot(vec3(productValue19, 0.0, sumValue20), vec3(productValue19, 0.0, sumValue20)));
    float productValue20 = inverseLengthValue5 * productValue19;
    float productValue21 = inverseLengthValue5 * sumValue20;
    float sumValue13 = vertexColor0.z + (-0.5);
    float productValue22 = (inverseLengthValue4 * sumValue13) * sumValue18;
    float sumValue14 = vertexColor0.x + (-0.5);
    float productValue23 = (multiplyAddValue48 - (productValue20 * sumValue14)) - (productValue21 * productValue22);
    float productValue24 = multiplyAddValue49 - (((productValue20 * productValue19) - (productValue21 * productValue18)) * sumValue13);
    float productValue25 = multiplyAddValue50 - ((productValue21 * sumValue14) - (productValue20 * productValue22));
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[6u].x, productValue25, fma(vertexVectorConstants0.packedValues[5u].x, productValue24, productValue23 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[6u].y, productValue25, fma(vertexVectorConstants0.packedValues[5u].y, productValue24, productValue23 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[6u].z, productValue25, fma(vertexVectorConstants0.packedValues[5u].z, productValue24, productValue23 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue54 = fma(vertexVectorConstants0.packedValues[6u].w, productValue25, fma(vertexVectorConstants0.packedValues[5u].w, productValue24, productValue23 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue55 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue54, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue52, multiplyAddValue51 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue56 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue54, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue52, multiplyAddValue51 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue57 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue54, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue52, multiplyAddValue51 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue58 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue54, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue52, multiplyAddValue51 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue55;
    gl_Position.y = multiplyAddValue56;
    gl_Position.z = multiplyAddValue57;
    gl_Position.w = multiplyAddValue58;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue4, fma(vertexVectorConstants0.packedValues[9u].x, productValue3, vertexVectorConstants0.packedValues[8u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue4, fma(vertexVectorConstants0.packedValues[9u].y, productValue3, vertexVectorConstants0.packedValues[8u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue4, fma(vertexVectorConstants0.packedValues[9u].z, productValue3, vertexVectorConstants0.packedValues[8u].z * productValue2));
    varyingColor1.x = multiplyAddValue55;
    varyingColor1.y = multiplyAddValue56;
    varyingColor1.z = multiplyAddValue57;
    varyingColor1.w = multiplyAddValue58;
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
#endif
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingFrontFacing0 = int(0u);
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z));
#endif
    varyingTexCoord5.x = 0.0;
    varyingTexCoord5.y = 0.0;
    varyingTexCoord5.z = 0.0;
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z));
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = productValue15;
    varyingTexCoord3.y = productValue16;
    varyingTexCoord3.z = productValue17;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue37;
    varyingTexCoord3.y = multiplyAddValue38;
    varyingTexCoord3.z = multiplyAddValue39;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = productValue23;
    varyingTexCoord3.y = productValue24;
    varyingTexCoord3.z = productValue25;
#endif
}
