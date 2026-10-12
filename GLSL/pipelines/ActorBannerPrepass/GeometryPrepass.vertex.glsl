#version 460
#extension GL_GOOGLE_include_directive : require
// ActorBannerPrepass / GeometryPrepass / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 8
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
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 4
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/ActorBannerPrepass/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue4 = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue5 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue6 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue5;
    varyingTexCoord3.y = scalarValue4;
    varyingTexCoord3.z = scalarValue6;
    vec4 multiplyAddValue90 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue5, scalarValue4 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue5, scalarValue4 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue5, scalarValue4 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue5, scalarValue4 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue22 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[424u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue90);
    float sumValue23 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[425u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue90);
    float scalarValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue90);
    float scalarValue8 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue90);
    gl_Position.x = sumValue22;
    gl_Position.y = sumValue23;
    gl_Position.z = scalarValue7;
    gl_Position.w = scalarValue8;
    varyingColor1.x = sumValue22;
    varyingColor1.y = sumValue23;
    varyingColor1.z = scalarValue7;
    varyingColor1.w = scalarValue8;
    float multiplyAddValue33 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue34 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue35 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue4 = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue5 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue6 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue5;
    varyingTexCoord3.y = scalarValue4;
    varyingTexCoord3.z = scalarValue6;
    vec4 multiplyAddValue90 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue5, scalarValue4 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue5, scalarValue4 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue5, scalarValue4 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue6, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue5, scalarValue4 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue24 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[396u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue90);
    float sumValue25 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[397u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue90);
    float scalarValue7 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue90);
    float scalarValue8 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue90);
    gl_Position.x = sumValue24;
    gl_Position.y = sumValue25;
    gl_Position.z = scalarValue7;
    gl_Position.w = scalarValue8;
    varyingColor1.x = sumValue24;
    varyingColor1.y = sumValue25;
    varyingColor1.z = scalarValue7;
    varyingColor1.w = scalarValue8;
    float multiplyAddValue33 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue34 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue35 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
#endif
    uint bitwiseValue = uint(vertexBlendIndices0) << 2u;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint bitwiseValue1 = (((16u * bitwiseValue) + 688u) + 4u) >> 2u;
    uint bitwiseValue2 = (((16u * bitwiseValue) + 688u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 688u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 688u) + 12u) >> 2u;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue1])));
    uint bitwiseValue5 = (((16u * bitwiseValue) + 672u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 672u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 672u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 672u) + 12u) >> 2u;
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue5])));
    uint bitwiseValue9 = (((16u * bitwiseValue) + 704u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 704u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 704u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 704u) + 12u) >> 2u;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue9])));
    uint bitwiseValue13 = (((16u * bitwiseValue) + 720u) + 4u) >> 2u;
    uint bitwiseValue14 = (((16u * bitwiseValue) + 720u) + 0u) >> 2u;
    uint bitwiseValue15 = (((16u * bitwiseValue) + 720u) + 8u) >> 2u;
    uint bitwiseValue16 = (((16u * bitwiseValue) + 720u) + 12u) >> 2u;
    float multiplyAddValue29 = fma(multiplyAddValue26, vertexPosition0.z, fma(multiplyAddValue23, vertexPosition0.x, multiplyAddValue20 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue30 = fma(multiplyAddValue27, vertexPosition0.z, fma(multiplyAddValue24, vertexPosition0.x, multiplyAddValue21 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue13])));
    float multiplyAddValue31 = fma(multiplyAddValue28, vertexPosition0.z, fma(multiplyAddValue25, vertexPosition0.x, multiplyAddValue22 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue16], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue15], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue14], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue13])));
    varyingTexCoord3.x = multiplyAddValue29;
    varyingTexCoord3.y = multiplyAddValue30;
    varyingTexCoord3.z = multiplyAddValue31;
    vec4 multiplyAddValue32 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue29, multiplyAddValue30 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue29, multiplyAddValue30 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue29, multiplyAddValue30 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue29, multiplyAddValue30 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue10 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[424u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue32);
    float sumValue11 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[425u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue32);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue32);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue32);
    gl_Position.x = sumValue10;
    gl_Position.y = sumValue11;
    gl_Position.z = scalarValue;
    gl_Position.w = scalarValue1;
    varyingColor1.x = sumValue10;
    varyingColor1.y = sumValue11;
    varyingColor1.z = scalarValue;
    varyingColor1.w = scalarValue1;
    float multiplyAddValue33 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue34 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue35 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(multiplyAddValue26, multiplyAddValue35, fma(multiplyAddValue23, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue20));
    varyingBitangent0.y = fma(multiplyAddValue27, multiplyAddValue35, fma(multiplyAddValue24, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue21));
    varyingBitangent0.z = fma(multiplyAddValue28, multiplyAddValue35, fma(multiplyAddValue25, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue22));
    uint productValue2 = uint(int(vertexColor0.w * 255.0));
    varyingColor0.w = (int(productValue2) > int(0u)) ? 0.0 : 1.0;
    uint sumValue5 = productValue2 + 28u;
    varyingColor0.x = vertexVectorConstants0.packedValues[sumValue5].x;
    varyingColor0.y = vertexVectorConstants0.packedValues[sumValue5].y;
    varyingColor0.z = vertexVectorConstants0.packedValues[sumValue5].z;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint bitwiseValue33 = (((16u * bitwiseValue) + 576u) + 4u) >> 2u;
    uint bitwiseValue34 = (((16u * bitwiseValue) + 576u) + 0u) >> 2u;
    uint bitwiseValue35 = (((16u * bitwiseValue) + 576u) + 8u) >> 2u;
    uint bitwiseValue36 = (((16u * bitwiseValue) + 576u) + 12u) >> 2u;
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue36], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue35], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue34], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue33])));
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue36], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue35], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue34], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue33])));
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue36], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue35], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue34], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue33])));
    uint bitwiseValue37 = (((16u * bitwiseValue) + 560u) + 4u) >> 2u;
    uint bitwiseValue38 = (((16u * bitwiseValue) + 560u) + 0u) >> 2u;
    uint bitwiseValue39 = (((16u * bitwiseValue) + 560u) + 8u) >> 2u;
    uint bitwiseValue40 = (((16u * bitwiseValue) + 560u) + 12u) >> 2u;
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue40], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue39], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue38], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue37])));
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue40], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue39], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue38], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue37])));
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue40], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue39], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue38], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue37])));
    uint bitwiseValue41 = (((16u * bitwiseValue) + 592u) + 4u) >> 2u;
    uint bitwiseValue42 = (((16u * bitwiseValue) + 592u) + 0u) >> 2u;
    uint bitwiseValue43 = (((16u * bitwiseValue) + 592u) + 8u) >> 2u;
    uint bitwiseValue44 = (((16u * bitwiseValue) + 592u) + 12u) >> 2u;
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue44], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue43], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue42], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue41])));
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue44], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue43], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue42], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue41])));
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue44], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue43], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue42], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue41])));
    uint bitwiseValue45 = (((16u * bitwiseValue) + 608u) + 4u) >> 2u;
    uint bitwiseValue46 = (((16u * bitwiseValue) + 608u) + 0u) >> 2u;
    uint bitwiseValue47 = (((16u * bitwiseValue) + 608u) + 8u) >> 2u;
    uint bitwiseValue48 = (((16u * bitwiseValue) + 608u) + 12u) >> 2u;
    float multiplyAddValue50 = fma(multiplyAddValue47, vertexPosition0.z, fma(multiplyAddValue44, vertexPosition0.x, multiplyAddValue41 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue48], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue47], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue46], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue45])));
    float multiplyAddValue51 = fma(multiplyAddValue48, vertexPosition0.z, fma(multiplyAddValue45, vertexPosition0.x, multiplyAddValue42 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue48], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue47], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue46], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue45])));
    float multiplyAddValue52 = fma(multiplyAddValue49, vertexPosition0.z, fma(multiplyAddValue46, vertexPosition0.x, multiplyAddValue43 * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue48], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue47], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue46], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue45])));
    varyingTexCoord3.x = multiplyAddValue50;
    varyingTexCoord3.y = multiplyAddValue51;
    varyingTexCoord3.z = multiplyAddValue52;
    vec4 multiplyAddValue53 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue52, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue50, multiplyAddValue51 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue52, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue50, multiplyAddValue51 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue52, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue50, multiplyAddValue51 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue52, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue50, multiplyAddValue51 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue12 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[396u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue53);
    float sumValue13 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[397u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue53);
    float scalarValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue53);
    float scalarValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue53);
    gl_Position.x = sumValue12;
    gl_Position.y = sumValue13;
    gl_Position.z = scalarValue2;
    gl_Position.w = scalarValue3;
    varyingColor1.x = sumValue12;
    varyingColor1.y = sumValue13;
    varyingColor1.z = scalarValue2;
    varyingColor1.w = scalarValue3;
    float multiplyAddValue33 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue34 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue35 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(multiplyAddValue47, multiplyAddValue35, fma(multiplyAddValue44, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue41));
    varyingBitangent0.y = fma(multiplyAddValue48, multiplyAddValue35, fma(multiplyAddValue45, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue42));
    varyingBitangent0.z = fma(multiplyAddValue49, multiplyAddValue35, fma(multiplyAddValue46, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue43));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    uint bitwiseValue1 = (((16u * bitwiseValue) + 688u) + 4u) >> 2u;
    uint bitwiseValue2 = (((16u * bitwiseValue) + 688u) + 0u) >> 2u;
    uint bitwiseValue3 = (((16u * bitwiseValue) + 688u) + 8u) >> 2u;
    uint bitwiseValue4 = (((16u * bitwiseValue) + 688u) + 12u) >> 2u;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue1])));
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue4], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue3], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue2], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue1])));
    uint bitwiseValue5 = (((16u * bitwiseValue) + 672u) + 4u) >> 2u;
    uint bitwiseValue6 = (((16u * bitwiseValue) + 672u) + 0u) >> 2u;
    uint bitwiseValue7 = (((16u * bitwiseValue) + 672u) + 8u) >> 2u;
    uint bitwiseValue8 = (((16u * bitwiseValue) + 672u) + 12u) >> 2u;
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue5])));
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue8], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue7], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue6], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue5])));
    uint bitwiseValue9 = (((16u * bitwiseValue) + 704u) + 4u) >> 2u;
    uint bitwiseValue10 = (((16u * bitwiseValue) + 704u) + 0u) >> 2u;
    uint bitwiseValue11 = (((16u * bitwiseValue) + 704u) + 8u) >> 2u;
    uint bitwiseValue12 = (((16u * bitwiseValue) + 704u) + 12u) >> 2u;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue9])));
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue12], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue11], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue10], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue9])));
    varyingBitangent0.x = fma(multiplyAddValue26, multiplyAddValue35, fma(multiplyAddValue23, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue20));
    varyingBitangent0.y = fma(multiplyAddValue27, multiplyAddValue35, fma(multiplyAddValue24, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue21));
    varyingBitangent0.z = fma(multiplyAddValue28, multiplyAddValue35, fma(multiplyAddValue25, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue22));
    uint productValue2 = uint(int(vertexColor0.w * 255.0));
    varyingColor0.w = (int(productValue2) > int(0u)) ? 0.0 : 1.0;
    uint sumValue5 = productValue2 + 28u;
    varyingColor0.x = vertexVectorConstants0.packedValues[sumValue5].x;
    varyingColor0.y = vertexVectorConstants0.packedValues[sumValue5].y;
    varyingColor0.z = vertexVectorConstants0.packedValues[sumValue5].z;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    uint bitwiseValue33 = (((16u * bitwiseValue) + 576u) + 4u) >> 2u;
    uint bitwiseValue34 = (((16u * bitwiseValue) + 576u) + 0u) >> 2u;
    uint bitwiseValue35 = (((16u * bitwiseValue) + 576u) + 8u) >> 2u;
    uint bitwiseValue36 = (((16u * bitwiseValue) + 576u) + 12u) >> 2u;
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue36], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue35], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue34], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue33])));
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue36], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue35], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue34], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue33])));
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue36], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue35], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue34], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue33])));
    uint bitwiseValue37 = (((16u * bitwiseValue) + 560u) + 4u) >> 2u;
    uint bitwiseValue38 = (((16u * bitwiseValue) + 560u) + 0u) >> 2u;
    uint bitwiseValue39 = (((16u * bitwiseValue) + 560u) + 8u) >> 2u;
    uint bitwiseValue40 = (((16u * bitwiseValue) + 560u) + 12u) >> 2u;
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue40], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue39], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue38], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue37])));
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue40], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue39], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue38], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue37])));
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue40], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue39], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue38], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue37])));
    uint bitwiseValue41 = (((16u * bitwiseValue) + 592u) + 4u) >> 2u;
    uint bitwiseValue42 = (((16u * bitwiseValue) + 592u) + 0u) >> 2u;
    uint bitwiseValue43 = (((16u * bitwiseValue) + 592u) + 8u) >> 2u;
    uint bitwiseValue44 = (((16u * bitwiseValue) + 592u) + 12u) >> 2u;
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[11u].x, vertexScalarConstants0.packedValues[bitwiseValue44], fma(vertexVectorConstants0.packedValues[10u].x, vertexScalarConstants0.packedValues[bitwiseValue43], fma(vertexVectorConstants0.packedValues[8u].x, vertexScalarConstants0.packedValues[bitwiseValue42], vertexVectorConstants0.packedValues[9u].x * vertexScalarConstants0.packedValues[bitwiseValue41])));
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[11u].y, vertexScalarConstants0.packedValues[bitwiseValue44], fma(vertexVectorConstants0.packedValues[10u].y, vertexScalarConstants0.packedValues[bitwiseValue43], fma(vertexVectorConstants0.packedValues[8u].y, vertexScalarConstants0.packedValues[bitwiseValue42], vertexVectorConstants0.packedValues[9u].y * vertexScalarConstants0.packedValues[bitwiseValue41])));
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[11u].z, vertexScalarConstants0.packedValues[bitwiseValue44], fma(vertexVectorConstants0.packedValues[10u].z, vertexScalarConstants0.packedValues[bitwiseValue43], fma(vertexVectorConstants0.packedValues[8u].z, vertexScalarConstants0.packedValues[bitwiseValue42], vertexVectorConstants0.packedValues[9u].z * vertexScalarConstants0.packedValues[bitwiseValue41])));
    varyingBitangent0.x = fma(multiplyAddValue47, multiplyAddValue35, fma(multiplyAddValue44, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue41));
    varyingBitangent0.y = fma(multiplyAddValue48, multiplyAddValue35, fma(multiplyAddValue45, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue42));
    varyingBitangent0.z = fma(multiplyAddValue49, multiplyAddValue35, fma(multiplyAddValue46, multiplyAddValue33, multiplyAddValue34 * multiplyAddValue43));
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint sumValue = bitwiseValue + 42u;
    uint sumValue1 = bitwiseValue + 43u;
    uint sumValue2 = bitwiseValue + 44u;
    uint sumValue3 = bitwiseValue + 45u;
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[8u].z)));
    float productValue = (vertexVectorConstants0.packedValues[107u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[107u].x;
    float productValue1 = (vertexVectorConstants0.packedValues[107u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[107u].y;
    float multiplyAddValue9 = fma(multiplyAddValue2, vertexPosition0.z, fma(multiplyAddValue1, vertexPosition0.y, multiplyAddValue * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue10 = fma(multiplyAddValue5, vertexPosition0.z, fma(multiplyAddValue4, vertexPosition0.y, multiplyAddValue3 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue11 = fma(multiplyAddValue8, vertexPosition0.z, fma(multiplyAddValue7, vertexPosition0.y, multiplyAddValue6 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue3].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue3].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue3].y, vertexVectorConstants0.packedValues[sumValue3].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[106u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[106u].y, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue2 = uint(int(vertexColor0.w * 255.0));
    uint sumValue4 = productValue2 + 35u;
    uint sumValue5 = productValue2 + 28u;
    uint sumValue6 = bitwiseValue + 74u;
    uint sumValue7 = bitwiseValue + 75u;
    uint sumValue8 = bitwiseValue + 76u;
    uint sumValue9 = bitwiseValue + 77u;
    float productValue3 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue16;
    gl_Position.y = multiplyAddValue17;
    gl_Position.z = multiplyAddValue18;
    gl_Position.w = multiplyAddValue19;
    varyingBitangent0.x = fma(multiplyAddValue2, productValue5, fma(multiplyAddValue1, productValue4, multiplyAddValue * productValue3));
    varyingBitangent0.y = fma(multiplyAddValue5, productValue5, fma(multiplyAddValue4, productValue4, multiplyAddValue3 * productValue3));
    varyingBitangent0.z = fma(multiplyAddValue8, productValue5, fma(multiplyAddValue7, productValue4, multiplyAddValue6 * productValue3));
    varyingColor1.x = multiplyAddValue16;
    varyingColor1.y = multiplyAddValue17;
    varyingColor1.z = multiplyAddValue18;
    varyingColor1.w = multiplyAddValue19;
    varyingColor0.x = vertexVectorConstants0.packedValues[sumValue5].x;
    varyingColor0.y = vertexVectorConstants0.packedValues[sumValue5].y;
    varyingColor0.z = vertexVectorConstants0.packedValues[sumValue5].z;
    varyingColor0.w = (int(productValue2) > int(0u)) ? 0.0 : 1.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint sumValue14 = bitwiseValue + 35u;
    uint sumValue15 = bitwiseValue + 36u;
    uint sumValue16 = bitwiseValue + 37u;
    uint sumValue17 = bitwiseValue + 38u;
    float multiplyAddValue59 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue14].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue14].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue14].y, vertexVectorConstants0.packedValues[sumValue14].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue60 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue15].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue15].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue15].y, vertexVectorConstants0.packedValues[sumValue15].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue61 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue16].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue16].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue16].y, vertexVectorConstants0.packedValues[sumValue16].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue62 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue14].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue14].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue14].y, vertexVectorConstants0.packedValues[sumValue14].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue63 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue15].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue15].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue15].y, vertexVectorConstants0.packedValues[sumValue15].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue64 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue16].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue16].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue16].y, vertexVectorConstants0.packedValues[sumValue16].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue65 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue14].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue14].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue14].y, vertexVectorConstants0.packedValues[sumValue14].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue66 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue15].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue15].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue15].y, vertexVectorConstants0.packedValues[sumValue15].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue67 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue16].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue16].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue16].y, vertexVectorConstants0.packedValues[sumValue16].x * vertexVectorConstants0.packedValues[8u].z)));
    float productValue7 = (vertexVectorConstants0.packedValues[100u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[100u].x;
    float productValue8 = (vertexVectorConstants0.packedValues[100u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[100u].y;
    float multiplyAddValue68 = fma(multiplyAddValue61, vertexPosition0.z, fma(multiplyAddValue60, vertexPosition0.y, multiplyAddValue59 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue17].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue17].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue17].y, vertexVectorConstants0.packedValues[sumValue17].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue69 = fma(multiplyAddValue64, vertexPosition0.z, fma(multiplyAddValue63, vertexPosition0.y, multiplyAddValue62 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue17].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue17].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue17].y, vertexVectorConstants0.packedValues[sumValue17].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue70 = fma(multiplyAddValue67, vertexPosition0.z, fma(multiplyAddValue66, vertexPosition0.y, multiplyAddValue65 * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue17].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue17].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue17].y, vertexVectorConstants0.packedValues[sumValue17].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue71 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue72 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue73 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue74 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue70, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue69, multiplyAddValue68 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue75 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[99u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue76 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[99u].y, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue77 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue78 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue74, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue73, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue72, multiplyAddValue71 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue6 = uint(int(vertexColor0.w * 255.0)) + 28u;
    uint sumValue18 = bitwiseValue + 67u;
    uint sumValue19 = bitwiseValue + 68u;
    uint sumValue20 = bitwiseValue + 69u;
    uint sumValue21 = bitwiseValue + 70u;
    float productValue3 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue75;
    gl_Position.y = multiplyAddValue76;
    gl_Position.z = multiplyAddValue77;
    gl_Position.w = multiplyAddValue78;
    varyingBitangent0.x = fma(multiplyAddValue61, productValue5, fma(multiplyAddValue60, productValue4, multiplyAddValue59 * productValue3));
    varyingBitangent0.y = fma(multiplyAddValue64, productValue5, fma(multiplyAddValue63, productValue4, multiplyAddValue62 * productValue3));
    varyingBitangent0.z = fma(multiplyAddValue67, productValue5, fma(multiplyAddValue66, productValue4, multiplyAddValue65 * productValue3));
    varyingColor1.x = multiplyAddValue75;
    varyingColor1.y = multiplyAddValue76;
    varyingColor1.z = multiplyAddValue77;
    varyingColor1.w = multiplyAddValue78;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    uint sumValue = bitwiseValue + 42u;
    uint sumValue1 = bitwiseValue + 43u;
    uint sumValue2 = bitwiseValue + 44u;
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue].y, vertexVectorConstants0.packedValues[sumValue].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue1].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue1].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue1].y, vertexVectorConstants0.packedValues[sumValue1].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue2].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue2].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue2].y, vertexVectorConstants0.packedValues[sumValue2].x * vertexVectorConstants0.packedValues[8u].z)));
    float productValue = (vertexVectorConstants0.packedValues[107u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[107u].x;
    float productValue1 = (vertexVectorConstants0.packedValues[107u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[107u].y;
    float multiplyAddValue79 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue80 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue81 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue82 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue81, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue80, multiplyAddValue79 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue83 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue81, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue80, multiplyAddValue79 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue84 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue81, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue80, multiplyAddValue79 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue85 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue81, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue80, multiplyAddValue79 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue86 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue85, fma(vertexVectorConstants0.packedValues[106u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue84, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue83, multiplyAddValue82 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue87 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue85, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[106u].y, multiplyAddValue84, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue83, multiplyAddValue82 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue88 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue85, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue84, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue83, multiplyAddValue82 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue89 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue85, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue84, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue83, multiplyAddValue82 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue2 = uint(int(vertexColor0.w * 255.0));
    uint sumValue4 = productValue2 + 35u;
    uint sumValue5 = productValue2 + 28u;
    uint sumValue6 = bitwiseValue + 74u;
    uint sumValue7 = bitwiseValue + 75u;
    uint sumValue8 = bitwiseValue + 76u;
    uint sumValue9 = bitwiseValue + 77u;
    float productValue3 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue86;
    gl_Position.y = multiplyAddValue87;
    gl_Position.z = multiplyAddValue88;
    gl_Position.w = multiplyAddValue89;
    varyingBitangent0.x = fma(multiplyAddValue2, productValue5, fma(multiplyAddValue1, productValue4, multiplyAddValue * productValue3));
    varyingBitangent0.y = fma(multiplyAddValue5, productValue5, fma(multiplyAddValue4, productValue4, multiplyAddValue3 * productValue3));
    varyingBitangent0.z = fma(multiplyAddValue8, productValue5, fma(multiplyAddValue7, productValue4, multiplyAddValue6 * productValue3));
    varyingColor1.x = multiplyAddValue86;
    varyingColor1.y = multiplyAddValue87;
    varyingColor1.z = multiplyAddValue88;
    varyingColor1.w = multiplyAddValue89;
    varyingColor0.x = vertexVectorConstants0.packedValues[sumValue5].x;
    varyingColor0.y = vertexVectorConstants0.packedValues[sumValue5].y;
    varyingColor0.z = vertexVectorConstants0.packedValues[sumValue5].z;
    varyingColor0.w = (int(productValue2) > int(0u)) ? 0.0 : 1.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    uint sumValue14 = bitwiseValue + 35u;
    uint sumValue15 = bitwiseValue + 36u;
    uint sumValue16 = bitwiseValue + 37u;
    float multiplyAddValue59 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue14].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue14].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue14].y, vertexVectorConstants0.packedValues[sumValue14].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue60 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue15].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue15].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue15].y, vertexVectorConstants0.packedValues[sumValue15].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue61 = fma(vertexVectorConstants0.packedValues[11u].x, vertexVectorConstants0.packedValues[sumValue16].w, fma(vertexVectorConstants0.packedValues[10u].x, vertexVectorConstants0.packedValues[sumValue16].z, fma(vertexVectorConstants0.packedValues[9u].x, vertexVectorConstants0.packedValues[sumValue16].y, vertexVectorConstants0.packedValues[sumValue16].x * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue62 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue14].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue14].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue14].y, vertexVectorConstants0.packedValues[sumValue14].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue63 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue15].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue15].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue15].y, vertexVectorConstants0.packedValues[sumValue15].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue64 = fma(vertexVectorConstants0.packedValues[11u].y, vertexVectorConstants0.packedValues[sumValue16].w, fma(vertexVectorConstants0.packedValues[10u].y, vertexVectorConstants0.packedValues[sumValue16].z, fma(vertexVectorConstants0.packedValues[9u].y, vertexVectorConstants0.packedValues[sumValue16].y, vertexVectorConstants0.packedValues[sumValue16].x * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue65 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue14].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue14].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue14].y, vertexVectorConstants0.packedValues[sumValue14].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue66 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue15].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue15].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue15].y, vertexVectorConstants0.packedValues[sumValue15].x * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue67 = fma(vertexVectorConstants0.packedValues[11u].z, vertexVectorConstants0.packedValues[sumValue16].w, fma(vertexVectorConstants0.packedValues[10u].z, vertexVectorConstants0.packedValues[sumValue16].z, fma(vertexVectorConstants0.packedValues[9u].z, vertexVectorConstants0.packedValues[sumValue16].y, vertexVectorConstants0.packedValues[sumValue16].x * vertexVectorConstants0.packedValues[8u].z)));
    float productValue7 = (vertexVectorConstants0.packedValues[100u].z * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[100u].x;
    float productValue8 = (vertexVectorConstants0.packedValues[100u].w * vertexTexCoord0.y) + vertexVectorConstants0.packedValues[100u].y;
    float multiplyAddValue79 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue80 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue81 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue82 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue81, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue80, multiplyAddValue79 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue83 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue81, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue80, multiplyAddValue79 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue84 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue81, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue80, multiplyAddValue79 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue85 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue81, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue80, multiplyAddValue79 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue94 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue85, fma(vertexVectorConstants0.packedValues[99u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue84, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue83, multiplyAddValue82 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue95 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue85, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[99u].y, multiplyAddValue84, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue83, multiplyAddValue82 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue88 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue85, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue84, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue83, multiplyAddValue82 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue89 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue85, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue84, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue83, multiplyAddValue82 * vertexVectorConstants0.packedValues[0u].w)));
    uint productValue6 = uint(int(vertexColor0.w * 255.0)) + 28u;
    uint sumValue18 = bitwiseValue + 67u;
    uint sumValue19 = bitwiseValue + 68u;
    uint sumValue20 = bitwiseValue + 69u;
    uint sumValue21 = bitwiseValue + 70u;
    float productValue3 = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue4 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue5 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue94;
    gl_Position.y = multiplyAddValue95;
    gl_Position.z = multiplyAddValue88;
    gl_Position.w = multiplyAddValue89;
    varyingBitangent0.x = fma(multiplyAddValue61, productValue5, fma(multiplyAddValue60, productValue4, multiplyAddValue59 * productValue3));
    varyingBitangent0.y = fma(multiplyAddValue64, productValue5, fma(multiplyAddValue63, productValue4, multiplyAddValue62 * productValue3));
    varyingBitangent0.z = fma(multiplyAddValue67, productValue5, fma(multiplyAddValue66, productValue4, multiplyAddValue65 * productValue3));
    varyingColor1.x = multiplyAddValue94;
    varyingColor1.y = multiplyAddValue95;
    varyingColor1.z = multiplyAddValue88;
    varyingColor1.w = multiplyAddValue89;
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#endif
    varyingFrontFacing0 = int(0u);
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingNormal0.x = fma(multiplyAddValue26, vertexNormal0.z, fma(multiplyAddValue23, vertexNormal0.x, multiplyAddValue20 * vertexNormal0.y));
    varyingNormal0.y = fma(multiplyAddValue27, vertexNormal0.z, fma(multiplyAddValue24, vertexNormal0.x, multiplyAddValue21 * vertexNormal0.y));
    varyingNormal0.z = fma(multiplyAddValue28, vertexNormal0.z, fma(multiplyAddValue25, vertexNormal0.x, multiplyAddValue22 * vertexNormal0.y));
    varyingTangent0.x = fma(multiplyAddValue26, vertexTangent0.z, fma(multiplyAddValue23, vertexTangent0.x, multiplyAddValue20 * vertexTangent0.y));
    varyingTangent0.y = fma(multiplyAddValue27, vertexTangent0.z, fma(multiplyAddValue24, vertexTangent0.x, multiplyAddValue21 * vertexTangent0.y));
    varyingTangent0.z = fma(multiplyAddValue28, vertexTangent0.z, fma(multiplyAddValue25, vertexTangent0.x, multiplyAddValue22 * vertexTangent0.y));
    uint bitwiseValue17 = (((16u * bitwiseValue) + 1200u) + 4u) >> 2u;
    uint bitwiseValue18 = (((16u * bitwiseValue) + 1200u) + 0u) >> 2u;
    uint bitwiseValue19 = (((16u * bitwiseValue) + 1200u) + 8u) >> 2u;
    uint bitwiseValue20 = (((16u * bitwiseValue) + 1200u) + 12u) >> 2u;
    uint bitwiseValue21 = (((16u * bitwiseValue) + 1184u) + 4u) >> 2u;
    uint bitwiseValue22 = (((16u * bitwiseValue) + 1184u) + 0u) >> 2u;
    uint bitwiseValue23 = (((16u * bitwiseValue) + 1184u) + 8u) >> 2u;
    uint bitwiseValue24 = (((16u * bitwiseValue) + 1184u) + 12u) >> 2u;
    uint bitwiseValue25 = (((16u * bitwiseValue) + 1216u) + 4u) >> 2u;
    uint bitwiseValue26 = (((16u * bitwiseValue) + 1216u) + 0u) >> 2u;
    uint bitwiseValue27 = (((16u * bitwiseValue) + 1216u) + 8u) >> 2u;
    uint bitwiseValue28 = (((16u * bitwiseValue) + 1216u) + 12u) >> 2u;
    uint bitwiseValue29 = (((16u * bitwiseValue) + 1232u) + 4u) >> 2u;
    uint bitwiseValue30 = (((16u * bitwiseValue) + 1232u) + 0u) >> 2u;
    uint bitwiseValue31 = (((16u * bitwiseValue) + 1232u) + 8u) >> 2u;
    uint bitwiseValue32 = (((16u * bitwiseValue) + 1232u) + 12u) >> 2u;
    float multiplyAddValue36 = fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue26], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue25]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue22], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue21]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue18], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue17]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue30], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue29])));
    float multiplyAddValue37 = fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue26], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue25]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue22], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue21]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue18], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue17]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue30], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue29])));
    float multiplyAddValue38 = fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue26], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue25]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue22], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue21]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue18], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue17]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue30], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue29])));
    varyingTexCoord4.x = multiplyAddValue36;
    varyingTexCoord4.y = multiplyAddValue37;
    varyingTexCoord4.z = multiplyAddValue38;
    float multiplyAddValue39 = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[107u].z, vertexVectorConstants0.packedValues[107u].x);
    float multiplyAddValue40 = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[107u].w, vertexVectorConstants0.packedValues[107u].y);
    varyingTexCoord0.x = multiplyAddValue39;
    varyingTexCoord0.y = multiplyAddValue40;
    uint sumValue4 = productValue2 + 35u;
    varyingTexCoord2.x = fma(vertexVectorConstants0.packedValues[sumValue4].z, multiplyAddValue39, vertexVectorConstants0.packedValues[sumValue4].x);
    varyingTexCoord2.y = fma(vertexVectorConstants0.packedValues[sumValue4].w, multiplyAddValue40, vertexVectorConstants0.packedValues[sumValue4].y);
    varyingTexCoord2.z = fma(vertexVectorConstants0.packedValues[35u].z, multiplyAddValue39, vertexVectorConstants0.packedValues[35u].x);
    varyingTexCoord2.w = fma(vertexVectorConstants0.packedValues[35u].w, multiplyAddValue40, vertexVectorConstants0.packedValues[35u].y);
#elif (RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingNormal0.x = fma(multiplyAddValue47, vertexNormal0.z, fma(multiplyAddValue44, vertexNormal0.x, multiplyAddValue41 * vertexNormal0.y));
    varyingNormal0.y = fma(multiplyAddValue48, vertexNormal0.z, fma(multiplyAddValue45, vertexNormal0.x, multiplyAddValue42 * vertexNormal0.y));
    varyingNormal0.z = fma(multiplyAddValue49, vertexNormal0.z, fma(multiplyAddValue46, vertexNormal0.x, multiplyAddValue43 * vertexNormal0.y));
    varyingTangent0.x = fma(multiplyAddValue47, vertexTangent0.z, fma(multiplyAddValue44, vertexTangent0.x, multiplyAddValue41 * vertexTangent0.y));
    varyingTangent0.y = fma(multiplyAddValue48, vertexTangent0.z, fma(multiplyAddValue45, vertexTangent0.x, multiplyAddValue42 * vertexTangent0.y));
    varyingTangent0.z = fma(multiplyAddValue49, vertexTangent0.z, fma(multiplyAddValue46, vertexTangent0.x, multiplyAddValue43 * vertexTangent0.y));
    uint bitwiseValue49 = (((16u * bitwiseValue) + 1088u) + 4u) >> 2u;
    uint bitwiseValue50 = (((16u * bitwiseValue) + 1088u) + 0u) >> 2u;
    uint bitwiseValue51 = (((16u * bitwiseValue) + 1088u) + 8u) >> 2u;
    uint bitwiseValue52 = (((16u * bitwiseValue) + 1088u) + 12u) >> 2u;
    uint bitwiseValue53 = (((16u * bitwiseValue) + 1072u) + 4u) >> 2u;
    uint bitwiseValue54 = (((16u * bitwiseValue) + 1072u) + 0u) >> 2u;
    uint bitwiseValue55 = (((16u * bitwiseValue) + 1072u) + 8u) >> 2u;
    uint bitwiseValue56 = (((16u * bitwiseValue) + 1072u) + 12u) >> 2u;
    uint bitwiseValue57 = (((16u * bitwiseValue) + 1104u) + 4u) >> 2u;
    uint bitwiseValue58 = (((16u * bitwiseValue) + 1104u) + 0u) >> 2u;
    uint bitwiseValue59 = (((16u * bitwiseValue) + 1104u) + 8u) >> 2u;
    uint bitwiseValue60 = (((16u * bitwiseValue) + 1104u) + 12u) >> 2u;
    uint bitwiseValue61 = (((16u * bitwiseValue) + 1120u) + 4u) >> 2u;
    uint bitwiseValue62 = (((16u * bitwiseValue) + 1120u) + 0u) >> 2u;
    uint bitwiseValue63 = (((16u * bitwiseValue) + 1120u) + 8u) >> 2u;
    uint bitwiseValue64 = (((16u * bitwiseValue) + 1120u) + 12u) >> 2u;
    float multiplyAddValue54 = fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue60], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue59], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue58], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue57]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue56], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue55], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue54], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue53]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue52], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue51], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue50], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue49]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue64], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue63], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue62], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue61])));
    float multiplyAddValue55 = fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue60], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue59], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue58], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue57]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue56], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue55], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue54], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue53]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue52], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue51], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue50], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue49]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue64], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue63], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue62], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue61])));
    float multiplyAddValue56 = fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue60], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue59], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue58], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue57]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue56], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue55], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue54], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue53]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue52], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue51], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue50], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue49]))) * vertexPosition0.y)) + fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue64], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue63], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue62], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue61])));
    varyingTexCoord4.x = multiplyAddValue54;
    varyingTexCoord4.y = multiplyAddValue55;
    varyingTexCoord4.z = multiplyAddValue56;
    float multiplyAddValue57 = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[100u].z, vertexVectorConstants0.packedValues[100u].x);
    float multiplyAddValue58 = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[100u].w, vertexVectorConstants0.packedValues[100u].y);
    varyingTexCoord0.x = multiplyAddValue57;
    varyingTexCoord0.y = multiplyAddValue58;
    uint productValue6 = uint(int(vertexColor0.w * 255.0)) + 28u;
    varyingTexCoord2.x = fma(vertexVectorConstants0.packedValues[productValue6].z, multiplyAddValue57, vertexVectorConstants0.packedValues[productValue6].x);
    varyingTexCoord2.y = fma(vertexVectorConstants0.packedValues[productValue6].w, multiplyAddValue58, vertexVectorConstants0.packedValues[productValue6].y);
    varyingTexCoord2.z = fma(vertexVectorConstants0.packedValues[28u].z, multiplyAddValue57, vertexVectorConstants0.packedValues[28u].x);
    varyingTexCoord2.w = fma(vertexVectorConstants0.packedValues[28u].w, multiplyAddValue58, vertexVectorConstants0.packedValues[28u].y);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingNormal0.x = fma(multiplyAddValue26, vertexNormal0.z, fma(multiplyAddValue23, vertexNormal0.x, multiplyAddValue20 * vertexNormal0.y));
    varyingNormal0.y = fma(multiplyAddValue27, vertexNormal0.z, fma(multiplyAddValue24, vertexNormal0.x, multiplyAddValue21 * vertexNormal0.y));
    varyingNormal0.z = fma(multiplyAddValue28, vertexNormal0.z, fma(multiplyAddValue25, vertexNormal0.x, multiplyAddValue22 * vertexNormal0.y));
    varyingTangent0.x = fma(multiplyAddValue26, vertexTangent0.z, fma(multiplyAddValue23, vertexTangent0.x, multiplyAddValue20 * vertexTangent0.y));
    varyingTangent0.y = fma(multiplyAddValue27, vertexTangent0.z, fma(multiplyAddValue24, vertexTangent0.x, multiplyAddValue21 * vertexTangent0.y));
    varyingTangent0.z = fma(multiplyAddValue28, vertexTangent0.z, fma(multiplyAddValue25, vertexTangent0.x, multiplyAddValue22 * vertexTangent0.y));
    uint bitwiseValue17 = (((16u * bitwiseValue) + 1200u) + 4u) >> 2u;
    uint bitwiseValue18 = (((16u * bitwiseValue) + 1200u) + 0u) >> 2u;
    uint bitwiseValue19 = (((16u * bitwiseValue) + 1200u) + 8u) >> 2u;
    uint bitwiseValue20 = (((16u * bitwiseValue) + 1200u) + 12u) >> 2u;
    uint bitwiseValue21 = (((16u * bitwiseValue) + 1184u) + 4u) >> 2u;
    uint bitwiseValue22 = (((16u * bitwiseValue) + 1184u) + 0u) >> 2u;
    uint bitwiseValue23 = (((16u * bitwiseValue) + 1184u) + 8u) >> 2u;
    uint bitwiseValue24 = (((16u * bitwiseValue) + 1184u) + 12u) >> 2u;
    uint bitwiseValue25 = (((16u * bitwiseValue) + 1216u) + 4u) >> 2u;
    uint bitwiseValue26 = (((16u * bitwiseValue) + 1216u) + 0u) >> 2u;
    uint bitwiseValue27 = (((16u * bitwiseValue) + 1216u) + 8u) >> 2u;
    uint bitwiseValue28 = (((16u * bitwiseValue) + 1216u) + 12u) >> 2u;
    uint bitwiseValue29 = (((16u * bitwiseValue) + 1232u) + 4u) >> 2u;
    uint bitwiseValue30 = (((16u * bitwiseValue) + 1232u) + 0u) >> 2u;
    uint bitwiseValue31 = (((16u * bitwiseValue) + 1232u) + 8u) >> 2u;
    uint bitwiseValue32 = (((16u * bitwiseValue) + 1232u) + 12u) >> 2u;
    float multiplyAddValue91 = fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue30], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue29]))) + fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue26], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue25]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue22], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue21]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].x, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[26u].x, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[24u].x, vertexScalarConstants0.packedValues[bitwiseValue18], vertexVectorConstants0.packedValues[25u].x * vertexScalarConstants0.packedValues[bitwiseValue17]))) * vertexPosition0.y));
    float multiplyAddValue92 = fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue30], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue29]))) + fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue26], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue25]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue22], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue21]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].y, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[26u].y, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[24u].y, vertexScalarConstants0.packedValues[bitwiseValue18], vertexVectorConstants0.packedValues[25u].y * vertexScalarConstants0.packedValues[bitwiseValue17]))) * vertexPosition0.y));
    float multiplyAddValue93 = fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue32], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue31], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue30], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue29]))) + fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue28], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue27], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue26], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue25]))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue24], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue23], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue22], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue21]))), vertexPosition0.x, fma(vertexVectorConstants0.packedValues[27u].z, vertexScalarConstants0.packedValues[bitwiseValue20], fma(vertexVectorConstants0.packedValues[26u].z, vertexScalarConstants0.packedValues[bitwiseValue19], fma(vertexVectorConstants0.packedValues[24u].z, vertexScalarConstants0.packedValues[bitwiseValue18], vertexVectorConstants0.packedValues[25u].z * vertexScalarConstants0.packedValues[bitwiseValue17]))) * vertexPosition0.y));
    varyingTexCoord4.x = multiplyAddValue91;
    varyingTexCoord4.y = multiplyAddValue92;
    varyingTexCoord4.z = multiplyAddValue93;
    float multiplyAddValue39 = fma(vertexTexCoord0.x, vertexVectorConstants0.packedValues[107u].z, vertexVectorConstants0.packedValues[107u].x);
    float multiplyAddValue40 = fma(vertexTexCoord0.y, vertexVectorConstants0.packedValues[107u].w, vertexVectorConstants0.packedValues[107u].y);
    varyingTexCoord0.x = multiplyAddValue39;
    varyingTexCoord0.y = multiplyAddValue40;
    uint sumValue4 = productValue2 + 35u;
    varyingTexCoord2.x = fma(vertexVectorConstants0.packedValues[sumValue4].z, multiplyAddValue39, vertexVectorConstants0.packedValues[sumValue4].x);
    varyingTexCoord2.y = fma(vertexVectorConstants0.packedValues[sumValue4].w, multiplyAddValue40, vertexVectorConstants0.packedValues[sumValue4].y);
    varyingTexCoord2.z = fma(vertexVectorConstants0.packedValues[35u].z, multiplyAddValue39, vertexVectorConstants0.packedValues[35u].x);
    varyingTexCoord2.w = fma(vertexVectorConstants0.packedValues[35u].w, multiplyAddValue40, vertexVectorConstants0.packedValues[35u].y);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = fma(multiplyAddValue2, vertexNormal0.z, fma(multiplyAddValue1, vertexNormal0.y, multiplyAddValue * vertexNormal0.x));
    varyingNormal0.y = fma(multiplyAddValue5, vertexNormal0.z, fma(multiplyAddValue4, vertexNormal0.y, multiplyAddValue3 * vertexNormal0.x));
    varyingNormal0.z = fma(multiplyAddValue8, vertexNormal0.z, fma(multiplyAddValue7, vertexNormal0.y, multiplyAddValue6 * vertexNormal0.x));
    varyingTexCoord4.x = fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue8].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue7].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue6].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue9].x)));
    varyingTexCoord4.y = fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue8].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue7].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue6].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue9].x)));
    varyingTexCoord4.z = fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue8].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue7].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue6].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue9].x)));
    varyingTangent0.x = fma(multiplyAddValue2, vertexTangent0.z, fma(multiplyAddValue1, vertexTangent0.y, multiplyAddValue * vertexTangent0.x));
    varyingTangent0.y = fma(multiplyAddValue5, vertexTangent0.z, fma(multiplyAddValue4, vertexTangent0.y, multiplyAddValue3 * vertexTangent0.x));
    varyingTangent0.z = fma(multiplyAddValue8, vertexTangent0.z, fma(multiplyAddValue7, vertexTangent0.y, multiplyAddValue6 * vertexTangent0.x));
    varyingTexCoord0.x = productValue;
    varyingTexCoord0.y = productValue1;
    varyingTexCoord2.x = (vertexVectorConstants0.packedValues[sumValue4].z * productValue) + vertexVectorConstants0.packedValues[sumValue4].x;
    varyingTexCoord2.y = (vertexVectorConstants0.packedValues[sumValue4].w * productValue1) + vertexVectorConstants0.packedValues[sumValue4].y;
    varyingTexCoord2.z = (vertexVectorConstants0.packedValues[35u].z * productValue) + vertexVectorConstants0.packedValues[35u].x;
    varyingTexCoord2.w = (vertexVectorConstants0.packedValues[35u].w * productValue1) + vertexVectorConstants0.packedValues[35u].y;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = fma(multiplyAddValue61, vertexNormal0.z, fma(multiplyAddValue60, vertexNormal0.y, multiplyAddValue59 * vertexNormal0.x));
    varyingNormal0.y = fma(multiplyAddValue64, vertexNormal0.z, fma(multiplyAddValue63, vertexNormal0.y, multiplyAddValue62 * vertexNormal0.x));
    varyingNormal0.z = fma(multiplyAddValue67, vertexNormal0.z, fma(multiplyAddValue66, vertexNormal0.y, multiplyAddValue65 * vertexNormal0.x));
    varyingTexCoord4.x = fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue20].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue20].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue20].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue20].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue19].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue19].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue19].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue19].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue18].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue18].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue18].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue18].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue21].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue21].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue21].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue21].x)));
    varyingTexCoord4.y = fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue20].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue20].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue20].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue20].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue19].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue19].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue19].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue19].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue18].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue18].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue18].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue18].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue21].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue21].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue21].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue21].x)));
    varyingTexCoord4.z = fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue20].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue20].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue20].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue20].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue19].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue19].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue19].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue19].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue18].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue18].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue18].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue18].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue21].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue21].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue21].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue21].x)));
    varyingTangent0.x = fma(multiplyAddValue61, vertexTangent0.z, fma(multiplyAddValue60, vertexTangent0.y, multiplyAddValue59 * vertexTangent0.x));
    varyingTangent0.y = fma(multiplyAddValue64, vertexTangent0.z, fma(multiplyAddValue63, vertexTangent0.y, multiplyAddValue62 * vertexTangent0.x));
    varyingTangent0.z = fma(multiplyAddValue67, vertexTangent0.z, fma(multiplyAddValue66, vertexTangent0.y, multiplyAddValue65 * vertexTangent0.x));
    varyingTexCoord0.x = productValue7;
    varyingTexCoord0.y = productValue8;
    varyingTexCoord2.x = (vertexVectorConstants0.packedValues[productValue6].z * productValue7) + vertexVectorConstants0.packedValues[productValue6].x;
    varyingTexCoord2.y = (vertexVectorConstants0.packedValues[productValue6].w * productValue8) + vertexVectorConstants0.packedValues[productValue6].y;
    varyingTexCoord2.z = (vertexVectorConstants0.packedValues[28u].z * productValue7) + vertexVectorConstants0.packedValues[28u].x;
    varyingTexCoord2.w = (vertexVectorConstants0.packedValues[28u].w * productValue8) + vertexVectorConstants0.packedValues[28u].y;
    varyingTexCoord3.x = multiplyAddValue68;
    varyingTexCoord3.y = multiplyAddValue69;
    varyingTexCoord3.z = multiplyAddValue70;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = fma(multiplyAddValue2, vertexNormal0.z, fma(multiplyAddValue1, vertexNormal0.y, multiplyAddValue * vertexNormal0.x));
    varyingNormal0.y = fma(multiplyAddValue5, vertexNormal0.z, fma(multiplyAddValue4, vertexNormal0.y, multiplyAddValue3 * vertexNormal0.x));
    varyingNormal0.z = fma(multiplyAddValue8, vertexNormal0.z, fma(multiplyAddValue7, vertexNormal0.y, multiplyAddValue6 * vertexNormal0.x));
    varyingTexCoord4.x = fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue8].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue7].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue6].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue9].x)));
    varyingTexCoord4.y = fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue8].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue7].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue6].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue9].x)));
    varyingTexCoord4.z = fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue8].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue8].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue8].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue8].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue7].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue7].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue7].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue7].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue6].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue6].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue6].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue6].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue9].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue9].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue9].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue9].x)));
    varyingTangent0.x = fma(multiplyAddValue2, vertexTangent0.z, fma(multiplyAddValue1, vertexTangent0.y, multiplyAddValue * vertexTangent0.x));
    varyingTangent0.y = fma(multiplyAddValue5, vertexTangent0.z, fma(multiplyAddValue4, vertexTangent0.y, multiplyAddValue3 * vertexTangent0.x));
    varyingTangent0.z = fma(multiplyAddValue8, vertexTangent0.z, fma(multiplyAddValue7, vertexTangent0.y, multiplyAddValue6 * vertexTangent0.x));
    varyingTexCoord0.x = productValue;
    varyingTexCoord0.y = productValue1;
    varyingTexCoord2.x = (vertexVectorConstants0.packedValues[sumValue4].z * productValue) + vertexVectorConstants0.packedValues[sumValue4].x;
    varyingTexCoord2.y = (vertexVectorConstants0.packedValues[sumValue4].w * productValue1) + vertexVectorConstants0.packedValues[sumValue4].y;
    varyingTexCoord2.z = (vertexVectorConstants0.packedValues[35u].z * productValue) + vertexVectorConstants0.packedValues[35u].x;
    varyingTexCoord2.w = (vertexVectorConstants0.packedValues[35u].w * productValue1) + vertexVectorConstants0.packedValues[35u].y;
    varyingTexCoord3.x = multiplyAddValue79;
    varyingTexCoord3.y = multiplyAddValue80;
    varyingTexCoord3.z = multiplyAddValue81;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TINTING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = fma(multiplyAddValue61, vertexNormal0.z, fma(multiplyAddValue60, vertexNormal0.y, multiplyAddValue59 * vertexNormal0.x));
    varyingNormal0.y = fma(multiplyAddValue64, vertexNormal0.z, fma(multiplyAddValue63, vertexNormal0.y, multiplyAddValue62 * vertexNormal0.x));
    varyingNormal0.z = fma(multiplyAddValue67, vertexNormal0.z, fma(multiplyAddValue66, vertexNormal0.y, multiplyAddValue65 * vertexNormal0.x));
    varyingTexCoord4.x = fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue20].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue20].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue20].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue20].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue19].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue19].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue19].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue19].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue18].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue18].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue18].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue18].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].x, vertexVectorConstants0.packedValues[sumValue21].w, fma(vertexVectorConstants0.packedValues[26u].x, vertexVectorConstants0.packedValues[sumValue21].z, fma(vertexVectorConstants0.packedValues[25u].x, vertexVectorConstants0.packedValues[sumValue21].y, vertexVectorConstants0.packedValues[24u].x * vertexVectorConstants0.packedValues[sumValue21].x)));
    varyingTexCoord4.y = fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue20].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue20].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue20].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue20].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue19].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue19].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue19].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue19].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue18].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue18].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue18].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue18].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].y, vertexVectorConstants0.packedValues[sumValue21].w, fma(vertexVectorConstants0.packedValues[26u].y, vertexVectorConstants0.packedValues[sumValue21].z, fma(vertexVectorConstants0.packedValues[25u].y, vertexVectorConstants0.packedValues[sumValue21].y, vertexVectorConstants0.packedValues[24u].y * vertexVectorConstants0.packedValues[sumValue21].x)));
    varyingTexCoord4.z = fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue20].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue20].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue20].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue20].x))), vertexPosition0.z, fma(fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue19].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue19].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue19].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue19].x))), vertexPosition0.y, fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue18].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue18].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue18].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue18].x))) * vertexPosition0.x)) + fma(vertexVectorConstants0.packedValues[27u].z, vertexVectorConstants0.packedValues[sumValue21].w, fma(vertexVectorConstants0.packedValues[26u].z, vertexVectorConstants0.packedValues[sumValue21].z, fma(vertexVectorConstants0.packedValues[25u].z, vertexVectorConstants0.packedValues[sumValue21].y, vertexVectorConstants0.packedValues[24u].z * vertexVectorConstants0.packedValues[sumValue21].x)));
    varyingTangent0.x = fma(multiplyAddValue61, vertexTangent0.z, fma(multiplyAddValue60, vertexTangent0.y, multiplyAddValue59 * vertexTangent0.x));
    varyingTangent0.y = fma(multiplyAddValue64, vertexTangent0.z, fma(multiplyAddValue63, vertexTangent0.y, multiplyAddValue62 * vertexTangent0.x));
    varyingTangent0.z = fma(multiplyAddValue67, vertexTangent0.z, fma(multiplyAddValue66, vertexTangent0.y, multiplyAddValue65 * vertexTangent0.x));
    varyingTexCoord0.x = productValue7;
    varyingTexCoord0.y = productValue8;
    varyingTexCoord2.x = (vertexVectorConstants0.packedValues[productValue6].z * productValue7) + vertexVectorConstants0.packedValues[productValue6].x;
    varyingTexCoord2.y = (vertexVectorConstants0.packedValues[productValue6].w * productValue8) + vertexVectorConstants0.packedValues[productValue6].y;
    varyingTexCoord2.z = (vertexVectorConstants0.packedValues[28u].z * productValue7) + vertexVectorConstants0.packedValues[28u].x;
    varyingTexCoord2.w = (vertexVectorConstants0.packedValues[28u].w * productValue8) + vertexVectorConstants0.packedValues[28u].y;
    varyingTexCoord3.x = multiplyAddValue79;
    varyingTexCoord3.y = multiplyAddValue80;
    varyingTexCoord3.z = multiplyAddValue81;
#endif
}
