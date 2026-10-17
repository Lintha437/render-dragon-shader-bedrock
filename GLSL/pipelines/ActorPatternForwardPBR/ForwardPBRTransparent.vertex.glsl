#version 460
#extension GL_GOOGLE_include_directive : require
// ActorPatternForwardPBR / ForwardPBRTransparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM40
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
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_FEATURE_TINTING
#define RD_FEATURE_TINTING RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#extension GL_EXT_scalar_block_layout : require
#define RD_USE_DOT4_PRECISE_FLOAT_0 1

#include "../../include/materials/ActorPatternForwardPBR/VertexBindings.glsli"

#include "../../include/Math.glsli"
void main()
{
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[372u];
#if RD_FEATURE_INSTANCING == RD_ON
    vec4 vectorValue1 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue4 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue43 = scalarValue4 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue44 = scalarValue4 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue45 = scalarValue4 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue46 = scalarValue4 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue5 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue6 = rdDot4Precise(vectorValue1, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue5;
    varyingTexCoord3.y = scalarValue4;
    varyingTexCoord3.z = scalarValue6;
    precise float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue5, productValue43)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue5, productValue44)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue5, productValue45)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue5, productValue46)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue2 = vec4(multiplyAddValue25, multiplyAddValue26, multiplyAddValue27, multiplyAddValue28);
    float scalarValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue2);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[373u];
    float scalarValue8 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue2);
    float scalarValue9 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue2);
    float scalarValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue2);
    gl_Position.x = scalarValue7;
    gl_Position.y = scalarValue8;
    gl_Position.z = scalarValue9;
    gl_Position.w = scalarValue10;
    varyingColor1.x = scalarValue7;
    varyingColor1.y = scalarValue8;
    varyingColor1.z = scalarValue9;
    varyingColor1.w = scalarValue10;
    precise float productValue19 = vertexNormal0.z * vertexTangent0.y;
    precise float productValue20 = vertexNormal0.x * vertexTangent0.z;
    precise float productValue21 = vertexNormal0.y * vertexTangent0.x;
    precise float multiplyAddValue16 = fma(vertexNormal0.y, vertexTangent0.z, -productValue19) * vertexTangent0.w;
    precise float multiplyAddValue17 = fma(vertexNormal0.z, vertexTangent0.x, -productValue20) * vertexTangent0.w;
    precise float multiplyAddValue18 = fma(vertexNormal0.x, vertexTangent0.y, -productValue21) * vertexTangent0.w;
#endif
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
    uint bitwiseValue1 = (((16u * bitwiseValue) + 400u) + 4u) >> 2u;
    precise float productValue = vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue1 = vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue1];
    precise float productValue2 = vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue1];
    uint bitwiseValue2 = (((16u * bitwiseValue) + 400u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 400u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 400u) + 12u) >> 2u;
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue2], productValue)));
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue2], productValue1)));
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue2], productValue2)));
#if RD_FEATURE_INSTANCING == RD_OFF
    precise float productValue3 = multiplyAddValue * vertexPosition0.y;
    precise float productValue4 = multiplyAddValue1 * vertexPosition0.y;
    precise float productValue5 = multiplyAddValue2 * vertexPosition0.y;
#elif RD_FEATURE_INSTANCING == RD_ON
    precise float productValue22 = multiplyAddValue17 * multiplyAddValue;
    precise float productValue23 = multiplyAddValue17 * multiplyAddValue1;
    precise float productValue24 = multiplyAddValue17 * multiplyAddValue2;
#endif
    uint bitwiseValue5 = (((16u * bitwiseValue) + 384u) + 4u) >> 2u;
    precise float productValue6 = vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue7 = vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue5];
    precise float productValue8 = vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue5];
    uint bitwiseValue6 = (((16u * bitwiseValue) + 384u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 384u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 384u) + 12u) >> 2u;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue6], productValue6)));
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue6], productValue7)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue6], productValue8)));
    uint bitwiseValue9 = (((16u * bitwiseValue) + 416u) + 4u) >> 2u;
    precise float productValue9 = vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue10 = vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue9];
    precise float productValue11 = vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue9];
    uint bitwiseValue10 = (((16u * bitwiseValue) + 416u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 416u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 416u) + 12u) >> 2u;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue10], productValue9)));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue10], productValue10)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue10], productValue11)));
#if RD_FEATURE_INSTANCING == RD_OFF
    uint bitwiseValue13 = (((16u * bitwiseValue) + 432u) + 4u) >> 2u;
    precise float productValue12 = vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue13 = vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue13];
    precise float productValue14 = vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue13];
    uint bitwiseValue14 = (((16u * bitwiseValue) + 432u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 432u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 432u) + 12u) >> 2u;
    precise float multiplyAddValue9 = fma(multiplyAddValue6, vertexPosition0.z, fma(multiplyAddValue3, vertexPosition0.x, productValue3)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue14], productValue12)));
    precise float multiplyAddValue10 = fma(multiplyAddValue7, vertexPosition0.z, fma(multiplyAddValue4, vertexPosition0.x, productValue4)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue14], productValue13)));
    precise float multiplyAddValue11 = fma(multiplyAddValue8, vertexPosition0.z, fma(multiplyAddValue5, vertexPosition0.x, productValue5)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue14], productValue14)));
    precise float productValue15 = multiplyAddValue10 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue16 = multiplyAddValue10 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue17 = multiplyAddValue10 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue18 = multiplyAddValue10 * vertexVectorConstants0.packedValues[5u].w;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    precise float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue9, productValue15)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue9, productValue16)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue9, productValue17)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue9, productValue18)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14, multiplyAddValue15);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[373u];
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
    precise float productValue19 = vertexNormal0.z * vertexTangent0.y;
    precise float productValue20 = vertexNormal0.x * vertexTangent0.z;
    precise float productValue21 = vertexNormal0.y * vertexTangent0.x;
    precise float multiplyAddValue16 = fma(vertexNormal0.y, vertexTangent0.z, -productValue19) * vertexTangent0.w;
    precise float multiplyAddValue17 = fma(vertexNormal0.z, vertexTangent0.x, -productValue20) * vertexTangent0.w;
    precise float multiplyAddValue18 = fma(vertexNormal0.x, vertexTangent0.y, -productValue21) * vertexTangent0.w;
    precise float productValue22 = multiplyAddValue17 * multiplyAddValue;
    precise float productValue23 = multiplyAddValue17 * multiplyAddValue1;
    precise float productValue24 = multiplyAddValue17 * multiplyAddValue2;
#endif
    varyingBitangent0.x = fma(multiplyAddValue6, multiplyAddValue18, fma(multiplyAddValue3, multiplyAddValue16, productValue22));
    varyingBitangent0.y = fma(multiplyAddValue7, multiplyAddValue18, fma(multiplyAddValue4, multiplyAddValue16, productValue23));
    varyingBitangent0.z = fma(multiplyAddValue8, multiplyAddValue18, fma(multiplyAddValue5, multiplyAddValue16, productValue24));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    precise float productValue25 = multiplyAddValue * vertexNormal0.y;
    precise float productValue26 = multiplyAddValue1 * vertexNormal0.y;
    precise float productValue27 = multiplyAddValue2 * vertexNormal0.y;
    precise float productValue28 = multiplyAddValue * vertexTangent0.y;
    precise float productValue29 = multiplyAddValue1 * vertexTangent0.y;
    precise float productValue30 = multiplyAddValue2 * vertexTangent0.y;
    varyingNormal0.x = fma(multiplyAddValue6, vertexNormal0.z, fma(multiplyAddValue3, vertexNormal0.x, productValue25));
    varyingNormal0.y = fma(multiplyAddValue7, vertexNormal0.z, fma(multiplyAddValue4, vertexNormal0.x, productValue26));
    varyingNormal0.z = fma(multiplyAddValue8, vertexNormal0.z, fma(multiplyAddValue5, vertexNormal0.x, productValue27));
    varyingTangent0.x = fma(multiplyAddValue6, vertexTangent0.z, fma(multiplyAddValue3, vertexTangent0.x, productValue28));
    varyingTangent0.y = fma(multiplyAddValue7, vertexTangent0.z, fma(multiplyAddValue4, vertexTangent0.x, productValue29));
    varyingTangent0.z = fma(multiplyAddValue8, vertexTangent0.z, fma(multiplyAddValue5, vertexTangent0.x, productValue30));
    uint bitwiseValue17 = (((16u * bitwiseValue) + 928u) + 4u) >> 2u;
    precise float productValue31 = vertexVectorConstants0.packedValues[90u].x * vertexScalarConstants0.packedValues[bitwiseValue17];
    precise float productValue32 = vertexVectorConstants0.packedValues[90u].y * vertexScalarConstants0.packedValues[bitwiseValue17];
    precise float productValue33 = vertexVectorConstants0.packedValues[90u].z * vertexScalarConstants0.packedValues[bitwiseValue17];
    uint bitwiseValue18 = (((16u * bitwiseValue) + 928u) + 0u) >> 2u;
    uint bitwiseValue19 = (((16u * bitwiseValue) + 928u) + 8u) >> 2u;
    uint bitwiseValue20 = (((16u * bitwiseValue) + 928u) + 12u) >> 2u;
    precise float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[92u].x, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[91u].x, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[89u].x, vertexScalarConstants0.packedValues[bitwiseValue18], productValue31))) * vertexPosition0.y;
    precise float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[92u].y, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[91u].y, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[89u].y, vertexScalarConstants0.packedValues[bitwiseValue18], productValue32))) * vertexPosition0.y;
    precise float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[92u].z, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[91u].z, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[89u].z, vertexScalarConstants0.packedValues[bitwiseValue18], productValue33))) * vertexPosition0.y;
    uint bitwiseValue21 = (((16u * bitwiseValue) + 912u) + 4u) >> 2u;
    precise float productValue34 = vertexVectorConstants0.packedValues[90u].x * vertexScalarConstants0.packedValues[bitwiseValue21];
    precise float productValue35 = vertexVectorConstants0.packedValues[90u].y * vertexScalarConstants0.packedValues[bitwiseValue21];
    precise float productValue36 = vertexVectorConstants0.packedValues[90u].z * vertexScalarConstants0.packedValues[bitwiseValue21];
    uint bitwiseValue22 = (((16u * bitwiseValue) + 912u) + 0u) >> 2u;
    uint bitwiseValue23 = (((16u * bitwiseValue) + 912u) + 8u) >> 2u;
    uint bitwiseValue24 = (((16u * bitwiseValue) + 912u) + 12u) >> 2u;
    uint bitwiseValue25 = (((16u * bitwiseValue) + 944u) + 4u) >> 2u;
    precise float productValue37 = vertexVectorConstants0.packedValues[90u].x * vertexScalarConstants0.packedValues[bitwiseValue25];
    precise float productValue38 = vertexVectorConstants0.packedValues[90u].y * vertexScalarConstants0.packedValues[bitwiseValue25];
    precise float productValue39 = vertexVectorConstants0.packedValues[90u].z * vertexScalarConstants0.packedValues[bitwiseValue25];
    uint bitwiseValue26 = (((16u * bitwiseValue) + 944u) + 0u) >> 2u;
    uint bitwiseValue27 = (((16u * bitwiseValue) + 944u) + 8u) >> 2u;
    uint bitwiseValue28 = (((16u * bitwiseValue) + 944u) + 12u) >> 2u;
    uint bitwiseValue29 = (((16u * bitwiseValue) + 960u) + 4u) >> 2u;
    precise float productValue40 = vertexVectorConstants0.packedValues[90u].x * vertexScalarConstants0.packedValues[bitwiseValue29];
    precise float productValue41 = vertexVectorConstants0.packedValues[90u].y * vertexScalarConstants0.packedValues[bitwiseValue29];
    precise float productValue42 = vertexVectorConstants0.packedValues[90u].z * vertexScalarConstants0.packedValues[bitwiseValue29];
    uint bitwiseValue30 = (((16u * bitwiseValue) + 960u) + 0u) >> 2u;
    uint bitwiseValue31 = (((16u * bitwiseValue) + 960u) + 8u) >> 2u;
    uint bitwiseValue32 = (((16u * bitwiseValue) + 960u) + 12u) >> 2u;
    precise float multiplyAddValue22 = fma(fma(vertexVectorConstants0.packedValues[92u].x, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[91u].x, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[89u].x, vertexScalarConstants0.packedValues[bitwiseValue26], productValue37))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[92u].x, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[91u].x, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[89u].x, vertexScalarConstants0.packedValues[bitwiseValue22], productValue34))), vertexPosition0.x, multiplyAddValue19)) + fma(vertexVectorConstants0.packedValues[92u].x, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[91u].x, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[89u].x, vertexScalarConstants0.packedValues[bitwiseValue30], productValue40)));
    precise float multiplyAddValue23 = fma(fma(vertexVectorConstants0.packedValues[92u].y, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[91u].y, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[89u].y, vertexScalarConstants0.packedValues[bitwiseValue26], productValue38))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[92u].y, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[91u].y, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[89u].y, vertexScalarConstants0.packedValues[bitwiseValue22], productValue35))), vertexPosition0.x, multiplyAddValue20)) + fma(vertexVectorConstants0.packedValues[92u].y, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[91u].y, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[89u].y, vertexScalarConstants0.packedValues[bitwiseValue30], productValue41)));
    precise float multiplyAddValue24 = fma(fma(vertexVectorConstants0.packedValues[92u].z, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[91u].z, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[89u].z, vertexScalarConstants0.packedValues[bitwiseValue26], productValue39))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[92u].z, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[91u].z, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[89u].z, vertexScalarConstants0.packedValues[bitwiseValue22], productValue36))), vertexPosition0.x, multiplyAddValue21)) + fma(vertexVectorConstants0.packedValues[92u].z, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[91u].z, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[89u].z, vertexScalarConstants0.packedValues[bitwiseValue30], productValue42)));
    varyingTexCoord4.x = multiplyAddValue22;
    varyingTexCoord4.y = multiplyAddValue23;
    varyingTexCoord4.z = multiplyAddValue24;
    varyingTexCoord0.x = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[56u].z, vertexVectorConstants0.packedValues[56u].x);
    varyingTexCoord0.y = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[56u].w, vertexVectorConstants0.packedValues[56u].y);
}
