#version 460
#extension GL_GOOGLE_include_directive : require
// ActorGlintPrepass / GeometryPrepass / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_CHANGE_COLOR
#define RD_OPTION_CHANGE_COLOR RD_CHANGE_COLOR_OFF
#endif
#ifndef RD_OPTION_EMISSIVE
#define RD_OPTION_EMISSIVE RD_EMISSIVE_OFF
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_MASKED_MULTITEXTURE
#define RD_FEATURE_MASKED_MULTITEXTURE RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/ActorGlintPrepass/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue4 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue3;
    varyingTexCoord3.y = scalarValue2;
    varyingTexCoord3.z = scalarValue4;
    vec4 multiplyAddValue50 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[372u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue50);
    float sumValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[373u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue50);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue50);
    float scalarValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue50);
    gl_Position.x = sumValue14;
    gl_Position.y = sumValue15;
    gl_Position.z = scalarValue5;
    gl_Position.w = scalarValue6;
    varyingColor1.x = sumValue14;
    varyingColor1.y = sumValue15;
    varyingColor1.z = scalarValue5;
    varyingColor1.w = scalarValue6;
    float multiplyAddValue33 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue34 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue35 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sumValue = vertexTexCoord0.x + (-0.5);
    float sumValue1 = vertexTexCoord0.y + (-0.5);
    float wavePhaseValue = sin(vertexVectorConstants0.packedValues[94u].z);
    float wavePhaseValue1 = cos(vertexVectorConstants0.packedValues[94u].z);
    float sumValue2 = (-0.0) - sumValue;
    float wavePhaseValue2 = sin(vertexVectorConstants0.packedValues[94u].w);
    float wavePhaseValue3 = cos(vertexVectorConstants0.packedValues[94u].w);
#endif
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint bitwiseValue1 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    uint bitwiseValue2 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue1])));
    uint bitwiseValue5 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue5])));
    uint bitwiseValue9 = (((16u * bitwiseValue) + 480u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 480u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 480u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 480u) + 12u) >> 2u;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue9])));
    uint bitwiseValue13 = (((16u * bitwiseValue) + 496u) + 4u) >> 2u;
    uint bitwiseValue14 = (((16u * bitwiseValue) + 496u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 496u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 496u) + 12u) >> 2u;
    float multiplyAddValue29 = fma(multiplyAddValue26, vertexPosition0.z, fma(multiplyAddValue23, vertexPosition0.x, multiplyAddValue20 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue30 = fma(multiplyAddValue27, vertexPosition0.z, fma(multiplyAddValue24, vertexPosition0.x, multiplyAddValue21 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue31 = fma(multiplyAddValue28, vertexPosition0.z, fma(multiplyAddValue25, vertexPosition0.x, multiplyAddValue22 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue29;
    varyingTexCoord3.y = multiplyAddValue30;
    varyingTexCoord3.z = multiplyAddValue31;
    vec4 multiplyAddValue32 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue29, multiplyAddValue30 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue29, multiplyAddValue30 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue29, multiplyAddValue30 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue29, multiplyAddValue30 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[372u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue32);
    float sumValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[373u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue32);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue32);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue32);
    gl_Position.x = sumValue11;
    gl_Position.y = sumValue12;
    gl_Position.z = scalarValue;
    gl_Position.w = scalarValue1;
    varyingColor1.x = sumValue11;
    varyingColor1.y = sumValue12;
    varyingColor1.z = scalarValue;
    varyingColor1.w = scalarValue1;
    float multiplyAddValue33 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue34 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue35 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(multiplyAddValue26, multiplyAddValue35, fma(multiplyAddValue23, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue20));
    varyingBitangent0.y = fma(multiplyAddValue27, multiplyAddValue35, fma(multiplyAddValue24, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue21));
    varyingBitangent0.z = fma(multiplyAddValue28, multiplyAddValue35, fma(multiplyAddValue25, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue22));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint bitwiseValue1 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    uint bitwiseValue2 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue1])));
    uint bitwiseValue5 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue5])));
    uint bitwiseValue9 = (((16u * bitwiseValue) + 480u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 480u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 480u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 480u) + 12u) >> 2u;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue9])));
    varyingBitangent0.x = fma(multiplyAddValue26, multiplyAddValue35, fma(multiplyAddValue23, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue20));
    varyingBitangent0.y = fma(multiplyAddValue27, multiplyAddValue35, fma(multiplyAddValue24, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue21));
    varyingBitangent0.z = fma(multiplyAddValue28, multiplyAddValue35, fma(multiplyAddValue25, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue22));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint sumValue3 = bitwiseValue + 28u;
    uint sumValue4 = bitwiseValue + 29u;
    uint sumValue5 = bitwiseValue + 30u;
    uint sumValue6 = bitwiseValue + 31u;
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue9 = fma(multiplyAddValue2, vertexPosition0.z, fma(multiplyAddValue1, vertexPosition0.y, multiplyAddValue * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue10 = fma(multiplyAddValue5, vertexPosition0.z, fma(multiplyAddValue4, vertexPosition0.y, multiplyAddValue3 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue11 = fma(multiplyAddValue8, vertexPosition0.z, fma(multiplyAddValue7, vertexPosition0.y, multiplyAddValue6 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[93u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[93u].y, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].w)));
    uint sumValue7 = bitwiseValue + 61u;
    uint sumValue8 = bitwiseValue + 62u;
    uint sumValue9 = bitwiseValue + 63u;
    uint sumValue10 = bitwiseValue + 64u;
    float productValue = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue1 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue2 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue16;
    gl_Position.y = multiplyAddValue17;
    gl_Position.z = multiplyAddValue18;
    gl_Position.w = multiplyAddValue19;
    varyingBitangent0.x = fma(multiplyAddValue2, productValue2, fma(multiplyAddValue1, productValue1, multiplyAddValue * productValue));
    varyingBitangent0.y = fma(multiplyAddValue5, productValue2, fma(multiplyAddValue4, productValue1, multiplyAddValue3 * productValue));
    varyingBitangent0.z = fma(multiplyAddValue8, productValue2, fma(multiplyAddValue7, productValue1, multiplyAddValue6 * productValue));
    varyingColor1.x = multiplyAddValue16;
    varyingColor1.y = multiplyAddValue17;
    varyingColor1.z = multiplyAddValue18;
    varyingColor1.w = multiplyAddValue19;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint sumValue3 = bitwiseValue + 28u;
    uint sumValue4 = bitwiseValue + 29u;
    uint sumValue5 = bitwiseValue + 30u;
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue39 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue40 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue41 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[93u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue43, multiplyAddValue42 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[93u].y, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue43, multiplyAddValue42 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue43, multiplyAddValue42 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue43, multiplyAddValue42 * vertexVectorConstants0.packedValues[0u].w)));
    uint sumValue7 = bitwiseValue + 61u;
    uint sumValue8 = bitwiseValue + 62u;
    uint sumValue9 = bitwiseValue + 63u;
    uint sumValue10 = bitwiseValue + 64u;
    float productValue = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue1 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue2 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue46;
    gl_Position.y = multiplyAddValue47;
    gl_Position.z = multiplyAddValue48;
    gl_Position.w = multiplyAddValue49;
    varyingBitangent0.x = fma(multiplyAddValue2, productValue2, fma(multiplyAddValue1, productValue1, multiplyAddValue * productValue));
    varyingBitangent0.y = fma(multiplyAddValue5, productValue2, fma(multiplyAddValue4, productValue1, multiplyAddValue3 * productValue));
    varyingBitangent0.z = fma(multiplyAddValue8, productValue2, fma(multiplyAddValue7, productValue1, multiplyAddValue6 * productValue));
    varyingColor1.x = multiplyAddValue46;
    varyingColor1.y = multiplyAddValue47;
    varyingColor1.z = multiplyAddValue48;
    varyingColor1.w = multiplyAddValue49;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float wavePhaseValue4 = sin(vertexScalarConstants0.packedValues[378u]);
    float wavePhaseValue5 = cos(vertexScalarConstants0.packedValues[378u]);
    vec2 sumValue13 = vec2(vertexTexCoord0.x - 0.5, vertexTexCoord0.y - 0.5);
    varyingTexCoord2.x = ((rdDot2Precise(sumValue13, vec2(wavePhaseValue5, wavePhaseValue4)) + vertexScalarConstants0.packedValues[376u]) + 0.5) * vertexVectorConstants0.packedValues[60u].x;
    varyingTexCoord2.y = (rdDot2Precise(sumValue13, vec2(-wavePhaseValue4, wavePhaseValue5)) + 0.5) * vertexVectorConstants0.packedValues[60u].y;
    float wavePhaseValue6 = sin(vertexScalarConstants0.packedValues[379u]);
    float wavePhaseValue7 = cos(vertexScalarConstants0.packedValues[379u]);
    varyingTexCoord2.z = ((rdDot2Precise(sumValue13, vec2(wavePhaseValue7, wavePhaseValue6)) + vertexScalarConstants0.packedValues[377u]) + 0.5) * vertexVectorConstants0.packedValues[60u].x;
    varyingTexCoord2.w = (rdDot2Precise(sumValue13, vec2(-wavePhaseValue6, wavePhaseValue7)) + 0.5) * vertexVectorConstants0.packedValues[60u].y;
    varyingNormal0.x = fma(multiplyAddValue26, vertexNormal0.z, fma(multiplyAddValue23, vertexNormal0.x, multiplyAddValue20 * vertexNormal0.y));
    varyingNormal0.y = fma(multiplyAddValue27, vertexNormal0.z, fma(multiplyAddValue24, vertexNormal0.x, multiplyAddValue21 * vertexNormal0.y));
    varyingNormal0.z = fma(multiplyAddValue28, vertexNormal0.z, fma(multiplyAddValue25, vertexNormal0.x, multiplyAddValue22 * vertexNormal0.y));
    varyingTangent0.x = fma(multiplyAddValue26, vertexTangent0.z, fma(multiplyAddValue23, vertexTangent0.x, multiplyAddValue20 * vertexTangent0.y));
    varyingTangent0.y = fma(multiplyAddValue27, vertexTangent0.z, fma(multiplyAddValue24, vertexTangent0.x, multiplyAddValue21 * vertexTangent0.y));
    varyingTangent0.z = fma(multiplyAddValue28, vertexTangent0.z, fma(multiplyAddValue25, vertexTangent0.x, multiplyAddValue22 * vertexTangent0.y));
    uint bitwiseValue17 = (((16u * bitwiseValue) + 992u) + 4u) >> 2u;
    uint bitwiseValue18 = (((16u * bitwiseValue) + 992u) + 0u) >> 2u;
    uint bitwiseValue19 = (((16u * bitwiseValue) + 992u) + 8u) >> 2u;
    uint bitwiseValue20 = (((16u * bitwiseValue) + 992u) + 12u) >> 2u;
    uint bitwiseValue21 = (((16u * bitwiseValue) + 976u) + 4u) >> 2u;
    uint bitwiseValue22 = (((16u * bitwiseValue) + 976u) + 0u) >> 2u;
    uint bitwiseValue23 = (((16u * bitwiseValue) + 976u) + 8u) >> 2u;
    uint bitwiseValue24 = (((16u * bitwiseValue) + 976u) + 12u) >> 2u;
    uint bitwiseValue25 = (((16u * bitwiseValue) + 1008u) + 4u) >> 2u;
    uint bitwiseValue26 = (((16u * bitwiseValue) + 1008u) + 0u) >> 2u;
    uint bitwiseValue27 = (((16u * bitwiseValue) + 1008u) + 8u) >> 2u;
    uint bitwiseValue28 = (((16u * bitwiseValue) + 1008u) + 12u) >> 2u;
    uint bitwiseValue29 = (((16u * bitwiseValue) + 1024u) + 4u) >> 2u;
    uint bitwiseValue30 = (((16u * bitwiseValue) + 1024u) + 0u) >> 2u;
    uint bitwiseValue31 = (((16u * bitwiseValue) + 1024u) + 8u) >> 2u;
    uint bitwiseValue32 = (((16u * bitwiseValue) + 1024u) + 12u) >> 2u;
    float multiplyAddValue36 = fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue26], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue25]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue22], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue21]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue18], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue17]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue30], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue29])));
    float multiplyAddValue37 = fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue26], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue25]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue22], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue21]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue18], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue17]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue30], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue29])));
    float multiplyAddValue38 = fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue26], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue25]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue22], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue21]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue18], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue17]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue30], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue29])));
    varyingTexCoord4.x = multiplyAddValue36;
    varyingTexCoord4.y = multiplyAddValue37;
    varyingTexCoord4.z = multiplyAddValue38;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord2.x = ((vertexVectorConstants0.packedValues[94u].x + 0.5) + fma(sumValue1, wavePhaseValue, wavePhaseValue1 * sumValue)) * vertexVectorConstants0.packedValues[60u].x;
    varyingTexCoord2.y = (fma(sumValue1, wavePhaseValue1, wavePhaseValue * sumValue2) + 0.5) * vertexVectorConstants0.packedValues[60u].y;
    varyingTexCoord2.z = ((vertexVectorConstants0.packedValues[94u].y + 0.5) + fma(sumValue1, wavePhaseValue2, wavePhaseValue3 * sumValue)) * vertexVectorConstants0.packedValues[60u].x;
    varyingTexCoord2.w = (fma(sumValue1, wavePhaseValue3, wavePhaseValue2 * sumValue2) + 0.5) * vertexVectorConstants0.packedValues[60u].y;
    varyingNormal0.x = fma(multiplyAddValue2, vertexNormal0.z, fma(multiplyAddValue1, vertexNormal0.y, multiplyAddValue * vertexNormal0.x));
    varyingNormal0.y = fma(multiplyAddValue5, vertexNormal0.z, fma(multiplyAddValue4, vertexNormal0.y, multiplyAddValue3 * vertexNormal0.x));
    varyingNormal0.z = fma(multiplyAddValue8, vertexNormal0.z, fma(multiplyAddValue7, vertexNormal0.y, multiplyAddValue6 * vertexNormal0.x));
    varyingTexCoord4.x = fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue9].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue8].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue7].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue10].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue10].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue10].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue10].x)));
    varyingTexCoord4.y = fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue9].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue8].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue7].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue10].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue10].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue10].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue10].x)));
    varyingTexCoord4.z = fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue9].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue8].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue7].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue10].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue10].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue10].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue10].x)));
    varyingTangent0.x = fma(multiplyAddValue2, vertexTangent0.z, fma(multiplyAddValue1, vertexTangent0.y, multiplyAddValue * vertexTangent0.x));
    varyingTangent0.y = fma(multiplyAddValue5, vertexTangent0.z, fma(multiplyAddValue4, vertexTangent0.y, multiplyAddValue3 * vertexTangent0.x));
    varyingTangent0.z = fma(multiplyAddValue8, vertexTangent0.z, fma(multiplyAddValue7, vertexTangent0.y, multiplyAddValue6 * vertexTangent0.x));
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue39;
    varyingTexCoord3.y = multiplyAddValue40;
    varyingTexCoord3.z = multiplyAddValue41;
#endif
}
