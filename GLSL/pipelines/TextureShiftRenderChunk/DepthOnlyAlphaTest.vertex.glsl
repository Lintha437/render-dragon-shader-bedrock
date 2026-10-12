#version 460
#extension GL_GOOGLE_include_directive : require
// TextureShiftRenderChunk / DepthOnlyAlphaTest / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/TextureShiftRenderChunk/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    vec4 multiplyAddValue3 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue3);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue3);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue3);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue3);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    vec4 multiplyAddValue18 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue18);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue18);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue18);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue18);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue2 = vertexVectorConstants0.packedValues[29u].x - multiplyAddValue4;
    float sumValue3 = vertexVectorConstants0.packedValues[29u].y - multiplyAddValue5;
    float sumValue4 = vertexVectorConstants0.packedValues[29u].z - multiplyAddValue6;
    bool conditionValue1 = vertexVectorConstants0.packedValues[26u].x > 0.5;
    float comparisonValue = conditionValue1 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].w)));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue11 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue12 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue13 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue5 = vertexVectorConstants0.packedValues[13u].x - multiplyAddValue11;
    float sumValue6 = vertexVectorConstants0.packedValues[13u].y - multiplyAddValue12;
    float sumValue7 = vertexVectorConstants0.packedValues[13u].z - multiplyAddValue13;
    bool conditionValue2 = vertexVectorConstants0.packedValues[10u].x > 0.5;
    float comparisonValue1 = conditionValue2 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[12u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[12u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[0u].w)));
#endif
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
    varyingTexCoord2.x = 0.0;
    varyingTexCoord2.y = 0.0;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    vec3 sumValue = vec3(vertexVectorConstants0.packedValues[29u].x - multiplyAddValue, vertexVectorConstants0.packedValues[29u].y - multiplyAddValue1, vertexVectorConstants0.packedValues[29u].z - multiplyAddValue2);
    bool conditionValue = vertexScalarConstants0.packedValues[104u] > 0.5;
    float sumValue1 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((sqrt(rdDot3Precise2(sumValue, sumValue)) / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexScalarConstants0.packedValues[108u]) - (conditionValue ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x)) / (conditionValue ? sumValue1 : (vertexVectorConstants0.packedValues[24u].y - vertexVectorConstants0.packedValues[24u].x)), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    vec3 sumValue8 = vec3(vertexVectorConstants0.packedValues[13u].x - scalarValue1, vertexVectorConstants0.packedValues[13u].y - scalarValue, vertexVectorConstants0.packedValues[13u].z - scalarValue2);
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    float sumValue1 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((sqrt(rdDot3Precise2(sumValue8, sumValue8)) / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexScalarConstants0.packedValues[44u]) - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x)) / (conditionValue3 ? sumValue1 : (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x)), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    uint productValue = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue1 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue1, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue1, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor2.w = spvNClamp((((sqrt(((sumValue2 * sumValue2) + (sumValue3 * sumValue3)) + (sumValue4 * sumValue4)) / (conditionValue1 ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexVectorConstants0.packedValues[27u].x) - comparisonValue) / ((conditionValue1 ? 1.0 : vertexVectorConstants0.packedValues[24u].y) - comparisonValue), 0.0, 1.0);
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    varyingColor2.w = spvNClamp((((sqrt(((sumValue5 * sumValue5) + (sumValue6 * sumValue6)) + (sumValue7 * sumValue7)) / (conditionValue2 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexVectorConstants0.packedValues[11u].x) - comparisonValue1) / ((conditionValue2 ? 1.0 : vertexVectorConstants0.packedValues[8u].y) - comparisonValue1), 0.0, 1.0);
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord0.x = ((float((productValue >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue1 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue1 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
#endif
    varyingTexCoord5.x = vertexTexCoord2.x;
    varyingTexCoord5.y = vertexTexCoord2.y;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue4;
    varyingTexCoord3.y = multiplyAddValue5;
    varyingTexCoord3.z = multiplyAddValue6;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue11;
    varyingTexCoord3.y = multiplyAddValue12;
    varyingTexCoord3.z = multiplyAddValue13;
#endif
}
