#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunkPrepass / GeometryPrepass / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 13
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

#include "../../include/materials/RenderChunkPrepass/VertexBindings.glsli"

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
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    uint productValue = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = float(bitfieldExtract(productValue, int(8u), int(1u)) != 0u);
    varyingTexCoord2.y = float(bitfieldExtract(productValue1, int(8u), int(1u)) != 0u);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue22 = (fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x) + 0.5;
    float multiplyAddValue23 = (fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y) + 0.5;
    float multiplyAddValue24 = (fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z) + 0.5;
    float sumValue6 = multiplyAddValue24 - vertexVectorConstants0.packedValues[25u].z;
    float sumValue7 = multiplyAddValue22 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue8 = multiplyAddValue23 - vertexVectorConstants0.packedValues[25u].y;
    vec3 vectorValue = vec3(sumValue6, sumValue7, sumValue8);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue16 = inverseLengthValue2 * sumValue6;
    float productValue17 = inverseLengthValue2 * sumValue7;
    float productValue18 = inverseLengthValue2 * sumValue8;
    float scalarValue = -productValue17;
    vec2 vectorValue1 = vec2(productValue16, scalarValue);
    float inverseLengthValue3 = inversesqrt(rdDot2Precise(vectorValue1, vectorValue1));
    float productValue19 = inverseLengthValue3 * productValue16;
    float productValue20 = inverseLengthValue3 * scalarValue;
    float sumValue9 = vertexColor0.z - 0.5;
    float sumValue10 = vertexColor0.x - 0.5;
    float multiplyAddValue25 = multiplyAddValue22 - fma(productValue18 * productValue20, sumValue9, productValue19 * sumValue10);
    float multiplyAddValue26 = multiplyAddValue23 - (fma(productValue16, productValue19, -(productValue17 * productValue20)) * sumValue9);
    float multiplyAddValue27 = multiplyAddValue24 - fma(-(productValue18 * productValue19), sumValue9, productValue20 * sumValue10);
    varyingTexCoord3.x = multiplyAddValue25;
    varyingTexCoord3.y = multiplyAddValue26;
    varyingTexCoord3.z = multiplyAddValue27;
    vec4 multiplyAddValue28 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue25, multiplyAddValue26 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue25, multiplyAddValue26 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue25, multiplyAddValue26 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue25, multiplyAddValue26 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue28);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue28);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue28);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue28);
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
    uint productValue = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = float(bitfieldExtract(productValue, int(8u), int(1u)) != 0u);
    varyingTexCoord2.y = float(bitfieldExtract(productValue1, int(8u), int(1u)) != 0u);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue1 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue2 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    vec4 multiplyAddValue36 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue36);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue36);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue36);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue36);
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    uint productValue = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = float(bitfieldExtract(productValue, int(8u), int(1u)) != 0u);
    varyingTexCoord2.y = float(bitfieldExtract(productValue1, int(8u), int(1u)) != 0u);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float sumValue11 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w)) + 0.5;
    float sumValue12 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w)) + 0.5;
    float sumValue13 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w)) + 0.5;
    float sumValue14 = sumValue13 - vertexVectorConstants0.packedValues[25u].z;
    float sumValue15 = sumValue11 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue16 = sumValue12 - vertexVectorConstants0.packedValues[25u].y;
    vec3 vectorValue3 = vec3(sumValue14, sumValue15, sumValue16);
    float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    float productValue21 = inverseLengthValue4 * sumValue14;
    float productValue22 = inverseLengthValue4 * sumValue15;
    float productValue23 = inverseLengthValue4 * sumValue16;
    float scalarValue4 = -productValue22;
    vec2 vectorValue4 = vec2(productValue21, scalarValue4);
    float inverseLengthValue5 = inversesqrt(rdDot2Precise(vectorValue4, vectorValue4));
    float productValue24 = inverseLengthValue5 * productValue21;
    float productValue25 = inverseLengthValue5 * scalarValue4;
    float sumValue9 = vertexColor0.z - 0.5;
    float sumValue10 = vertexColor0.x - 0.5;
    float multiplyAddValue37 = sumValue11 - fma(productValue23 * productValue25, sumValue9, productValue24 * sumValue10);
    float multiplyAddValue38 = sumValue12 - (fma(productValue21, productValue24, -(productValue22 * productValue25)) * sumValue9);
    float multiplyAddValue39 = sumValue13 - fma(-(productValue23 * productValue24), sumValue9, productValue25 * sumValue10);
    varyingTexCoord3.x = multiplyAddValue37;
    varyingTexCoord3.y = multiplyAddValue38;
    varyingTexCoord3.z = multiplyAddValue39;
    vec4 multiplyAddValue40 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue37, multiplyAddValue38 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue37, multiplyAddValue38 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue37, multiplyAddValue38 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue37, multiplyAddValue38 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue40);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue40);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue40);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue40);
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
    uint productValue = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = float(bitfieldExtract(productValue, int(8u), int(1u)) != 0u);
    varyingTexCoord2.y = float(bitfieldExtract(productValue1, int(8u), int(1u)) != 0u);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue9, multiplyAddValue8 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue2 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue3 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue4 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue6 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue >> 8u;
    uint bitwiseValue1 = productValue1 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[0u].w)));
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue6, fma(vertexVectorConstants0.packedValues[9u].x, productValue5, vertexVectorConstants0.packedValues[8u].x * productValue4));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue6, fma(vertexVectorConstants0.packedValues[9u].y, productValue5, vertexVectorConstants0.packedValues[8u].y * productValue4));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue6, fma(vertexVectorConstants0.packedValues[9u].z, productValue5, vertexVectorConstants0.packedValues[8u].z * productValue4));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue15 = (vertexVectorConstants0.packedValues[11u].x + 0.5) + fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x));
    float multiplyAddValue16 = (vertexVectorConstants0.packedValues[11u].y + 0.5) + fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x));
    float multiplyAddValue17 = (vertexVectorConstants0.packedValues[11u].z + 0.5) + fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x));
    float sumValue = multiplyAddValue15 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue1 = multiplyAddValue16 - vertexVectorConstants0.packedValues[25u].y;
    float sumValue2 = multiplyAddValue17 - vertexVectorConstants0.packedValues[25u].z;
    float inverseLengthValue = inversesqrt(dot(vec3(sumValue, sumValue1, sumValue2), vec3(sumValue, sumValue1, sumValue2)));
    float productValue8 = sumValue * inverseLengthValue;
    float productValue9 = sumValue2 * inverseLengthValue;
    float sumValue3 = (-0.0) - productValue8;
    float inverseLengthValue1 = inversesqrt(dot(vec3(productValue9, 0.0, sumValue3), vec3(productValue9, 0.0, sumValue3)));
    float productValue10 = inverseLengthValue1 * productValue9;
    float productValue11 = inverseLengthValue1 * sumValue3;
    float sumValue4 = vertexColor0.z + (-0.5);
    float productValue12 = (inverseLengthValue * sumValue4) * sumValue1;
    float sumValue5 = vertexColor0.x + (-0.5);
    float productValue13 = (multiplyAddValue15 - (productValue10 * sumValue5)) - (productValue11 * productValue12);
    float productValue14 = multiplyAddValue16 - (((productValue10 * productValue9) - (productValue11 * productValue8)) * sumValue4);
    float productValue15 = multiplyAddValue17 - ((productValue11 * sumValue5) - (productValue10 * productValue12));
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].x, productValue15, fma(vertexVectorConstants0.packedValues[5u].x, productValue14, productValue13 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[6u].y, productValue15, fma(vertexVectorConstants0.packedValues[5u].y, productValue14, productValue13 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[6u].z, productValue15, fma(vertexVectorConstants0.packedValues[5u].z, productValue14, productValue13 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[6u].w, productValue15, fma(vertexVectorConstants0.packedValues[5u].w, productValue14, productValue13 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue2 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue3 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue4 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue6 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue >> 8u;
    uint bitwiseValue1 = productValue1 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[0u].w)));
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue6, fma(vertexVectorConstants0.packedValues[9u].x, productValue5, vertexVectorConstants0.packedValues[8u].x * productValue4));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue6, fma(vertexVectorConstants0.packedValues[9u].y, productValue5, vertexVectorConstants0.packedValues[8u].y * productValue4));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue6, fma(vertexVectorConstants0.packedValues[9u].z, productValue5, vertexVectorConstants0.packedValues[8u].z * productValue4));
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue29 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue30 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue31 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue30, multiplyAddValue29 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue2 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue3 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue4 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue6 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue >> 8u;
    uint bitwiseValue1 = productValue1 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].w)));
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue6, fma(vertexVectorConstants0.packedValues[9u].x, productValue5, vertexVectorConstants0.packedValues[8u].x * productValue4));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue6, fma(vertexVectorConstants0.packedValues[9u].y, productValue5, vertexVectorConstants0.packedValues[8u].y * productValue4));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue6, fma(vertexVectorConstants0.packedValues[9u].z, productValue5, vertexVectorConstants0.packedValues[8u].z * productValue4));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue41 = (vertexTexCoord7.w + 0.5) + fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x));
    float multiplyAddValue42 = (vertexTexCoord6.w + 0.5) + fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x));
    float multiplyAddValue43 = (vertexTexCoord5.w + 0.5) + fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x));
    float sumValue17 = multiplyAddValue41 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue18 = multiplyAddValue42 - vertexVectorConstants0.packedValues[25u].y;
    float sumValue19 = multiplyAddValue43 - vertexVectorConstants0.packedValues[25u].z;
    float inverseLengthValue6 = inversesqrt(dot(vec3(sumValue17, sumValue18, sumValue19), vec3(sumValue17, sumValue18, sumValue19)));
    float productValue26 = sumValue17 * inverseLengthValue6;
    float productValue27 = sumValue19 * inverseLengthValue6;
    float sumValue20 = (-0.0) - productValue26;
    float inverseLengthValue7 = inversesqrt(dot(vec3(productValue27, 0.0, sumValue20), vec3(productValue27, 0.0, sumValue20)));
    float productValue28 = inverseLengthValue7 * productValue27;
    float productValue29 = inverseLengthValue7 * sumValue20;
    float sumValue4 = vertexColor0.z + (-0.5);
    float productValue30 = (inverseLengthValue6 * sumValue4) * sumValue18;
    float sumValue5 = vertexColor0.x + (-0.5);
    float productValue31 = (multiplyAddValue41 - (productValue28 * sumValue5)) - (productValue29 * productValue30);
    float productValue32 = multiplyAddValue42 - (((productValue28 * productValue27) - (productValue29 * productValue26)) * sumValue4);
    float productValue33 = multiplyAddValue43 - ((productValue29 * sumValue5) - (productValue28 * productValue30));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[6u].x, productValue33, fma(vertexVectorConstants0.packedValues[5u].x, productValue32, productValue31 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[6u].y, productValue33, fma(vertexVectorConstants0.packedValues[5u].y, productValue32, productValue31 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[6u].z, productValue33, fma(vertexVectorConstants0.packedValues[5u].z, productValue32, productValue31 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[6u].w, productValue33, fma(vertexVectorConstants0.packedValues[5u].w, productValue32, productValue31 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue2 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue3 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float productValue4 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue6 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue >> 8u;
    uint bitwiseValue1 = productValue1 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue46, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue45, multiplyAddValue44 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue46, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue45, multiplyAddValue44 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue46, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue45, multiplyAddValue44 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue46, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue45, multiplyAddValue44 * vertexVectorConstants0.packedValues[0u].w)));
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue6, fma(vertexVectorConstants0.packedValues[9u].x, productValue5, vertexVectorConstants0.packedValues[8u].x * productValue4));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue6, fma(vertexVectorConstants0.packedValues[9u].y, productValue5, vertexVectorConstants0.packedValues[8u].y * productValue4));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue6, fma(vertexVectorConstants0.packedValues[9u].z, productValue5, vertexVectorConstants0.packedValues[8u].z * productValue4));
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue1 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue1 & 15u) * 0.066666670143604278564453125;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
#endif
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingFrontFacing0 = int(0u);
    float multiplyAddValue7 = fma(vertexNormal0.w, 0.5, 0.5);
    varyingTexCoord5.x = (multiplyAddValue7 * (rdEvaluateFloatExpression((productValue >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.y = (multiplyAddValue7 * (rdEvaluateFloatExpression(productValue & 255u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.z = (multiplyAddValue7 * (rdEvaluateFloatExpression((productValue1 >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z));
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z));
    uint productValue2 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue3 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue2, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue2, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue3, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue3, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue2 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue2 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue3 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue8;
    varyingTexCoord3.y = multiplyAddValue9;
    varyingTexCoord3.z = multiplyAddValue10;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue2 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue2 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue3 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = productValue13;
    varyingTexCoord3.y = productValue14;
    varyingTexCoord3.z = productValue15;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue2 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue2 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue3 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue29;
    varyingTexCoord3.y = multiplyAddValue30;
    varyingTexCoord3.z = multiplyAddValue31;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue2 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue2 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue3 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue3 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = productValue31;
    varyingTexCoord3.y = productValue32;
    varyingTexCoord3.z = productValue33;
#endif
}
