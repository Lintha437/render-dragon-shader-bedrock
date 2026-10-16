#version 460
#extension GL_GOOGLE_include_directive : require
// WeatherForwardPBR / MotionOnly / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FLIP_OCCLUSION
#define RD_FEATURE_FLIP_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_NO_OCCLUSION
#define RD_FEATURE_NO_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_NO_VARIETY
#define RD_FEATURE_NO_VARIETY RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 7
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/WeatherForwardPBR/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue = vertexPosition0.x + vertexVectorConstants0.packedValues[11u].x;
    precise float sumValue1 = vertexPosition0.y + vertexVectorConstants0.packedValues[11u].y;
    precise float sumValue2 = vertexPosition0.z + vertexVectorConstants0.packedValues[11u].z;
    precise float productValue = sumValue * 0.0333333350718021392822265625;
    precise float productValue1 = sumValue1 * 0.0333333350718021392822265625;
    precise float productValue2 = sumValue2 * 0.0333333350718021392822265625;
    precise float multiplyAddValue = fma(-trunc(productValue), 30.0, sumValue) + vertexVectorConstants0.packedValues[12u].x;
    precise float multiplyAddValue1 = fma(-trunc(productValue1), 30.0, sumValue1) + vertexVectorConstants0.packedValues[12u].y;
    precise float multiplyAddValue2 = fma(-trunc(productValue2), 30.0, sumValue2) + vertexVectorConstants0.packedValues[12u].z;
    precise float sumValue3 = multiplyAddValue - 15.0;
    precise float sumValue4 = multiplyAddValue1 - 15.0;
    precise float sumValue5 = multiplyAddValue2 - 15.0;
    precise float productValue3 = sumValue4 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue4 = sumValue4 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue5 = sumValue4 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue6 = sumValue4 * vertexVectorConstants0.packedValues[5u].w;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, sumValue5, fma(vertexVectorConstants0.packedValues[4u].x, sumValue3, productValue3)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, sumValue5, fma(vertexVectorConstants0.packedValues[4u].y, sumValue3, productValue4)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, sumValue5, fma(vertexVectorConstants0.packedValues[4u].z, sumValue3, productValue5)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, sumValue5, fma(vertexVectorConstants0.packedValues[4u].w, sumValue3, productValue6)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]);
    vec4 vectorValue1 = vec4(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5, multiplyAddValue6);
    precise float sumValue6 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[60u];
    vec4 vectorValue2 = vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue6, vertexScalarConstants0.packedValues[12u]);
    float scalarValue = rdDot4Precise(vectorValue2, vectorValue1);
    precise float sumValue7 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[61u];
    vec4 vectorValue3 = vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue7, vertexScalarConstants0.packedValues[13u]);
    float scalarValue1 = rdDot4Precise(vectorValue3, vectorValue1);
    vec4 vectorValue4 = vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]);
    float scalarValue2 = rdDot4Precise(vectorValue4, vectorValue1);
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[17u].x, vertexScalarConstants0.packedValues[33u], sumValue3);
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[17u].y, vertexScalarConstants0.packedValues[33u], sumValue4);
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[17u].z, vertexScalarConstants0.packedValues[33u], sumValue5);
    precise float productValue7 = multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue8 = multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue9 = multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue10 = multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].w;
    precise float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue7, productValue7)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue7, productValue8)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue7, productValue9)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue7, productValue10)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue5 = vec4(multiplyAddValue10, multiplyAddValue11, multiplyAddValue12, multiplyAddValue13);
    float scalarValue3 = rdDot4Precise(vectorValue, vectorValue5);
    float scalarValue4 = rdDot4Precise(vectorValue2, vectorValue5);
    float scalarValue5 = rdDot4Precise(vectorValue3, vectorValue5);
    float scalarValue6 = rdDot4Precise(vectorValue4, vectorValue5);
    precise float sumValue8 = scalarValue - scalarValue4;
    precise float sumValue9 = scalarValue1 - scalarValue5;
    precise float sumValue10 = rdDot4Precise(vectorValue, vectorValue1) - scalarValue3;
    precise float sumValue11 = scalarValue2 - scalarValue6;
    precise float quotientValue = scalarValue / scalarValue2;
    precise float quotientValue1 = scalarValue1 / scalarValue2;
    float multiplyAddValue14 = fma(vertexTexCoord0.y, sumValue10, scalarValue3);
    precise float quotientValue2 = scalarValue4 / scalarValue6;
    precise float quotientValue3 = scalarValue5 / scalarValue6;
    precise float sumValue12 = quotientValue2 - quotientValue;
    precise float sumValue13 = quotientValue3 - quotientValue1;
    vec2 vectorValue6 = vec2(sumValue12, -sumValue13);
    precise float productValue11 = sumValue13 * (-1.0);
    precise float productValue12 = sumValue12 * 1.0;
    float inverseLengthValue = inversesqrt(rdDot2Precise(vectorValue6, vectorValue6));
    precise float productValue13 = inverseLengthValue * productValue11;
    precise float productValue14 = inverseLengthValue * productValue12;
    precise float sumValue14 = 0.5 - vertexTexCoord0.x;
    precise float productValue15 = productValue13 * sumValue14;
    precise float productValue16 = productValue14 * sumValue14;
    gl_Position.x = fma(productValue15, vertexScalarConstants0.packedValues[32u], fma(vertexTexCoord0.y, sumValue8, scalarValue4));
    gl_Position.y = fma(productValue16, vertexScalarConstants0.packedValues[32u], fma(vertexTexCoord0.y, sumValue9, scalarValue5));
    gl_Position.z = multiplyAddValue14;
    gl_Position.w = fma(vertexTexCoord0.y, sumValue11, scalarValue6);
    precise float quotientValue4 = multiplyAddValue14 / vertexScalarConstants0.packedValues[38u];
    precise float sumValue15 = quotientValue4 - vertexScalarConstants0.packedValues[36u];
    precise float sumValue16 = vertexScalarConstants0.packedValues[37u] - vertexScalarConstants0.packedValues[36u];
    precise float quotientValue5 = sumValue15 / sumValue16;
    varyingColor1.w = spvNClamp(quotientValue5, 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float sumValue29 = vertexPosition0.x + vertexVectorConstants0.packedValues[11u].x;
    float sumValue30 = vertexPosition0.y + vertexVectorConstants0.packedValues[11u].y;
    float sumValue31 = vertexPosition0.z + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue34 = (fma(-trunc(sumValue29 * 0.0333333350718021392822265625), 30.0, sumValue29) + vertexVectorConstants0.packedValues[12u].x) - 15.0;
    float multiplyAddValue35 = (fma(-trunc(sumValue30 * 0.0333333350718021392822265625), 30.0, sumValue30) + vertexVectorConstants0.packedValues[12u].y) - 15.0;
    float multiplyAddValue36 = (fma(-trunc(sumValue31 * 0.0333333350718021392822265625), 30.0, sumValue31) + vertexVectorConstants0.packedValues[12u].z) - 15.0;
    vec4 vectorValue = vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]);
    vec4 multiplyAddValue37 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue34, multiplyAddValue35 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue34, multiplyAddValue35 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue34, multiplyAddValue35 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue34, multiplyAddValue35 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    vec4 sumValue32 = vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[60u], vertexScalarConstants0.packedValues[12u]);
    float scalarValue13 = rdDot4Precise(sumValue32, multiplyAddValue37);
    vec4 sumValue33 = vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[61u], vertexScalarConstants0.packedValues[13u]);
    float scalarValue14 = rdDot4Precise(sumValue33, multiplyAddValue37);
    vec4 vectorValue4 = vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]);
    float scalarValue15 = rdDot4Precise(vectorValue4, multiplyAddValue37);
    float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[17u].x, vertexScalarConstants0.packedValues[33u], multiplyAddValue34);
    float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[17u].y, vertexScalarConstants0.packedValues[33u], multiplyAddValue35);
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[17u].z, vertexScalarConstants0.packedValues[33u], multiplyAddValue36);
    vec4 multiplyAddValue41 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue38, multiplyAddValue39 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue38, multiplyAddValue39 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue38, multiplyAddValue39 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue38, multiplyAddValue39 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float scalarValue16 = rdDot4Precise(vectorValue, multiplyAddValue41);
    float scalarValue17 = rdDot4Precise(sumValue32, multiplyAddValue41);
    float scalarValue18 = rdDot4Precise(sumValue33, multiplyAddValue41);
    float scalarValue19 = rdDot4Precise(vectorValue4, multiplyAddValue41);
    float multiplyAddValue42 = fma(vertexTexCoord0.y, rdDot4Precise(vectorValue, multiplyAddValue37) - scalarValue16, scalarValue16);
    float quotientValue8 = (scalarValue17 / scalarValue19) - (scalarValue13 / scalarValue15);
    float quotientValue9 = (scalarValue14 / scalarValue15) - (scalarValue18 / scalarValue19);
    vec2 vectorValue7 = vec2(quotientValue8, quotientValue9);
    float inverseLengthValue2 = inversesqrt(rdDot2Precise(vectorValue7, vectorValue7));
    float sumValue34 = 0.5 - vertexTexCoord0.x;
    gl_Position.x = fma((inverseLengthValue2 * quotientValue9) * sumValue34, vertexScalarConstants0.packedValues[32u], fma(vertexTexCoord0.y, scalarValue13 - scalarValue17, scalarValue17));
    gl_Position.y = fma((inverseLengthValue2 * quotientValue8) * sumValue34, vertexScalarConstants0.packedValues[32u], fma(vertexTexCoord0.y, scalarValue14 - scalarValue18, scalarValue18));
    gl_Position.z = multiplyAddValue42;
    gl_Position.w = fma(vertexTexCoord0.y, scalarValue15 - scalarValue19, scalarValue19);
    varyingColor1.w = spvNClamp(((multiplyAddValue42 / vertexScalarConstants0.packedValues[38u]) - vertexScalarConstants0.packedValues[36u]) / (vertexScalarConstants0.packedValues[37u] - vertexScalarConstants0.packedValues[36u]), 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue22 = (vertexVectorConstants0.packedValues[11u].x + vertexPosition0.x) * 0.0333333350718021392822265625;
    float productValue23 = (vertexVectorConstants0.packedValues[11u].y + vertexPosition0.y) * 0.0333333350718021392822265625;
    float productValue24 = (vertexVectorConstants0.packedValues[11u].z + vertexPosition0.z) * 0.0333333350718021392822265625;
    float scalarValue7 = fract(abs(productValue22));
    float scalarValue8 = fract(abs(productValue23));
    float scalarValue9 = fract(abs(productValue24));
    float comparisonValue = (vertexVectorConstants0.packedValues[12u].x + (-15.0)) + (((productValue22 >= ((-0.0) - productValue22)) ? scalarValue7 : ((-0.0) - scalarValue7)) * 30.0);
    float comparisonValue1 = (vertexVectorConstants0.packedValues[12u].y + (-15.0)) + (((productValue23 >= ((-0.0) - productValue23)) ? scalarValue8 : ((-0.0) - scalarValue8)) * 30.0);
    float comparisonValue2 = (vertexVectorConstants0.packedValues[12u].z + (-15.0)) + (((productValue24 >= ((-0.0) - productValue24)) ? scalarValue9 : ((-0.0) - scalarValue9)) * 30.0);
    float productValue25 = (vertexVectorConstants0.packedValues[8u].y * vertexVectorConstants0.packedValues[17u].x) + comparisonValue;
    float productValue26 = (vertexVectorConstants0.packedValues[8u].y * vertexVectorConstants0.packedValues[17u].y) + comparisonValue1;
    float productValue27 = (vertexVectorConstants0.packedValues[8u].y * vertexVectorConstants0.packedValues[17u].z) + comparisonValue2;
    float sumValue27 = vertexVectorConstants0.packedValues[15u].x + vertexVectorConstants0.packedValues[2u].x;
    float sumValue28 = vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[15u].y;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].x, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].x, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[6u].y, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].y, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[6u].z, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].z, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[6u].w, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].w, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue21, fma(sumValue27, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue21, fma(sumValue28, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[0u].w)));
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].x, productValue27, fma(vertexVectorConstants0.packedValues[5u].x, productValue26, productValue25 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].y, productValue27, fma(vertexVectorConstants0.packedValues[5u].y, productValue26, productValue25 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].z, productValue27, fma(vertexVectorConstants0.packedValues[5u].z, productValue26, productValue25 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].w, productValue27, fma(vertexVectorConstants0.packedValues[5u].w, productValue26, productValue25 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue28, fma(sumValue27, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue28, fma(sumValue28, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].w)));
    float quotientValue6 = (multiplyAddValue29 / multiplyAddValue32) - (multiplyAddValue22 / multiplyAddValue24);
    float quotientValue7 = (-0.0) - ((multiplyAddValue30 / multiplyAddValue32) - (multiplyAddValue23 / multiplyAddValue24));
    float multiplyAddValue33 = ((fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[0u].z))) - multiplyAddValue31) * vertexTexCoord0.y) + multiplyAddValue31;
    float inverseLengthValue1 = (inversesqrt(dot(vec2(quotientValue7, quotientValue6), vec2(quotientValue7, quotientValue6))) * (0.5 - vertexTexCoord0.x)) * vertexVectorConstants0.packedValues[8u].x;
    float productValue28 = (vertexVectorConstants0.packedValues[13u].x + vertexPosition0.x) * 0.0333333350718021392822265625;
    float productValue29 = (vertexVectorConstants0.packedValues[13u].y + vertexPosition0.y) * 0.0333333350718021392822265625;
    float productValue30 = (vertexVectorConstants0.packedValues[13u].z + vertexPosition0.z) * 0.0333333350718021392822265625;
    float scalarValue10 = fract(abs(productValue28));
    float scalarValue11 = fract(abs(productValue29));
    float scalarValue12 = fract(abs(productValue30));
    gl_Position.x = (((multiplyAddValue22 - multiplyAddValue29) * vertexTexCoord0.y) + multiplyAddValue29) + (inverseLengthValue1 * quotientValue7);
    gl_Position.y = (((multiplyAddValue23 - multiplyAddValue30) * vertexTexCoord0.y) + multiplyAddValue30) + (inverseLengthValue1 * quotientValue6);
    gl_Position.z = multiplyAddValue33;
    gl_Position.w = ((multiplyAddValue24 - multiplyAddValue32) * vertexTexCoord0.y) + multiplyAddValue32;
#endif
    varyingColor1.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor1.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor1.z = vertexVectorConstants0.packedValues[10u].z;
#if (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue17 = sumValue3 + vertexVectorConstants0.packedValues[18u].x;
    precise float sumValue18 = sumValue5 + vertexVectorConstants0.packedValues[18u].z;
    precise float sumValue19 = sumValue4 + vertexVectorConstants0.packedValues[18u].y;
    varyingTexCoord3.x = sumValue3;
    varyingTexCoord3.y = sumValue4;
    varyingTexCoord3.z = sumValue5;
    precise float sumValue20 = sumValue19 - 0.5;
    varyingTexCoord1.x = fma(sumValue17, 0.015625, 0.5);
    varyingTexCoord1.y = fma(sumValue18, 0.015625, 0.5);
    precise float productValue17 = sumValue20 * 0.0039215688593685626983642578125;
    varyingTexCoord2 = productValue17;
    precise float sumValue21 = vertexPosition0.x + vertexVectorConstants0.packedValues[13u].x;
    precise float sumValue22 = vertexPosition0.y + vertexVectorConstants0.packedValues[13u].y;
    precise float sumValue23 = vertexPosition0.z + vertexVectorConstants0.packedValues[13u].z;
    precise float productValue18 = sumValue21 * 0.0333333350718021392822265625;
    precise float productValue19 = sumValue22 * 0.0333333350718021392822265625;
    precise float productValue20 = sumValue23 * 0.0333333350718021392822265625;
    precise float multiplyAddValue15 = fma(-trunc(productValue18), 30.0, sumValue21) + vertexVectorConstants0.packedValues[14u].x;
    precise float multiplyAddValue16 = fma(-trunc(productValue19), 30.0, sumValue22) + vertexVectorConstants0.packedValues[14u].y;
    precise float multiplyAddValue17 = fma(-trunc(productValue20), 30.0, sumValue23) + vertexVectorConstants0.packedValues[14u].z;
    precise float sumValue24 = multiplyAddValue15 - 15.0;
    precise float sumValue25 = multiplyAddValue16 - 15.0;
    precise float sumValue26 = multiplyAddValue17 - 15.0;
    varyingTexCoord4.x = sumValue24;
    varyingTexCoord4.y = sumValue25;
    varyingTexCoord4.z = sumValue26;
    precise float productValue21 = vertexColor0 * vertexScalarConstants0.packedValues[66u];
    varyingTexCoord0.x = fma(productValue21, 255.0, fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[16u].z, vertexVectorConstants0.packedValues[16u].x));
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[16u].w, vertexVectorConstants0.packedValues[16u].y);
#elif (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue17 = sumValue3 + vertexVectorConstants0.packedValues[18u].x;
    precise float sumValue18 = sumValue5 + vertexVectorConstants0.packedValues[18u].z;
    precise float sumValue19 = sumValue4 + vertexVectorConstants0.packedValues[18u].y;
    varyingTexCoord3.x = sumValue3;
    varyingTexCoord3.y = sumValue4;
    varyingTexCoord3.z = sumValue5;
    precise float sumValue20 = sumValue19 - 0.5;
    varyingTexCoord1.x = fma(sumValue17, 0.015625, 0.5);
    varyingTexCoord1.y = fma(sumValue18, 0.015625, 0.5);
    precise float productValue17 = sumValue20 * 0.0039215688593685626983642578125;
    varyingTexCoord2 = productValue17;
    precise float sumValue21 = vertexPosition0.x + vertexVectorConstants0.packedValues[13u].x;
    precise float sumValue22 = vertexPosition0.y + vertexVectorConstants0.packedValues[13u].y;
    precise float sumValue23 = vertexPosition0.z + vertexVectorConstants0.packedValues[13u].z;
    precise float productValue18 = sumValue21 * 0.0333333350718021392822265625;
    precise float productValue19 = sumValue22 * 0.0333333350718021392822265625;
    precise float productValue20 = sumValue23 * 0.0333333350718021392822265625;
    precise float multiplyAddValue15 = fma(-trunc(productValue18), 30.0, sumValue21) + vertexVectorConstants0.packedValues[14u].x;
    precise float multiplyAddValue16 = fma(-trunc(productValue19), 30.0, sumValue22) + vertexVectorConstants0.packedValues[14u].y;
    precise float multiplyAddValue17 = fma(-trunc(productValue20), 30.0, sumValue23) + vertexVectorConstants0.packedValues[14u].z;
    precise float sumValue24 = multiplyAddValue15 - 15.0;
    precise float sumValue25 = multiplyAddValue16 - 15.0;
    precise float sumValue26 = multiplyAddValue17 - 15.0;
    varyingTexCoord4.x = sumValue24;
    varyingTexCoord4.y = sumValue25;
    varyingTexCoord4.z = sumValue26;
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[16u].z, vertexVectorConstants0.packedValues[16u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[16u].w, vertexVectorConstants0.packedValues[16u].y);
#elif (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord3.x = multiplyAddValue34;
    varyingTexCoord3.y = multiplyAddValue35;
    varyingTexCoord3.z = multiplyAddValue36;
    varyingTexCoord1.x = fma(multiplyAddValue34 + vertexVectorConstants0.packedValues[18u].x, 0.015625, 0.5);
    varyingTexCoord1.y = fma(multiplyAddValue36 + vertexVectorConstants0.packedValues[18u].z, 0.015625, 0.5);
    varyingTexCoord2 = ((multiplyAddValue35 + vertexVectorConstants0.packedValues[18u].y) - 0.5) * 0.0039215688593685626983642578125;
    float sumValue35 = vertexPosition0.x + vertexVectorConstants0.packedValues[13u].x;
    float sumValue36 = vertexPosition0.y + vertexVectorConstants0.packedValues[13u].y;
    float sumValue37 = vertexPosition0.z + vertexVectorConstants0.packedValues[13u].z;
    varyingTexCoord4.x = (fma(-trunc(sumValue35 * 0.0333333350718021392822265625), 30.0, sumValue35) + vertexVectorConstants0.packedValues[14u].x) - 15.0;
    varyingTexCoord4.y = (fma(-trunc(sumValue36 * 0.0333333350718021392822265625), 30.0, sumValue36) + vertexVectorConstants0.packedValues[14u].y) - 15.0;
    varyingTexCoord4.z = (fma(-trunc(sumValue37 * 0.0333333350718021392822265625), 30.0, sumValue37) + vertexVectorConstants0.packedValues[14u].z) - 15.0;
    varyingTexCoord0.x = fma(vertexColor0 * vertexScalarConstants0.packedValues[66u], 255.0, fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[16u].z, vertexVectorConstants0.packedValues[16u].x));
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[16u].w, vertexVectorConstants0.packedValues[16u].y);
#elif (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord3.x = multiplyAddValue34;
    varyingTexCoord3.y = multiplyAddValue35;
    varyingTexCoord3.z = multiplyAddValue36;
    varyingTexCoord1.x = fma(multiplyAddValue34 + vertexVectorConstants0.packedValues[18u].x, 0.015625, 0.5);
    varyingTexCoord1.y = fma(multiplyAddValue36 + vertexVectorConstants0.packedValues[18u].z, 0.015625, 0.5);
    varyingTexCoord2 = ((multiplyAddValue35 + vertexVectorConstants0.packedValues[18u].y) - 0.5) * 0.0039215688593685626983642578125;
    float sumValue35 = vertexPosition0.x + vertexVectorConstants0.packedValues[13u].x;
    float sumValue36 = vertexPosition0.y + vertexVectorConstants0.packedValues[13u].y;
    float sumValue37 = vertexPosition0.z + vertexVectorConstants0.packedValues[13u].z;
    varyingTexCoord4.x = (fma(-trunc(sumValue35 * 0.0333333350718021392822265625), 30.0, sumValue35) + vertexVectorConstants0.packedValues[14u].x) - 15.0;
    varyingTexCoord4.y = (fma(-trunc(sumValue36 * 0.0333333350718021392822265625), 30.0, sumValue36) + vertexVectorConstants0.packedValues[14u].y) - 15.0;
    varyingTexCoord4.z = (fma(-trunc(sumValue37 * 0.0333333350718021392822265625), 30.0, sumValue37) + vertexVectorConstants0.packedValues[14u].z) - 15.0;
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[16u].z, vertexVectorConstants0.packedValues[16u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[16u].w, vertexVectorConstants0.packedValues[16u].y);
#elif (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor1.w = spvNClamp(((multiplyAddValue33 / vertexVectorConstants0.packedValues[9u].z) - vertexVectorConstants0.packedValues[9u].x) / (vertexVectorConstants0.packedValues[9u].y - vertexVectorConstants0.packedValues[9u].x), 0.0, 1.0);
    varyingTexCoord2 = ((comparisonValue1 + (-0.5)) + vertexVectorConstants0.packedValues[18u].y) * 0.0039215688593685626983642578125;
    varyingTexCoord1.x = ((vertexVectorConstants0.packedValues[18u].x + comparisonValue) * 0.015625) + 0.5;
    varyingTexCoord1.y = ((vertexVectorConstants0.packedValues[18u].z + comparisonValue2) * 0.015625) + 0.5;
    varyingTexCoord4.x = (vertexVectorConstants0.packedValues[14u].x + (-15.0)) + (((productValue28 >= ((-0.0) - productValue28)) ? scalarValue10 : ((-0.0) - scalarValue10)) * 30.0);
    varyingTexCoord4.y = (vertexVectorConstants0.packedValues[14u].y + (-15.0)) + (((productValue29 >= ((-0.0) - productValue29)) ? scalarValue11 : ((-0.0) - scalarValue11)) * 30.0);
    varyingTexCoord4.z = (vertexVectorConstants0.packedValues[14u].z + (-15.0)) + (((productValue30 >= ((-0.0) - productValue30)) ? scalarValue12 : ((-0.0) - scalarValue12)) * 30.0);
    varyingTexCoord0.x = (((vertexColor0.x * 255.0) + vertexTexCoord0.x) * vertexVectorConstants0.packedValues[16u].z) + vertexVectorConstants0.packedValues[16u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[16u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[16u].y;
    varyingTexCoord3.x = comparisonValue;
    varyingTexCoord3.y = comparisonValue1;
    varyingTexCoord3.z = comparisonValue2;
#elif (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor1.w = spvNClamp(((multiplyAddValue33 / vertexVectorConstants0.packedValues[9u].z) - vertexVectorConstants0.packedValues[9u].x) / (vertexVectorConstants0.packedValues[9u].y - vertexVectorConstants0.packedValues[9u].x), 0.0, 1.0);
    varyingTexCoord2 = ((comparisonValue1 + (-0.5)) + vertexVectorConstants0.packedValues[18u].y) * 0.0039215688593685626983642578125;
    varyingTexCoord1.x = ((vertexVectorConstants0.packedValues[18u].x + comparisonValue) * 0.015625) + 0.5;
    varyingTexCoord1.y = ((vertexVectorConstants0.packedValues[18u].z + comparisonValue2) * 0.015625) + 0.5;
    varyingTexCoord4.x = (vertexVectorConstants0.packedValues[14u].x + (-15.0)) + (((productValue28 >= ((-0.0) - productValue28)) ? scalarValue10 : ((-0.0) - scalarValue10)) * 30.0);
    varyingTexCoord4.y = (vertexVectorConstants0.packedValues[14u].y + (-15.0)) + (((productValue29 >= ((-0.0) - productValue29)) ? scalarValue11 : ((-0.0) - scalarValue11)) * 30.0);
    varyingTexCoord4.z = (vertexVectorConstants0.packedValues[14u].z + (-15.0)) + (((productValue30 >= ((-0.0) - productValue30)) ? scalarValue12 : ((-0.0) - scalarValue12)) * 30.0);
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[16u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[16u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[16u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[16u].y;
    varyingTexCoord3.x = comparisonValue;
    varyingTexCoord3.y = comparisonValue1;
    varyingTexCoord3.z = comparisonValue2;
#endif
}
