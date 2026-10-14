#version 460
#extension GL_GOOGLE_include_directive : require
// BeaconBeam / Opaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/BeaconBeam/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u];
    precise float productValue5 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue6 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue7 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue8 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].w;
    precise float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue5)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue6)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue7)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].w, vertexPosition0.x, productValue8)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17, multiplyAddValue18);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u];
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue);
    gl_Position.z = scalarValue1;
    precise float quotientValue = scalarValue1 / vertexScalarConstants0.packedValues[102u];
    precise float sumValue2 = quotientValue - vertexScalarConstants0.packedValues[100u];
#elif (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue4 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u];
    precise float productValue5 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue6 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue7 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue8 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].w;
    precise float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue5)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue6)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue7)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].w, vertexPosition0.x, productValue8)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17, multiplyAddValue18);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue4, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue5 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u];
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue5, vertexScalarConstants0.packedValues[13u]), vectorValue);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue);
    gl_Position.z = scalarValue1;
    precise float quotientValue2 = scalarValue1 / vertexScalarConstants0.packedValues[38u];
    precise float sumValue6 = quotientValue2 - vertexScalarConstants0.packedValues[36u];
#elif (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 multiplyAddValue9 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].w, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[108u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue9);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[109u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue9);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue9);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue9);
    gl_Position.z = scalarValue;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 multiplyAddValue9 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].w, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue9);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue9);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue9);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue9);
    gl_Position.z = scalarValue;
#elif (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].w, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].w * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[9u].x * vertexNormal0.x));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[9u].y * vertexNormal0.x));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[9u].z * vertexNormal0.x));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[11u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[10u].w, vertexNormal0.y, vertexVectorConstants0.packedValues[9u].w * vertexNormal0.x));
    float inverseLengthValue = inversesqrt(dot(vec4(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7, multiplyAddValue8), vec4(multiplyAddValue5, multiplyAddValue6, multiplyAddValue7, multiplyAddValue8)));
    float productValue = inverseLengthValue * multiplyAddValue5;
    float productValue1 = inverseLengthValue * multiplyAddValue7;
    float productValue2 = (((0.449999988079071044921875 - ((productValue * productValue) * 0.100000001490116119384765625)) + ((productValue1 * productValue1) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[8u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue6 * vertexVectorConstants0.packedValues[28u].w) * inverseLengthValue) + 1.0) * 0.2750000059604644775390625);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[27u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[27u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = multiplyAddValue4;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].w)));
#elif (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].w, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].w * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z)));
    float productValue22 = (vertexVectorConstants0.packedValues[8u].w * 0.3499999940395355224609375) + 1.0;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[11u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[11u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = multiplyAddValue4;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].w)));
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[101u] - vertexScalarConstants0.packedValues[100u];
    precise float quotientValue1 = sumValue2 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    precise float productValue9 = vertexNormal0.y * vertexVectorConstants0.packedValues[10u].x;
    precise float productValue10 = vertexNormal0.y * vertexVectorConstants0.packedValues[10u].y;
    precise float productValue11 = vertexNormal0.y * vertexVectorConstants0.packedValues[10u].z;
    precise float productValue12 = vertexNormal0.y * vertexVectorConstants0.packedValues[10u].w;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.x, productValue9));
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.x, productValue10));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.x, productValue11));
    vec4 multiplyAddValue22 = vec4(multiplyAddValue19, multiplyAddValue20, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[11u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].w, vertexNormal0.x, productValue12)));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue22, multiplyAddValue22));
    precise float productValue13 = inverseLengthValue2 * multiplyAddValue19;
    precise float productValue14 = inverseLengthValue2 * multiplyAddValue20;
    precise float productValue15 = inverseLengthValue2 * multiplyAddValue21;
    precise float productValue16 = productValue13 * productValue13;
    precise float productValue17 = productValue15 * productValue15;
    precise float productValue18 = productValue16 * (-0.100000001490116119384765625);
    precise float multiplyAddValue23 = fma(productValue17, 0.100000001490116119384765625, fma(fma(productValue14, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, productValue18)) + 0.449999988079071044921875;
    float multiplyAddValue24 = fma(vertexScalarConstants0.packedValues[35u], 0.3499999940395355224609375, multiplyAddValue23);
    precise float productValue19 = multiplyAddValue24 * vertexVectorConstants0.packedValues[28u].x;
    precise float productValue20 = multiplyAddValue24 * vertexVectorConstants0.packedValues[28u].y;
    precise float productValue21 = multiplyAddValue24 * vertexVectorConstants0.packedValues[28u].z;
    varyingColor1.x = productValue19;
    varyingColor1.y = productValue20;
    varyingColor1.z = productValue21;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue7 = vertexScalarConstants0.packedValues[37u] - vertexScalarConstants0.packedValues[36u];
    precise float quotientValue3 = sumValue6 / sumValue7;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue25 = fma(vertexScalarConstants0.packedValues[35u], 0.3499999940395355224609375, 1.0);
    precise float productValue23 = multiplyAddValue25 * vertexVectorConstants0.packedValues[12u].x;
    precise float productValue24 = multiplyAddValue25 * vertexVectorConstants0.packedValues[12u].y;
    precise float productValue25 = multiplyAddValue25 * vertexVectorConstants0.packedValues[12u].z;
    varyingColor1.x = productValue23;
    varyingColor1.y = productValue24;
    varyingColor1.z = productValue25;
#elif (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue / vertexScalarConstants0.packedValues[102u]) - vertexScalarConstants0.packedValues[100u]) / (vertexScalarConstants0.packedValues[101u] - vertexScalarConstants0.packedValues[100u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[11u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[10u].x));
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[11u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[10u].y));
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[11u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[10u].z));
    vec4 multiplyAddValue13 = vec4(multiplyAddValue10, multiplyAddValue11, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[11u].w, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].w, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[10u].w)));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue13, multiplyAddValue13));
    float productValue3 = inverseLengthValue1 * multiplyAddValue10;
    float productValue4 = inverseLengthValue1 * multiplyAddValue12;
    float multiplyAddValue14 = fma(vertexScalarConstants0.packedValues[35u], 0.3499999940395355224609375, fma(productValue4 * productValue4, 0.100000001490116119384765625, fma(fma(inverseLengthValue1 * multiplyAddValue11, vertexScalarConstants0.packedValues[115u], 1.0), 0.2750000059604644775390625, (productValue3 * productValue3) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor1.x = multiplyAddValue14 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = multiplyAddValue14 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = multiplyAddValue14 * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue / vertexScalarConstants0.packedValues[38u]) - vertexScalarConstants0.packedValues[36u]) / (vertexScalarConstants0.packedValues[37u] - vertexScalarConstants0.packedValues[36u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue25 = fma(vertexScalarConstants0.packedValues[35u], 0.3499999940395355224609375, 1.0);
    varyingColor1.x = multiplyAddValue25 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor1.y = multiplyAddValue25 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor1.z = multiplyAddValue25 * vertexVectorConstants0.packedValues[12u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue4 / vertexVectorConstants0.packedValues[25u].z) - vertexVectorConstants0.packedValues[25u].x) / (vertexVectorConstants0.packedValues[25u].y - vertexVectorConstants0.packedValues[25u].x), 0.0, 1.0);
    varyingColor1.x = productValue2 * vertexVectorConstants0.packedValues[28u].x;
    varyingColor1.y = productValue2 * vertexVectorConstants0.packedValues[28u].y;
    varyingColor1.z = productValue2 * vertexVectorConstants0.packedValues[28u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue4 / vertexVectorConstants0.packedValues[9u].z) - vertexVectorConstants0.packedValues[9u].x) / (vertexVectorConstants0.packedValues[9u].y - vertexVectorConstants0.packedValues[9u].x), 0.0, 1.0);
    varyingColor1.x = productValue22 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor1.y = productValue22 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor1.z = productValue22 * vertexVectorConstants0.packedValues[12u].z;
#endif
    varyingColor1.w = 1.0;
#if (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[29u].z, vertexVectorConstants0.packedValues[29u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[29u].w, vertexVectorConstants0.packedValues[29u].y);
#elif (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[13u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[13u].y);
#elif (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[29u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[29u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[29u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[29u].y;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[13u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[13u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[13u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[13u].y;
#endif
}
