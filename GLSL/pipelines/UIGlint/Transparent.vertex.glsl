#version 460
#extension GL_GOOGLE_include_directive : require
// UIGlint / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif

#include "../../include/materials/UIGlint/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[2u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[2u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[2u].z;
    precise float productValue3 = vertexPosition0.y * vertexVectorConstants0.packedValues[2u].w;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[3u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[4u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[3u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[4u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[3u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[4u].z;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[3u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].w, vertexPosition0.x, productValue3)) + vertexVectorConstants0.packedValues[4u].w;
    gl_Position.x = multiplyAddValue;
    gl_Position.y = multiplyAddValue1;
    gl_Position.z = multiplyAddValue2;
    gl_Position.w = multiplyAddValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[2u].x)) + vertexVectorConstants0.packedValues[4u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[2u].y)) + vertexVectorConstants0.packedValues[4u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[2u].z)) + vertexVectorConstants0.packedValues[4u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].w, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[2u].w)) + vertexVectorConstants0.packedValues[4u].w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sumValue9 = vertexTexCoord0.x + (-0.5);
    float sumValue10 = vertexTexCoord0.y + (-0.5);
    float wavePhaseValue4 = sin(vertexVectorConstants0.packedValues[5u].x);
    float wavePhaseValue5 = cos(vertexVectorConstants0.packedValues[5u].x);
    float sumValue11 = (-0.0) - sumValue9;
    float wavePhaseValue6 = sin(vertexVectorConstants0.packedValues[5u].y);
    float wavePhaseValue7 = cos(vertexVectorConstants0.packedValues[5u].y);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[2u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[1u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[4u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[2u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[1u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[4u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[2u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[1u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[4u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[2u].w, vertexPosition0.y, vertexVectorConstants0.packedValues[1u].w * vertexPosition0.x)) + vertexVectorConstants0.packedValues[4u].w;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if RD_PLATFORM == RD_PLATFORM_SM40
    float wavePhaseValue = sin(vertexScalarConstants0.packedValues[20u]);
    float wavePhaseValue1 = cos(vertexScalarConstants0.packedValues[20u]);
    precise float sumValue = vertexTexCoord0.x - 0.5;
    precise float sumValue1 = vertexTexCoord0.y - 0.5;
    vec2 vectorValue = vec2(sumValue, sumValue1);
    precise float sumValue2 = rdDot2Precise(vectorValue, vec2(wavePhaseValue1, wavePhaseValue)) + vertexScalarConstants0.packedValues[0u];
    precise float sumValue3 = sumValue2 + 0.5;
    precise float sumValue4 = rdDot2Precise(vectorValue, vec2(-wavePhaseValue, wavePhaseValue1)) + 0.5;
    precise float productValue4 = sumValue3 * vertexVectorConstants0.packedValues[6u].x;
    precise float productValue5 = sumValue4 * vertexVectorConstants0.packedValues[6u].y;
    varyingTexCoord1.x = productValue4;
    varyingTexCoord1.y = productValue5;
    float wavePhaseValue2 = sin(vertexScalarConstants0.packedValues[21u]);
    float wavePhaseValue3 = cos(vertexScalarConstants0.packedValues[21u]);
    precise float sumValue5 = rdDot2Precise(vectorValue, vec2(wavePhaseValue3, wavePhaseValue2)) + vertexScalarConstants0.packedValues[1u];
    precise float sumValue6 = sumValue5 + 0.5;
    precise float sumValue7 = rdDot2Precise(vectorValue, vec2(-wavePhaseValue2, wavePhaseValue3)) + 0.5;
    precise float productValue6 = sumValue6 * vertexVectorConstants0.packedValues[6u].x;
    precise float productValue7 = sumValue7 * vertexVectorConstants0.packedValues[6u].y;
    varyingTexCoord2.x = productValue6;
    varyingTexCoord2.y = productValue7;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float wavePhaseValue = sin(vertexScalarConstants0.packedValues[20u]);
    float wavePhaseValue1 = cos(vertexScalarConstants0.packedValues[20u]);
    vec2 sumValue8 = vec2(vertexTexCoord0.x - 0.5, vertexTexCoord0.y - 0.5);
    varyingTexCoord1.x = ((rdDot2Precise(sumValue8, vec2(wavePhaseValue1, wavePhaseValue)) + vertexScalarConstants0.packedValues[0u]) + 0.5) * vertexVectorConstants0.packedValues[6u].x;
    varyingTexCoord1.y = (rdDot2Precise(sumValue8, vec2(-wavePhaseValue, wavePhaseValue1)) + 0.5) * vertexVectorConstants0.packedValues[6u].y;
    float wavePhaseValue2 = sin(vertexScalarConstants0.packedValues[21u]);
    float wavePhaseValue3 = cos(vertexScalarConstants0.packedValues[21u]);
    varyingTexCoord2.x = ((rdDot2Precise(sumValue8, vec2(wavePhaseValue3, wavePhaseValue2)) + vertexScalarConstants0.packedValues[1u]) + 0.5) * vertexVectorConstants0.packedValues[6u].x;
    varyingTexCoord2.y = (rdDot2Precise(sumValue8, vec2(-wavePhaseValue2, wavePhaseValue3)) + 0.5) * vertexVectorConstants0.packedValues[6u].y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord1.x = vertexVectorConstants0.packedValues[6u].x * ((vertexVectorConstants0.packedValues[0u].x + 0.5) + fma(sumValue10, wavePhaseValue4, wavePhaseValue5 * sumValue9));
    varyingTexCoord1.y = vertexVectorConstants0.packedValues[6u].y * (fma(sumValue10, wavePhaseValue5, wavePhaseValue4 * sumValue11) + 0.5);
    varyingTexCoord2.x = ((vertexVectorConstants0.packedValues[0u].y + 0.5) + fma(sumValue10, wavePhaseValue6, wavePhaseValue7 * sumValue9)) * vertexVectorConstants0.packedValues[6u].x;
    varyingTexCoord2.y = (fma(sumValue10, wavePhaseValue7, wavePhaseValue6 * sumValue11) + 0.5) * vertexVectorConstants0.packedValues[6u].y;
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
}
