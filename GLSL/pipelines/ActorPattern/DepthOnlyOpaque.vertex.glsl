#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPattern / DepthOnlyOpaque / vertex forward pipeline.
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
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/ActorPattern/VertexBindings.glsli"

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
    precise float productValue44 = scalarValue6 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue45 = scalarValue6 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue46 = scalarValue6 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue47 = scalarValue6 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    precise float multiplyAddValue85 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, productValue44)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue86 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, productValue45)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue87 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, productValue46)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue88 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, productValue47)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue85, multiplyAddValue86, multiplyAddValue87, multiplyAddValue88);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u];
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    gl_Position.x = scalarValue11;
    gl_Position.y = scalarValue12;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue13;
    varyingColor1.x = scalarValue11;
    varyingColor1.y = scalarValue12;
    varyingColor1.z = scalarValue14;
    varyingColor1.w = scalarValue13;
    precise float quotientValue2 = scalarValue14 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue12 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    precise float productValue = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue1 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue2 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    precise float multiplyAddValue114 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue))) * vertexPosition0.y;
    precise float multiplyAddValue115 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue1))) * vertexPosition0.y;
    precise float multiplyAddValue116 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue2))) * vertexPosition0.y;
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
    precise float multiplyAddValue117 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue14))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue10))), vertexPosition0.x, multiplyAddValue114)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], productValue18)));
    precise float multiplyAddValue118 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue15))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue11))), vertexPosition0.x, multiplyAddValue115)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], productValue19)));
    precise float multiplyAddValue119 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue16))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue12))), vertexPosition0.x, multiplyAddValue116)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], productValue20)));
    precise float productValue58 = multiplyAddValue118 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue59 = multiplyAddValue118 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue60 = multiplyAddValue118 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue61 = multiplyAddValue118 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue117;
    varyingTexCoord3.y = multiplyAddValue118;
    varyingTexCoord3.z = multiplyAddValue119;
    precise float multiplyAddValue120 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue119, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue117, productValue58)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue121 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue119, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue117, productValue59)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue122 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue119, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue117, productValue60)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue123 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue119, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue117, productValue61)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u];
    vec4 vectorValue3 = vec4(multiplyAddValue120, multiplyAddValue121, multiplyAddValue122, multiplyAddValue123);
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
    precise float productValue44 = scalarValue6 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue45 = scalarValue6 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue46 = scalarValue6 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue47 = scalarValue6 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue7 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue7;
    varyingTexCoord3.y = scalarValue6;
    varyingTexCoord3.z = scalarValue8;
    precise float multiplyAddValue85 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, productValue44)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue86 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, productValue45)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue87 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, productValue46)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue88 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, productValue47)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue85, multiplyAddValue86, multiplyAddValue87, multiplyAddValue88);
    float scalarValue21 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue16, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue17 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u];
    float scalarValue22 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue17, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    gl_Position.x = scalarValue21;
    gl_Position.y = scalarValue22;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue13;
    varyingColor1.x = scalarValue21;
    varyingColor1.y = scalarValue22;
    varyingColor1.z = scalarValue14;
    varyingColor1.w = scalarValue13;
    precise float quotientValue2 = scalarValue14 / vertexScalarConstants0.packedValues[34u];
    precise float sumValue12 = quotientValue2 - vertexScalarConstants0.packedValues[32u];
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1])));
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    float multiplyAddValue50 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5])));
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue54 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue55 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue56 = fma(multiplyAddValue53, vertexNormal0.z, fma(multiplyAddValue50, vertexNormal0.x, multiplyAddValue47 * vertexNormal0.y));
    float multiplyAddValue57 = fma(multiplyAddValue54, vertexNormal0.z, fma(multiplyAddValue51, vertexNormal0.x, multiplyAddValue48 * vertexNormal0.y));
    float multiplyAddValue58 = fma(multiplyAddValue55, vertexNormal0.z, fma(multiplyAddValue52, vertexNormal0.x, multiplyAddValue49 * vertexNormal0.y));
    uint bitwiseValue13 = (((16u * bitwiseValue) + 480u) + 4u) >> 2u;
    uint bitwiseValue14 = (((16u * bitwiseValue) + 480u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 480u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 480u) + 12u) >> 2u;
    float multiplyAddValue59 = fma(multiplyAddValue53, vertexPosition0.z, fma(multiplyAddValue50, vertexPosition0.x, multiplyAddValue47 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue60 = fma(multiplyAddValue54, vertexPosition0.z, fma(multiplyAddValue51, vertexPosition0.x, multiplyAddValue48 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue61 = fma(multiplyAddValue55, vertexPosition0.z, fma(multiplyAddValue52, vertexPosition0.x, multiplyAddValue49 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue59;
    varyingTexCoord3.y = multiplyAddValue60;
    varyingTexCoord3.z = multiplyAddValue61;
    vec4 multiplyAddValue62 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue61, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue59, multiplyAddValue60 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue61, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue59, multiplyAddValue60 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue61, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue59, multiplyAddValue60 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue61, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue59, multiplyAddValue60 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue8 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue62);
    float sumValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue62);
    float scalarValue4 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue62);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue62);
    gl_Position.x = sumValue8;
    gl_Position.y = sumValue9;
    gl_Position.z = scalarValue5;
    gl_Position.w = scalarValue4;
    varyingColor1.x = sumValue8;
    varyingColor1.y = sumValue9;
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
    vec4 multiplyAddValue79 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue79);
    float sumValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue79);
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue79);
    float scalarValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue79);
    gl_Position.x = sumValue10;
    gl_Position.y = sumValue11;
    gl_Position.z = scalarValue10;
    gl_Position.w = scalarValue9;
    varyingColor1.x = sumValue10;
    varyingColor1.y = sumValue11;
    varyingColor1.z = scalarValue10;
    varyingColor1.w = scalarValue9;
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
    float multiplyAddValue109 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue110 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue111 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue109;
    varyingTexCoord3.y = multiplyAddValue110;
    varyingTexCoord3.z = multiplyAddValue111;
    vec4 multiplyAddValue112 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue111, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue109, multiplyAddValue110 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue111, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue109, multiplyAddValue110 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue111, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue109, multiplyAddValue110 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue111, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue109, multiplyAddValue110 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue112);
    float sumValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue112);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue112);
    float scalarValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue112);
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
    vec4 multiplyAddValue79 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue8, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue7, scalarValue6 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue18 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue79);
    float sumValue19 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue79);
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue79);
    float scalarValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue79);
    gl_Position.x = sumValue18;
    gl_Position.y = sumValue19;
    gl_Position.z = scalarValue10;
    gl_Position.w = scalarValue9;
    varyingColor1.x = sumValue18;
    varyingColor1.y = sumValue19;
    varyingColor1.z = scalarValue10;
    varyingColor1.w = scalarValue9;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue4 = bitwiseValue + 27u;
    uint sumValue5 = bitwiseValue + 28u;
    uint sumValue6 = bitwiseValue + 29u;
    uint sumValue7 = bitwiseValue + 30u;
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue32 = fma(multiplyAddValue25, vertexNormal0.z, fma(multiplyAddValue24, vertexNormal0.y, multiplyAddValue23 * vertexNormal0.x));
    float multiplyAddValue33 = fma(multiplyAddValue28, vertexNormal0.z, fma(multiplyAddValue27, vertexNormal0.y, multiplyAddValue26 * vertexNormal0.x));
    float multiplyAddValue34 = fma(multiplyAddValue31, vertexNormal0.z, fma(multiplyAddValue30, vertexNormal0.y, multiplyAddValue29 * vertexNormal0.x));
    float multiplyAddValue35 = fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].w))) * vertexNormal0.x));
    float inverseLengthValue1 = inversesqrt(dot(vec4(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34, multiplyAddValue35), vec4(multiplyAddValue32, multiplyAddValue33, multiplyAddValue34, multiplyAddValue35)));
    float productValue34 = inverseLengthValue1 * multiplyAddValue32;
    float productValue35 = inverseLengthValue1 * multiplyAddValue34;
    float productValue36 = (((0.449999988079071044921875 - ((productValue34 * productValue34) * 0.100000001490116119384765625)) + ((productValue35 * productValue35) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue33 * vertexVectorConstants0.packedValues[60u].w) * inverseLengthValue1) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue36 = fma(multiplyAddValue25, vertexPosition0.z, fma(multiplyAddValue24, vertexPosition0.y, multiplyAddValue23 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue37 = fma(multiplyAddValue28, vertexPosition0.z, fma(multiplyAddValue27, vertexPosition0.y, multiplyAddValue26 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue38 = fma(multiplyAddValue31, vertexPosition0.z, fma(multiplyAddValue30, vertexPosition0.y, multiplyAddValue29 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[59u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[59u].y, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue43;
    gl_Position.y = multiplyAddValue44;
    gl_Position.z = multiplyAddValue45;
    gl_Position.w = multiplyAddValue46;
    varyingColor1.x = multiplyAddValue43;
    varyingColor1.y = multiplyAddValue44;
    varyingColor1.z = multiplyAddValue45;
    varyingColor1.w = multiplyAddValue46;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue4 = bitwiseValue + 27u;
    uint sumValue5 = bitwiseValue + 28u;
    uint sumValue6 = bitwiseValue + 29u;
    float multiplyAddValue65 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].x))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].x))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].x))) * vertexNormal0.x));
    float multiplyAddValue66 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].y))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].y))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].y))) * vertexNormal0.x));
    float multiplyAddValue67 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].z))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].z))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].z))) * vertexNormal0.x));
    float multiplyAddValue35 = fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].w))) * vertexNormal0.x));
    float inverseLengthValue3 = inversesqrt(dot(vec4(multiplyAddValue65, multiplyAddValue66, multiplyAddValue67, multiplyAddValue35), vec4(multiplyAddValue65, multiplyAddValue66, multiplyAddValue67, multiplyAddValue35)));
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
    uint sumValue4 = bitwiseValue + 27u;
    uint sumValue5 = bitwiseValue + 28u;
    uint sumValue6 = bitwiseValue + 29u;
    uint sumValue7 = bitwiseValue + 30u;
    float productValue57 = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue98 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue99 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].y))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].y))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].y))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue100 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[sumValue6].x * vertexVectorConstants0.packedValues[10u].z))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].z))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].z))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[sumValue7].x * vertexVectorConstants0.packedValues[10u].z)));
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
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
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
    precise float quotientValue3 = sumValue12 / sumValue3;
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
    precise float multiplyAddValue89 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue))) * vertexNormal0.y;
    precise float multiplyAddValue90 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue1))) * vertexNormal0.y;
    precise float multiplyAddValue91 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue2))) * vertexNormal0.y;
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
    float multiplyAddValue92 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue14))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue10))), vertexNormal0.x, multiplyAddValue89));
    float multiplyAddValue93 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue15))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue11))), vertexNormal0.x, multiplyAddValue90));
    float multiplyAddValue94 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue16))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue12))), vertexNormal0.x, multiplyAddValue91));
    vec4 multiplyAddValue95 = vec4(multiplyAddValue92, multiplyAddValue93, multiplyAddValue94, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], productValue17))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], productValue13))), vertexNormal0.x, multiplyAddValue3)));
    float inverseLengthValue5 = inversesqrt(rdDot4Precise(multiplyAddValue95, multiplyAddValue95));
    precise float productValue48 = inverseLengthValue5 * multiplyAddValue92;
    precise float productValue49 = inverseLengthValue5 * multiplyAddValue93;
    precise float productValue50 = inverseLengthValue5 * multiplyAddValue94;
    precise float productValue51 = productValue48 * productValue48;
    precise float productValue52 = productValue50 * productValue50;
    precise float productValue53 = productValue51 * (-0.100000001490116119384765625);
    precise float multiplyAddValue96 = fma(productValue52, 0.100000001490116119384765625, fma(fma(productValue49, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, productValue53)) + 0.449999988079071044921875;
    float multiplyAddValue97 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue96);
    precise float productValue54 = multiplyAddValue97 * vertexVectorConstants0.packedValues[60u].x;
    precise float productValue55 = multiplyAddValue97 * vertexVectorConstants0.packedValues[60u].y;
    precise float productValue56 = multiplyAddValue97 * vertexVectorConstants0.packedValues[60u].z;
    varyingColor3.x = productValue54;
    varyingColor3.y = productValue55;
    varyingColor3.z = productValue56;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue5 = sumValue15 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue5, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue113 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue62 = multiplyAddValue113 * vertexVectorConstants0.packedValues[60u].x;
    precise float productValue63 = multiplyAddValue113 * vertexVectorConstants0.packedValues[60u].y;
    precise float productValue64 = multiplyAddValue113 * vertexVectorConstants0.packedValues[60u].z;
    varyingColor3.x = productValue62;
    varyingColor3.y = productValue63;
    varyingColor3.z = productValue64;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue3 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue12 / sumValue3;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue113 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue65 = multiplyAddValue113 * vertexVectorConstants0.packedValues[12u].x;
    precise float productValue66 = multiplyAddValue113 * vertexVectorConstants0.packedValues[12u].y;
    precise float productValue67 = multiplyAddValue113 * vertexVectorConstants0.packedValues[12u].z;
    varyingColor3.x = productValue65;
    varyingColor3.y = productValue66;
    varyingColor3.z = productValue67;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue5 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    vec4 multiplyAddValue63 = vec4(multiplyAddValue56, multiplyAddValue57, multiplyAddValue58, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y)));
    float inverseLengthValue2 = inversesqrt(rdDot4Precise(multiplyAddValue63, multiplyAddValue63));
    float productValue37 = inverseLengthValue2 * multiplyAddValue56;
    float productValue38 = inverseLengthValue2 * multiplyAddValue58;
    float multiplyAddValue64 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue38 * productValue38, 0.100000001490116119384765625, fma(fma(inverseLengthValue2 * multiplyAddValue57, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, (productValue37 * productValue37) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor3.x = multiplyAddValue64 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue64 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue64 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue10 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
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
    float multiplyAddValue80 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    float multiplyAddValue81 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    float multiplyAddValue82 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    vec4 multiplyAddValue83 = vec4(multiplyAddValue80, multiplyAddValue81, multiplyAddValue82, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y)));
    float inverseLengthValue4 = inversesqrt(rdDot4Precise(multiplyAddValue83, multiplyAddValue83));
    float productValue42 = inverseLengthValue4 * multiplyAddValue80;
    float productValue43 = inverseLengthValue4 * multiplyAddValue82;
    float multiplyAddValue84 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue43 * productValue43, 0.100000001490116119384765625, fma(fma(inverseLengthValue4 * multiplyAddValue81, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, (productValue42 * productValue42) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor3.x = multiplyAddValue84 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue84 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue84 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue16 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue113 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor3.x = multiplyAddValue113 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue113 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue113 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue10 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue113 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor3.x = multiplyAddValue113 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor3.y = multiplyAddValue113 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor3.z = multiplyAddValue113 * vertexVectorConstants0.packedValues[12u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue45 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue36 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue36 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue36 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue77 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue41 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue41 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue41 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue107 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue57 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue57 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue57 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue77 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue57 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor3.y = productValue57 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor3.z = productValue57 * vertexVectorConstants0.packedValues[12u].z;
#endif
    varyingColor3.w = 1.0;
    varyingTexCoord0.x = 0.0;
    varyingTexCoord0.y = 0.0;
    varyingTexCoord2.x = 0.0;
    varyingTexCoord2.y = 0.0;
    varyingTexCoord2.z = 0.0;
    varyingTexCoord2.w = 0.0;
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue36;
    varyingTexCoord3.y = multiplyAddValue37;
    varyingTexCoord3.z = multiplyAddValue38;
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
