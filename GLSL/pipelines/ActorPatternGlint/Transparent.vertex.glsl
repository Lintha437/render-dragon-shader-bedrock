#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPatternGlint / Transparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
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
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_FEATURE_UIENTITY
#define RD_FEATURE_UIENTITY RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 11
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/ActorPatternGlint/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    precise float productValue5 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue6 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue7 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue8 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue5)));
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue6)));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue7)));
    precise float productValue9 = multiplyAddValue42 * vertexPosition0.y;
    precise float productValue10 = multiplyAddValue43 * vertexPosition0.y;
    precise float productValue11 = multiplyAddValue44 * vertexPosition0.y;
    precise float productValue12 = multiplyAddValue42 * vertexNormal0.y;
    precise float productValue13 = multiplyAddValue43 * vertexNormal0.y;
    precise float productValue14 = multiplyAddValue44 * vertexNormal0.y;
    precise float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], productValue8))) * vertexNormal0.y;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    precise float productValue15 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue16 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue17 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue18 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5];
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue15)));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue16)));
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue17)));
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    precise float productValue19 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue20 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue21 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue22 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9];
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue19)));
    float multiplyAddValue50 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue20)));
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue21)));
    float multiplyAddValue52 = fma(multiplyAddValue49, vertexNormal0.z, fma(multiplyAddValue46, vertexNormal0.x, productValue12));
    float multiplyAddValue53 = fma(multiplyAddValue50, vertexNormal0.z, fma(multiplyAddValue47, vertexNormal0.x, productValue13));
    float multiplyAddValue54 = fma(multiplyAddValue51, vertexNormal0.z, fma(multiplyAddValue48, vertexNormal0.x, productValue14));
    uint bitwiseValue13 = (((16u * bitwiseValue) + 480u) + 4u) >> 2u;
    precise float productValue23 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue24 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue25 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13];
    uint bitwiseValue14 = (((16u * bitwiseValue) + 480u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 480u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 480u) + 12u) >> 2u;
    precise float multiplyAddValue55 = fma(multiplyAddValue49, vertexPosition0.z, fma(multiplyAddValue46, vertexPosition0.x, productValue9)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], productValue23)));
    precise float multiplyAddValue56 = fma(multiplyAddValue50, vertexPosition0.z, fma(multiplyAddValue47, vertexPosition0.x, productValue10)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], productValue24)));
    precise float multiplyAddValue57 = fma(multiplyAddValue51, vertexPosition0.z, fma(multiplyAddValue48, vertexPosition0.x, productValue11)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], productValue25)));
    precise float productValue26 = multiplyAddValue56 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue27 = multiplyAddValue56 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue28 = multiplyAddValue56 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue29 = multiplyAddValue56 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue55;
    varyingTexCoord3.y = multiplyAddValue56;
    varyingTexCoord3.z = multiplyAddValue57;
    precise float multiplyAddValue58 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue57, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue55, productValue26)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue59 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue57, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue55, productValue27)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue60 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue57, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue55, productValue28)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue61 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue57, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue55, productValue29)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue6 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u];
    vec4 vectorValue = vec4(multiplyAddValue58, multiplyAddValue59, multiplyAddValue60, multiplyAddValue61);
    float scalarValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue6, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue7 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u];
    float scalarValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue7, vertexScalarConstants0.packedValues[13u]), vectorValue);
    float scalarValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue);
    gl_Position.x = scalarValue2;
    gl_Position.y = scalarValue3;
    gl_Position.z = scalarValue5;
    gl_Position.w = scalarValue4;
    varyingColor1.x = scalarValue2;
    varyingColor1.y = scalarValue3;
    varyingColor1.z = scalarValue5;
    varyingColor1.w = scalarValue4;
    precise float quotientValue = scalarValue5 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue8 = quotientValue - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue6 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u];
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue42 = scalarValue6 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue43 = scalarValue6 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue44 = scalarValue6 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue45 = scalarValue6 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    precise float multiplyAddValue79 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, productValue42)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue80 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, productValue43)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue81 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, productValue44)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue82 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, productValue45)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue79, multiplyAddValue80, multiplyAddValue81, multiplyAddValue82);
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue6, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue7 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u];
    float scalarValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue7, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    gl_Position.x = scalarValue9;
    gl_Position.y = scalarValue10;
    gl_Position.z = scalarValue12;
    gl_Position.w = scalarValue11;
    varyingColor1.x = scalarValue9;
    varyingColor1.y = scalarValue10;
    varyingColor1.z = scalarValue12;
    varyingColor1.w = scalarValue11;
    precise float quotientValue2 = scalarValue12 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue10 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    precise float productValue5 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue6 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue7 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    precise float multiplyAddValue109 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue5))) * vertexPosition0.y;
    precise float multiplyAddValue110 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue6))) * vertexPosition0.y;
    precise float multiplyAddValue111 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue7))) * vertexPosition0.y;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    precise float productValue15 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue16 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue17 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5];
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    precise float productValue19 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue20 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue21 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9];
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    uint bitwiseValue13 = (((16u * bitwiseValue) + 480u) + 4u) >> 2u;
    precise float productValue23 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue24 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue25 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13];
    uint bitwiseValue14 = (((16u * bitwiseValue) + 480u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 480u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 480u) + 12u) >> 2u;
    precise float multiplyAddValue112 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue19))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue15))), vertexPosition0.x, multiplyAddValue109)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], productValue23)));
    precise float multiplyAddValue113 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue20))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue16))), vertexPosition0.x, multiplyAddValue110)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], productValue24)));
    precise float multiplyAddValue114 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue21))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue17))), vertexPosition0.x, multiplyAddValue111)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], productValue25)));
    precise float productValue58 = multiplyAddValue113 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue59 = multiplyAddValue113 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue60 = multiplyAddValue113 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue61 = multiplyAddValue113 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue112;
    varyingTexCoord3.y = multiplyAddValue113;
    varyingTexCoord3.z = multiplyAddValue114;
    precise float multiplyAddValue115 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue114, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue112, productValue58)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue116 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue114, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue112, productValue59)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue117 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue114, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue112, productValue60)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue118 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue114, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue112, productValue61)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue6 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u];
    vec4 vectorValue3 = vec4(multiplyAddValue115, multiplyAddValue116, multiplyAddValue117, multiplyAddValue118);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue6, vertexScalarConstants0.packedValues[12u]), vectorValue3);
    precise float sumValue7 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u];
    float scalarValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue7, vertexScalarConstants0.packedValues[13u]), vectorValue3);
    float scalarValue17 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue3);
    float scalarValue18 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue3);
    gl_Position.x = scalarValue15;
    gl_Position.y = scalarValue16;
    gl_Position.z = scalarValue18;
    gl_Position.w = scalarValue17;
    varyingColor1.x = scalarValue15;
    varyingColor1.y = scalarValue16;
    varyingColor1.z = scalarValue18;
    varyingColor1.w = scalarValue17;
    precise float quotientValue4 = scalarValue18 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue13 = quotientValue4 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue16 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u];
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue42 = scalarValue6 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue43 = scalarValue6 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue44 = scalarValue6 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue45 = scalarValue6 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    precise float multiplyAddValue79 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, productValue42)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue80 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, productValue43)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue81 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, productValue44)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue82 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, productValue45)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue79, multiplyAddValue80, multiplyAddValue81, multiplyAddValue82);
    float scalarValue21 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue16, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue17 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u];
    float scalarValue22 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue17, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    gl_Position.x = scalarValue21;
    gl_Position.y = scalarValue22;
    gl_Position.z = scalarValue12;
    gl_Position.w = scalarValue11;
    varyingColor1.x = scalarValue21;
    varyingColor1.y = scalarValue22;
    varyingColor1.z = scalarValue12;
    varyingColor1.w = scalarValue11;
    precise float quotientValue2 = scalarValue12 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue10 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1])));
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5])));
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue33 = fma(multiplyAddValue30, vertexNormal0.z, fma(multiplyAddValue27, vertexNormal0.x, multiplyAddValue24 * vertexNormal0.y));
    float multiplyAddValue34 = fma(multiplyAddValue31, vertexNormal0.z, fma(multiplyAddValue28, vertexNormal0.x, multiplyAddValue25 * vertexNormal0.y));
    float multiplyAddValue35 = fma(multiplyAddValue32, vertexNormal0.z, fma(multiplyAddValue29, vertexNormal0.x, multiplyAddValue26 * vertexNormal0.y));
    uint bitwiseValue13 = (((16u * bitwiseValue) + 480u) + 4u) >> 2u;
    uint bitwiseValue14 = (((16u * bitwiseValue) + 480u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 480u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 480u) + 12u) >> 2u;
    float multiplyAddValue36 = fma(multiplyAddValue30, vertexPosition0.z, fma(multiplyAddValue27, vertexPosition0.x, multiplyAddValue24 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue37 = fma(multiplyAddValue31, vertexPosition0.z, fma(multiplyAddValue28, vertexPosition0.x, multiplyAddValue25 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue38 = fma(multiplyAddValue32, vertexPosition0.z, fma(multiplyAddValue29, vertexPosition0.x, multiplyAddValue26 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue36;
    varyingTexCoord3.y = multiplyAddValue37;
    varyingTexCoord3.z = multiplyAddValue38;
    vec4 multiplyAddValue39 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue36, multiplyAddValue37 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue36, multiplyAddValue37 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue36, multiplyAddValue37 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue36, multiplyAddValue37 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue39);
    float sumValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue39);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue39);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue39);
    gl_Position.x = sumValue4;
    gl_Position.y = sumValue5;
    gl_Position.z = scalarValue1;
    gl_Position.w = scalarValue;
    varyingColor1.x = sumValue4;
    varyingColor1.y = sumValue5;
    varyingColor1.z = scalarValue1;
    varyingColor1.w = scalarValue;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    vec4 multiplyAddValue92 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue92);
    float sumValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue92);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue92);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue92);
    gl_Position.x = sumValue11;
    gl_Position.y = sumValue12;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue13;
    varyingColor1.x = sumValue11;
    varyingColor1.y = sumValue12;
    varyingColor1.z = scalarValue14;
    varyingColor1.w = scalarValue13;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    uint bitwiseValue13 = (((16u * bitwiseValue) + 480u) + 4u) >> 2u;
    uint bitwiseValue14 = (((16u * bitwiseValue) + 480u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 480u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 480u) + 12u) >> 2u;
    float multiplyAddValue120 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue121 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue122 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue120;
    varyingTexCoord3.y = multiplyAddValue121;
    varyingTexCoord3.z = multiplyAddValue122;
    vec4 multiplyAddValue123 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue122, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue120, multiplyAddValue121 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue122, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue120, multiplyAddValue121 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue122, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue120, multiplyAddValue121 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue122, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue120, multiplyAddValue121 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue123);
    float sumValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue123);
    float scalarValue19 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue123);
    float scalarValue20 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue123);
    gl_Position.x = sumValue14;
    gl_Position.y = sumValue15;
    gl_Position.z = scalarValue20;
    gl_Position.w = scalarValue19;
    varyingColor1.x = sumValue14;
    varyingColor1.y = sumValue15;
    varyingColor1.z = scalarValue20;
    varyingColor1.w = scalarValue19;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    vec4 multiplyAddValue92 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue18 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue92);
    float sumValue19 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue92);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue92);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue92);
    gl_Position.x = sumValue18;
    gl_Position.y = sumValue19;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue13;
    varyingColor1.x = sumValue18;
    varyingColor1.y = sumValue19;
    varyingColor1.z = scalarValue14;
    varyingColor1.w = scalarValue13;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 27u;
    uint sumValue1 = bitwiseValue + 28u;
    uint sumValue2 = bitwiseValue + 29u;
    uint sumValue3 = bitwiseValue + 30u;
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue9 = fma(multiplyAddValue2, vertexNormal0.z, fma(multiplyAddValue1, vertexNormal0.y, multiplyAddValue * vertexNormal0.x));
    float multiplyAddValue10 = fma(multiplyAddValue5, vertexNormal0.z, fma(multiplyAddValue4, vertexNormal0.y, multiplyAddValue3 * vertexNormal0.x));
    float multiplyAddValue11 = fma(multiplyAddValue8, vertexNormal0.z, fma(multiplyAddValue7, vertexNormal0.y, multiplyAddValue6 * vertexNormal0.x));
    float multiplyAddValue12 = fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[10u].w))) * vertexNormal0.x));
    float inverseLengthValue = inversesqrt(dot(vec4(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11, multiplyAddValue12), vec4(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11, multiplyAddValue12)));
    float productValue = inverseLengthValue * multiplyAddValue9;
    float productValue1 = inverseLengthValue * multiplyAddValue11;
    float productValue2 = (((0.449999988079071044921875 - ((productValue * productValue) * 0.100000001490116119384765625)) + ((productValue1 * productValue1) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue10 * vertexVectorConstants0.packedValues[60u].w) * inverseLengthValue) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue13 = fma(multiplyAddValue2, vertexPosition0.z, fma(multiplyAddValue1, vertexPosition0.y, multiplyAddValue * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue14 = fma(multiplyAddValue5, vertexPosition0.z, fma(multiplyAddValue4, vertexPosition0.y, multiplyAddValue3 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue15 = fma(multiplyAddValue8, vertexPosition0.z, fma(multiplyAddValue7, vertexPosition0.y, multiplyAddValue6 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[59u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[59u].y, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue20;
    gl_Position.y = multiplyAddValue21;
    gl_Position.z = multiplyAddValue22;
    gl_Position.w = multiplyAddValue23;
    varyingColor1.x = multiplyAddValue20;
    varyingColor1.y = multiplyAddValue21;
    varyingColor1.z = multiplyAddValue22;
    varyingColor1.w = multiplyAddValue23;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 27u;
    uint sumValue1 = bitwiseValue + 28u;
    uint sumValue2 = bitwiseValue + 29u;
    float multiplyAddValue65 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].x))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[10u].x))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[10u].x))) * vertexNormal0.x));
    float multiplyAddValue66 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].y))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[10u].y))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[10u].y))) * vertexNormal0.x));
    float multiplyAddValue67 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].z))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[10u].z))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[10u].z))) * vertexNormal0.x));
    float multiplyAddValue12 = fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[10u].w))) * vertexNormal0.x));
    float inverseLengthValue3 = inversesqrt(dot(vec4(multiplyAddValue65, multiplyAddValue66, multiplyAddValue67, multiplyAddValue12), vec4(multiplyAddValue65, multiplyAddValue66, multiplyAddValue67, multiplyAddValue12)));
    float productValue39 = inverseLengthValue3 * multiplyAddValue65;
    float productValue40 = inverseLengthValue3 * multiplyAddValue67;
    float productValue41 = (((0.449999988079071044921875 - ((productValue39 * productValue39) * 0.100000001490116119384765625)) + ((productValue40 * productValue40) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue66 * vertexVectorConstants0.packedValues[60u].w) * inverseLengthValue3) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue68 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue69 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue70 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue71 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue72 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue73 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue74 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue75 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[59u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue76 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[59u].y, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue77 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue78 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue75;
    gl_Position.y = multiplyAddValue76;
    gl_Position.z = multiplyAddValue77;
    gl_Position.w = multiplyAddValue78;
    varyingColor1.x = multiplyAddValue75;
    varyingColor1.y = multiplyAddValue76;
    varyingColor1.z = multiplyAddValue77;
    varyingColor1.w = multiplyAddValue78;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue = bitwiseValue + 27u;
    uint sumValue1 = bitwiseValue + 28u;
    uint sumValue2 = bitwiseValue + 29u;
    uint sumValue3 = bitwiseValue + 30u;
    float productValue57 = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue98 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[10u].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[10u].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue99 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].y))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[10u].y))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[10u].y))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue100 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].z))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[10u].z))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[10u].z))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue101 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue100, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue99, multiplyAddValue98 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue102 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue100, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue99, multiplyAddValue98 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue103 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue100, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue99, multiplyAddValue98 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue104 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue100, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue99, multiplyAddValue98 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue105 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue104, fma(vertexVectorConstants0.packedValues[59u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue102, multiplyAddValue101 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue106 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue104, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[59u].y, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue102, multiplyAddValue101 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue107 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue104, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue102, multiplyAddValue101 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue108 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue104, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue102, multiplyAddValue101 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue105;
    gl_Position.y = multiplyAddValue106;
    gl_Position.z = multiplyAddValue107;
    gl_Position.w = multiplyAddValue108;
    varyingColor1.x = multiplyAddValue105;
    varyingColor1.y = multiplyAddValue106;
    varyingColor1.z = multiplyAddValue107;
    varyingColor1.w = multiplyAddValue108;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue57 = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue68 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue69 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue70 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue71 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue72 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue73 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue74 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue124 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[11u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue125 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[11u].y, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue77 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue78 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue124;
    gl_Position.y = multiplyAddValue125;
    gl_Position.z = multiplyAddValue77;
    gl_Position.w = multiplyAddValue78;
    varyingColor1.x = multiplyAddValue124;
    varyingColor1.y = multiplyAddValue125;
    varyingColor1.z = multiplyAddValue77;
    varyingColor1.w = multiplyAddValue78;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue9 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue8 / sumValue9;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue9 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue10 / sumValue9;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue9 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue5 = sumValue13 / sumValue9;
    varyingColor2.w = spvNClamp(quotientValue5, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue9 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue10 / sumValue9;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue1 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue14 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue20 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue14 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue22 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue77 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue107 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue77 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
#endif
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord1.z = 0.0;
    varyingTexCoord1.w = 0.0;
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 multiplyAddValue62 = vec4(multiplyAddValue52, multiplyAddValue53, multiplyAddValue54, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], productValue22))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], productValue18))), vertexNormal0.x, multiplyAddValue45)));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue62, multiplyAddValue62));
    precise float productValue30 = inverseLengthValue2 * multiplyAddValue52;
    precise float productValue31 = inverseLengthValue2 * multiplyAddValue53;
    precise float productValue32 = inverseLengthValue2 * multiplyAddValue54;
    precise float productValue33 = productValue30 * productValue30;
    precise float productValue34 = productValue32 * productValue32;
    precise float productValue35 = productValue33 * (-0.100000001490116119384765625);
    precise float multiplyAddValue63 = fma(productValue34, 0.100000001490116119384765625, fma(fma(productValue31, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, productValue35)) + 0.449999988079071044921875;
    float multiplyAddValue64 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue63);
    precise float productValue36 = multiplyAddValue64 * vertexVectorConstants0.packedValues[60u].x;
    precise float productValue37 = multiplyAddValue64 * vertexVectorConstants0.packedValues[60u].y;
    precise float productValue38 = multiplyAddValue64 * vertexVectorConstants0.packedValues[60u].z;
    varyingColor3.x = productValue36;
    varyingColor3.y = productValue37;
    varyingColor3.z = productValue38;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    precise float productValue5 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue6 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue7 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue8 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    precise float multiplyAddValue83 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue5))) * vertexNormal0.y;
    precise float multiplyAddValue84 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue6))) * vertexNormal0.y;
    precise float multiplyAddValue85 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue7))) * vertexNormal0.y;
    precise float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], productValue8))) * vertexNormal0.y;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    precise float productValue15 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue16 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue17 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue18 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5];
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    precise float productValue19 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue20 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue21 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue22 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9];
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    float multiplyAddValue86 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue19))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue15))), vertexNormal0.x, multiplyAddValue83));
    float multiplyAddValue87 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue20))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue16))), vertexNormal0.x, multiplyAddValue84));
    float multiplyAddValue88 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue21))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue17))), vertexNormal0.x, multiplyAddValue85));
    vec4 multiplyAddValue89 = vec4(multiplyAddValue86, multiplyAddValue87, multiplyAddValue88, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], productValue22))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], productValue18))), vertexNormal0.x, multiplyAddValue45)));
    float inverseLengthValue4 = inversesqrt(rdDot4Precise(multiplyAddValue89, multiplyAddValue89));
    precise float productValue46 = inverseLengthValue4 * multiplyAddValue86;
    precise float productValue47 = inverseLengthValue4 * multiplyAddValue87;
    precise float productValue48 = inverseLengthValue4 * multiplyAddValue88;
    precise float productValue49 = productValue46 * productValue46;
    precise float productValue50 = productValue48 * productValue48;
    precise float productValue51 = productValue49 * (-0.100000001490116119384765625);
    precise float multiplyAddValue90 = fma(productValue50, 0.100000001490116119384765625, fma(fma(productValue47, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, productValue51)) + 0.449999988079071044921875;
    float multiplyAddValue91 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue90);
    precise float productValue52 = multiplyAddValue91 * vertexVectorConstants0.packedValues[60u].x;
    precise float productValue53 = multiplyAddValue91 * vertexVectorConstants0.packedValues[60u].y;
    precise float productValue54 = multiplyAddValue91 * vertexVectorConstants0.packedValues[60u].z;
    varyingColor3.x = productValue52;
    varyingColor3.y = productValue53;
    varyingColor3.z = productValue54;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue119 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue62 = multiplyAddValue119 * vertexVectorConstants0.packedValues[60u].x;
    precise float productValue63 = multiplyAddValue119 * vertexVectorConstants0.packedValues[60u].y;
    precise float productValue64 = multiplyAddValue119 * vertexVectorConstants0.packedValues[60u].z;
    varyingColor3.x = productValue62;
    varyingColor3.y = productValue63;
    varyingColor3.z = productValue64;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    float multiplyAddValue119 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue65 = multiplyAddValue119 * vertexVectorConstants0.packedValues[12u].x;
    precise float productValue66 = multiplyAddValue119 * vertexVectorConstants0.packedValues[12u].y;
    precise float productValue67 = multiplyAddValue119 * vertexVectorConstants0.packedValues[12u].z;
    varyingColor3.x = productValue65;
    varyingColor3.y = productValue66;
    varyingColor3.z = productValue67;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 multiplyAddValue40 = vec4(multiplyAddValue33, multiplyAddValue34, multiplyAddValue35, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y)));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue40, multiplyAddValue40));
    float productValue3 = inverseLengthValue1 * multiplyAddValue33;
    float productValue4 = inverseLengthValue1 * multiplyAddValue35;
    float multiplyAddValue41 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue4 * productValue4, 0.100000001490116119384765625, fma(fma(inverseLengthValue1 * multiplyAddValue34, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, (productValue3 * productValue3) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor3.x = multiplyAddValue41 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue41 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue41 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    float multiplyAddValue93 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    float multiplyAddValue94 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    float multiplyAddValue95 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    vec4 multiplyAddValue96 = vec4(multiplyAddValue93, multiplyAddValue94, multiplyAddValue95, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y)));
    float inverseLengthValue5 = inversesqrt(rdDot4Precise(multiplyAddValue96, multiplyAddValue96));
    float productValue55 = inverseLengthValue5 * multiplyAddValue93;
    float productValue56 = inverseLengthValue5 * multiplyAddValue95;
    float multiplyAddValue97 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue56 * productValue56, 0.100000001490116119384765625, fma(fma(inverseLengthValue5 * multiplyAddValue94, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, (productValue55 * productValue55) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor3.x = multiplyAddValue97 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue97 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue97 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue119 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor3.x = multiplyAddValue119 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue119 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue119 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue119 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor3.x = multiplyAddValue119 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor3.y = multiplyAddValue119 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor3.z = multiplyAddValue119 * vertexVectorConstants0.packedValues[12u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor3.x = productValue2 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue2 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue2 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor3.x = productValue41 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue41 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue41 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor3.x = productValue57 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue57 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue57 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor3.x = productValue57 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor3.y = productValue57 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor3.z = productValue57 * vertexVectorConstants0.packedValues[12u].z;
#endif
    varyingColor3.w = 1.0;
#if (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[61u].z, vertexVectorConstants0.packedValues[61u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[61u].w, vertexVectorConstants0.packedValues[61u].y);
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[13u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[13u].y);
#elif (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[61u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[61u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[61u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[61u].y;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[13u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[13u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[13u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[13u].y;
#endif
    varyingTexCoord2.x = 0.0;
    varyingTexCoord2.y = 0.0;
    varyingTexCoord2.z = 0.0;
    varyingTexCoord2.w = 0.0;
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue13;
    varyingTexCoord3.y = multiplyAddValue14;
    varyingTexCoord3.z = multiplyAddValue15;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue68;
    varyingTexCoord3.y = multiplyAddValue69;
    varyingTexCoord3.z = multiplyAddValue70;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue98;
    varyingTexCoord3.y = multiplyAddValue99;
    varyingTexCoord3.z = multiplyAddValue100;
#endif
}
