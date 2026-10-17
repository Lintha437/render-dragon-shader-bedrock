#version 460
#extension GL_GOOGLE_include_directive : require
// GlowInkSignForwardPBR / RasterizedAlphaTest / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_OPTION_ALPHA_TEST
#define RD_OPTION_ALPHA_TEST RD_ALPHA_TEST_ON_DISCARD_VALUE_BASED
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_LIT
#define RD_FEATURE_LIT RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_FEATURE_USE_TEXTURES
#define RD_FEATURE_USE_TEXTURES RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/GlowInkSignForwardPBR/VertexBindings.glsli"

#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue3, multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue3, multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue3, multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue3, multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    float multiplyAddValue6 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue7 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue8 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].z));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    float multiplyAddValue6 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue7 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue8 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue6, multiplyAddValue7 * vertexVectorConstants0.packedValues[5u].z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float productValue = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue1 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue2 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, productValue2, fma(vertexVectorConstants0.packedValues[5u].x, productValue1, vertexVectorConstants0.packedValues[4u].x * productValue));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, productValue2, fma(vertexVectorConstants0.packedValues[5u].y, productValue1, vertexVectorConstants0.packedValues[4u].y * productValue));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, productValue2, fma(vertexVectorConstants0.packedValues[5u].z, productValue1, vertexVectorConstants0.packedValues[4u].z * productValue));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue9 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue10 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue11 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float productValue = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue1 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue2 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue10, multiplyAddValue9 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, productValue2, fma(vertexVectorConstants0.packedValues[5u].x, productValue1, vertexVectorConstants0.packedValues[4u].x * productValue));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, productValue2, fma(vertexVectorConstants0.packedValues[5u].y, productValue1, vertexVectorConstants0.packedValues[4u].y * productValue));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, productValue2, fma(vertexVectorConstants0.packedValues[5u].z, productValue1, vertexVectorConstants0.packedValues[4u].z * productValue));
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord4.x = multiplyAddValue3;
    varyingTexCoord4.y = multiplyAddValue4;
    varyingTexCoord4.z = multiplyAddValue5;
    varyingTexCoord3.x = multiplyAddValue3;
    varyingTexCoord3.y = multiplyAddValue4;
    varyingTexCoord3.z = multiplyAddValue5;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].z));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord4.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    varyingTexCoord4.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    varyingTexCoord4.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[5u].z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord4.x = multiplyAddValue;
    varyingTexCoord4.y = multiplyAddValue1;
    varyingTexCoord4.z = multiplyAddValue2;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].z * vertexTangent0.x));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord4.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    varyingTexCoord4.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    varyingTexCoord4.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[4u].z * vertexTangent0.x));
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].y));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[5u].z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].z * vertexNormal0.x));
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[6u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[6u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[6u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[4u].z * vertexNormal0.x));
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
#endif
}
