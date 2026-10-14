#version 460
#extension GL_GOOGLE_include_directive : require
// ActorMultiTexturePrepass / DepthOnlyAlphaTest / vertex forward pipeline.
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
#ifndef RD_FEATURE_COLOR_SECOND_TEXTURE
#define RD_FEATURE_COLOR_SECOND_TEXTURE RD_OFF
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
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/ActorMultiTexturePrepass/VertexBindings.glsli"

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
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue))) * vertexPosition0.y;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue1))) * vertexPosition0.y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue2))) * vertexPosition0.y;
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
    precise float multiplyAddValue3 = fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue6))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue3))), vertexPosition0.x, multiplyAddValue)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue14], productValue9)));
    precise float multiplyAddValue4 = fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue7))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue4))), vertexPosition0.x, multiplyAddValue1)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue14], productValue10)));
    precise float multiplyAddValue5 = fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue8))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue5))), vertexPosition0.x, multiplyAddValue2)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue14], productValue11)));
    precise float productValue12 = multiplyAddValue4 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue13 = multiplyAddValue4 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue14 = multiplyAddValue4 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue15 = multiplyAddValue4 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue3;
    varyingTexCoord3.y = multiplyAddValue4;
    varyingTexCoord3.z = multiplyAddValue5;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue3, productValue12)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue3, productValue13)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue3, productValue14)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue3, productValue15)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[224u];
    vec4 vectorValue = vec4(multiplyAddValue6, multiplyAddValue7, multiplyAddValue8, multiplyAddValue9);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[225u];
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
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue8 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[32u];
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
    precise float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, productValue16)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, productValue17)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, productValue18)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, productValue19)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue36, multiplyAddValue37, multiplyAddValue38, multiplyAddValue39);
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue8, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue9 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[33u];
    float scalarValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue9, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    gl_Position.x = scalarValue9;
    gl_Position.y = scalarValue10;
    gl_Position.z = scalarValue11;
    gl_Position.w = scalarValue12;
    varyingColor1.x = scalarValue9;
    varyingColor1.y = scalarValue10;
    varyingColor1.z = scalarValue11;
    varyingColor1.w = scalarValue12;
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
    float multiplyAddValue10 = fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue11 = fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue12 = fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue10;
    varyingTexCoord3.y = multiplyAddValue11;
    varyingTexCoord3.z = multiplyAddValue12;
    vec4 multiplyAddValue13 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[224u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue13);
    float sumValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[225u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue13);
    float scalarValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue13);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue13);
    gl_Position.x = sumValue2;
    gl_Position.y = sumValue3;
    gl_Position.z = scalarValue4;
    gl_Position.w = scalarValue5;
    varyingColor1.x = sumValue2;
    varyingColor1.y = sumValue3;
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
    vec4 multiplyAddValue40 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[32u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue40);
    float sumValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[33u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue40);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue40);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue40);
    gl_Position.x = sumValue10;
    gl_Position.y = sumValue11;
    gl_Position.z = scalarValue13;
    gl_Position.w = scalarValue14;
    varyingColor1.x = sumValue10;
    varyingColor1.y = sumValue11;
    varyingColor1.z = scalarValue13;
    varyingColor1.w = scalarValue14;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue4 = bitwiseValue + 24u;
    uint sumValue5 = bitwiseValue + 25u;
    uint sumValue6 = bitwiseValue + 26u;
    uint sumValue7 = bitwiseValue + 27u;
    float multiplyAddValue14 = fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[8u].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[8u].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[8u].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue15 = fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[8u].y))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[8u].y))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[8u].y))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue16 = fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[8u].z))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[8u].z))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[8u].z))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[56u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[56u].y, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue21;
    gl_Position.y = multiplyAddValue22;
    gl_Position.z = multiplyAddValue23;
    gl_Position.w = multiplyAddValue24;
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
    varyingColor1.x = multiplyAddValue21;
    varyingColor1.y = multiplyAddValue22;
    varyingColor1.z = multiplyAddValue23;
    varyingColor1.w = multiplyAddValue24;
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
    varyingNormal0.x = 0.0;
    varyingNormal0.y = 0.0;
    varyingNormal0.z = 0.0;
    varyingTexCoord4.x = 0.0;
    varyingTexCoord4.y = 0.0;
    varyingTexCoord4.z = 0.0;
    varyingTangent0.x = 0.0;
    varyingTangent0.y = 0.0;
    varyingTangent0.z = 0.0;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[57u].z, vertexVectorConstants0.packedValues[57u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[57u].w, vertexVectorConstants0.packedValues[57u].y);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[9u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[9u].w, vertexVectorConstants0.packedValues[9u].y);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[57u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[57u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[57u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[57u].y;
    varyingTexCoord3.x = multiplyAddValue14;
    varyingTexCoord3.y = multiplyAddValue15;
    varyingTexCoord3.z = multiplyAddValue16;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[9u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[9u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[9u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[9u].y;
    varyingTexCoord3.x = multiplyAddValue25;
    varyingTexCoord3.y = multiplyAddValue26;
    varyingTexCoord3.z = multiplyAddValue27;
#endif
}
