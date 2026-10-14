#version 460
#extension GL_GOOGLE_include_directive : require
// WeatherForwardPBR / ForwardPBRTransparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
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
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/WeatherForwardPBR/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float sumValue2 = vertexPosition0.x + vertexVectorConstants0.packedValues[11u].x;
    float sumValue3 = vertexPosition0.y + vertexVectorConstants0.packedValues[11u].y;
    float sumValue4 = vertexPosition0.z + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue16 = (fma(-trunc(sumValue2 * 0.0333333350718021392822265625), 30.0, sumValue2) + vertexVectorConstants0.packedValues[12u].x) - 15.0;
    float multiplyAddValue17 = (fma(-trunc(sumValue3 * 0.0333333350718021392822265625), 30.0, sumValue3) + vertexVectorConstants0.packedValues[12u].y) - 15.0;
    float multiplyAddValue18 = (fma(-trunc(sumValue4 * 0.0333333350718021392822265625), 30.0, sumValue4) + vertexVectorConstants0.packedValues[12u].z) - 15.0;
    vec4 vectorValue = vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]);
    vec4 multiplyAddValue19 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue16, multiplyAddValue17 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue16, multiplyAddValue17 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue16, multiplyAddValue17 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue16, multiplyAddValue17 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    vec4 sumValue5 = vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[52u], vertexScalarConstants0.packedValues[12u]);
    float scalarValue3 = rdDot4Precise(sumValue5, multiplyAddValue19);
    vec4 sumValue6 = vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[53u], vertexScalarConstants0.packedValues[13u]);
    float scalarValue4 = rdDot4Precise(sumValue6, multiplyAddValue19);
    vec4 vectorValue1 = vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]);
    float scalarValue5 = rdDot4Precise(vectorValue1, multiplyAddValue19);
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[15u].x, vertexScalarConstants0.packedValues[33u], multiplyAddValue16);
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[15u].y, vertexScalarConstants0.packedValues[33u], multiplyAddValue17);
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[15u].z, vertexScalarConstants0.packedValues[33u], multiplyAddValue18);
    vec4 multiplyAddValue23 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue22, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue20, multiplyAddValue21 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float scalarValue6 = rdDot4Precise(vectorValue, multiplyAddValue23);
    float scalarValue7 = rdDot4Precise(sumValue5, multiplyAddValue23);
    float scalarValue8 = rdDot4Precise(sumValue6, multiplyAddValue23);
    float scalarValue9 = rdDot4Precise(vectorValue1, multiplyAddValue23);
    float multiplyAddValue24 = fma(vertexTexCoord0.y, rdDot4Precise(vectorValue, multiplyAddValue19) - scalarValue6, scalarValue6);
    float multiplyAddValue25 = fma(vertexTexCoord0.y, scalarValue5 - scalarValue9, scalarValue9);
    float quotientValue2 = (scalarValue7 / scalarValue9) - (scalarValue3 / scalarValue5);
    float quotientValue3 = (scalarValue4 / scalarValue5) - (scalarValue8 / scalarValue9);
    vec2 vectorValue2 = vec2(quotientValue2, quotientValue3);
    float inverseLengthValue1 = inversesqrt(rdDot2Precise(vectorValue2, vectorValue2));
    float sumValue7 = 0.5 - vertexTexCoord0.x;
    float multiplyAddValue26 = fma((inverseLengthValue1 * quotientValue3) * sumValue7, vertexScalarConstants0.packedValues[32u], fma(vertexTexCoord0.y, scalarValue3 - scalarValue7, scalarValue7));
    float multiplyAddValue27 = fma((inverseLengthValue1 * quotientValue2) * sumValue7, vertexScalarConstants0.packedValues[32u], fma(vertexTexCoord0.y, scalarValue4 - scalarValue8, scalarValue8));
    varyingColor2.x = multiplyAddValue26 / multiplyAddValue25;
    varyingColor2.y = multiplyAddValue27 / multiplyAddValue25;
    varyingColor2.z = multiplyAddValue24 / multiplyAddValue25;
    gl_Position.x = multiplyAddValue26;
    gl_Position.y = multiplyAddValue27;
    gl_Position.z = multiplyAddValue24;
    gl_Position.w = multiplyAddValue25;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (vertexVectorConstants0.packedValues[11u].x + vertexPosition0.x) * 0.0333333350718021392822265625;
    float productValue1 = (vertexVectorConstants0.packedValues[11u].y + vertexPosition0.y) * 0.0333333350718021392822265625;
    float productValue2 = (vertexVectorConstants0.packedValues[11u].z + vertexPosition0.z) * 0.0333333350718021392822265625;
    float scalarValue = fract(abs(productValue));
    float scalarValue1 = fract(abs(productValue1));
    float scalarValue2 = fract(abs(productValue2));
    float comparisonValue = (vertexVectorConstants0.packedValues[12u].x + (-15.0)) + (((productValue >= ((-0.0) - productValue)) ? scalarValue : ((-0.0) - scalarValue)) * 30.0);
    float comparisonValue1 = (vertexVectorConstants0.packedValues[12u].y + (-15.0)) + (((productValue1 >= ((-0.0) - productValue1)) ? scalarValue1 : ((-0.0) - scalarValue1)) * 30.0);
    float comparisonValue2 = (vertexVectorConstants0.packedValues[12u].z + (-15.0)) + (((productValue2 >= ((-0.0) - productValue2)) ? scalarValue2 : ((-0.0) - scalarValue2)) * 30.0);
    float productValue3 = (vertexVectorConstants0.packedValues[8u].y * vertexVectorConstants0.packedValues[15u].x) + comparisonValue;
    float productValue4 = (vertexVectorConstants0.packedValues[8u].y * vertexVectorConstants0.packedValues[15u].y) + comparisonValue1;
    float productValue5 = (vertexVectorConstants0.packedValues[8u].y * vertexVectorConstants0.packedValues[15u].z) + comparisonValue2;
    float sumValue = vertexVectorConstants0.packedValues[13u].x + vertexVectorConstants0.packedValues[2u].x;
    float sumValue1 = vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[13u].y;
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].x, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].y, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].z, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].w, comparisonValue2, fma(vertexVectorConstants0.packedValues[5u].w, comparisonValue1, comparisonValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue3, fma(sumValue, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue3, fma(sumValue1, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].w)));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[6u].x, productValue5, fma(vertexVectorConstants0.packedValues[5u].x, productValue4, productValue3 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[6u].y, productValue5, fma(vertexVectorConstants0.packedValues[5u].y, productValue4, productValue3 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].z, productValue5, fma(vertexVectorConstants0.packedValues[5u].z, productValue4, productValue3 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].w, productValue5, fma(vertexVectorConstants0.packedValues[5u].w, productValue4, productValue3 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue10, fma(sumValue, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue10, fma(sumValue1, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].w)));
    float quotientValue = (multiplyAddValue11 / multiplyAddValue14) - (multiplyAddValue4 / multiplyAddValue6);
    float quotientValue1 = (-0.0) - ((multiplyAddValue12 / multiplyAddValue14) - (multiplyAddValue5 / multiplyAddValue6));
    float multiplyAddValue15 = ((fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z))) - multiplyAddValue13) * vertexTexCoord0.y) + multiplyAddValue13;
    float productValue6 = ((multiplyAddValue6 - multiplyAddValue14) * vertexTexCoord0.y) + multiplyAddValue14;
    float inverseLengthValue = (inversesqrt(dot(vec2(quotientValue1, quotientValue), vec2(quotientValue1, quotientValue))) * (0.5 - vertexTexCoord0.x)) * vertexVectorConstants0.packedValues[8u].x;
    float productValue7 = (((multiplyAddValue4 - multiplyAddValue11) * vertexTexCoord0.y) + multiplyAddValue11) + (inverseLengthValue * quotientValue1);
    float productValue8 = (((multiplyAddValue5 - multiplyAddValue12) * vertexTexCoord0.y) + multiplyAddValue12) + (inverseLengthValue * quotientValue);
    gl_Position.x = productValue7;
    gl_Position.y = productValue8;
    gl_Position.z = multiplyAddValue15;
    gl_Position.w = productValue6;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingColor1.w = spvNClamp(((multiplyAddValue24 / vertexScalarConstants0.packedValues[38u]) - vertexScalarConstants0.packedValues[36u]) / (vertexScalarConstants0.packedValues[37u] - vertexScalarConstants0.packedValues[36u]), 0.0, 1.0);
#endif
    varyingColor1.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor1.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor1.z = vertexVectorConstants0.packedValues[10u].z;
#if (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord3.x = multiplyAddValue16;
    varyingTexCoord3.y = multiplyAddValue17;
    varyingTexCoord3.z = multiplyAddValue18;
    varyingTexCoord1.x = fma(multiplyAddValue16 + vertexVectorConstants0.packedValues[16u].x, 0.015625, 0.5);
    varyingTexCoord1.y = fma(multiplyAddValue18 + vertexVectorConstants0.packedValues[16u].z, 0.015625, 0.5);
    varyingTexCoord2 = ((multiplyAddValue17 + vertexVectorConstants0.packedValues[16u].y) - 0.5) * 0.0039215688593685626983642578125;
    varyingTexCoord0.x = fma(vertexColor0.x * vertexScalarConstants0.packedValues[58u], 255.0, fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[14u].z, vertexVectorConstants0.packedValues[14u].x));
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[14u].w, vertexVectorConstants0.packedValues[14u].y);
#elif (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord3.x = multiplyAddValue16;
    varyingTexCoord3.y = multiplyAddValue17;
    varyingTexCoord3.z = multiplyAddValue18;
    varyingTexCoord1.x = fma(multiplyAddValue16 + vertexVectorConstants0.packedValues[16u].x, 0.015625, 0.5);
    varyingTexCoord1.y = fma(multiplyAddValue18 + vertexVectorConstants0.packedValues[16u].z, 0.015625, 0.5);
    varyingTexCoord2 = ((multiplyAddValue17 + vertexVectorConstants0.packedValues[16u].y) - 0.5) * 0.0039215688593685626983642578125;
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[14u].z, vertexVectorConstants0.packedValues[14u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[14u].w, vertexVectorConstants0.packedValues[14u].y);
#elif (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_VARIETY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor1.w = spvNClamp(((multiplyAddValue15 / vertexVectorConstants0.packedValues[9u].z) - vertexVectorConstants0.packedValues[9u].x) / (vertexVectorConstants0.packedValues[9u].y - vertexVectorConstants0.packedValues[9u].x), 0.0, 1.0);
    varyingColor2.x = productValue7 / productValue6;
    varyingColor2.y = productValue8 / productValue6;
    varyingColor2.z = multiplyAddValue15 / productValue6;
    varyingTexCoord2 = ((comparisonValue1 + (-0.5)) + vertexVectorConstants0.packedValues[16u].y) * 0.0039215688593685626983642578125;
    varyingTexCoord1.x = ((vertexVectorConstants0.packedValues[16u].x + comparisonValue) * 0.015625) + 0.5;
    varyingTexCoord1.y = ((vertexVectorConstants0.packedValues[16u].z + comparisonValue2) * 0.015625) + 0.5;
    varyingTexCoord0.x = (((vertexColor0.x * 255.0) + vertexTexCoord0.x) * vertexVectorConstants0.packedValues[14u].z) + vertexVectorConstants0.packedValues[14u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[14u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[14u].y;
    varyingTexCoord3.x = comparisonValue;
    varyingTexCoord3.y = comparisonValue1;
    varyingTexCoord3.z = comparisonValue2;
#elif (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_NO_VARIETY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor1.w = spvNClamp(((multiplyAddValue15 / vertexVectorConstants0.packedValues[9u].z) - vertexVectorConstants0.packedValues[9u].x) / (vertexVectorConstants0.packedValues[9u].y - vertexVectorConstants0.packedValues[9u].x), 0.0, 1.0);
    varyingColor2.x = productValue7 / productValue6;
    varyingColor2.y = productValue8 / productValue6;
    varyingColor2.z = multiplyAddValue15 / productValue6;
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
