#version 460
#extension GL_GOOGLE_include_directive : require
// WeatherForwardPBR / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FLIP_OCCLUSION
#define RD_FEATURE_FLIP_OCCLUSION RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
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
#define RD_BINDING_LAYOUT 4
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
    precise float sumValue6 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[52u];
    vec4 vectorValue2 = vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue6, vertexScalarConstants0.packedValues[12u]);
    float scalarValue = rdDot4Precise(vectorValue2, vectorValue1);
    precise float sumValue7 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[53u];
    vec4 vectorValue3 = vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue7, vertexScalarConstants0.packedValues[13u]);
    float scalarValue1 = rdDot4Precise(vectorValue3, vectorValue1);
    vec4 vectorValue4 = vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]);
    float scalarValue2 = rdDot4Precise(vectorValue4, vectorValue1);
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[15u].x, vertexScalarConstants0.packedValues[33u], sumValue3);
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[15u].y, vertexScalarConstants0.packedValues[33u], sumValue4);
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[15u].z, vertexScalarConstants0.packedValues[33u], sumValue5);
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
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float sumValue21 = vertexPosition0.x + vertexVectorConstants0.packedValues[11u].x;
    float sumValue22 = vertexPosition0.y + vertexVectorConstants0.packedValues[11u].y;
    float sumValue23 = vertexPosition0.z + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue15 = (fma(-trunc(sumValue21 * 0.0333333350718021392822265625), 30.0, sumValue21) + vertexVectorConstants0.packedValues[12u].x) - 15.0;
    float multiplyAddValue16 = (fma(-trunc(sumValue22 * 0.0333333350718021392822265625), 30.0, sumValue22) + vertexVectorConstants0.packedValues[12u].y) - 15.0;
    float multiplyAddValue17 = (fma(-trunc(sumValue23 * 0.0333333350718021392822265625), 30.0, sumValue23) + vertexVectorConstants0.packedValues[12u].z) - 15.0;
    vec4 vectorValue = vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]);
    vec4 multiplyAddValue18 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    vec4 sumValue24 = vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[52u], vertexScalarConstants0.packedValues[12u]);
    float scalarValue7 = rdDot4Precise(sumValue24, multiplyAddValue18);
    vec4 sumValue25 = vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[53u], vertexScalarConstants0.packedValues[13u]);
    float scalarValue8 = rdDot4Precise(sumValue25, multiplyAddValue18);
    vec4 vectorValue4 = vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]);
    float scalarValue9 = rdDot4Precise(vectorValue4, multiplyAddValue18);
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[15u].x, vertexScalarConstants0.packedValues[33u], multiplyAddValue15);
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[15u].y, vertexScalarConstants0.packedValues[33u], multiplyAddValue16);
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[15u].z, vertexScalarConstants0.packedValues[33u], multiplyAddValue17);
    vec4 multiplyAddValue22 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float scalarValue10 = rdDot4Precise(vectorValue, multiplyAddValue22);
    float scalarValue11 = rdDot4Precise(sumValue24, multiplyAddValue22);
    float scalarValue12 = rdDot4Precise(sumValue25, multiplyAddValue22);
    float scalarValue13 = rdDot4Precise(vectorValue4, multiplyAddValue22);
    float multiplyAddValue23 = fma(vertexTexCoord0.y, rdDot4Precise(vectorValue, multiplyAddValue18) - scalarValue10, scalarValue10);
    float quotientValue6 = (scalarValue11 / scalarValue13) - (scalarValue7 / scalarValue9);
    float quotientValue7 = (scalarValue8 / scalarValue9) - (scalarValue12 / scalarValue13);
    vec2 vectorValue7 = vec2(quotientValue6, quotientValue7);
    float inverseLengthValue1 = inversesqrt(rdDot2Precise(vectorValue7, vectorValue7));
    float sumValue26 = 0.5 - vertexTexCoord0.x;
    gl_Position.x = fma((inverseLengthValue1 * quotientValue7) * sumValue26, vertexScalarConstants0.packedValues[32u], fma(vertexTexCoord0.y, scalarValue7 - scalarValue11, scalarValue11));
    gl_Position.y = fma((inverseLengthValue1 * quotientValue6) * sumValue26, vertexScalarConstants0.packedValues[32u], fma(vertexTexCoord0.y, scalarValue8 - scalarValue12, scalarValue12));
    gl_Position.z = multiplyAddValue23;
    gl_Position.w = fma(vertexTexCoord0.y, scalarValue9 - scalarValue13, scalarValue13);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue19 = (vertexVectorConstants0.packedValues[11u].x + vertexPosition0.x) * 0.0333333350718021392822265625;
    float productValue20 = (vertexVectorConstants0.packedValues[11u].y + vertexPosition0.y) * 0.0333333350718021392822265625;
    float productValue21 = (vertexVectorConstants0.packedValues[11u].z + vertexPosition0.z) * 0.0333333350718021392822265625;
    float scalarValue14 = fract(abs(productValue19));
    float scalarValue15 = fract(abs(productValue20));
    float scalarValue16 = fract(abs(productValue21));
    float comparisonValue = (vertexVectorConstants0.packedValues[12u].x + (-15.0)) + (((productValue19 >= ((-0.0) - productValue19)) ? scalarValue14 : ((-0.0) - scalarValue14)) * 30.0);
    float comparisonValue1 = (vertexVectorConstants0.packedValues[12u].y + (-15.0)) + (((productValue20 >= ((-0.0) - productValue20)) ? scalarValue15 : ((-0.0) - scalarValue15)) * 30.0);
    float comparisonValue2 = (vertexVectorConstants0.packedValues[12u].z + (-15.0)) + (((productValue21 >= ((-0.0) - productValue21)) ? scalarValue16 : ((-0.0) - scalarValue16)) * 30.0);
    float productValue22 = (vertexVectorConstants0.packedValues[8u].y * vertexVectorConstants0.packedValues[15u].x) + comparisonValue;
    float productValue23 = (vertexVectorConstants0.packedValues[8u].y * vertexVectorConstants0.packedValues[15u].y) + comparisonValue1;
    float productValue24 = (vertexVectorConstants0.packedValues[8u].y * vertexVectorConstants0.packedValues[15u].z) + comparisonValue2;
    float sumValue27 = vertexVectorConstants0.packedValues[13u].x + vertexVectorConstants0.packedValues[2u].x;
    float sumValue28 = vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[6u].x, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].x, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].y, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].y, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].z, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].z, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].w, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].w, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue27, fma(sumValue27, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue25, multiplyAddValue24 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue27, fma(sumValue28, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue25, multiplyAddValue24 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue25, multiplyAddValue24 * vertexVectorConstants0.packedValues[0u].w)));
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[6u].x, productValue24, fma(vertexVectorConstants0.packedValues[5u].x, productValue23, productValue22 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[6u].y, productValue24, fma(vertexVectorConstants0.packedValues[5u].y, productValue23, productValue22 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[6u].z, productValue24, fma(vertexVectorConstants0.packedValues[5u].z, productValue23, productValue22 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[6u].w, productValue24, fma(vertexVectorConstants0.packedValues[5u].w, productValue23, productValue22 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue34, fma(sumValue27, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue34, fma(sumValue28, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[0u].w)));
    float quotientValue8 = (multiplyAddValue35 / multiplyAddValue38) - (multiplyAddValue28 / multiplyAddValue30);
    float quotientValue9 = (-0.0) - ((multiplyAddValue36 / multiplyAddValue38) - (multiplyAddValue29 / multiplyAddValue30));
    float multiplyAddValue39 = ((fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue26, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue25, multiplyAddValue24 * vertexVectorConstants0.packedValues[0u].z))) - multiplyAddValue37) * vertexTexCoord0.y) + multiplyAddValue37;
    float inverseLengthValue2 = (inversesqrt(dot(vec2(quotientValue9, quotientValue8), vec2(quotientValue9, quotientValue8))) * (0.5 - vertexTexCoord0.x)) * vertexVectorConstants0.packedValues[8u].x;
    gl_Position.x = (((multiplyAddValue28 - multiplyAddValue35) * vertexTexCoord0.y) + multiplyAddValue35) + (inverseLengthValue2 * quotientValue9);
    gl_Position.y = (((multiplyAddValue29 - multiplyAddValue36) * vertexTexCoord0.y) + multiplyAddValue36) + (inverseLengthValue2 * quotientValue8);
    gl_Position.z = multiplyAddValue39;
    gl_Position.w = ((multiplyAddValue30 - multiplyAddValue38) * vertexTexCoord0.y) + multiplyAddValue38;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue16 = vertexScalarConstants0.packedValues[37u] - vertexScalarConstants0.packedValues[36u];
    precise float quotientValue5 = sumValue15 / sumValue16;
    varyingColor1.w = spvNClamp(quotientValue5, 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    varyingColor1.w = spvNClamp(((multiplyAddValue23 / vertexScalarConstants0.packedValues[38u]) - vertexScalarConstants0.packedValues[36u]) / (vertexScalarConstants0.packedValues[37u] - vertexScalarConstants0.packedValues[36u]), 0.0, 1.0);
#endif
    varyingColor1.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor1.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor1.z = vertexVectorConstants0.packedValues[10u].z;
#if (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue17 = sumValue3 + vertexVectorConstants0.packedValues[16u].x;
    precise float sumValue18 = sumValue5 + vertexVectorConstants0.packedValues[16u].z;
    precise float sumValue19 = sumValue4 + vertexVectorConstants0.packedValues[16u].y;
    varyingTexCoord3.x = sumValue3;
    varyingTexCoord3.y = sumValue4;
    varyingTexCoord3.z = sumValue5;
    precise float sumValue20 = sumValue19 - 0.5;
    varyingTexCoord1.x = fma(sumValue17, 0.015625, 0.5);
    varyingTexCoord1.y = fma(sumValue18, 0.015625, 0.5);
    precise float productValue17 = sumValue20 * 0.0039215688593685626983642578125;
    varyingTexCoord2 = productValue17;
    precise float productValue18 = vertexColor0.x * vertexScalarConstants0.packedValues[58u];
    varyingTexCoord0.x = fma(productValue18, 255.0, fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[14u].z, vertexVectorConstants0.packedValues[14u].x));
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[14u].w, vertexVectorConstants0.packedValues[14u].y);
#elif (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue17 = sumValue3 + vertexVectorConstants0.packedValues[16u].x;
    precise float sumValue18 = sumValue5 + vertexVectorConstants0.packedValues[16u].z;
    precise float sumValue19 = sumValue4 + vertexVectorConstants0.packedValues[16u].y;
    varyingTexCoord3.x = sumValue3;
    varyingTexCoord3.y = sumValue4;
    varyingTexCoord3.z = sumValue5;
    precise float sumValue20 = sumValue19 - 0.5;
    varyingTexCoord1.x = fma(sumValue17, 0.015625, 0.5);
    varyingTexCoord1.y = fma(sumValue18, 0.015625, 0.5);
    precise float productValue17 = sumValue20 * 0.0039215688593685626983642578125;
    varyingTexCoord2 = productValue17;
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[14u].z, vertexVectorConstants0.packedValues[14u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[14u].w, vertexVectorConstants0.packedValues[14u].y);
#elif (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord3.x = multiplyAddValue15;
    varyingTexCoord3.y = multiplyAddValue16;
    varyingTexCoord3.z = multiplyAddValue17;
    varyingTexCoord1.x = fma(multiplyAddValue15 + vertexVectorConstants0.packedValues[16u].x, 0.015625, 0.5);
    varyingTexCoord1.y = fma(multiplyAddValue17 + vertexVectorConstants0.packedValues[16u].z, 0.015625, 0.5);
    varyingTexCoord2 = ((multiplyAddValue16 + vertexVectorConstants0.packedValues[16u].y) - 0.5) * 0.0039215688593685626983642578125;
    varyingTexCoord0.x = fma(vertexColor0.x * vertexScalarConstants0.packedValues[58u], 255.0, fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[14u].z, vertexVectorConstants0.packedValues[14u].x));
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[14u].w, vertexVectorConstants0.packedValues[14u].y);
#elif (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord3.x = multiplyAddValue15;
    varyingTexCoord3.y = multiplyAddValue16;
    varyingTexCoord3.z = multiplyAddValue17;
    varyingTexCoord1.x = fma(multiplyAddValue15 + vertexVectorConstants0.packedValues[16u].x, 0.015625, 0.5);
    varyingTexCoord1.y = fma(multiplyAddValue17 + vertexVectorConstants0.packedValues[16u].z, 0.015625, 0.5);
    varyingTexCoord2 = ((multiplyAddValue16 + vertexVectorConstants0.packedValues[16u].y) - 0.5) * 0.0039215688593685626983642578125;
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[14u].z, vertexVectorConstants0.packedValues[14u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[14u].w, vertexVectorConstants0.packedValues[14u].y);
#elif (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor1.w = spvNClamp(((multiplyAddValue39 / vertexVectorConstants0.packedValues[9u].z) - vertexVectorConstants0.packedValues[9u].x) / (vertexVectorConstants0.packedValues[9u].y - vertexVectorConstants0.packedValues[9u].x), 0.0, 1.0);
    varyingTexCoord2 = ((comparisonValue1 + (-0.5)) + vertexVectorConstants0.packedValues[16u].y) * 0.0039215688593685626983642578125;
    varyingTexCoord1.x = ((vertexVectorConstants0.packedValues[16u].x + comparisonValue) * 0.015625) + 0.5;
    varyingTexCoord1.y = ((vertexVectorConstants0.packedValues[16u].z + comparisonValue2) * 0.015625) + 0.5;
    varyingTexCoord0.x = (((vertexColor0.x * 255.0) + vertexTexCoord0.x) * vertexVectorConstants0.packedValues[14u].z) + vertexVectorConstants0.packedValues[14u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[14u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[14u].y;
    varyingTexCoord3.x = comparisonValue;
    varyingTexCoord3.y = comparisonValue1;
    varyingTexCoord3.z = comparisonValue2;
#elif (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor1.w = spvNClamp(((multiplyAddValue39 / vertexVectorConstants0.packedValues[9u].z) - vertexVectorConstants0.packedValues[9u].x) / (vertexVectorConstants0.packedValues[9u].y - vertexVectorConstants0.packedValues[9u].x), 0.0, 1.0);
    varyingTexCoord2 = ((comparisonValue1 + (-0.5)) + vertexVectorConstants0.packedValues[16u].y) * 0.0039215688593685626983642578125;
    varyingTexCoord1.x = ((vertexVectorConstants0.packedValues[16u].x + comparisonValue) * 0.015625) + 0.5;
    varyingTexCoord1.y = ((vertexVectorConstants0.packedValues[16u].z + comparisonValue2) * 0.015625) + 0.5;
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[14u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[14u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[14u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[14u].y;
    varyingTexCoord3.x = comparisonValue;
    varyingTexCoord3.y = comparisonValue1;
    varyingTexCoord3.z = comparisonValue2;
#endif
}
