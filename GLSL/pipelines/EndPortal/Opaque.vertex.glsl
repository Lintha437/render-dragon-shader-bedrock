#version 460
#extension GL_GOOGLE_include_directive : require
// EndPortal / Opaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/EndPortal/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[7u].z;
    precise float productValue3 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue4 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue5 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue6 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue, productValue3)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue, productValue4)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue, productValue5)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue, productValue6)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue3;
    gl_Position.y = multiplyAddValue4;
    gl_Position.z = multiplyAddValue5;
    gl_Position.w = multiplyAddValue6;
    precise float sumValue = vertexColor0.x - 0.5;
    precise float sumValue1 = vertexColor0.y - 0.5;
    precise float sumValue2 = vertexColor0.z - 0.5;
    precise float productValue7 = sumValue * 2.0;
    precise float productValue8 = sumValue1 * 2.0;
    precise float productValue9 = sumValue2 * 2.0;
    precise float productValue10 = vertexColor0.w * 32.0;
    precise float productValue11 = vertexColor0.w * 71.807830810546875;
    float wavePhaseValue = sin(productValue11);
    float wavePhaseValue1 = cos(productValue11);
    vec3 vectorValue = vec3(productValue7, productValue8, productValue9);
    vec3 vectorValue1 = vec3(multiplyAddValue, multiplyAddValue1, multiplyAddValue2);
    precise float multiplyAddValue7 = rdDot3Precise2(vec3(fma(-productValue7, productValue10, multiplyAddValue), fma(-productValue8, productValue10, multiplyAddValue1), fma(-productValue9, productValue10, multiplyAddValue2)), vectorValue) / rdDot3Precise2(vectorValue1, vectorValue);
    float multiplyAddValue8 = fma(multiplyAddValue7, multiplyAddValue1, vertexVectorConstants0.packedValues[22u].y);
    float multiplyAddValue9 = fma(multiplyAddValue7, multiplyAddValue2, vertexVectorConstants0.packedValues[22u].z);
    float multiplyAddValue10 = fma(multiplyAddValue7, multiplyAddValue, vertexVectorConstants0.packedValues[22u].x);
    precise float nonlinearValue = sqrt(rdDot3Precise2(vectorValue1, vectorValue1)) / vertexScalarConstants0.packedValues[82u];
    precise float sumValue3 = nonlinearValue - vertexScalarConstants0.packedValues[80u];
    float scalarValue = abs(productValue7);
    float scalarValue1 = abs(productValue8);
    precise float productValue12 = scalarValue * multiplyAddValue8;
    precise float productValue13 = scalarValue * multiplyAddValue9;
    precise float productValue14 = scalarValue1 * multiplyAddValue10;
    precise float productValue15 = scalarValue1 * multiplyAddValue9;
    precise float sumValue4 = productValue14 + productValue12;
    precise float sumValue5 = productValue15 + productValue13;
    float scalarValue2 = abs(productValue9);
    precise float multiplyAddValue11 = fma(multiplyAddValue10, scalarValue2, sumValue4) * 0.0625;
    precise float multiplyAddValue12 = fma(multiplyAddValue8, scalarValue2, sumValue5) * 0.0625;
    vec2 vectorValue2 = vec2(multiplyAddValue11, multiplyAddValue12);
    float multiplyAddValue13 = fma(wavePhaseValue1, productValue10, rdDot2Precise(vec2(wavePhaseValue1, wavePhaseValue), vectorValue2));
    precise float productValue16 = multiplyAddValue13 * 0.015625;
    varyingTexCoord1.x = fma(-trunc(productValue16), 64.0, multiplyAddValue13);
    float multiplyAddValue14 = fma(vertexScalarConstants0.packedValues[91u], 0.00390625, fma(wavePhaseValue, productValue10, rdDot2Precise(vec2(-wavePhaseValue, wavePhaseValue1), vectorValue2)));
    precise float productValue17 = multiplyAddValue14 * 0.015625;
    varyingTexCoord1.y = fma(-trunc(productValue17), 64.0, multiplyAddValue14);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue5 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue11 = rdDot4Precise(vectorValue5, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue29 = scalarValue11 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue30 = scalarValue11 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue31 = scalarValue11 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue32 = scalarValue11 * vertexVectorConstants0.packedValues[1u].w;
    float scalarValue12 = rdDot4Precise(vectorValue5, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue13 = rdDot4Precise(vectorValue5, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue13, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue12, productValue29)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue13, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue12, productValue30)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue13, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue12, productValue31)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue13, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue12, productValue32)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue37;
    gl_Position.y = multiplyAddValue38;
    gl_Position.z = multiplyAddValue39;
    gl_Position.w = multiplyAddValue40;
    precise float sumValue = vertexColor0.x - 0.5;
    precise float sumValue1 = vertexColor0.y - 0.5;
    precise float sumValue2 = vertexColor0.z - 0.5;
    precise float productValue7 = sumValue * 2.0;
    precise float productValue8 = sumValue1 * 2.0;
    precise float productValue9 = sumValue2 * 2.0;
    precise float productValue10 = vertexColor0.w * 32.0;
    precise float productValue11 = vertexColor0.w * 71.807830810546875;
    float wavePhaseValue = sin(productValue11);
    float wavePhaseValue1 = cos(productValue11);
    vec3 vectorValue = vec3(productValue7, productValue8, productValue9);
    vec3 vectorValue6 = vec3(scalarValue12, scalarValue11, scalarValue13);
    precise float multiplyAddValue41 = rdDot3Precise2(vec3(fma(-productValue7, productValue10, scalarValue12), fma(-productValue8, productValue10, scalarValue11), fma(-productValue9, productValue10, scalarValue13)), vectorValue) / rdDot3Precise2(vectorValue6, vectorValue);
    float multiplyAddValue42 = fma(multiplyAddValue41, scalarValue11, vertexVectorConstants0.packedValues[6u].y);
    float multiplyAddValue43 = fma(multiplyAddValue41, scalarValue13, vertexVectorConstants0.packedValues[6u].z);
    float multiplyAddValue44 = fma(multiplyAddValue41, scalarValue12, vertexVectorConstants0.packedValues[6u].x);
    precise float nonlinearValue1 = sqrt(rdDot3Precise2(vectorValue6, vectorValue6)) / vertexScalarConstants0.packedValues[18u];
    precise float sumValue7 = nonlinearValue1 - vertexScalarConstants0.packedValues[16u];
    float scalarValue = abs(productValue7);
    float scalarValue1 = abs(productValue8);
    precise float productValue33 = scalarValue * multiplyAddValue42;
    precise float productValue34 = scalarValue * multiplyAddValue43;
    precise float productValue35 = scalarValue1 * multiplyAddValue44;
    precise float productValue36 = scalarValue1 * multiplyAddValue43;
    precise float sumValue8 = productValue35 + productValue33;
    precise float sumValue9 = productValue36 + productValue34;
    float scalarValue2 = abs(productValue9);
    precise float multiplyAddValue45 = fma(multiplyAddValue44, scalarValue2, sumValue8) * 0.0625;
    precise float multiplyAddValue46 = fma(multiplyAddValue42, scalarValue2, sumValue9) * 0.0625;
    vec2 vectorValue7 = vec2(multiplyAddValue45, multiplyAddValue46);
    float multiplyAddValue47 = fma(wavePhaseValue1, productValue10, rdDot2Precise(vec2(wavePhaseValue1, wavePhaseValue), vectorValue7));
    precise float productValue37 = multiplyAddValue47 * 0.015625;
    varyingTexCoord1.x = fma(-trunc(productValue37), 64.0, multiplyAddValue47);
    float multiplyAddValue48 = fma(vertexScalarConstants0.packedValues[27u], 0.00390625, fma(wavePhaseValue, productValue10, rdDot2Precise(vec2(-wavePhaseValue, wavePhaseValue1), vectorValue7)));
    precise float productValue38 = multiplyAddValue48 * 0.015625;
    varyingTexCoord1.y = fma(-trunc(productValue38), 64.0, multiplyAddValue48);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    float productValue18 = (vertexColor0.x - 0.5) * 2.0;
    float productValue19 = (vertexColor0.y - 0.5) * 2.0;
    float productValue20 = (vertexColor0.z - 0.5) * 2.0;
    float productValue21 = vertexColor0.w * 32.0;
    float productValue22 = vertexColor0.w * 71.807830810546875;
    float wavePhaseValue2 = sin(productValue22);
    float wavePhaseValue3 = cos(productValue22);
    vec3 vectorValue3 = vec3(productValue18, productValue19, productValue20);
    vec3 vectorValue4 = vec3(multiplyAddValue15, multiplyAddValue16, multiplyAddValue17);
    float multiplyAddValue18 = rdDot3Precise2(vec3(fma(-productValue18, productValue21, multiplyAddValue15), fma(-productValue19, productValue21, multiplyAddValue16), fma(-productValue20, productValue21, multiplyAddValue17)), vectorValue3) / rdDot3Precise2(vectorValue4, vectorValue3);
    float multiplyAddValue19 = fma(multiplyAddValue18, multiplyAddValue16, vertexVectorConstants0.packedValues[22u].y);
    float multiplyAddValue20 = fma(multiplyAddValue18, multiplyAddValue17, vertexVectorConstants0.packedValues[22u].z);
    float multiplyAddValue21 = fma(multiplyAddValue18, multiplyAddValue15, vertexVectorConstants0.packedValues[22u].x);
    float scalarValue3 = abs(productValue18);
    float scalarValue4 = abs(productValue19);
    float scalarValue5 = abs(productValue20);
    vec2 multiplyAddValue22 = vec2(fma(multiplyAddValue21, scalarValue5, fma(scalarValue4, multiplyAddValue21, scalarValue3 * multiplyAddValue19)) * 0.0625, fma(multiplyAddValue19, scalarValue5, fma(scalarValue4, multiplyAddValue20, scalarValue3 * multiplyAddValue20)) * 0.0625);
    float multiplyAddValue23 = fma(wavePhaseValue3, productValue21, rdDot2Precise(vec2(wavePhaseValue3, wavePhaseValue2), multiplyAddValue22));
    varyingTexCoord1.x = fma(-trunc(multiplyAddValue23 * 0.015625), 64.0, multiplyAddValue23);
    float multiplyAddValue24 = fma(vertexScalarConstants0.packedValues[91u], 0.00390625, fma(wavePhaseValue2, productValue21, rdDot2Precise(vec2(-wavePhaseValue2, wavePhaseValue3), multiplyAddValue22)));
    varyingTexCoord1.y = fma(-trunc(multiplyAddValue24 * 0.015625), 64.0, multiplyAddValue24);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue5 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue11 = rdDot4Precise(vectorValue5, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue12 = rdDot4Precise(vectorValue5, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue13 = rdDot4Precise(vectorValue5, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue13, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue12, scalarValue11 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue13, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue12, scalarValue11 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue13, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue12, scalarValue11 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue13, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue12, scalarValue11 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    float productValue18 = (vertexColor0.x - 0.5) * 2.0;
    float productValue19 = (vertexColor0.y - 0.5) * 2.0;
    float productValue20 = (vertexColor0.z - 0.5) * 2.0;
    float productValue21 = vertexColor0.w * 32.0;
    float productValue22 = vertexColor0.w * 71.807830810546875;
    float wavePhaseValue2 = sin(productValue22);
    float wavePhaseValue3 = cos(productValue22);
    vec3 vectorValue3 = vec3(productValue18, productValue19, productValue20);
    vec3 vectorValue6 = vec3(scalarValue12, scalarValue11, scalarValue13);
    float multiplyAddValue30 = rdDot3Precise2(vec3(fma(-productValue18, productValue21, scalarValue12), fma(-productValue19, productValue21, scalarValue11), fma(-productValue20, productValue21, scalarValue13)), vectorValue3) / rdDot3Precise2(vectorValue6, vectorValue3);
    float multiplyAddValue31 = fma(multiplyAddValue30, scalarValue11, vertexVectorConstants0.packedValues[6u].y);
    float multiplyAddValue32 = fma(multiplyAddValue30, scalarValue13, vertexVectorConstants0.packedValues[6u].z);
    float multiplyAddValue33 = fma(multiplyAddValue30, scalarValue12, vertexVectorConstants0.packedValues[6u].x);
    float scalarValue3 = abs(productValue18);
    float scalarValue4 = abs(productValue19);
    float scalarValue5 = abs(productValue20);
    vec2 multiplyAddValue34 = vec2(fma(multiplyAddValue33, scalarValue5, fma(scalarValue4, multiplyAddValue33, scalarValue3 * multiplyAddValue31)) * 0.0625, fma(multiplyAddValue31, scalarValue5, fma(scalarValue4, multiplyAddValue32, scalarValue3 * multiplyAddValue32)) * 0.0625);
    float multiplyAddValue35 = fma(wavePhaseValue3, productValue21, rdDot2Precise(vec2(wavePhaseValue3, wavePhaseValue2), multiplyAddValue34));
    varyingTexCoord1.x = fma(-trunc(multiplyAddValue35 * 0.015625), 64.0, multiplyAddValue35);
    float multiplyAddValue36 = fma(vertexScalarConstants0.packedValues[27u], 0.00390625, fma(wavePhaseValue2, productValue21, rdDot2Precise(vec2(-wavePhaseValue2, wavePhaseValue3), multiplyAddValue34)));
    varyingTexCoord1.y = fma(-trunc(multiplyAddValue36 * 0.015625), 64.0, multiplyAddValue36);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float productValue23 = (vertexColor0.x + (-0.5)) * 2.0;
    float productValue24 = (vertexColor0.y + (-0.5)) * 2.0;
    float productValue25 = (vertexColor0.z + (-0.5)) * 2.0;
    float productValue21 = vertexColor0.w * 32.0;
    float dotProductValue = dot(vec3(multiplyAddValue25 - (productValue21 * productValue23), multiplyAddValue26 - (productValue21 * productValue24), multiplyAddValue27 - (productValue25 * productValue21)), vec3(productValue23, productValue24, productValue25)) / dot(vec3(multiplyAddValue25, multiplyAddValue26, multiplyAddValue27), vec3(productValue23, productValue24, productValue25));
    float productValue26 = vertexVectorConstants0.packedValues[22u].y + (dotProductValue * multiplyAddValue26);
    float scalarValue6 = abs(productValue23);
    float scalarValue7 = abs(productValue24);
    float scalarValue8 = abs(productValue25);
    float productValue27 = (((scalarValue8 + scalarValue7) * (vertexVectorConstants0.packedValues[22u].x + (dotProductValue * multiplyAddValue25))) + (productValue26 * scalarValue6)) * 0.0625;
    float productValue28 = (((scalarValue7 + scalarValue6) * (vertexVectorConstants0.packedValues[22u].z + (dotProductValue * multiplyAddValue27))) + (scalarValue8 * productValue26)) * 0.0625;
    float productValue22 = vertexColor0.w * 71.807830810546875;
    float wavePhaseValue2 = sin(productValue22);
    float wavePhaseValue3 = cos(productValue22);
    float multiplyAddValue28 = (fma(wavePhaseValue2, productValue28, productValue27 * wavePhaseValue3) + (wavePhaseValue3 * productValue21)) * 0.015625;
    float multiplyAddValue29 = (((wavePhaseValue2 * productValue21) + (vertexVectorConstants0.packedValues[22u].w * 0.00390625)) + fma(wavePhaseValue3, productValue28, (-0.0) - (wavePhaseValue2 * productValue27))) * 0.015625;
    float scalarValue9 = fract(abs(multiplyAddValue28));
    float scalarValue10 = fract(abs(multiplyAddValue29));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue49 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue50 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue51 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float productValue23 = (vertexColor0.x + (-0.5)) * 2.0;
    float productValue24 = (vertexColor0.y + (-0.5)) * 2.0;
    float productValue25 = (vertexColor0.z + (-0.5)) * 2.0;
    float productValue21 = vertexColor0.w * 32.0;
    float dotProductValue1 = dot(vec3(multiplyAddValue49 - (productValue21 * productValue23), multiplyAddValue50 - (productValue21 * productValue24), multiplyAddValue51 - (productValue25 * productValue21)), vec3(productValue23, productValue24, productValue25)) / dot(vec3(multiplyAddValue49, multiplyAddValue50, multiplyAddValue51), vec3(productValue23, productValue24, productValue25));
    float productValue39 = vertexVectorConstants0.packedValues[6u].y + (dotProductValue1 * multiplyAddValue50);
    float scalarValue6 = abs(productValue23);
    float scalarValue7 = abs(productValue24);
    float scalarValue8 = abs(productValue25);
    float productValue40 = (((scalarValue8 + scalarValue7) * (vertexVectorConstants0.packedValues[6u].x + (dotProductValue1 * multiplyAddValue49))) + (productValue39 * scalarValue6)) * 0.0625;
    float productValue41 = (((scalarValue7 + scalarValue6) * (vertexVectorConstants0.packedValues[6u].z + (dotProductValue1 * multiplyAddValue51))) + (scalarValue8 * productValue39)) * 0.0625;
    float productValue22 = vertexColor0.w * 71.807830810546875;
    float wavePhaseValue2 = sin(productValue22);
    float wavePhaseValue3 = cos(productValue22);
    float multiplyAddValue52 = (fma(wavePhaseValue2, productValue41, productValue40 * wavePhaseValue3) + (wavePhaseValue3 * productValue21)) * 0.015625;
    float multiplyAddValue53 = (((wavePhaseValue2 * productValue21) + (vertexVectorConstants0.packedValues[6u].w * 0.00390625)) + fma(wavePhaseValue3, productValue41, (-0.0) - (wavePhaseValue2 * productValue40))) * 0.015625;
    float scalarValue14 = fract(abs(multiplyAddValue52));
    float scalarValue15 = fract(abs(multiplyAddValue53));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue51, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue50, multiplyAddValue49 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue51, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue50, multiplyAddValue49 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue51, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue50, multiplyAddValue49 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue51, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue50, multiplyAddValue49 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord2 = vertexColor0.w;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue6 = vertexScalarConstants0.packedValues[81u] - vertexScalarConstants0.packedValues[80u];
    precise float quotientValue = sumValue3 / sumValue6;
    varyingColor0.w = spvNClamp(quotientValue, 0.0, 1.0);
    varyingColor0.x = vertexVectorConstants0.packedValues[21u].x;
    varyingColor0.y = vertexVectorConstants0.packedValues[21u].y;
    varyingColor0.z = vertexVectorConstants0.packedValues[21u].z;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue10 = vertexScalarConstants0.packedValues[17u] - vertexScalarConstants0.packedValues[16u];
    precise float quotientValue1 = sumValue7 / sumValue10;
    varyingColor0.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor0.x = vertexVectorConstants0.packedValues[5u].x;
    varyingColor0.y = vertexVectorConstants0.packedValues[5u].y;
    varyingColor0.z = vertexVectorConstants0.packedValues[5u].z;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor0.w = spvNClamp(((sqrt(rdDot3Precise2(vectorValue4, vectorValue4)) / vertexScalarConstants0.packedValues[82u]) - vertexScalarConstants0.packedValues[80u]) / (vertexScalarConstants0.packedValues[81u] - vertexScalarConstants0.packedValues[80u]), 0.0, 1.0);
    varyingColor0.x = vertexVectorConstants0.packedValues[21u].x;
    varyingColor0.y = vertexVectorConstants0.packedValues[21u].y;
    varyingColor0.z = vertexVectorConstants0.packedValues[21u].z;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor0.w = spvNClamp(((sqrt(rdDot3Precise2(vectorValue6, vectorValue6)) / vertexScalarConstants0.packedValues[18u]) - vertexScalarConstants0.packedValues[16u]) / (vertexScalarConstants0.packedValues[17u] - vertexScalarConstants0.packedValues[16u]), 0.0, 1.0);
    varyingColor0.x = vertexVectorConstants0.packedValues[5u].x;
    varyingColor0.y = vertexVectorConstants0.packedValues[5u].y;
    varyingColor0.z = vertexVectorConstants0.packedValues[5u].z;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor0.x = vertexVectorConstants0.packedValues[21u].x;
    varyingColor0.y = vertexVectorConstants0.packedValues[21u].y;
    varyingColor0.z = vertexVectorConstants0.packedValues[21u].z;
    varyingColor0.w = spvNClamp(((sqrt(((multiplyAddValue26 * multiplyAddValue26) + (multiplyAddValue25 * multiplyAddValue25)) + (multiplyAddValue27 * multiplyAddValue27)) / vertexVectorConstants0.packedValues[20u].z) - vertexVectorConstants0.packedValues[20u].x) / (vertexVectorConstants0.packedValues[20u].y - vertexVectorConstants0.packedValues[20u].x), 0.0, 1.0);
    varyingTexCoord1.x = ((multiplyAddValue28 >= ((-0.0) - multiplyAddValue28)) ? scalarValue9 : ((-0.0) - scalarValue9)) * 64.0;
    varyingTexCoord1.y = ((multiplyAddValue29 >= ((-0.0) - multiplyAddValue29)) ? scalarValue10 : ((-0.0) - scalarValue10)) * 64.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor0.x = vertexVectorConstants0.packedValues[5u].x;
    varyingColor0.y = vertexVectorConstants0.packedValues[5u].y;
    varyingColor0.z = vertexVectorConstants0.packedValues[5u].z;
    varyingColor0.w = spvNClamp(((sqrt(((multiplyAddValue50 * multiplyAddValue50) + (multiplyAddValue49 * multiplyAddValue49)) + (multiplyAddValue51 * multiplyAddValue51)) / vertexVectorConstants0.packedValues[4u].z) - vertexVectorConstants0.packedValues[4u].x) / (vertexVectorConstants0.packedValues[4u].y - vertexVectorConstants0.packedValues[4u].x), 0.0, 1.0);
    varyingTexCoord1.x = ((multiplyAddValue52 >= ((-0.0) - multiplyAddValue52)) ? scalarValue14 : ((-0.0) - scalarValue14)) * 64.0;
    varyingTexCoord1.y = ((multiplyAddValue53 >= ((-0.0) - multiplyAddValue53)) ? scalarValue15 : ((-0.0) - scalarValue15)) * 64.0;
#endif
}
