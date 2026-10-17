#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunkPrepass / GeometryPrepassAlphaTest / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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
#define RD_BINDING_LAYOUT 20
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
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
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue11 = (fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x) + 0.5;
    float multiplyAddValue12 = (fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y) + 0.5;
    float multiplyAddValue13 = (fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z) + 0.5;
    float sumValue = multiplyAddValue13 - vertexVectorConstants0.packedValues[25u].z;
    float sumValue1 = multiplyAddValue11 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue2 = multiplyAddValue12 - vertexVectorConstants0.packedValues[25u].y;
    vec3 vectorValue = vec3(sumValue, sumValue1, sumValue2);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue8 = inverseLengthValue * sumValue;
    float productValue9 = inverseLengthValue * sumValue1;
    float productValue10 = inverseLengthValue * sumValue2;
    float scalarValue = -productValue9;
    vec2 vectorValue1 = vec2(productValue8, scalarValue);
    float inverseLengthValue1 = inversesqrt(rdDot2Precise(vectorValue1, vectorValue1));
    float productValue11 = inverseLengthValue1 * productValue8;
    float productValue12 = inverseLengthValue1 * scalarValue;
    float sumValue3 = vertexColor0.z - 0.5;
    float sumValue4 = vertexColor0.x - 0.5;
    float multiplyAddValue14 = multiplyAddValue11 - fma(productValue10 * productValue12, sumValue3, productValue11 * sumValue4);
    float multiplyAddValue15 = multiplyAddValue12 - (fma(productValue8, productValue11, -(productValue9 * productValue12)) * sumValue3);
    float multiplyAddValue16 = multiplyAddValue13 - fma(-(productValue10 * productValue11), sumValue3, productValue12 * sumValue4);
    varyingTexCoord3.x = multiplyAddValue14;
    varyingTexCoord3.y = multiplyAddValue15;
    varyingTexCoord3.z = multiplyAddValue16;
    vec4 multiplyAddValue17 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue17);
    float sumValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue17);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue17);
    float scalarValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue17);
    gl_Position.x = sumValue5;
    gl_Position.y = sumValue6;
    gl_Position.z = scalarValue1;
    gl_Position.w = scalarValue2;
    varyingColor1.x = sumValue5;
    varyingColor1.y = sumValue6;
    varyingColor1.z = scalarValue1;
    varyingColor1.w = scalarValue2;
    float multiplyAddValue18 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue19 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue20 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue18, multiplyAddValue19 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue18, multiplyAddValue19 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue18, multiplyAddValue19 * vertexVectorConstants0.packedValues[9u].z));
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
    uint productValue5 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue6 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue6 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = float(bitfieldExtract(productValue5, int(8u), int(1u)) != 0u);
    varyingTexCoord2.y = float(bitfieldExtract(productValue6, int(8u), int(1u)) != 0u);
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingFrontFacing0 = int(0u);
    float multiplyAddValue21 = fma(vertexNormal0.w, 0.5, 0.5);
    varyingTexCoord5.x = (multiplyAddValue21 * (rdEvaluateFloatExpression((productValue5 >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.y = (multiplyAddValue21 * (rdEvaluateFloatExpression(productValue5 & 255u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.z = (multiplyAddValue21 * (rdEvaluateFloatExpression((productValue6 >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z));
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue2 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float sumValue17 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w)) + 0.5;
    float sumValue18 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w)) + 0.5;
    float sumValue19 = rdDot4Precise(vectorValue2, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w)) + 0.5;
    float sumValue20 = sumValue19 - vertexVectorConstants0.packedValues[25u].z;
    float sumValue21 = sumValue17 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue22 = sumValue18 - vertexVectorConstants0.packedValues[25u].y;
    vec3 vectorValue3 = vec3(sumValue20, sumValue21, sumValue22);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    float productValue29 = inverseLengthValue6 * sumValue20;
    float productValue30 = inverseLengthValue6 * sumValue21;
    float productValue31 = inverseLengthValue6 * sumValue22;
    float scalarValue3 = -productValue30;
    vec2 vectorValue4 = vec2(productValue29, scalarValue3);
    float inverseLengthValue7 = inversesqrt(rdDot2Precise(vectorValue4, vectorValue4));
    float productValue32 = inverseLengthValue7 * productValue29;
    float productValue33 = inverseLengthValue7 * scalarValue3;
    float sumValue3 = vertexColor0.z - 0.5;
    float sumValue4 = vertexColor0.x - 0.5;
    float multiplyAddValue55 = sumValue17 - fma(productValue31 * productValue33, sumValue3, productValue32 * sumValue4);
    float multiplyAddValue56 = sumValue18 - (fma(productValue29, productValue32, -(productValue30 * productValue33)) * sumValue3);
    float multiplyAddValue57 = sumValue19 - fma(-(productValue31 * productValue32), sumValue3, productValue33 * sumValue4);
    varyingTexCoord3.x = multiplyAddValue55;
    varyingTexCoord3.y = multiplyAddValue56;
    varyingTexCoord3.z = multiplyAddValue57;
    vec4 multiplyAddValue58 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue57, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue55, multiplyAddValue56 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue57, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue55, multiplyAddValue56 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue57, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue55, multiplyAddValue56 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue57, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue55, multiplyAddValue56 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue23 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[96u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue58);
    float sumValue24 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[97u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue58);
    float scalarValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue58);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue58);
    gl_Position.x = sumValue23;
    gl_Position.y = sumValue24;
    gl_Position.z = scalarValue4;
    gl_Position.w = scalarValue5;
    varyingColor1.x = sumValue23;
    varyingColor1.y = sumValue24;
    varyingColor1.z = scalarValue4;
    varyingColor1.w = scalarValue5;
    float multiplyAddValue18 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue19 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue20 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue18, multiplyAddValue19 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue18, multiplyAddValue19 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue18, multiplyAddValue19 * vertexVectorConstants0.packedValues[9u].z));
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
    uint productValue5 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue6 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue6 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord2.x = float(bitfieldExtract(productValue5, int(8u), int(1u)) != 0u);
    varyingTexCoord2.y = float(bitfieldExtract(productValue6, int(8u), int(1u)) != 0u);
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingFrontFacing0 = int(0u);
    float multiplyAddValue21 = fma(vertexNormal0.w, 0.5, 0.5);
    varyingTexCoord5.x = (multiplyAddValue21 * (rdEvaluateFloatExpression((productValue5 >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.y = (multiplyAddValue21 * (rdEvaluateFloatExpression(productValue5 & 255u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingTexCoord5.z = (multiplyAddValue21 * (rdEvaluateFloatExpression((productValue6 >> 8u) & 254u) * 0.0039215688593685626983642578125)) * 6.0;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z));
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF)
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
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue22 = (vertexVectorConstants0.packedValues[11u].x + 0.5) + fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x));
    float multiplyAddValue23 = (vertexVectorConstants0.packedValues[11u].y + 0.5) + fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x));
    float multiplyAddValue24 = (vertexVectorConstants0.packedValues[11u].z + 0.5) + fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x));
    float sumValue7 = multiplyAddValue22 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue8 = multiplyAddValue23 - vertexVectorConstants0.packedValues[25u].y;
    float sumValue9 = multiplyAddValue24 - vertexVectorConstants0.packedValues[25u].z;
    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue7, sumValue8, sumValue9), vec3(sumValue7, sumValue8, sumValue9)));
    float productValue13 = sumValue7 * inverseLengthValue2;
    float productValue14 = sumValue9 * inverseLengthValue2;
    float sumValue10 = (-0.0) - productValue13;
    float inverseLengthValue3 = inversesqrt(dot(vec3(productValue14, 0.0, sumValue10), vec3(productValue14, 0.0, sumValue10)));
    float productValue15 = inverseLengthValue3 * productValue14;
    float productValue16 = inverseLengthValue3 * sumValue10;
    float sumValue11 = vertexColor0.z + (-0.5);
    float productValue17 = (inverseLengthValue2 * sumValue11) * sumValue8;
    float sumValue12 = vertexColor0.x + (-0.5);
    float productValue18 = (multiplyAddValue22 - (productValue15 * sumValue12)) - (productValue16 * productValue17);
    float productValue19 = multiplyAddValue23 - (((productValue15 * productValue14) - (productValue16 * productValue13)) * sumValue11);
    float productValue20 = multiplyAddValue24 - ((productValue16 * sumValue12) - (productValue15 * productValue17));
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].x, productValue20, fma(vertexVectorConstants0.packedValues[5u].x, productValue19, productValue18 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].y, productValue20, fma(vertexVectorConstants0.packedValues[5u].y, productValue19, productValue18 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].z, productValue20, fma(vertexVectorConstants0.packedValues[5u].z, productValue19, productValue18 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].w, productValue20, fma(vertexVectorConstants0.packedValues[5u].w, productValue19, productValue18 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].w)));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF)
    float multiplyAddValue33 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue34 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue35 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue34, multiplyAddValue33 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue34, multiplyAddValue33 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue34, multiplyAddValue33 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue34, multiplyAddValue33 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue39, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[0u].w)));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue44 = (vertexTexCoord7.w + 0.5) + fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x));
    float multiplyAddValue45 = (vertexTexCoord6.w + 0.5) + fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x));
    float multiplyAddValue46 = (vertexTexCoord5.w + 0.5) + fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x));
    float sumValue13 = multiplyAddValue44 - vertexVectorConstants0.packedValues[25u].x;
    float sumValue14 = multiplyAddValue45 - vertexVectorConstants0.packedValues[25u].y;
    float sumValue15 = multiplyAddValue46 - vertexVectorConstants0.packedValues[25u].z;
    float inverseLengthValue4 = inversesqrt(dot(vec3(sumValue13, sumValue14, sumValue15), vec3(sumValue13, sumValue14, sumValue15)));
    float productValue21 = sumValue13 * inverseLengthValue4;
    float productValue22 = sumValue15 * inverseLengthValue4;
    float sumValue16 = (-0.0) - productValue21;
    float inverseLengthValue5 = inversesqrt(dot(vec3(productValue22, 0.0, sumValue16), vec3(productValue22, 0.0, sumValue16)));
    float productValue23 = inverseLengthValue5 * productValue22;
    float productValue24 = inverseLengthValue5 * sumValue16;
    float sumValue11 = vertexColor0.z + (-0.5);
    float productValue25 = (inverseLengthValue4 * sumValue11) * sumValue14;
    float sumValue12 = vertexColor0.x + (-0.5);
    float productValue26 = (multiplyAddValue44 - (productValue23 * sumValue12)) - (productValue24 * productValue25);
    float productValue27 = multiplyAddValue45 - (((productValue23 * productValue22) - (productValue24 * productValue21)) * sumValue11);
    float productValue28 = multiplyAddValue46 - ((productValue24 * sumValue12) - (productValue23 * productValue25));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[6u].x, productValue28, fma(vertexVectorConstants0.packedValues[5u].x, productValue27, productValue26 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[6u].y, productValue28, fma(vertexVectorConstants0.packedValues[5u].y, productValue27, productValue26 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[6u].z, productValue28, fma(vertexVectorConstants0.packedValues[5u].z, productValue27, productValue26 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue50 = fma(vertexVectorConstants0.packedValues[6u].w, productValue28, fma(vertexVectorConstants0.packedValues[5u].w, productValue27, productValue26 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue50, fma(vertexVectorConstants0.packedValues[24u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue48, multiplyAddValue47 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue50, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[24u].y, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue48, multiplyAddValue47 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue50, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue48, multiplyAddValue47 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue54 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue50, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue49, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue48, multiplyAddValue47 * vertexVectorConstants0.packedValues[0u].w)));
#endif
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF)
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue6 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
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
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue5 & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue6 & 15u) * 0.066666670143604278564453125;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue6 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = multiplyAddValue29;
    gl_Position.y = multiplyAddValue30;
    gl_Position.z = multiplyAddValue31;
    gl_Position.w = multiplyAddValue32;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue4, fma(vertexVectorConstants0.packedValues[9u].x, productValue3, vertexVectorConstants0.packedValues[8u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue4, fma(vertexVectorConstants0.packedValues[9u].y, productValue3, vertexVectorConstants0.packedValues[8u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue4, fma(vertexVectorConstants0.packedValues[9u].z, productValue3, vertexVectorConstants0.packedValues[8u].z * productValue2));
    varyingColor1.x = multiplyAddValue29;
    varyingColor1.y = multiplyAddValue30;
    varyingColor1.z = multiplyAddValue31;
    varyingColor1.w = multiplyAddValue32;
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue5 & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue6 & 15u) * 0.066666670143604278564453125;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = productValue18;
    varyingTexCoord3.y = productValue19;
    varyingTexCoord3.z = productValue20;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF)
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue6 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = multiplyAddValue40;
    gl_Position.y = multiplyAddValue41;
    gl_Position.z = multiplyAddValue42;
    gl_Position.w = multiplyAddValue43;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue4, fma(vertexVectorConstants0.packedValues[9u].x, productValue3, vertexVectorConstants0.packedValues[8u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue4, fma(vertexVectorConstants0.packedValues[9u].y, productValue3, vertexVectorConstants0.packedValues[8u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue4, fma(vertexVectorConstants0.packedValues[9u].z, productValue3, vertexVectorConstants0.packedValues[8u].z * productValue2));
    varyingColor1.x = multiplyAddValue40;
    varyingColor1.y = multiplyAddValue41;
    varyingColor1.z = multiplyAddValue42;
    varyingColor1.w = multiplyAddValue43;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue5 & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue6 & 15u) * 0.066666670143604278564453125;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue33;
    varyingTexCoord3.y = multiplyAddValue34;
    varyingTexCoord3.z = multiplyAddValue35;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    uint productValue5 = uint(roundEven(vertexTexCoord1.x * 65535.0));
    uint productValue6 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    uint bitwiseValue = productValue5 >> 8u;
    uint bitwiseValue1 = productValue6 >> 8u;
    float productValue7 = (vertexNormal0.w * 0.01176470704376697540283203125) + 0.01176470704376697540283203125;
    gl_Position.x = multiplyAddValue51;
    gl_Position.y = multiplyAddValue52;
    gl_Position.z = multiplyAddValue53;
    gl_Position.w = multiplyAddValue54;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue4, fma(vertexVectorConstants0.packedValues[9u].x, productValue3, vertexVectorConstants0.packedValues[8u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue4, fma(vertexVectorConstants0.packedValues[9u].y, productValue3, vertexVectorConstants0.packedValues[8u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue4, fma(vertexVectorConstants0.packedValues[9u].z, productValue3, vertexVectorConstants0.packedValues[8u].z * productValue2));
    varyingColor1.x = multiplyAddValue51;
    varyingColor1.y = multiplyAddValue52;
    varyingColor1.z = multiplyAddValue53;
    varyingColor1.w = multiplyAddValue54;
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
    varyingTexCoord2.x = float((bitwiseValue & 1u) != 0u);
    varyingTexCoord2.y = float((bitwiseValue1 & 1u) != 0u);
    varyingFrontFacing0 = int(0u);
    varyingTexCoord5.x = float(bitwiseValue & 254u) * productValue7;
    varyingTexCoord5.y = float(productValue5 & 255u) * productValue7;
    varyingTexCoord5.z = float(bitwiseValue1 & 254u) * productValue7;
    varyingTexCoord1.x = float((productValue6 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue6 & 15u) * 0.066666670143604278564453125;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
    varyingTexCoord4 = int(uint(vertexTexCoord4) & 65535u);
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = productValue26;
    varyingTexCoord3.y = productValue27;
    varyingTexCoord3.z = productValue28;
#endif
}
