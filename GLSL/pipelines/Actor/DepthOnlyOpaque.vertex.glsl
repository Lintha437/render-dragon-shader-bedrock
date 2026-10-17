#version 460
#extension GL_GOOGLE_include_directive : require
// Actor / DepthOnlyOpaque / vertex forward pipeline.
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
#define RD_BINDING_LAYOUT 1
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
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue40 = scalarValue8 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue41 = scalarValue8 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue42 = scalarValue8 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue43 = scalarValue8 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue9 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    precise float multiplyAddValue81 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, productValue40)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue82 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, productValue41)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue83 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, productValue42)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue84 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, productValue43)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue81, multiplyAddValue82, multiplyAddValue83, multiplyAddValue84);
    float scalarValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue6, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue7 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u];
    float scalarValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue7, vertexScalarConstants0.packedValues[13u]), vectorValue2);
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
    precise float productValue5 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue6 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue7 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    precise float multiplyAddValue108 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue5))) * vertexPosition0.y;
    precise float multiplyAddValue109 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue6))) * vertexPosition0.y;
    precise float multiplyAddValue110 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue7))) * vertexPosition0.y;
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
    precise float multiplyAddValue111 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue19))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue15))), vertexPosition0.x, multiplyAddValue108)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], productValue23)));
    precise float multiplyAddValue112 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue20))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue16))), vertexPosition0.x, multiplyAddValue109)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], productValue24)));
    precise float multiplyAddValue113 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue21))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue17))), vertexPosition0.x, multiplyAddValue110)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], productValue25)));
    precise float productValue59 = multiplyAddValue112 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue60 = multiplyAddValue112 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue61 = multiplyAddValue112 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue62 = multiplyAddValue112 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue111;
    varyingTexCoord3.y = multiplyAddValue112;
    varyingTexCoord3.z = multiplyAddValue113;
    precise float multiplyAddValue114 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue113, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue111, productValue59)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue115 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue113, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue111, productValue60)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue116 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue113, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue111, productValue61)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue117 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue113, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue111, productValue62)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue6 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u];
    vec4 vectorValue3 = vec4(multiplyAddValue114, multiplyAddValue115, multiplyAddValue116, multiplyAddValue117);
    float scalarValue17 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue6, vertexScalarConstants0.packedValues[12u]), vectorValue3);
    precise float sumValue7 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u];
    float scalarValue18 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue7, vertexScalarConstants0.packedValues[13u]), vectorValue3);
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
    precise float sumValue13 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u];
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue40 = scalarValue8 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue41 = scalarValue8 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue42 = scalarValue8 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue43 = scalarValue8 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue9 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    precise float multiplyAddValue81 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, productValue40)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue82 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, productValue41)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue83 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, productValue42)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue84 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, productValue43)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue81, multiplyAddValue82, multiplyAddValue83, multiplyAddValue84);
    float scalarValue15 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue13, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue14 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u];
    float scalarValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue14, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    float scalarValue14 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    gl_Position.x = scalarValue15;
    gl_Position.y = scalarValue16;
    gl_Position.z = scalarValue14;
    gl_Position.w = scalarValue13;
    varyingColor1.x = scalarValue15;
    varyingColor1.y = scalarValue16;
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
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1])));
    uint bitwiseValue5 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5])));
    uint bitwiseValue9 = (((16u * bitwiseValue) + 464u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 464u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 464u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 464u) + 12u) >> 2u;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue9 = fma(multiplyAddValue6, vertexNormal0.z, fma(multiplyAddValue3, vertexNormal0.x, multiplyAddValue * vertexNormal0.y));
    float multiplyAddValue10 = fma(multiplyAddValue7, vertexNormal0.z, fma(multiplyAddValue4, vertexNormal0.x, multiplyAddValue1 * vertexNormal0.y));
    float multiplyAddValue11 = fma(multiplyAddValue8, vertexNormal0.z, fma(multiplyAddValue5, vertexNormal0.x, multiplyAddValue2 * vertexNormal0.y));
    uint bitwiseValue13 = (((16u * bitwiseValue) + 480u) + 4u) >> 2u;
    uint bitwiseValue14 = (((16u * bitwiseValue) + 480u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 480u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 480u) + 12u) >> 2u;
    float multiplyAddValue12 = fma(multiplyAddValue6, vertexPosition0.z, fma(multiplyAddValue3, vertexPosition0.x, multiplyAddValue * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue13 = fma(multiplyAddValue7, vertexPosition0.z, fma(multiplyAddValue4, vertexPosition0.x, multiplyAddValue1 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue14 = fma(multiplyAddValue8, vertexPosition0.z, fma(multiplyAddValue5, vertexPosition0.x, multiplyAddValue2 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue12;
    varyingTexCoord3.y = multiplyAddValue13;
    varyingTexCoord3.z = multiplyAddValue14;
    vec4 multiplyAddValue15 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue12, multiplyAddValue13 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue12, multiplyAddValue13 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue12, multiplyAddValue13 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue12, multiplyAddValue13 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue15);
    float sumValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue15);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue15);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue15);
    gl_Position.x = sumValue;
    gl_Position.y = sumValue1;
    gl_Position.z = scalarValue1;
    gl_Position.w = scalarValue;
    varyingColor1.x = sumValue;
    varyingColor1.y = sumValue1;
    varyingColor1.z = scalarValue1;
    varyingColor1.w = scalarValue;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue9 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    vec4 multiplyAddValue118 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue16 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue118);
    float sumValue17 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue118);
    float scalarValue21 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue118);
    float scalarValue22 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue118);
    gl_Position.x = sumValue16;
    gl_Position.y = sumValue17;
    gl_Position.z = scalarValue22;
    gl_Position.w = scalarValue21;
    varyingColor1.x = sumValue16;
    varyingColor1.y = sumValue17;
    varyingColor1.z = scalarValue22;
    varyingColor1.w = scalarValue21;
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
    float multiplyAddValue76 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue77 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue78 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue76;
    varyingTexCoord3.y = multiplyAddValue77;
    varyingTexCoord3.z = multiplyAddValue78;
    vec4 multiplyAddValue79 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue78, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue76, multiplyAddValue77 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue78, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue76, multiplyAddValue77 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue78, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue76, multiplyAddValue77 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue78, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue76, multiplyAddValue77 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[236u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue79);
    float sumValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[237u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue79);
    float scalarValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue79);
    float scalarValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue79);
    gl_Position.x = sumValue10;
    gl_Position.y = sumValue11;
    gl_Position.z = scalarValue7;
    gl_Position.w = scalarValue6;
    varyingColor1.x = sumValue10;
    varyingColor1.y = sumValue11;
    varyingColor1.z = scalarValue7;
    varyingColor1.w = scalarValue6;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue8 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue9 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue10 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue9;
    varyingTexCoord3.y = scalarValue8;
    varyingTexCoord3.z = scalarValue10;
    vec4 multiplyAddValue118 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue10, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue9, scalarValue8 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue18 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[44u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue118);
    float sumValue19 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[45u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue118);
    float scalarValue21 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue118);
    float scalarValue22 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue118);
    gl_Position.x = sumValue18;
    gl_Position.y = sumValue19;
    gl_Position.z = scalarValue22;
    gl_Position.w = scalarValue21;
    varyingColor1.x = sumValue18;
    varyingColor1.y = sumValue19;
    varyingColor1.z = scalarValue22;
    varyingColor1.w = scalarValue21;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue2 = bitwiseValue + 27u;
    uint sumValue3 = bitwiseValue + 28u;
    uint sumValue4 = bitwiseValue + 29u;
    uint sumValue5 = bitwiseValue + 30u;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue27 = fma(multiplyAddValue20, vertexNormal0.z, fma(multiplyAddValue19, vertexNormal0.y, multiplyAddValue18 * vertexNormal0.x));
    float multiplyAddValue28 = fma(multiplyAddValue23, vertexNormal0.z, fma(multiplyAddValue22, vertexNormal0.y, multiplyAddValue21 * vertexNormal0.x));
    float multiplyAddValue29 = fma(multiplyAddValue26, vertexNormal0.z, fma(multiplyAddValue25, vertexNormal0.y, multiplyAddValue24 * vertexNormal0.x));
    float multiplyAddValue30 = fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].w))) * vertexNormal0.x));
    float inverseLengthValue1 = inversesqrt(dot(vec4(multiplyAddValue27, multiplyAddValue28, multiplyAddValue29, multiplyAddValue30), vec4(multiplyAddValue27, multiplyAddValue28, multiplyAddValue29, multiplyAddValue30)));
    float productValue2 = inverseLengthValue1 * multiplyAddValue27;
    float productValue3 = inverseLengthValue1 * multiplyAddValue29;
    float productValue4 = (((0.449999988079071044921875 - ((productValue2 * productValue2) * 0.100000001490116119384765625)) + ((productValue3 * productValue3) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue28 * vertexVectorConstants0.packedValues[60u].w) * inverseLengthValue1) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue31 = fma(multiplyAddValue20, vertexPosition0.z, fma(multiplyAddValue19, vertexPosition0.y, multiplyAddValue18 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue32 = fma(multiplyAddValue23, vertexPosition0.z, fma(multiplyAddValue22, vertexPosition0.y, multiplyAddValue21 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue33 = fma(multiplyAddValue26, vertexPosition0.z, fma(multiplyAddValue25, vertexPosition0.y, multiplyAddValue24 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue32, multiplyAddValue31 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue38 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[59u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[59u].y, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue38;
    gl_Position.y = multiplyAddValue39;
    gl_Position.z = multiplyAddValue40;
    gl_Position.w = multiplyAddValue41;
    varyingColor1.x = multiplyAddValue38;
    varyingColor1.y = multiplyAddValue39;
    varyingColor1.z = multiplyAddValue40;
    varyingColor1.w = multiplyAddValue41;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue2 = bitwiseValue + 27u;
    uint sumValue3 = bitwiseValue + 28u;
    uint sumValue4 = bitwiseValue + 29u;
    float multiplyAddValue94 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].x))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].x))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].x))) * vertexNormal0.x));
    float multiplyAddValue95 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].y))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].y))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].y))) * vertexNormal0.x));
    float multiplyAddValue96 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].z))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].z))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].z))) * vertexNormal0.x));
    float multiplyAddValue30 = fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].w))), vertexNormal0.y, fma(vertexVectorConstants0.packedValues[13u].w, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].w, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].w, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].w))) * vertexNormal0.x));
    float inverseLengthValue4 = inversesqrt(dot(vec4(multiplyAddValue94, multiplyAddValue95, multiplyAddValue96, multiplyAddValue30), vec4(multiplyAddValue94, multiplyAddValue95, multiplyAddValue96, multiplyAddValue30)));
    float productValue53 = inverseLengthValue4 * multiplyAddValue94;
    float productValue54 = inverseLengthValue4 * multiplyAddValue96;
    float productValue55 = (((0.449999988079071044921875 - ((productValue53 * productValue53) * 0.100000001490116119384765625)) + ((productValue54 * productValue54) * 0.100000001490116119384765625)) + (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375)) + ((((multiplyAddValue95 * vertexVectorConstants0.packedValues[60u].w) * inverseLengthValue4) + 1.0) * 0.2750000059604644775390625);
    float multiplyAddValue97 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue98 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue99 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue100 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue99, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue98, multiplyAddValue97 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue101 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue99, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue98, multiplyAddValue97 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue102 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue99, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue98, multiplyAddValue97 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue103 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue99, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue98, multiplyAddValue97 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue104 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[59u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue102, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue101, multiplyAddValue100 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue105 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[59u].y, multiplyAddValue102, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue101, multiplyAddValue100 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue106 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue102, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue101, multiplyAddValue100 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue107 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue102, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue101, multiplyAddValue100 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue104;
    gl_Position.y = multiplyAddValue105;
    gl_Position.z = multiplyAddValue106;
    gl_Position.w = multiplyAddValue107;
    varyingColor1.x = multiplyAddValue104;
    varyingColor1.y = multiplyAddValue105;
    varyingColor1.z = multiplyAddValue106;
    varyingColor1.w = multiplyAddValue107;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint sumValue2 = bitwiseValue + 27u;
    uint sumValue3 = bitwiseValue + 28u;
    uint sumValue4 = bitwiseValue + 29u;
    uint sumValue5 = bitwiseValue + 30u;
    float productValue39 = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue65 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].x, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].x, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].x)));
    float multiplyAddValue66 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].y))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].y))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].y))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].y, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].y, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].y)));
    float multiplyAddValue67 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue4].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue4].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue4].y, vertexVectorConstants0.packedValues[sumValue4].x * vertexVectorConstants0.packedValues[10u].z))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[10u].z))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[10u].z))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[13u].z, vertexVectorConstants0.packedValues[sumValue5].w, fma(vertexVectorConstants0.packedValues[12u].z, vertexVectorConstants0.packedValues[sumValue5].z, fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue5].y, vertexVectorConstants0.packedValues[sumValue5].x * vertexVectorConstants0.packedValues[10u].z)));
    float multiplyAddValue68 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue66, multiplyAddValue65 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue69 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue66, multiplyAddValue65 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue70 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue66, multiplyAddValue65 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue71 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue66, multiplyAddValue65 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue72 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue71, fma(vertexVectorConstants0.packedValues[59u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue73 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue71, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[59u].y, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue74 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue71, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue75 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue71, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue72;
    gl_Position.y = multiplyAddValue73;
    gl_Position.z = multiplyAddValue74;
    gl_Position.w = multiplyAddValue75;
    varyingColor1.x = multiplyAddValue72;
    varyingColor1.y = multiplyAddValue73;
    varyingColor1.z = multiplyAddValue74;
    varyingColor1.w = multiplyAddValue75;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float productValue39 = (vertexVectorConstants0.packedValues[9u].w * 0.3499999940395355224609375) + 1.0;
    float multiplyAddValue97 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue98 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue99 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue100 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue99, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue98, multiplyAddValue97 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue101 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue99, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue98, multiplyAddValue97 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue102 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue99, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue98, multiplyAddValue97 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue103 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue99, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue98, multiplyAddValue97 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue124 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[11u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue102, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue101, multiplyAddValue100 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue125 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[11u].y, multiplyAddValue102, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue101, multiplyAddValue100 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue106 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue102, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue101, multiplyAddValue100 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue107 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue103, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue102, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue101, multiplyAddValue100 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue124;
    gl_Position.y = multiplyAddValue125;
    gl_Position.z = multiplyAddValue106;
    gl_Position.w = multiplyAddValue107;
    varyingColor1.x = multiplyAddValue124;
    varyingColor1.y = multiplyAddValue125;
    varyingColor1.z = multiplyAddValue106;
    varyingColor1.w = multiplyAddValue107;
#endif
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue9 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue1 = sumValue8 / sumValue9;
    varyingColor2.w = spvNClamp(quotientValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
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
    precise float sumValue9 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue12 / sumValue9;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 448u) + 4u) >> 2u;
    precise float productValue5 = vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue6 = vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue7 = vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue8 = vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 448u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 448u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 448u) + 12u) >> 2u;
    precise float multiplyAddValue85 = fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue5))) * vertexNormal0.y;
    precise float multiplyAddValue86 = fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue6))) * vertexNormal0.y;
    precise float multiplyAddValue87 = fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue7))) * vertexNormal0.y;
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
    float multiplyAddValue88 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue19))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue15))), vertexNormal0.x, multiplyAddValue85));
    float multiplyAddValue89 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue20))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue16))), vertexNormal0.x, multiplyAddValue86));
    float multiplyAddValue90 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue21))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue17))), vertexNormal0.x, multiplyAddValue87));
    vec4 multiplyAddValue91 = vec4(multiplyAddValue88, multiplyAddValue89, multiplyAddValue90, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], productValue22))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], productValue18))), vertexNormal0.x, multiplyAddValue45)));
    float inverseLengthValue3 = inversesqrt(rdDot4Precise(multiplyAddValue91, multiplyAddValue91));
    precise float productValue44 = inverseLengthValue3 * multiplyAddValue88;
    precise float productValue45 = inverseLengthValue3 * multiplyAddValue89;
    precise float productValue46 = inverseLengthValue3 * multiplyAddValue90;
    precise float productValue47 = productValue44 * productValue44;
    precise float productValue48 = productValue46 * productValue46;
    precise float productValue49 = productValue47 * (-0.100000001490116119384765625);
    precise float multiplyAddValue92 = fma(productValue48, 0.100000001490116119384765625, fma(fma(productValue45, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, productValue49)) + 0.449999988079071044921875;
    float multiplyAddValue93 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, multiplyAddValue92);
    precise float productValue50 = multiplyAddValue93 * vertexVectorConstants0.packedValues[60u].x;
    precise float productValue51 = multiplyAddValue93 * vertexVectorConstants0.packedValues[60u].y;
    precise float productValue52 = multiplyAddValue93 * vertexVectorConstants0.packedValues[60u].z;
    varyingColor3.x = productValue50;
    varyingColor3.y = productValue51;
    varyingColor3.z = productValue52;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue9 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue5 = sumValue15 / sumValue9;
    varyingColor2.w = spvNClamp(quotientValue5, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue80 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue63 = multiplyAddValue80 * vertexVectorConstants0.packedValues[60u].x;
    precise float productValue64 = multiplyAddValue80 * vertexVectorConstants0.packedValues[60u].y;
    precise float productValue65 = multiplyAddValue80 * vertexVectorConstants0.packedValues[60u].z;
    varyingColor3.x = productValue63;
    varyingColor3.y = productValue64;
    varyingColor3.z = productValue65;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue9 = vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u];
    precise float quotientValue3 = sumValue12 / sumValue9;
    varyingColor2.w = spvNClamp(quotientValue3, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue80 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    precise float productValue56 = multiplyAddValue80 * vertexVectorConstants0.packedValues[12u].x;
    precise float productValue57 = multiplyAddValue80 * vertexVectorConstants0.packedValues[12u].y;
    precise float productValue58 = multiplyAddValue80 * vertexVectorConstants0.packedValues[12u].z;
    varyingColor3.x = productValue56;
    varyingColor3.y = productValue57;
    varyingColor3.z = productValue58;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue1 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    vec4 multiplyAddValue16 = vec4(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y)));
    float inverseLengthValue = inversesqrt(rdDot4Precise(multiplyAddValue16, multiplyAddValue16));
    float productValue = inverseLengthValue * multiplyAddValue9;
    float productValue1 = inverseLengthValue * multiplyAddValue11;
    float multiplyAddValue17 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue1 * productValue1, 0.100000001490116119384765625, fma(fma(inverseLengthValue * multiplyAddValue10, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, (productValue * productValue) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor3.x = multiplyAddValue17 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue17 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue17 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue22 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
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
    float multiplyAddValue119 = fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].x * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    float multiplyAddValue120 = fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].y * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    float multiplyAddValue121 = fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].z * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y));
    vec4 multiplyAddValue122 = vec4(multiplyAddValue119, multiplyAddValue120, multiplyAddValue121, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue9]))), vertexNormal0.z, fma(fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue5]))), vertexNormal0.x, fma(vertexVectorConstants0.packedValues[13u].w, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[12u].w, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[10u].w, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[11u].w * vertexScalarConstants0.packedValues[bitwiseValue1]))) * vertexNormal0.y)));
    float inverseLengthValue5 = inversesqrt(rdDot4Precise(multiplyAddValue122, multiplyAddValue122));
    float productValue66 = inverseLengthValue5 * multiplyAddValue119;
    float productValue67 = inverseLengthValue5 * multiplyAddValue121;
    float multiplyAddValue123 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, fma(productValue67 * productValue67, 0.100000001490116119384765625, fma(fma(inverseLengthValue5 * multiplyAddValue120, vertexScalarConstants0.packedValues[243u], 1.0), 0.2750000059604644775390625, (productValue66 * productValue66) * (-0.100000001490116119384765625))) + 0.449999988079071044921875);
    varyingColor3.x = multiplyAddValue123 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue123 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue123 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue7 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    float multiplyAddValue80 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor3.x = multiplyAddValue80 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = multiplyAddValue80 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = multiplyAddValue80 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingColor2.w = spvNClamp(((scalarValue22 / vertexScalarConstants0.packedValues[34u]) - vertexScalarConstants0.packedValues[32u]) / (vertexScalarConstants0.packedValues[33u] - vertexScalarConstants0.packedValues[32u]), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    float multiplyAddValue80 = fma(vertexScalarConstants0.packedValues[39u], 0.3499999940395355224609375, 1.0);
    varyingColor3.x = multiplyAddValue80 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor3.y = multiplyAddValue80 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor3.z = multiplyAddValue80 * vertexVectorConstants0.packedValues[12u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue40 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue4 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue4 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue4 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue106 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue55 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue55 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue55 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[26u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[26u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[26u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue74 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue39 * vertexVectorConstants0.packedValues[60u].x;
    varyingColor3.y = productValue39 * vertexVectorConstants0.packedValues[60u].y;
    varyingColor3.z = productValue39 * vertexVectorConstants0.packedValues[60u].z;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[10u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[10u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[10u].z;
    varyingColor2.w = spvNClamp(((multiplyAddValue106 / vertexVectorConstants0.packedValues[8u].z) - vertexVectorConstants0.packedValues[8u].x) / (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x), 0.0, 1.0);
    varyingColor3.x = productValue39 * vertexVectorConstants0.packedValues[12u].x;
    varyingColor3.y = productValue39 * vertexVectorConstants0.packedValues[12u].y;
    varyingColor3.z = productValue39 * vertexVectorConstants0.packedValues[12u].z;
#endif
    varyingColor3.w = 1.0;
    varyingTexCoord0.x = 0.0;
    varyingTexCoord0.y = 0.0;
#if (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_ON && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue31;
    varyingTexCoord3.y = multiplyAddValue32;
    varyingTexCoord3.z = multiplyAddValue33;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue97;
    varyingTexCoord3.y = multiplyAddValue98;
    varyingTexCoord3.z = multiplyAddValue99;
#elif (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_FANCY == RD_OFF && RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue65;
    varyingTexCoord3.y = multiplyAddValue66;
    varyingTexCoord3.z = multiplyAddValue67;
#endif
}
