#version 460
#extension GL_GOOGLE_include_directive : require
// Actor / AlphaTest / vertex forward pipeline.
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 8
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/Actor/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    precise float productValue = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue1 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue2 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue3 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue)));
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue1)));
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue2)));
    precise float productValue4 = multiplyAddValue * vertexPosition0.y;
    precise float productValue5 = multiplyAddValue1 * vertexPosition0.y;
    precise float productValue6 = multiplyAddValue2 * vertexPosition0.y;
    precise float productValue7 = multiplyAddValue * vertexNormal0.y;
    precise float productValue8 = multiplyAddValue1 * vertexNormal0.y;
    precise float productValue9 = multiplyAddValue2 * vertexNormal0.y;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], productValue3))) * vertexNormal0.y;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    precise float productValue10 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue11 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue12 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue13 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5];
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue10)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue11)));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue12)));
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    precise float productValue14 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue15 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue16 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue17 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9];
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue14)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue15)));
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue16)));
    float multiplyAddValue10 = fma(multiplyAddValue7, vertexNormal0.z, fma(multiplyAddValue4, vertexNormal0.x, productValue7));
    float multiplyAddValue11 = fma(multiplyAddValue8, vertexNormal0.z, fma(multiplyAddValue5, vertexNormal0.x, productValue8));
    float multiplyAddValue12 = fma(multiplyAddValue9, vertexNormal0.z, fma(multiplyAddValue6, vertexNormal0.x, productValue9));
    uint bitwiseValue13 = (((16u * bitwiseValue) + 480u) + 4u) >> 2u;
    precise float productValue18 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue19 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue20 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13];
    uint bitwiseValue14 = (((16u * bitwiseValue) + 480u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 480u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 480u) + 12u) >> 2u;
    precise float multiplyAddValue13 = fma(multiplyAddValue7, vertexPosition0.z, fma(multiplyAddValue4, vertexPosition0.x, productValue4)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], productValue18)));
    precise float multiplyAddValue14 = fma(multiplyAddValue8, vertexPosition0.z, fma(multiplyAddValue5, vertexPosition0.x, productValue5)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], productValue19)));
    precise float multiplyAddValue15 = fma(multiplyAddValue9, vertexPosition0.z, fma(multiplyAddValue6, vertexPosition0.x, productValue6)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], productValue20)));
    precise float productValue21 = multiplyAddValue14 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue22 = multiplyAddValue14 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue23 = multiplyAddValue14 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue24 = multiplyAddValue14 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue13;
    varyingTexCoord3.y = multiplyAddValue14;
    varyingTexCoord3.z = multiplyAddValue15;
    precise float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue13, productValue21)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue13, productValue22)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue13, productValue23)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue13, productValue24)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u];
    vec4 vectorValue = vec4(multiplyAddValue16, multiplyAddValue17, multiplyAddValue18, multiplyAddValue19);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u];
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue);
    float scalarValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue);
    float scalarValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue);
    gl_Position.x = scalarValue;
    gl_Position.y = scalarValue1;
    gl_Position.z = scalarValue3;
    gl_Position.w = scalarValue2;
    varyingColor1.x = scalarValue;
    varyingColor1.y = scalarValue1;
    varyingColor1.z = scalarValue3;
    varyingColor1.w = scalarValue2;
    precise float quotientValue = scalarValue3 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue2 = quotientValue - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u];
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue39 = scalarValue6 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue40 = scalarValue6 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue41 = scalarValue6 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue42 = scalarValue6 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    precise float multiplyAddValue65 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, productValue39)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue66 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, productValue40)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue67 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, productValue41)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue68 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, productValue42)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue65, multiplyAddValue66, multiplyAddValue67, multiplyAddValue68);
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u];
    float scalarValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue2);
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
    precise float productValue = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue1 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue2 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    precise float multiplyAddValue103 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue))) * vertexPosition0.y;
    precise float multiplyAddValue104 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue1))) * vertexPosition0.y;
    precise float multiplyAddValue105 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue2))) * vertexPosition0.y;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    precise float productValue10 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue11 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue12 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5];
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    precise float productValue14 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue15 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue16 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9];
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    uint bitwiseValue13 = (((16u * bitwiseValue) + 480u) + 4u) >> 2u;
    precise float productValue18 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue19 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue20 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13];
    uint bitwiseValue14 = (((16u * bitwiseValue) + 480u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 480u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 480u) + 12u) >> 2u;
    precise float multiplyAddValue106 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue14))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue10))), vertexPosition0.x, multiplyAddValue103)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], productValue18)));
    precise float multiplyAddValue107 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue15))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue11))), vertexPosition0.x, multiplyAddValue104)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], productValue19)));
    precise float multiplyAddValue108 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue16))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue12))), vertexPosition0.x, multiplyAddValue105)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], productValue20)));
    precise float productValue57 = multiplyAddValue107 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue58 = multiplyAddValue107 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue59 = multiplyAddValue107 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue60 = multiplyAddValue107 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue106;
    varyingTexCoord3.y = multiplyAddValue107;
    varyingTexCoord3.z = multiplyAddValue108;
    precise float multiplyAddValue109 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue108, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue106, productValue57)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue110 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue108, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue106, productValue58)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue111 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue108, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue106, productValue59)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue112 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue108, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue106, productValue60)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u];
    vec4 vectorValue3 = vec4(multiplyAddValue109, multiplyAddValue110, multiplyAddValue111, multiplyAddValue112);
    float scalarValue17 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue3);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u];
    float scalarValue18 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue3);
    float scalarValue19 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue3);
    float scalarValue20 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue3);
    gl_Position.x = scalarValue17;
    gl_Position.y = scalarValue18;
    gl_Position.z = scalarValue20;
    gl_Position.w = scalarValue19;
    varyingColor1.x = scalarValue17;
    varyingColor1.y = scalarValue18;
    varyingColor1.z = scalarValue20;
    varyingColor1.w = scalarValue19;
    precise float quotientValue4 = scalarValue20 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue15 = quotientValue4 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue16 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u];
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue39 = scalarValue6 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue40 = scalarValue6 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue41 = scalarValue6 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue42 = scalarValue6 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    precise float multiplyAddValue65 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, productValue39)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue66 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, productValue40)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue67 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, productValue41)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue68 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, productValue42)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue65, multiplyAddValue66, multiplyAddValue67, multiplyAddValue68);
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
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1])));
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5])));
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue32 = fma(multiplyAddValue29, vertexNormal0.z, fma(multiplyAddValue26, vertexNormal0.x, multiplyAddValue23 * vertexNormal0.y));
    float multiplyAddValue33 = fma(multiplyAddValue30, vertexNormal0.z, fma(multiplyAddValue27, vertexNormal0.x, multiplyAddValue24 * vertexNormal0.y));
    float multiplyAddValue34 = fma(multiplyAddValue31, vertexNormal0.z, fma(multiplyAddValue28, vertexNormal0.x, multiplyAddValue25 * vertexNormal0.y));
    uint bitwiseValue13 = (((16u * bitwiseValue) + 480u) + 4u) >> 2u;
    uint bitwiseValue14 = (((16u * bitwiseValue) + 480u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 480u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 480u) + 12u) >> 2u;
    float multiplyAddValue35 = fma(multiplyAddValue29, vertexPosition0.z, fma(multiplyAddValue26, vertexPosition0.x, multiplyAddValue23 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue36 = fma(multiplyAddValue30, vertexPosition0.z, fma(multiplyAddValue27, vertexPosition0.x, multiplyAddValue24 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue37 = fma(multiplyAddValue31, vertexPosition0.z, fma(multiplyAddValue28, vertexPosition0.x, multiplyAddValue25 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue35;
    varyingTexCoord3.y = multiplyAddValue36;
    varyingTexCoord3.z = multiplyAddValue37;
    vec4 multiplyAddValue38 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue35, multiplyAddValue36 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue35, multiplyAddValue36 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue35, multiplyAddValue36 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue35, multiplyAddValue36 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue38);
    float sumValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue38);
    float scalarValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue38);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue38);
    gl_Position.x = sumValue4;
    gl_Position.y = sumValue5;
    gl_Position.z = scalarValue5;
    gl_Position.w = scalarValue4;
    varyingColor1.x = sumValue4;
    varyingColor1.y = sumValue5;
    varyingColor1.z = scalarValue5;
    varyingColor1.w = scalarValue4;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    vec4 multiplyAddValue78 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue78);
    float sumValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue78);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue78);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue78);
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
    float multiplyAddValue98 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue99 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue100 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue98;
    varyingTexCoord3.y = multiplyAddValue99;
    varyingTexCoord3.z = multiplyAddValue100;
    vec4 multiplyAddValue101 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue100, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue98, multiplyAddValue99 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue100, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue98, multiplyAddValue99 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue100, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue98, multiplyAddValue99 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue100, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue98, multiplyAddValue99 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue101);
    float sumValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue101);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue101);
    float scalarValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue101);
    gl_Position.x = sumValue13;
    gl_Position.y = sumValue14;
    gl_Position.z = scalarValue16;
    gl_Position.w = scalarValue15;
    varyingColor1.x = sumValue13;
    varyingColor1.y = sumValue14;
    varyingColor1.z = scalarValue16;
    varyingColor1.w = scalarValue15;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    vec4 multiplyAddValue78 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue18 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue78);
    float sumValue19 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue78);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue78);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue78);
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
    uint sumValue6 = bitwiseValue + 27u;
    uint sumValue7 = bitwiseValue + 28u;
    uint sumValue8 = bitwiseValue + 29u;
    uint sumValue9 = bitwiseValue + 30u;
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[sumValue8].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[sumValue8].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[sumValue8].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue50 = fma(multiplyAddValue43, vertexNormal0.z, fma(multiplyAddValue42, vertexNormal0.y, multiplyAddValue41 * vertexNormal0.x));
    float multiplyAddValue51 = fma(multiplyAddValue46, vertexNormal0.z, fma(multiplyAddValue45, vertexNormal0.y, multiplyAddValue44 * vertexNormal0.x));
    float multiplyAddValue52 = fma(multiplyAddValue49, vertexNormal0.z, fma(multiplyAddValue48, vertexNormal0.y, multiplyAddValue47 * vertexNormal0.x));
    float multiplyAddValue53 = fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[sumValue8].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].w))) * vertexNormal0.x));
    float inverseLengthValue2 = inversesqrt(dot(vec4(multiplyAddValue50, multiplyAddValue51, multiplyAddValue52, multiplyAddValue53), vec4(multiplyAddValue50, multiplyAddValue51, multiplyAddValue52, multiplyAddValue53)));
    float productValue36 = inverseLengthValue2 * multiplyAddValue50;
    float productValue37 = inverseLengthValue2 * multiplyAddValue52;
    float productValue38 = (((0.449999988079071044921875 - ((productValue36 * productValue36) * 0.100000001490116119384765625)) + ((productValue37 * productValue37) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue51 * vertexVectorConstants0.packedValues[60u].w) * inverseLengthValue2) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue54 = fma(multiplyAddValue43, vertexPosition0.z, fma(multiplyAddValue42, vertexPosition0.y, multiplyAddValue41 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[sumValue9].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue55 = fma(multiplyAddValue46, vertexPosition0.z, fma(multiplyAddValue45, vertexPosition0.y, multiplyAddValue44 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[sumValue9].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue56 = fma(multiplyAddValue49, vertexPosition0.z, fma(multiplyAddValue48, vertexPosition0.y, multiplyAddValue47 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[sumValue9].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue57 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue56, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue55, multiplyAddValue54 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue58 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue56, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue55, multiplyAddValue54 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue59 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue56, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue55, multiplyAddValue54 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue60 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue56, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue55, multiplyAddValue54 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue61 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue60, fma(vertexVectorConstants0.packedValues[59u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue58, multiplyAddValue57 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue62 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue60, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[59u].y, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue58, multiplyAddValue57 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue63 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue60, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue58, multiplyAddValue57 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue64 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue60, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue58, multiplyAddValue57 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue61;
    gl_Position.y = multiplyAddValue62;
    gl_Position.z = multiplyAddValue63;
    gl_Position.w = multiplyAddValue64;
    varyingColor1.x = multiplyAddValue61;
    varyingColor1.y = multiplyAddValue62;
    varyingColor1.z = multiplyAddValue63;
    varyingColor1.w = multiplyAddValue64;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue6 = bitwiseValue + 27u;
    uint sumValue7 = bitwiseValue + 28u;
    uint sumValue8 = bitwiseValue + 29u;
    float multiplyAddValue84 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[sumValue8].x * vertexVectorConstants0.packedValues[10u].x))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].x))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].x))) * vertexNormal0.x));
    float multiplyAddValue85 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[sumValue8].x * vertexVectorConstants0.packedValues[10u].y))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].y))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].y))) * vertexNormal0.x));
    float multiplyAddValue86 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[sumValue8].x * vertexVectorConstants0.packedValues[10u].z))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].z))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].z))) * vertexNormal0.x));
    float multiplyAddValue53 = fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[sumValue8].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].w))) * vertexNormal0.x));
    float inverseLengthValue5 = inversesqrt(dot(vec4(multiplyAddValue84, multiplyAddValue85, multiplyAddValue86, multiplyAddValue53), vec4(multiplyAddValue84, multiplyAddValue85, multiplyAddValue86, multiplyAddValue53)));
    float productValue54 = inverseLengthValue5 * multiplyAddValue84;
    float productValue55 = inverseLengthValue5 * multiplyAddValue86;
    float productValue56 = (((0.449999988079071044921875 - ((productValue54 * productValue54) * 0.100000001490116119384765625)) + ((productValue55 * productValue55) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue85 * vertexVectorConstants0.packedValues[60u].w) * inverseLengthValue5) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue87 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue88 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue89 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue90 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue89, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue88, multiplyAddValue87 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue91 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue89, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue88, multiplyAddValue87 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue92 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue89, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue88, multiplyAddValue87 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue93 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue89, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue88, multiplyAddValue87 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue94 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue93, fma(vertexVectorConstants0.packedValues[59u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue92, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue91, multiplyAddValue90 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue95 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue93, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[59u].y, multiplyAddValue92, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue91, multiplyAddValue90 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue96 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue93, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue92, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue91, multiplyAddValue90 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue97 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue93, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue92, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue91, multiplyAddValue90 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue94;
    gl_Position.y = multiplyAddValue95;
    gl_Position.z = multiplyAddValue96;
    gl_Position.w = multiplyAddValue97;
    varyingColor1.x = multiplyAddValue94;
    varyingColor1.y = multiplyAddValue95;
    varyingColor1.z = multiplyAddValue96;
    varyingColor1.w = multiplyAddValue97;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue6 = bitwiseValue + 27u;
    uint sumValue7 = bitwiseValue + 28u;
    uint sumValue8 = bitwiseValue + 29u;
    uint sumValue9 = bitwiseValue + 30u;
    float productValue64 = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue113 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[sumValue8].x * vertexVectorConstants0.packedValues[10u].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[sumValue9].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue114 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[sumValue8].x * vertexVectorConstants0.packedValues[10u].y))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].y))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].y))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[sumValue9].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue115 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[sumValue8].x * vertexVectorConstants0.packedValues[10u].z))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].z))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].z))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[sumValue9].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue116 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue115, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue114, multiplyAddValue113 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue117 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue115, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue114, multiplyAddValue113 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue118 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue115, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue114, multiplyAddValue113 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue119 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue115, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue114, multiplyAddValue113 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue120 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue119, fma(vertexVectorConstants0.packedValues[59u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue118, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue117, multiplyAddValue116 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue121 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue119, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[59u].y, multiplyAddValue118, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue117, multiplyAddValue116 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue122 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue119, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue118, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue117, multiplyAddValue116 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue123 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue119, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue118, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue117, multiplyAddValue116 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue120;
    gl_Position.y = multiplyAddValue121;
    gl_Position.z = multiplyAddValue122;
    gl_Position.w = multiplyAddValue123;
    varyingColor1.x = multiplyAddValue120;
    varyingColor1.y = multiplyAddValue121;
    varyingColor1.z = multiplyAddValue122;
    varyingColor1.w = multiplyAddValue123;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue64 = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue87 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue88 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue89 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue90 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue89, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue88, multiplyAddValue87 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue91 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue89, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue88, multiplyAddValue87 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue92 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue89, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue88, multiplyAddValue87 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue93 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue89, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue88, multiplyAddValue87 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue124 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue93, fma(vertexVectorConstants0.packedValues[11u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue92, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue91, multiplyAddValue90 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue125 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue93, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[11u].y, multiplyAddValue92, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue91, multiplyAddValue90 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue96 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue93, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue92, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue91, multiplyAddValue90 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue97 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue93, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue92, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue91, multiplyAddValue90 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue124;
    gl_Position.y = multiplyAddValue125;
    gl_Position.z = multiplyAddValue96;
    gl_Position.w = multiplyAddValue97;
    varyingColor1.x = multiplyAddValue124;
    varyingColor1.y = multiplyAddValue125;
    varyingColor1.z = multiplyAddValue96;
    varyingColor1.w = multiplyAddValue97;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue2 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    vec4 multiplyAddValue20 = vec4(multiplyAddValue10, multiplyAddValue11, multiplyAddValue12, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], productValue17))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], productValue13))), vertexNormal0.x, multiplyAddValue3)));
    float inverseLengthValue = inversesqrt(rdDot4Precise(multiplyAddValue20, multiplyAddValue20));
    precise float productValue25 = inverseLengthValue * multiplyAddValue10;
    precise float productValue26 = inverseLengthValue * multiplyAddValue11;
    precise float productValue27 = inverseLengthValue * multiplyAddValue12;
    precise float productValue28 = productValue25 * productValue25;
    precise float productValue29 = productValue27 * productValue27;
    precise float productValue30 = productValue28 * (-0.100000001490116119384765625);
    precise float multiplyAddValue21 = fma(productValue29, 0.100000001490116119384765625, fma(fma(productValue26, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, productValue30)) + 0.449999988079071044921875;
    float multiplyAddValue22 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue21);
    precise float productValue31 = multiplyAddValue22 * vertexVectorConstants0.packedValues[60u].x;
    precise float productValue32 = multiplyAddValue22 * vertexVectorConstants0.packedValues[60u].y;
    precise float productValue33 = multiplyAddValue22 * vertexVectorConstants0.packedValues[60u].z;
    varyingColor3.x = productValue31;
    varyingColor3.y = productValue32;
    varyingColor3.z = productValue33;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue10 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    precise float productValue = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue1 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue2 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue3 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    precise float multiplyAddValue69 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue))) * vertexNormal0.y;
    precise float multiplyAddValue70 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue1))) * vertexNormal0.y;
    precise float multiplyAddValue71 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue2))) * vertexNormal0.y;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], productValue3))) * vertexNormal0.y;
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    precise float productValue10 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue11 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue12 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue13 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5];
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    precise float productValue14 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue15 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue16 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue17 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9];
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    float multiplyAddValue72 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue14))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue10))), vertexNormal0.x, multiplyAddValue69));
    float multiplyAddValue73 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue15))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue11))), vertexNormal0.x, multiplyAddValue70));
    float multiplyAddValue74 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue16))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue12))), vertexNormal0.x, multiplyAddValue71));
    vec4 multiplyAddValue75 = vec4(multiplyAddValue72, multiplyAddValue73, multiplyAddValue74, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], productValue17))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], productValue13))), vertexNormal0.x, multiplyAddValue3)));
    float inverseLengthValue3 = inversesqrt(rdDot4Precise(multiplyAddValue75, multiplyAddValue75));
    precise float productValue43 = inverseLengthValue3 * multiplyAddValue72;
    precise float productValue44 = inverseLengthValue3 * multiplyAddValue73;
    precise float productValue45 = inverseLengthValue3 * multiplyAddValue74;
    precise float productValue46 = productValue43 * productValue43;
    precise float productValue47 = productValue45 * productValue45;
    precise float productValue48 = productValue46 * (-0.100000001490116119384765625);
    precise float multiplyAddValue76 = fma(productValue47, 0.100000001490116119384765625, fma(fma(productValue44, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, productValue48)) + 0.449999988079071044921875;
    float multiplyAddValue77 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue76);
    precise float productValue49 = multiplyAddValue77 * vertexVectorConstants0.packedValues[60u].x;
    precise float productValue50 = multiplyAddValue77 * vertexVectorConstants0.packedValues[60u].y;
    precise float productValue51 = multiplyAddValue77 * vertexVectorConstants0.packedValues[60u].z;
    varyingColor3.x = productValue49;
    varyingColor3.y = productValue50;
    varyingColor3.z = productValue51;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue5 = sumValue15 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue5, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue102 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue61 = multiplyAddValue102 * vertexVectorConstants0.packedValues[60u].x;
    precise float productValue62 = multiplyAddValue102 * vertexVectorConstants0.packedValues[60u].y;
    precise float productValue63 = multiplyAddValue102 * vertexVectorConstants0.packedValues[60u].z;
    varyingColor3.x = productValue61;
    varyingColor3.y = productValue62;
    varyingColor3.z = productValue63;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue10 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue102 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue65 = multiplyAddValue102 * vertexVectorConstants0.packedValues[12u].x;
    precise float productValue66 = multiplyAddValue102 * vertexVectorConstants0.packedValues[12u].y;
    precise float productValue67 = multiplyAddValue102 * vertexVectorConstants0.packedValues[12u].z;
    varyingColor3.x = productValue65;
    varyingColor3.y = productValue66;
    varyingColor3.z = productValue67;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue5 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    vec4 multiplyAddValue39 = vec4(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y)));
    float inverseLengthValue1 = inversesqrt(rdDot4Precise(multiplyAddValue39, multiplyAddValue39));
    float productValue34 = inverseLengthValue1 * multiplyAddValue32;
    float productValue35 = inverseLengthValue1 * multiplyAddValue34;
    float multiplyAddValue40 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue35 * productValue35, 0.100000001490116119384765625, fma(fma(inverseLengthValue1 * multiplyAddValue33, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, (productValue34 * productValue34) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor3.x = multiplyAddValue40 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue40 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue40 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue14 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
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
    float multiplyAddValue79 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    float multiplyAddValue80 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    float multiplyAddValue81 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    vec4 multiplyAddValue82 = vec4(multiplyAddValue79, multiplyAddValue80, multiplyAddValue81, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y)));
    float inverseLengthValue4 = inversesqrt(rdDot4Precise(multiplyAddValue82, multiplyAddValue82));
    float productValue52 = inverseLengthValue4 * multiplyAddValue79;
    float productValue53 = inverseLengthValue4 * multiplyAddValue81;
    float multiplyAddValue83 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue53 * productValue53, 0.100000001490116119384765625, fma(fma(inverseLengthValue4 * multiplyAddValue80, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, (productValue52 * productValue52) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor3.x = multiplyAddValue83 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue83 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue83 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue16 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue102 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor3.x = multiplyAddValue102 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue102 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue102 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue14 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue102 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor3.x = multiplyAddValue102 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor3.y = multiplyAddValue102 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor3.z = multiplyAddValue102 * vertexVectorConstants0.packedValues[12u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue63 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue38 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue38 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue38 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue96 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue56 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue56 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue56 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue122 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue64 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue64 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue64 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue96 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue64 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor3.y = productValue64 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor3.z = productValue64 * vertexVectorConstants0.packedValues[12u].z;
#endif
    varyingColor3.w = 1.0;
#if (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[61u].z, vertexVectorConstants0.packedValues[61u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[61u].w, vertexVectorConstants0.packedValues[61u].y);
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[13u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[13u].y);
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[61u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[61u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[61u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[61u].y;
    varyingTexCoord3.x = multiplyAddValue54;
    varyingTexCoord3.y = multiplyAddValue55;
    varyingTexCoord3.z = multiplyAddValue56;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[61u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[61u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[61u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[61u].y;
    varyingTexCoord3.x = multiplyAddValue87;
    varyingTexCoord3.y = multiplyAddValue88;
    varyingTexCoord3.z = multiplyAddValue89;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[61u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[61u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[61u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[61u].y;
    varyingTexCoord3.x = multiplyAddValue113;
    varyingTexCoord3.y = multiplyAddValue114;
    varyingTexCoord3.z = multiplyAddValue115;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = (vertexVectorConstants0.packedValues[13u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[13u].x;
    varyingTexCoord0.y = (vertexVectorConstants0.packedValues[13u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[13u].y;
    varyingTexCoord3.x = multiplyAddValue87;
    varyingTexCoord3.y = multiplyAddValue88;
    varyingTexCoord3.z = multiplyAddValue89;
#endif
}
