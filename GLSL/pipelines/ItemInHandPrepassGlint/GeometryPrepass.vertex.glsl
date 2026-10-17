#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandPrepassGlint / GeometryPrepass / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 5
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
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/ItemInHandPrepassGlint/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    vec4 multiplyAddValue3 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[116u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue3);
    float sumValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[117u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue3);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue3);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue3);
    gl_Position.x = sumValue;
    gl_Position.y = sumValue1;
    gl_Position.z = scalarValue;
    gl_Position.w = scalarValue1;
    varyingColor1.x = sumValue;
    varyingColor1.y = sumValue1;
    varyingColor1.z = scalarValue;
    varyingColor1.w = scalarValue1;
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue4 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue3;
    varyingTexCoord3.y = scalarValue2;
    varyingTexCoord3.z = scalarValue4;
    vec4 multiplyAddValue31 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[116u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue31);
    float sumValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[117u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue31);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue31);
    float scalarValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue31);
    gl_Position.x = sumValue5;
    gl_Position.y = sumValue6;
    gl_Position.z = scalarValue5;
    gl_Position.w = scalarValue6;
    varyingColor1.x = sumValue5;
    varyingColor1.y = sumValue6;
    varyingColor1.z = scalarValue5;
    varyingColor1.w = scalarValue6;
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float bitwiseValue = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float bitwiseValue1 = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float sumValue3 = bitwiseValue + (-0.5);
    float sumValue4 = bitwiseValue1 + (-0.5);
    float wavePhaseValue4 = sin(vertexVectorConstants0.packedValues[30u].z);
    float wavePhaseValue5 = cos(vertexVectorConstants0.packedValues[30u].z);
    float wavePhaseValue6 = sin(vertexVectorConstants0.packedValues[30u].w);
    float wavePhaseValue7 = cos(vertexVectorConstants0.packedValues[30u].w);
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[29u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[29u].y, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].w)));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue16;
    gl_Position.y = multiplyAddValue17;
    gl_Position.z = multiplyAddValue18;
    gl_Position.w = multiplyAddValue19;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue4, fma(vertexVectorConstants0.packedValues[9u].x, productValue3, vertexVectorConstants0.packedValues[8u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue4, fma(vertexVectorConstants0.packedValues[9u].y, productValue3, vertexVectorConstants0.packedValues[8u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue4, fma(vertexVectorConstants0.packedValues[9u].z, productValue3, vertexVectorConstants0.packedValues[8u].z * productValue2));
    varyingColor1.x = multiplyAddValue16;
    varyingColor1.y = multiplyAddValue17;
    varyingColor1.z = multiplyAddValue18;
    varyingColor1.w = multiplyAddValue19;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float bitwiseValue = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float bitwiseValue1 = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    float sumValue3 = bitwiseValue + (-0.5);
    float sumValue4 = bitwiseValue1 + (-0.5);
    float wavePhaseValue4 = sin(vertexVectorConstants0.packedValues[30u].z);
    float wavePhaseValue5 = cos(vertexVectorConstants0.packedValues[30u].z);
    float wavePhaseValue6 = sin(vertexVectorConstants0.packedValues[30u].w);
    float wavePhaseValue7 = cos(vertexVectorConstants0.packedValues[30u].w);
    float multiplyAddValue20 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue21 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue22 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue21, multiplyAddValue20 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[29u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[29u].y, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue24, multiplyAddValue23 * vertexVectorConstants0.packedValues[0u].w)));
    float productValue2 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue3 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue27;
    gl_Position.y = multiplyAddValue28;
    gl_Position.z = multiplyAddValue29;
    gl_Position.w = multiplyAddValue30;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue4, fma(vertexVectorConstants0.packedValues[9u].x, productValue3, vertexVectorConstants0.packedValues[8u].x * productValue2));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue4, fma(vertexVectorConstants0.packedValues[9u].y, productValue3, vertexVectorConstants0.packedValues[8u].y * productValue2));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue4, fma(vertexVectorConstants0.packedValues[9u].z, productValue3, vertexVectorConstants0.packedValues[8u].z * productValue2));
    varyingColor1.x = multiplyAddValue27;
    varyingColor1.y = multiplyAddValue28;
    varyingColor1.z = multiplyAddValue29;
    varyingColor1.w = multiplyAddValue30;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float multiplyAddValue7 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    float multiplyAddValue8 = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.x = multiplyAddValue7;
    varyingTexCoord0.y = multiplyAddValue8;
    float wavePhaseValue = sin(vertexScalarConstants0.packedValues[122u]);
    float wavePhaseValue1 = cos(vertexScalarConstants0.packedValues[122u]);
    vec2 sumValue2 = vec2(multiplyAddValue7 - 0.5, multiplyAddValue8 - 0.5);
    varyingTexCoord2.x = ((rdDot2Precise(sumValue2, vec2(wavePhaseValue1, wavePhaseValue)) + vertexScalarConstants0.packedValues[120u]) + 0.5) * vertexVectorConstants0.packedValues[28u].x;
    varyingTexCoord2.y = (rdDot2Precise(sumValue2, vec2(-wavePhaseValue, wavePhaseValue1)) + 0.5) * vertexVectorConstants0.packedValues[28u].y;
    float wavePhaseValue2 = sin(vertexScalarConstants0.packedValues[123u]);
    float wavePhaseValue3 = cos(vertexScalarConstants0.packedValues[123u]);
    varyingTexCoord2.z = ((rdDot2Precise(sumValue2, vec2(wavePhaseValue3, wavePhaseValue2)) + vertexScalarConstants0.packedValues[121u]) + 0.5) * vertexVectorConstants0.packedValues[28u].x;
    varyingTexCoord2.w = (rdDot2Precise(sumValue2, vec2(-wavePhaseValue2, wavePhaseValue3)) + 0.5) * vertexVectorConstants0.packedValues[28u].y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord2.x = ((vertexVectorConstants0.packedValues[30u].x + 0.5) + fma(sumValue4, wavePhaseValue4, sumValue3 * wavePhaseValue5)) * vertexVectorConstants0.packedValues[28u].x;
    varyingTexCoord2.y = (fma(sumValue4, wavePhaseValue5, (-0.0) - (wavePhaseValue4 * sumValue3)) + 0.5) * vertexVectorConstants0.packedValues[28u].y;
    varyingTexCoord2.z = ((vertexVectorConstants0.packedValues[30u].y + 0.5) + fma(sumValue4, wavePhaseValue6, wavePhaseValue7 * sumValue3)) * vertexVectorConstants0.packedValues[28u].x;
    varyingTexCoord2.w = (fma(sumValue4, wavePhaseValue7, (-0.0) - (wavePhaseValue6 * sumValue3)) + 0.5) * vertexVectorConstants0.packedValues[28u].y;
#endif
    varyingTexCoord8.x = vertexTexCoord8.x;
    varyingTexCoord8.y = vertexTexCoord8.y;
    varyingTexCoord8.z = vertexTexCoord8.z;
    varyingTexCoord8.w = vertexTexCoord8.w;
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
#endif
    varyingTexCoord4 = int(0u);
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord5.x = fma(vertexVectorConstants0.packedValues[26u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[24u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[25u].x)) + vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord5.y = fma(vertexVectorConstants0.packedValues[26u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[24u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[25u].y)) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord5.z = fma(vertexVectorConstants0.packedValues[26u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[24u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[25u].z)) + vertexVectorConstants0.packedValues[27u].z;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord5.x = fma(vertexVectorConstants0.packedValues[26u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord5.y = fma(vertexVectorConstants0.packedValues[26u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord5.z = fma(vertexVectorConstants0.packedValues[26u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].z;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = bitwiseValue;
    varyingTexCoord0.y = bitwiseValue1;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord5.x = fma(vertexVectorConstants0.packedValues[26u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord5.y = fma(vertexVectorConstants0.packedValues[26u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord5.z = fma(vertexVectorConstants0.packedValues[26u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].z;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    varyingTexCoord0.x = bitwiseValue;
    varyingTexCoord0.y = bitwiseValue1;
    varyingTexCoord3.x = multiplyAddValue20;
    varyingTexCoord3.y = multiplyAddValue21;
    varyingTexCoord3.z = multiplyAddValue22;
#endif
}
