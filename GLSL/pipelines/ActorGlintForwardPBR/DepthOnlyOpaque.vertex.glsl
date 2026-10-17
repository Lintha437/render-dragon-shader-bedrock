#version 460
#extension GL_GOOGLE_include_directive : require
// ActorGlintForwardPBR / DepthOnlyOpaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
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
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 8
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/ActorGlintForwardPBR/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 400u) + 4u) >> 2u;
    precise float productValue = vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue1 = vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue2 = vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 400u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 400u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 400u) + 12u) >> 2u;
    precise float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue))) * vertexPosition0.y;
    precise float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue1))) * vertexPosition0.y;
    precise float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue2))) * vertexPosition0.y;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 384u) + 4u) >> 2u;
    precise float productValue3 = vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue4 = vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue5 = vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue5];
    uint bitwiseValue6 = (((16u * bitwiseValue) + 384u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 384u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 384u) + 12u) >> 2u;
    uint bitwiseValue9 = (((16u * bitwiseValue) + 416u) + 4u) >> 2u;
    precise float productValue6 = vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue7 = vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue8 = vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue9];
    uint bitwiseValue10 = (((16u * bitwiseValue) + 416u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 416u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 416u) + 12u) >> 2u;
    uint bitwiseValue13 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    precise float productValue9 = vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue10 = vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue11 = vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue13];
    uint bitwiseValue14 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    precise float multiplyAddValue14 = fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue6))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue3))), vertexPosition0.x, multiplyAddValue11)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue14], productValue9)));
    precise float multiplyAddValue15 = fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue7))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue4))), vertexPosition0.x, multiplyAddValue12)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue14], productValue10)));
    precise float multiplyAddValue16 = fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue8))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue5))), vertexPosition0.x, multiplyAddValue13)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue14], productValue11)));
    precise float productValue12 = multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue13 = multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue14 = multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue15 = multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue14;
    varyingTexCoord3.y = multiplyAddValue15;
    varyingTexCoord3.z = multiplyAddValue16;
    precise float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue14, productValue12)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue14, productValue13)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue14, productValue14)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue14, productValue15)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue4 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[224u];
    vec4 vectorValue = vec4(multiplyAddValue17, multiplyAddValue18, multiplyAddValue19, multiplyAddValue20);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue4, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue5 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[225u];
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue5, vertexScalarConstants0.packedValues[13u]), vectorValue);
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
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue10 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[32u];
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue16 = scalarValue6 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue17 = scalarValue6 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue18 = scalarValue6 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue19 = scalarValue6 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    precise float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, productValue16)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, productValue17)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, productValue18)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, productValue19)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue37, multiplyAddValue38, multiplyAddValue39, multiplyAddValue40);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue10, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue11 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[33u];
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue11, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    gl_Position.x = scalarValue11;
    gl_Position.y = scalarValue12;
    gl_Position.z = scalarValue13;
    gl_Position.w = scalarValue14;
    varyingColor1.x = scalarValue11;
    varyingColor1.y = scalarValue12;
    varyingColor1.z = scalarValue13;
    varyingColor1.w = scalarValue14;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 400u) + 4u) >> 2u;
    uint bitwiseValue2 = (((16u * bitwiseValue) + 400u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 400u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 400u) + 12u) >> 2u;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 384u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 384u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 384u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 384u) + 12u) >> 2u;
    uint bitwiseValue9 = (((16u * bitwiseValue) + 416u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 416u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 416u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 416u) + 12u) >> 2u;
    uint bitwiseValue13 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    uint bitwiseValue14 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    float multiplyAddValue21 = fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue22 = fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue23 = fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue21;
    varyingTexCoord3.y = multiplyAddValue22;
    varyingTexCoord3.z = multiplyAddValue23;
    vec4 multiplyAddValue24 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue21, multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue21, multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue21, multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue21, multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[224u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue24);
    float sumValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[225u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue24);
    float scalarValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue24);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue24);
    gl_Position.x = sumValue6;
    gl_Position.y = sumValue7;
    gl_Position.z = scalarValue4;
    gl_Position.w = scalarValue5;
    varyingColor1.x = sumValue6;
    varyingColor1.y = sumValue7;
    varyingColor1.z = scalarValue4;
    varyingColor1.w = scalarValue5;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    vec4 multiplyAddValue36 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue8 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[32u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue36);
    float sumValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[33u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue36);
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue36);
    float scalarValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue36);
    gl_Position.x = sumValue8;
    gl_Position.y = sumValue9;
    gl_Position.z = scalarValue9;
    gl_Position.w = scalarValue10;
    varyingColor1.x = sumValue8;
    varyingColor1.y = sumValue9;
    varyingColor1.z = scalarValue9;
    varyingColor1.w = scalarValue10;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 24u;
    uint sumValue1 = bitwiseValue + 25u;
    uint sumValue2 = bitwiseValue + 26u;
    uint sumValue3 = bitwiseValue + 27u;
    float multiplyAddValue = fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[8u].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[8u].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[8u].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue1 = fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[8u].y))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[8u].y))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[8u].y))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue2 = fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[8u].z))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[8u].z))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[8u].z))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[56u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[56u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue7;
    gl_Position.y = multiplyAddValue8;
    gl_Position.z = multiplyAddValue9;
    gl_Position.w = multiplyAddValue10;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue25 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue26 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue27 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue26, multiplyAddValue25 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[8u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[8u].y, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue32;
    gl_Position.y = multiplyAddValue33;
    gl_Position.z = multiplyAddValue34;
    gl_Position.w = multiplyAddValue35;
#endif
    varyingBitangent0.x = 0.0;
    varyingBitangent0.y = 0.0;
    varyingBitangent0.z = 0.0;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor1.x = multiplyAddValue7;
    varyingColor1.y = multiplyAddValue8;
    varyingColor1.z = multiplyAddValue9;
    varyingColor1.w = multiplyAddValue10;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor1.x = multiplyAddValue32;
    varyingColor1.y = multiplyAddValue33;
    varyingColor1.z = multiplyAddValue34;
    varyingColor1.w = multiplyAddValue35;
#endif
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
    varyingTexCoord2.x = 0.0;
    varyingTexCoord2.y = 0.0;
    varyingTexCoord2.z = 0.0;
    varyingTexCoord2.w = 0.0;
    varyingNormal0.x = 0.0;
    varyingNormal0.y = 0.0;
    varyingNormal0.z = 0.0;
    varyingTexCoord4.x = 0.0;
    varyingTexCoord4.y = 0.0;
    varyingTexCoord4.z = 0.0;
    varyingTangent0.x = 0.0;
    varyingTangent0.y = 0.0;
    varyingTangent0.z = 0.0;
    varyingTexCoord0.x = 0.0;
    varyingTexCoord0.y = 0.0;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue25;
    varyingTexCoord3.y = multiplyAddValue26;
    varyingTexCoord3.z = multiplyAddValue27;
#endif
}
