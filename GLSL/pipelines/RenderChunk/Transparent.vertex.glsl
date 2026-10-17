#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunk / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
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
#define RD_BINDING_LAYOUT 7
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
#if (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/RenderChunk/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u];
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[11u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[11u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[11u].z;
    precise float productValue3 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue4 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue5 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue6 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].w;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue, productValue3)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue, productValue4)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue, productValue5)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue, productValue6)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5, multiplyAddValue6);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u];
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue);
    float scalarValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue);
    float scalarValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue);
    gl_Position.x = scalarValue;
    gl_Position.y = scalarValue1;
    gl_Position.z = scalarValue2;
    gl_Position.w = scalarValue3;
    varyingColor1.x = scalarValue;
    varyingColor1.y = scalarValue1;
    varyingColor1.z = scalarValue2;
    varyingColor1.w = scalarValue3;
    precise float sumValue2 = vertexVectorConstants0.packedValues[29u].x - multiplyAddValue;
    precise float sumValue3 = vertexVectorConstants0.packedValues[29u].y - multiplyAddValue1;
    precise float sumValue4 = vertexVectorConstants0.packedValues[29u].z - multiplyAddValue2;
    vec3 vectorValue1 = vec3(sumValue2, sumValue3, sumValue4);
    float nonlinearValue = sqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    bool conditionValue = vertexScalarConstants0.packedValues[104u] > 0.5;
    precise float comparisonValue = nonlinearValue / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].w);
    precise float comparisonValue2 = nonlinearValue / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].z);
    precise float sumValue5 = comparisonValue2 + vertexScalarConstants0.packedValues[108u];
    precise float comparisonValue3 = sumValue5 - (conditionValue ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x);
    precise float sumValue6 = 1.0 - 0.9900000095367431640625;
    precise float sumValue7 = vertexVectorConstants0.packedValues[24u].y - vertexVectorConstants0.packedValues[24u].x;
    precise float comparisonValue4 = comparisonValue3 / (conditionValue ? sumValue6 : sumValue7);
    varyingColor2.w = spvNClamp(comparisonValue4, 0.0, 1.0);
    precise float sumValue8 = 1.0 - vertexColor0.w;
    varyingColor0.w = (vertexColor0.w < 0.949999988079071044921875) ? fma(spvNClamp(comparisonValue, 0.0, 1.0), sumValue8, vertexColor0.w) : vertexColor0.w;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    precise float productValue7 = vertexTexCoord1.x * 65535.0;
    precise float productValue8 = vertexTexCoord1.y * 65535.0;
    uint scalarValue4 = uint(roundEven(productValue8));
    varyingTexCoord2.x = float((uint(roundEven(productValue7)) & 256u) != 0u);
    varyingTexCoord2.y = float((scalarValue4 & 256u) != 0u);
    precise float bitwiseValue = rdEvaluateFloatExpression((scalarValue4 >> 4u) & 15u) * 0.066666670143604278564453125;
    precise float bitwiseValue1 = rdEvaluateFloatExpression(scalarValue4 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.x = bitwiseValue;
    varyingTexCoord1.y = bitwiseValue1;
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    precise float productValue9 = vertexTexCoord0.x * 65535.0;
    precise float productValue10 = vertexTexCoord0.y * 65535.0;
    uint scalarValue5 = uint(roundEven(productValue9));
    uint scalarValue6 = uint(roundEven(productValue10));
    precise float multiplyAddValue7 = fma(rdEvaluateFloatExpression((scalarValue5 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue8 = fma(rdEvaluateFloatExpression((scalarValue6 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression((scalarValue5 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue7);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression((scalarValue6 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue8);
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    varyingColor3.x = multiplyAddValue;
    varyingColor3.y = multiplyAddValue1;
    varyingColor3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[11u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[11u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[11u].z;
    precise float sumValue16 = multiplyAddValue + 0.5;
    precise float sumValue17 = multiplyAddValue1 + 0.5;
    precise float sumValue18 = multiplyAddValue2 + 0.5;
    precise float sumValue19 = sumValue18 - vertexVectorConstants0.packedValues[29u].z;
    precise float sumValue20 = sumValue16 - vertexVectorConstants0.packedValues[29u].x;
    precise float sumValue21 = sumValue17 - vertexVectorConstants0.packedValues[29u].y;
    vec3 vectorValue2 = vec3(sumValue19, sumValue20, sumValue21);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    precise float productValue14 = inverseLengthValue * sumValue19;
    precise float productValue15 = inverseLengthValue * sumValue20;
    precise float productValue16 = inverseLengthValue * sumValue21;
    precise float productValue17 = productValue16 * 0.0;
    precise float productValue18 = productValue14 * 0.0;
    precise float productValue19 = productValue15 * 1.0;
    float multiplyAddValue24 = fma(productValue14, 1.0, -productValue17);
    float multiplyAddValue25 = fma(productValue16, 0.0, -productValue19);
    vec2 vectorValue3 = vec2(multiplyAddValue24, multiplyAddValue25);
    float inverseLengthValue1 = inversesqrt(rdDot2Precise(vectorValue3, vectorValue3));
    precise float productValue20 = inverseLengthValue1 * multiplyAddValue24;
    precise float multiplyAddValue26 = inverseLengthValue1 * fma(productValue15, 0.0, -productValue18);
    precise float productValue21 = inverseLengthValue1 * multiplyAddValue25;
    precise float productValue22 = productValue14 * multiplyAddValue26;
    precise float productValue23 = productValue15 * productValue21;
    precise float productValue24 = productValue16 * productValue20;
    precise float sumValue22 = vertexColor0.z - 0.5;
    precise float sumValue23 = vertexColor0.x - 0.5;
    precise float productValue25 = productValue20 * sumValue23;
    precise float productValue26 = multiplyAddValue26 * sumValue23;
    precise float productValue27 = productValue21 * sumValue23;
    precise float multiplyAddValue27 = sumValue16 - fma(fma(productValue16, productValue21, -productValue22), sumValue22, productValue25);
    precise float multiplyAddValue28 = sumValue17 - fma(fma(productValue14, productValue20, -productValue23), sumValue22, productValue26);
    precise float multiplyAddValue29 = sumValue18 - fma(fma(productValue15, multiplyAddValue26, -productValue24), sumValue22, productValue27);
    precise float productValue28 = multiplyAddValue28 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue29 = multiplyAddValue28 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue30 = multiplyAddValue28 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue31 = multiplyAddValue28 * vertexVectorConstants0.packedValues[5u].w;
    precise float sumValue24 = vertexVectorConstants0.packedValues[29u].x - multiplyAddValue27;
    precise float sumValue25 = vertexVectorConstants0.packedValues[29u].y - multiplyAddValue28;
    precise float sumValue26 = vertexVectorConstants0.packedValues[29u].z - multiplyAddValue29;
    vec3 vectorValue4 = vec3(sumValue24, sumValue25, sumValue26);
    float nonlinearValue3 = sqrt(rdDot3Precise2(vectorValue4, vectorValue4));
    precise float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue27, productValue28)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue27, productValue29)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue27, productValue30)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue29, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue27, productValue31)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u];
    vec4 vectorValue5 = vec4(multiplyAddValue30, multiplyAddValue31, multiplyAddValue32, multiplyAddValue33);
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue5);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u];
    float scalarValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue5);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue5);
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue5);
    gl_Position.x = scalarValue9;
    gl_Position.y = scalarValue10;
    gl_Position.z = scalarValue11;
    gl_Position.w = scalarValue12;
    varyingColor1.x = scalarValue9;
    varyingColor1.y = scalarValue10;
    varyingColor1.z = scalarValue11;
    varyingColor1.w = scalarValue12;
    bool conditionValue = vertexScalarConstants0.packedValues[104u] > 0.5;
    precise float comparisonValue6 = nonlinearValue3 / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].w);
    precise float comparisonValue7 = nonlinearValue3 / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].z);
    precise float sumValue27 = comparisonValue7 + vertexScalarConstants0.packedValues[108u];
    precise float comparisonValue8 = sumValue27 - (conditionValue ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x);
    precise float sumValue6 = 1.0 - 0.9900000095367431640625;
    precise float sumValue7 = vertexVectorConstants0.packedValues[24u].y - vertexVectorConstants0.packedValues[24u].x;
    precise float comparisonValue9 = comparisonValue8 / (conditionValue ? sumValue6 : sumValue7);
    varyingColor2.w = spvNClamp(comparisonValue9, 0.0, 1.0);
    precise float sumValue8 = 1.0 - vertexColor0.w;
    varyingColor0.w = (vertexColor0.w < 0.949999988079071044921875) ? fma(spvNClamp(comparisonValue6, 0.0, 1.0), sumValue8, vertexColor0.w) : 1.0;
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    precise float productValue7 = vertexTexCoord1.x * 65535.0;
    precise float productValue8 = vertexTexCoord1.y * 65535.0;
    uint scalarValue4 = uint(roundEven(productValue8));
    varyingTexCoord2.x = float((uint(roundEven(productValue7)) & 256u) != 0u);
    varyingTexCoord2.y = float((scalarValue4 & 256u) != 0u);
    precise float bitwiseValue = rdEvaluateFloatExpression((scalarValue4 >> 4u) & 15u) * 0.066666670143604278564453125;
    precise float bitwiseValue1 = rdEvaluateFloatExpression(scalarValue4 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.x = bitwiseValue;
    varyingTexCoord1.y = bitwiseValue1;
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    precise float productValue9 = vertexTexCoord0.x * 65535.0;
    precise float productValue10 = vertexTexCoord0.y * 65535.0;
    uint scalarValue5 = uint(roundEven(productValue9));
    uint scalarValue6 = uint(roundEven(productValue10));
    precise float multiplyAddValue7 = fma(rdEvaluateFloatExpression((scalarValue5 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue8 = fma(rdEvaluateFloatExpression((scalarValue6 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression((scalarValue5 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue7);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression((scalarValue6 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue8);
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    varyingColor3.x = multiplyAddValue;
    varyingColor3.y = multiplyAddValue1;
    varyingColor3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue60 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u];
    vec4 vectorValue8 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue16 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue45 = scalarValue16 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue46 = scalarValue16 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue47 = scalarValue16 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue48 = scalarValue16 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue17 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue18 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float multiplyAddValue58 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue18, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue17, productValue45)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue59 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue18, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue17, productValue46)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue60 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue18, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue17, productValue47)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue61 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue18, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue17, productValue48)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue9 = vec4(multiplyAddValue58, multiplyAddValue59, multiplyAddValue60, multiplyAddValue61);
    float scalarValue21 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue60, vertexScalarConstants0.packedValues[12u]), vectorValue9);
    precise float sumValue61 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u];
    float scalarValue22 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue61, vertexScalarConstants0.packedValues[13u]), vectorValue9);
    float scalarValue23 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue9);
    float scalarValue24 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue9);
    gl_Position.x = scalarValue21;
    gl_Position.y = scalarValue22;
    gl_Position.z = scalarValue23;
    gl_Position.w = scalarValue24;
    varyingColor1.x = scalarValue21;
    varyingColor1.y = scalarValue22;
    varyingColor1.z = scalarValue23;
    varyingColor1.w = scalarValue24;
    precise float sumValue8 = 1.0 - vertexColor0.w;
    precise float sumValue62 = vertexVectorConstants0.packedValues[13u].x - scalarValue17;
    precise float sumValue63 = vertexVectorConstants0.packedValues[13u].y - scalarValue16;
    precise float sumValue64 = vertexVectorConstants0.packedValues[13u].z - scalarValue18;
    vec3 vectorValue10 = vec3(sumValue62, sumValue63, sumValue64);
    float nonlinearValue8 = sqrt(rdDot3Precise2(vectorValue10, vectorValue10));
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    precise float comparisonValue11 = nonlinearValue8 / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].w);
    precise float comparisonValue12 = nonlinearValue8 / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z);
    precise float sumValue65 = comparisonValue12 + vertexScalarConstants0.packedValues[44u];
    precise float comparisonValue13 = sumValue65 - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x);
    precise float sumValue6 = 1.0 - 0.9900000095367431640625;
    precise float sumValue66 = vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x;
    precise float comparisonValue14 = comparisonValue13 / (conditionValue3 ? sumValue6 : sumValue66);
    varyingColor2.w = spvNClamp(comparisonValue14, 0.0, 1.0);
    varyingColor0.w = (vertexColor0.w < 0.949999988079071044921875) ? fma(spvNClamp(comparisonValue11, 0.0, 1.0), sumValue8, vertexColor0.w) : vertexColor0.w;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    precise float productValue7 = vertexTexCoord1.x * 65535.0;
    precise float productValue8 = vertexTexCoord1.y * 65535.0;
    uint scalarValue4 = uint(roundEven(productValue8));
    varyingTexCoord2.x = float((uint(roundEven(productValue7)) & 256u) != 0u);
    varyingTexCoord2.y = float((scalarValue4 & 256u) != 0u);
    precise float bitwiseValue = rdEvaluateFloatExpression((scalarValue4 >> 4u) & 15u) * 0.066666670143604278564453125;
    precise float bitwiseValue1 = rdEvaluateFloatExpression(scalarValue4 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.x = bitwiseValue;
    varyingTexCoord1.y = bitwiseValue1;
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    precise float productValue9 = vertexTexCoord0.x * 65535.0;
    precise float productValue10 = vertexTexCoord0.y * 65535.0;
    uint scalarValue5 = uint(roundEven(productValue9));
    uint scalarValue6 = uint(roundEven(productValue10));
    precise float multiplyAddValue7 = fma(rdEvaluateFloatExpression((scalarValue5 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue8 = fma(rdEvaluateFloatExpression((scalarValue6 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression((scalarValue5 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue7);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression((scalarValue6 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue8);
    varyingTexCoord3.x = scalarValue17;
    varyingTexCoord3.y = scalarValue16;
    varyingTexCoord3.z = scalarValue18;
    varyingColor3.x = scalarValue17;
    varyingColor3.y = scalarValue16;
    varyingColor3.z = scalarValue18;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue8 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue17 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue16 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue18 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float sumValue67 = scalarValue17 + 0.5;
    precise float sumValue68 = scalarValue16 + 0.5;
    precise float sumValue69 = scalarValue18 + 0.5;
    precise float sumValue70 = sumValue69 - vertexVectorConstants0.packedValues[13u].z;
    precise float sumValue71 = sumValue67 - vertexVectorConstants0.packedValues[13u].x;
    precise float sumValue72 = sumValue68 - vertexVectorConstants0.packedValues[13u].y;
    vec3 vectorValue11 = vec3(sumValue70, sumValue71, sumValue72);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
    precise float productValue49 = inverseLengthValue6 * sumValue70;
    precise float productValue50 = inverseLengthValue6 * sumValue71;
    precise float productValue51 = inverseLengthValue6 * sumValue72;
    precise float productValue52 = productValue51 * 0.0;
    precise float productValue53 = productValue49 * 0.0;
    precise float productValue54 = productValue50 * 1.0;
    float multiplyAddValue62 = fma(productValue49, 1.0, -productValue52);
    float multiplyAddValue63 = fma(productValue51, 0.0, -productValue54);
    vec2 vectorValue12 = vec2(multiplyAddValue62, multiplyAddValue63);
    float inverseLengthValue7 = inversesqrt(rdDot2Precise(vectorValue12, vectorValue12));
    precise float productValue55 = inverseLengthValue7 * multiplyAddValue62;
    precise float multiplyAddValue64 = inverseLengthValue7 * fma(productValue50, 0.0, -productValue53);
    precise float productValue56 = inverseLengthValue7 * multiplyAddValue63;
    precise float productValue57 = productValue49 * multiplyAddValue64;
    precise float productValue58 = productValue50 * productValue56;
    precise float productValue59 = productValue51 * productValue55;
    precise float sumValue22 = vertexColor0.z - 0.5;
    precise float sumValue23 = vertexColor0.x - 0.5;
    precise float productValue60 = productValue55 * sumValue23;
    precise float productValue61 = multiplyAddValue64 * sumValue23;
    precise float productValue62 = productValue56 * sumValue23;
    precise float multiplyAddValue65 = sumValue67 - fma(fma(productValue51, productValue56, -productValue57), sumValue22, productValue60);
    precise float multiplyAddValue66 = sumValue68 - fma(fma(productValue49, productValue55, -productValue58), sumValue22, productValue61);
    precise float multiplyAddValue67 = sumValue69 - fma(fma(productValue50, multiplyAddValue64, -productValue59), sumValue22, productValue62);
    precise float productValue63 = multiplyAddValue66 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue64 = multiplyAddValue66 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue65 = multiplyAddValue66 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue66 = multiplyAddValue66 * vertexVectorConstants0.packedValues[5u].w;
    precise float sumValue73 = vertexVectorConstants0.packedValues[13u].x - multiplyAddValue65;
    precise float sumValue74 = vertexVectorConstants0.packedValues[13u].y - multiplyAddValue66;
    precise float sumValue75 = vertexVectorConstants0.packedValues[13u].z - multiplyAddValue67;
    vec3 vectorValue13 = vec3(sumValue73, sumValue74, sumValue75);
    float nonlinearValue9 = sqrt(rdDot3Precise2(vectorValue13, vectorValue13));
    precise float multiplyAddValue68 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue65, productValue63)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue69 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue65, productValue64)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue70 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue65, productValue65)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue71 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue65, productValue66)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue60 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u];
    vec4 vectorValue14 = vec4(multiplyAddValue68, multiplyAddValue69, multiplyAddValue70, multiplyAddValue71);
    float scalarValue25 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue60, vertexScalarConstants0.packedValues[12u]), vectorValue14);
    precise float sumValue61 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u];
    float scalarValue26 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue61, vertexScalarConstants0.packedValues[13u]), vectorValue14);
    float scalarValue27 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue14);
    float scalarValue28 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue14);
    gl_Position.x = scalarValue25;
    gl_Position.y = scalarValue26;
    gl_Position.z = scalarValue27;
    gl_Position.w = scalarValue28;
    varyingColor1.x = scalarValue25;
    varyingColor1.y = scalarValue26;
    varyingColor1.z = scalarValue27;
    varyingColor1.w = scalarValue28;
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    precise float comparisonValue15 = nonlinearValue9 / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].w);
    precise float comparisonValue16 = nonlinearValue9 / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z);
    precise float sumValue76 = comparisonValue16 + vertexScalarConstants0.packedValues[44u];
    precise float comparisonValue17 = sumValue76 - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x);
    precise float sumValue6 = 1.0 - 0.9900000095367431640625;
    precise float sumValue66 = vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x;
    precise float comparisonValue18 = comparisonValue17 / (conditionValue3 ? sumValue6 : sumValue66);
    varyingColor2.w = spvNClamp(comparisonValue18, 0.0, 1.0);
    precise float sumValue8 = 1.0 - vertexColor0.w;
    varyingColor0.w = (vertexColor0.w < 0.949999988079071044921875) ? fma(spvNClamp(comparisonValue15, 0.0, 1.0), sumValue8, vertexColor0.w) : 1.0;
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    precise float productValue7 = vertexTexCoord1.x * 65535.0;
    precise float productValue8 = vertexTexCoord1.y * 65535.0;
    uint scalarValue4 = uint(roundEven(productValue8));
    varyingTexCoord2.x = float((uint(roundEven(productValue7)) & 256u) != 0u);
    varyingTexCoord2.y = float((scalarValue4 & 256u) != 0u);
    precise float bitwiseValue = rdEvaluateFloatExpression((scalarValue4 >> 4u) & 15u) * 0.066666670143604278564453125;
    precise float bitwiseValue1 = rdEvaluateFloatExpression(scalarValue4 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.x = bitwiseValue;
    varyingTexCoord1.y = bitwiseValue1;
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    precise float productValue9 = vertexTexCoord0.x * 65535.0;
    precise float productValue10 = vertexTexCoord0.y * 65535.0;
    uint scalarValue5 = uint(roundEven(productValue9));
    uint scalarValue6 = uint(roundEven(productValue10));
    precise float multiplyAddValue7 = fma(rdEvaluateFloatExpression((scalarValue5 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue8 = fma(rdEvaluateFloatExpression((scalarValue6 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression((scalarValue5 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue7);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression((scalarValue6 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue8);
    varyingTexCoord3.x = scalarValue17;
    varyingTexCoord3.y = scalarValue16;
    varyingTexCoord3.z = scalarValue18;
    varyingColor3.x = scalarValue17;
    varyingColor3.y = scalarValue16;
    varyingColor3.z = scalarValue18;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    vec4 multiplyAddValue23 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue23);
    float sumValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue23);
    float scalarValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue23);
    float scalarValue8 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue23);
    gl_Position.x = sumValue12;
    gl_Position.y = sumValue13;
    gl_Position.z = scalarValue7;
    gl_Position.w = scalarValue8;
    varyingColor1.x = sumValue12;
    varyingColor1.y = sumValue13;
    varyingColor1.z = scalarValue7;
    varyingColor1.w = scalarValue8;
    vec3 sumValue14 = vec3(vertexVectorConstants0.packedValues[29u].x - multiplyAddValue20, vertexVectorConstants0.packedValues[29u].y - multiplyAddValue21, vertexVectorConstants0.packedValues[29u].z - multiplyAddValue22);
    float nonlinearValue2 = sqrt(rdDot3Precise2(sumValue14, sumValue14));
    bool conditionValue = vertexScalarConstants0.packedValues[104u] > 0.5;
    float sumValue15 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((nonlinearValue2 / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexScalarConstants0.packedValues[108u]) - (conditionValue ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x)) / (conditionValue ? sumValue15 : (vertexVectorConstants0.packedValues[24u].y - vertexVectorConstants0.packedValues[24u].x)), 0.0, 1.0);
    varyingColor0.w = (vertexColor0.w < 0.949999988079071044921875) ? fma(spvNClamp(nonlinearValue2 / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].w), 0.0, 1.0), 1.0 - vertexColor0.w, vertexColor0.w) : vertexColor0.w;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    uint productValue13 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord2.x = float((uint(roundEven(vertexTexCoord1.x * 65535.0)) & 256u) != 0u);
    varyingTexCoord2.y = float((productValue13 & 256u) != 0u);
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue13 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue13 & 15u) * 0.066666670143604278564453125;
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    uint productValue11 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue12 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue11, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue11, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue12, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue12, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord3.x = multiplyAddValue20;
    varyingTexCoord3.y = multiplyAddValue21;
    varyingTexCoord3.z = multiplyAddValue22;
    varyingColor3.x = multiplyAddValue20;
    varyingColor3.y = multiplyAddValue21;
    varyingColor3.z = multiplyAddValue22;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue43 = multiplyAddValue20 + 0.5;
    float sumValue44 = multiplyAddValue21 + 0.5;
    float sumValue45 = multiplyAddValue22 + 0.5;
    float sumValue46 = sumValue45 - vertexVectorConstants0.packedValues[29u].z;
    float sumValue47 = sumValue43 - vertexVectorConstants0.packedValues[29u].x;
    float sumValue48 = sumValue44 - vertexVectorConstants0.packedValues[29u].y;
    vec3 vectorValue6 = vec3(sumValue46, sumValue47, sumValue48);
    float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
    float productValue40 = inverseLengthValue4 * sumValue46;
    float productValue41 = inverseLengthValue4 * sumValue47;
    float productValue42 = inverseLengthValue4 * sumValue48;
    float scalarValue13 = -productValue41;
    vec2 vectorValue7 = vec2(productValue40, scalarValue13);
    float inverseLengthValue5 = inversesqrt(rdDot2Precise(vectorValue7, vectorValue7));
    float productValue43 = inverseLengthValue5 * productValue40;
    float productValue44 = inverseLengthValue5 * scalarValue13;
    float sumValue49 = vertexColor0.z - 0.5;
    float sumValue50 = vertexColor0.x - 0.5;
    float multiplyAddValue53 = fma(productValue42 * productValue44, sumValue49, productValue43 * sumValue50);
    float multiplyAddValue54 = fma(productValue40, productValue43, -(productValue41 * productValue44)) * sumValue49;
    float multiplyAddValue55 = fma(-(productValue42 * productValue43), sumValue49, productValue44 * sumValue50);
    float sumValue51 = sumValue43 - multiplyAddValue53;
    float sumValue52 = sumValue44 - multiplyAddValue54;
    float sumValue53 = sumValue45 - multiplyAddValue55;
    vec3 sumValue54 = vec3((multiplyAddValue53 - sumValue43) + vertexVectorConstants0.packedValues[29u].x, (multiplyAddValue54 - sumValue44) + vertexVectorConstants0.packedValues[29u].y, (multiplyAddValue55 - sumValue45) + vertexVectorConstants0.packedValues[29u].z);
    float nonlinearValue6 = sqrt(rdDot3Precise2(sumValue54, sumValue54));
    vec4 multiplyAddValue56 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, sumValue53, fma(vertexVectorConstants0.packedValues[4u].x, sumValue51, sumValue52 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, sumValue53, fma(vertexVectorConstants0.packedValues[4u].y, sumValue51, sumValue52 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, sumValue53, fma(vertexVectorConstants0.packedValues[4u].z, sumValue51, sumValue52 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, sumValue53, fma(vertexVectorConstants0.packedValues[4u].w, sumValue51, sumValue52 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue55 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue56);
    float sumValue56 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue56);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue56);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue56);
    gl_Position.x = sumValue55;
    gl_Position.y = sumValue56;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue15;
    varyingColor1.x = sumValue55;
    varyingColor1.y = sumValue56;
    varyingColor1.z = scalarValue14;
    varyingColor1.w = scalarValue15;
    bool conditionValue = vertexScalarConstants0.packedValues[104u] > 0.5;
    float sumValue15 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((nonlinearValue6 / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexScalarConstants0.packedValues[108u]) - (conditionValue ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x)) / (conditionValue ? sumValue15 : (vertexVectorConstants0.packedValues[24u].y - vertexVectorConstants0.packedValues[24u].x)), 0.0, 1.0);
    varyingColor0.w = (vertexColor0.w < 0.949999988079071044921875) ? fma(spvNClamp(nonlinearValue6 / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].w), 0.0, 1.0), 1.0 - vertexColor0.w, vertexColor0.w) : 1.0;
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    uint productValue13 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord2.x = float((uint(roundEven(vertexTexCoord1.x * 65535.0)) & 256u) != 0u);
    varyingTexCoord2.y = float((productValue13 & 256u) != 0u);
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue13 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue13 & 15u) * 0.066666670143604278564453125;
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    uint productValue11 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue12 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue11, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue11, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue12, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue12, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord3.x = multiplyAddValue20;
    varyingTexCoord3.y = multiplyAddValue21;
    varyingTexCoord3.z = multiplyAddValue22;
    varyingColor3.x = multiplyAddValue20;
    varyingColor3.y = multiplyAddValue21;
    varyingColor3.z = multiplyAddValue22;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue8 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue16 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue17 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue18 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    vec4 multiplyAddValue57 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue18, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue17, scalarValue16 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue18, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue17, scalarValue16 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue18, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue17, scalarValue16 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue18, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue17, scalarValue16 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue57 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue57);
    float sumValue58 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue57);
    float scalarValue19 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue57);
    float scalarValue20 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue57);
    gl_Position.x = sumValue57;
    gl_Position.y = sumValue58;
    gl_Position.z = scalarValue19;
    gl_Position.w = scalarValue20;
    varyingColor1.x = sumValue57;
    varyingColor1.y = sumValue58;
    varyingColor1.z = scalarValue19;
    varyingColor1.w = scalarValue20;
    vec3 sumValue59 = vec3(vertexVectorConstants0.packedValues[13u].x - scalarValue17, vertexVectorConstants0.packedValues[13u].y - scalarValue16, vertexVectorConstants0.packedValues[13u].z - scalarValue18);
    float nonlinearValue7 = sqrt(rdDot3Precise2(sumValue59, sumValue59));
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    float sumValue15 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((nonlinearValue7 / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexScalarConstants0.packedValues[44u]) - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x)) / (conditionValue3 ? sumValue15 : (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x)), 0.0, 1.0);
    varyingColor0.w = (vertexColor0.w < 0.949999988079071044921875) ? fma(spvNClamp(nonlinearValue7 / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].w), 0.0, 1.0), 1.0 - vertexColor0.w, vertexColor0.w) : vertexColor0.w;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    uint productValue13 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord2.x = float((uint(roundEven(vertexTexCoord1.x * 65535.0)) & 256u) != 0u);
    varyingTexCoord2.y = float((productValue13 & 256u) != 0u);
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue13 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue13 & 15u) * 0.066666670143604278564453125;
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    uint productValue11 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue12 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue11, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue11, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue12, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue12, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord3.x = scalarValue17;
    varyingTexCoord3.y = scalarValue16;
    varyingTexCoord3.z = scalarValue18;
    varyingColor3.x = scalarValue17;
    varyingColor3.y = scalarValue16;
    varyingColor3.z = scalarValue18;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue8 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue17 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue16 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue18 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float sumValue87 = scalarValue17 + 0.5;
    float sumValue88 = scalarValue16 + 0.5;
    float sumValue89 = scalarValue18 + 0.5;
    float sumValue90 = sumValue89 - vertexVectorConstants0.packedValues[13u].z;
    float sumValue91 = sumValue87 - vertexVectorConstants0.packedValues[13u].x;
    float sumValue92 = sumValue88 - vertexVectorConstants0.packedValues[13u].y;
    vec3 vectorValue15 = vec3(sumValue90, sumValue91, sumValue92);
    float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue15, vectorValue15));
    float productValue75 = inverseLengthValue10 * sumValue90;
    float productValue76 = inverseLengthValue10 * sumValue91;
    float productValue77 = inverseLengthValue10 * sumValue92;
    float scalarValue29 = -productValue76;
    vec2 vectorValue16 = vec2(productValue75, scalarValue29);
    float inverseLengthValue11 = inversesqrt(rdDot2Precise(vectorValue16, vectorValue16));
    float productValue78 = inverseLengthValue11 * productValue75;
    float productValue79 = inverseLengthValue11 * scalarValue29;
    float sumValue49 = vertexColor0.z - 0.5;
    float sumValue50 = vertexColor0.x - 0.5;
    float multiplyAddValue80 = fma(productValue77 * productValue79, sumValue49, productValue78 * sumValue50);
    float multiplyAddValue81 = fma(productValue75, productValue78, -(productValue76 * productValue79)) * sumValue49;
    float multiplyAddValue82 = fma(-(productValue77 * productValue78), sumValue49, productValue79 * sumValue50);
    float sumValue93 = sumValue87 - multiplyAddValue80;
    float sumValue94 = sumValue88 - multiplyAddValue81;
    float sumValue95 = sumValue89 - multiplyAddValue82;
    vec3 sumValue96 = vec3((multiplyAddValue80 - sumValue87) + vertexVectorConstants0.packedValues[13u].x, (multiplyAddValue81 - sumValue88) + vertexVectorConstants0.packedValues[13u].y, (multiplyAddValue82 - sumValue89) + vertexVectorConstants0.packedValues[13u].z);
    float nonlinearValue11 = sqrt(rdDot3Precise2(sumValue96, sumValue96));
    vec4 multiplyAddValue83 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, sumValue95, fma(vertexVectorConstants0.packedValues[4u].x, sumValue93, sumValue94 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, sumValue95, fma(vertexVectorConstants0.packedValues[4u].y, sumValue93, sumValue94 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, sumValue95, fma(vertexVectorConstants0.packedValues[4u].z, sumValue93, sumValue94 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, sumValue95, fma(vertexVectorConstants0.packedValues[4u].w, sumValue93, sumValue94 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue97 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue83);
    float sumValue98 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue83);
    float scalarValue30 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue83);
    float scalarValue31 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue83);
    gl_Position.x = sumValue97;
    gl_Position.y = sumValue98;
    gl_Position.z = scalarValue30;
    gl_Position.w = scalarValue31;
    varyingColor1.x = sumValue97;
    varyingColor1.y = sumValue98;
    varyingColor1.z = scalarValue30;
    varyingColor1.w = scalarValue31;
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    float sumValue15 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((nonlinearValue11 / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexScalarConstants0.packedValues[44u]) - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x)) / (conditionValue3 ? sumValue15 : (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x)), 0.0, 1.0);
    varyingColor0.w = (vertexColor0.w < 0.949999988079071044921875) ? fma(spvNClamp(nonlinearValue11 / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].w), 0.0, 1.0), 1.0 - vertexColor0.w, vertexColor0.w) : 1.0;
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    uint productValue13 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    varyingTexCoord2.x = float((uint(roundEven(vertexTexCoord1.x * 65535.0)) & 256u) != 0u);
    varyingTexCoord2.y = float((productValue13 & 256u) != 0u);
    varyingTexCoord1.x = rdEvaluateFloatExpression((productValue13 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = rdEvaluateFloatExpression(productValue13 & 15u) * 0.066666670143604278564453125;
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    uint productValue11 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue12 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue11, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue11, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue12, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue12, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord3.x = scalarValue17;
    varyingTexCoord3.y = scalarValue16;
    varyingTexCoord3.z = scalarValue18;
    varyingColor3.x = scalarValue17;
    varyingColor3.y = scalarValue16;
    varyingColor3.z = scalarValue18;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue9 = vertexVectorConstants0.packedValues[29u].x - multiplyAddValue9;
    float sumValue10 = vertexVectorConstants0.packedValues[29u].y - multiplyAddValue10;
    float sumValue11 = vertexVectorConstants0.packedValues[29u].z - multiplyAddValue11;
    float nonlinearValue1 = sqrt(((sumValue9 * sumValue9) + (sumValue10 * sumValue10)) + (sumValue11 * sumValue11));
    bool conditionValue1 = vertexVectorConstants0.packedValues[26u].x > 0.5;
    float comparisonValue5 = conditionValue1 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue11 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue12 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float comparisonValue1;
    if (vertexColor0.w < 0.949999988079071044921875)
    {
        comparisonValue1 = (spvNClamp(nonlinearValue1 / (conditionValue1 ? 100000.0 : vertexVectorConstants0.packedValues[24u].w), 0.0, 1.0) * (1.0 - vertexColor0.w)) + vertexColor0.w;
    }
    else
    {
        comparisonValue1 = vertexColor0.w;
    }
    uint productValue13 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    gl_Position.x = multiplyAddValue16;
    gl_Position.y = multiplyAddValue17;
    gl_Position.z = multiplyAddValue18;
    gl_Position.w = multiplyAddValue19;
    varyingColor1.x = multiplyAddValue16;
    varyingColor1.y = multiplyAddValue17;
    varyingColor1.z = multiplyAddValue18;
    varyingColor1.w = multiplyAddValue19;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = comparisonValue1;
    varyingTexCoord2.x = float((uint(roundEven(vertexTexCoord1.x * 65535.0)) & 256u) != 0u);
    varyingTexCoord2.y = float((productValue13 & 256u) != 0u);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor2.w = spvNClamp((((nonlinearValue1 / (conditionValue1 ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexVectorConstants0.packedValues[27u].x) - comparisonValue5) / ((conditionValue1 ? 1.0 : vertexVectorConstants0.packedValues[24u].y) - comparisonValue5), 0.0, 1.0);
    varyingTexCoord1.x = float((productValue13 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue13 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord0.x = ((float((productValue11 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue11 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue12 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue12 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    varyingColor3.x = multiplyAddValue9;
    varyingColor3.y = multiplyAddValue10;
    varyingColor3.z = multiplyAddValue11;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue28 = multiplyAddValue9 + 0.5;
    float sumValue29 = multiplyAddValue10 + 0.5;
    float sumValue30 = multiplyAddValue11 + 0.5;
    float sumValue31 = sumValue28 - vertexVectorConstants0.packedValues[29u].x;
    float sumValue32 = sumValue29 - vertexVectorConstants0.packedValues[29u].y;
    float sumValue33 = sumValue30 - vertexVectorConstants0.packedValues[29u].z;
    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue31, sumValue32, sumValue33), vec3(sumValue31, sumValue32, sumValue33)));
    float productValue32 = sumValue31 * inverseLengthValue2;
    float productValue33 = sumValue33 * inverseLengthValue2;
    float sumValue34 = (-0.0) - productValue32;
    float inverseLengthValue3 = inversesqrt(dot(vec3(productValue33, 0.0, sumValue34), vec3(productValue33, 0.0, sumValue34)));
    float productValue34 = inverseLengthValue3 * productValue33;
    float productValue35 = inverseLengthValue3 * sumValue34;
    float sumValue35 = vertexColor0.z + (-0.5);
    float productValue36 = (inverseLengthValue2 * sumValue35) * sumValue32;
    float sumValue36 = vertexColor0.x + (-0.5);
    float productValue37 = (sumValue28 - (productValue34 * sumValue36)) - (productValue35 * productValue36);
    float productValue38 = sumValue29 - (((productValue34 * productValue33) - (productValue35 * productValue32)) * sumValue35);
    float productValue39 = sumValue30 - ((productValue35 * sumValue36) - (productValue34 * productValue36));
    float sumValue37 = vertexVectorConstants0.packedValues[29u].x - productValue37;
    float sumValue38 = vertexVectorConstants0.packedValues[29u].y - productValue38;
    float sumValue39 = vertexVectorConstants0.packedValues[29u].z - productValue39;
    float nonlinearValue4 = sqrt(((sumValue39 * sumValue39) + (sumValue37 * sumValue37)) + (sumValue38 * sumValue38));
    bool conditionValue1 = vertexVectorConstants0.packedValues[26u].x > 0.5;
    float comparisonValue5 = conditionValue1 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x;
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[6u].x, productValue39, fma(vertexVectorConstants0.packedValues[5u].x, productValue38, productValue37 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[6u].y, productValue39, fma(vertexVectorConstants0.packedValues[5u].y, productValue38, productValue37 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[6u].z, productValue39, fma(vertexVectorConstants0.packedValues[5u].z, productValue38, productValue37 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[6u].w, productValue39, fma(vertexVectorConstants0.packedValues[5u].w, productValue38, productValue37 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue11 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue12 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float comparisonValue1;
    if (vertexColor0.w < 0.949999988079071044921875)
    {
        comparisonValue1 = (spvNClamp(nonlinearValue4 / (conditionValue1 ? 100000.0 : vertexVectorConstants0.packedValues[24u].w), 0.0, 1.0) * (1.0 - vertexColor0.w)) + vertexColor0.w;
    }
    else
    {
        comparisonValue1 = 1.0;
    }
    uint productValue13 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    gl_Position.x = multiplyAddValue38;
    gl_Position.y = multiplyAddValue39;
    gl_Position.z = multiplyAddValue40;
    gl_Position.w = multiplyAddValue41;
    varyingColor1.x = multiplyAddValue38;
    varyingColor1.y = multiplyAddValue39;
    varyingColor1.z = multiplyAddValue40;
    varyingColor1.w = multiplyAddValue41;
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = comparisonValue1;
    varyingTexCoord2.x = float((uint(roundEven(vertexTexCoord1.x * 65535.0)) & 256u) != 0u);
    varyingTexCoord2.y = float((productValue13 & 256u) != 0u);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor2.w = spvNClamp((((nonlinearValue4 / (conditionValue1 ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexVectorConstants0.packedValues[27u].x) - comparisonValue5) / ((conditionValue1 ? 1.0 : vertexVectorConstants0.packedValues[24u].y) - comparisonValue5), 0.0, 1.0);
    varyingTexCoord1.x = float((productValue13 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue13 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord0.x = ((float((productValue11 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue11 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue12 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue12 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    varyingColor3.x = multiplyAddValue9;
    varyingColor3.y = multiplyAddValue10;
    varyingColor3.z = multiplyAddValue11;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue42 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue43 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue44 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue40 = vertexVectorConstants0.packedValues[13u].x - multiplyAddValue42;
    float sumValue41 = vertexVectorConstants0.packedValues[13u].y - multiplyAddValue43;
    float sumValue42 = vertexVectorConstants0.packedValues[13u].z - multiplyAddValue44;
    float nonlinearValue5 = sqrt(((sumValue40 * sumValue40) + (sumValue41 * sumValue41)) + (sumValue42 * sumValue42));
    bool conditionValue2 = vertexVectorConstants0.packedValues[10u].x > 0.5;
    float comparisonValue10 = conditionValue2 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x;
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue43, multiplyAddValue42 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue43, multiplyAddValue42 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue43, multiplyAddValue42 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue43, multiplyAddValue42 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue48, fma(vertexVectorConstants0.packedValues[12u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue46, multiplyAddValue45 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue50 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue48, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[12u].y, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue46, multiplyAddValue45 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue48, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue46, multiplyAddValue45 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue48, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue46, multiplyAddValue45 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue11 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue12 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float comparisonValue1;
    if (vertexColor0.w < 0.949999988079071044921875)
    {
        comparisonValue1 = (spvNClamp(nonlinearValue5 / (conditionValue2 ? 100000.0 : vertexVectorConstants0.packedValues[8u].w), 0.0, 1.0) * (1.0 - vertexColor0.w)) + vertexColor0.w;
    }
    else
    {
        comparisonValue1 = vertexColor0.w;
    }
    uint productValue13 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    gl_Position.x = multiplyAddValue49;
    gl_Position.y = multiplyAddValue50;
    gl_Position.z = multiplyAddValue51;
    gl_Position.w = multiplyAddValue52;
    varyingColor1.x = multiplyAddValue49;
    varyingColor1.y = multiplyAddValue50;
    varyingColor1.z = multiplyAddValue51;
    varyingColor1.w = multiplyAddValue52;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = comparisonValue1;
    varyingTexCoord2.x = float((uint(roundEven(vertexTexCoord1.x * 65535.0)) & 256u) != 0u);
    varyingTexCoord2.y = float((productValue13 & 256u) != 0u);
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    varyingColor2.w = spvNClamp((((nonlinearValue5 / (conditionValue2 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexVectorConstants0.packedValues[11u].x) - comparisonValue10) / ((conditionValue2 ? 1.0 : vertexVectorConstants0.packedValues[8u].y) - comparisonValue10), 0.0, 1.0);
    varyingTexCoord1.x = float((productValue13 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue13 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord0.x = ((float((productValue11 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue11 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue12 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue12 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue42;
    varyingTexCoord3.y = multiplyAddValue43;
    varyingTexCoord3.z = multiplyAddValue44;
    varyingColor3.x = multiplyAddValue42;
    varyingColor3.y = multiplyAddValue43;
    varyingColor3.z = multiplyAddValue44;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue42 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue43 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue44 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue77 = multiplyAddValue42 + 0.5;
    float sumValue78 = multiplyAddValue43 + 0.5;
    float sumValue79 = multiplyAddValue44 + 0.5;
    float sumValue80 = sumValue77 - vertexVectorConstants0.packedValues[13u].x;
    float sumValue81 = sumValue78 - vertexVectorConstants0.packedValues[13u].y;
    float sumValue82 = sumValue79 - vertexVectorConstants0.packedValues[13u].z;
    float inverseLengthValue8 = inversesqrt(dot(vec3(sumValue80, sumValue81, sumValue82), vec3(sumValue80, sumValue81, sumValue82)));
    float productValue67 = sumValue80 * inverseLengthValue8;
    float productValue68 = sumValue82 * inverseLengthValue8;
    float sumValue83 = (-0.0) - productValue67;
    float inverseLengthValue9 = inversesqrt(dot(vec3(productValue68, 0.0, sumValue83), vec3(productValue68, 0.0, sumValue83)));
    float productValue69 = inverseLengthValue9 * productValue68;
    float productValue70 = inverseLengthValue9 * sumValue83;
    float sumValue35 = vertexColor0.z + (-0.5);
    float productValue71 = (inverseLengthValue8 * sumValue35) * sumValue81;
    float sumValue36 = vertexColor0.x + (-0.5);
    float productValue72 = (sumValue77 - (productValue69 * sumValue36)) - (productValue70 * productValue71);
    float productValue73 = sumValue78 - (((productValue69 * productValue68) - (productValue70 * productValue67)) * sumValue35);
    float productValue74 = sumValue79 - ((productValue70 * sumValue36) - (productValue69 * productValue71));
    float sumValue84 = vertexVectorConstants0.packedValues[13u].x - productValue72;
    float sumValue85 = vertexVectorConstants0.packedValues[13u].y - productValue73;
    float sumValue86 = vertexVectorConstants0.packedValues[13u].z - productValue74;
    float nonlinearValue10 = sqrt(((sumValue86 * sumValue86) + (sumValue84 * sumValue84)) + (sumValue85 * sumValue85));
    bool conditionValue2 = vertexVectorConstants0.packedValues[10u].x > 0.5;
    float comparisonValue10 = conditionValue2 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x;
    float multiplyAddValue72 = fma(vertexVectorConstants0.packedValues[6u].x, productValue74, fma(vertexVectorConstants0.packedValues[5u].x, productValue73, productValue72 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue73 = fma(vertexVectorConstants0.packedValues[6u].y, productValue74, fma(vertexVectorConstants0.packedValues[5u].y, productValue73, productValue72 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue74 = fma(vertexVectorConstants0.packedValues[6u].z, productValue74, fma(vertexVectorConstants0.packedValues[5u].z, productValue73, productValue72 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue75 = fma(vertexVectorConstants0.packedValues[6u].w, productValue74, fma(vertexVectorConstants0.packedValues[5u].w, productValue73, productValue72 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue76 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue75, fma(vertexVectorConstants0.packedValues[12u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue73, multiplyAddValue72 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue77 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue75, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[12u].y, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue73, multiplyAddValue72 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue78 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue75, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue73, multiplyAddValue72 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue79 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue75, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue73, multiplyAddValue72 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue11 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue12 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    float comparisonValue1;
    if (vertexColor0.w < 0.949999988079071044921875)
    {
        comparisonValue1 = (spvNClamp(nonlinearValue10 / (conditionValue2 ? 100000.0 : vertexVectorConstants0.packedValues[8u].w), 0.0, 1.0) * (1.0 - vertexColor0.w)) + vertexColor0.w;
    }
    else
    {
        comparisonValue1 = 1.0;
    }
    uint productValue13 = uint(roundEven(vertexTexCoord1.y * 65535.0));
    gl_Position.x = multiplyAddValue76;
    gl_Position.y = multiplyAddValue77;
    gl_Position.z = multiplyAddValue78;
    gl_Position.w = multiplyAddValue79;
    varyingColor1.x = multiplyAddValue76;
    varyingColor1.y = multiplyAddValue77;
    varyingColor1.z = multiplyAddValue78;
    varyingColor1.w = multiplyAddValue79;
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = comparisonValue1;
    varyingTexCoord2.x = float((uint(roundEven(vertexTexCoord1.x * 65535.0)) & 256u) != 0u);
    varyingTexCoord2.y = float((productValue13 & 256u) != 0u);
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    varyingColor2.w = spvNClamp((((nonlinearValue10 / (conditionValue2 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexVectorConstants0.packedValues[11u].x) - comparisonValue10) / ((conditionValue2 ? 1.0 : vertexVectorConstants0.packedValues[8u].y) - comparisonValue10), 0.0, 1.0);
    varyingTexCoord1.x = float((productValue13 >> 4u) & 15u) * 0.066666670143604278564453125;
    varyingTexCoord1.y = float(productValue13 & 15u) * 0.066666670143604278564453125;
    varyingTexCoord0.x = ((float((productValue11 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue11 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue12 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue12 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue42;
    varyingTexCoord3.y = multiplyAddValue43;
    varyingTexCoord3.z = multiplyAddValue44;
    varyingColor3.x = multiplyAddValue42;
    varyingColor3.y = multiplyAddValue43;
    varyingColor3.z = multiplyAddValue44;
#endif
    varyingColor3.w = 0.0;
}
