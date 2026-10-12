#version 460
#extension GL_GOOGLE_include_directive : require
// StandardRed / Opaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 6
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 6
#endif

#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/StandardRed/VertexBindings.glsli"

#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[11u].x;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[11u].y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[11u].z;
    precise float productValue3 = multiplyAddValue4 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue4 = multiplyAddValue4 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue5 = multiplyAddValue4 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue6 = multiplyAddValue4 * vertexVectorConstants0.packedValues[5u].w;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue3, productValue3)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue3, productValue4)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue3, productValue5)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue3, productValue6)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = multiplyAddValue6;
    gl_Position.y = multiplyAddValue7;
    gl_Position.z = multiplyAddValue8;
    gl_Position.w = multiplyAddValue9;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue14 = scalarValue * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue15 = scalarValue * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue16 = scalarValue * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue17 = scalarValue * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue1, productValue14)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue1, productValue15)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue1, productValue16)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue1, productValue17)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = multiplyAddValue20;
    gl_Position.y = multiplyAddValue21;
    gl_Position.z = multiplyAddValue22;
    gl_Position.w = multiplyAddValue23;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue17 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue18 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue19 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue7 = vertexNormal0.y * vertexVectorConstants0.packedValues[25u].x;
    precise float productValue8 = vertexNormal0.y * vertexVectorConstants0.packedValues[25u].y;
    precise float productValue9 = vertexNormal0.y * vertexVectorConstants0.packedValues[25u].z;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[26u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[24u].x, vertexNormal0.x, productValue7));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[26u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[24u].y, vertexNormal0.x, productValue8));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[26u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[24u].z, vertexNormal0.x, productValue9));
    precise float productValue10 = multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue11 = multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue12 = multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue13 = multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].w;
    varyingTexCoord3.x = multiplyAddValue3;
    varyingTexCoord3.y = multiplyAddValue4;
    varyingTexCoord3.z = multiplyAddValue5;
    precise float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue3, productValue10)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue3, productValue11)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue3, productValue12)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue3, productValue13)) + vertexVectorConstants0.packedValues[3u].w;
    varyingColor1.x = multiplyAddValue10;
    varyingColor1.y = multiplyAddValue11;
    varyingColor1.z = multiplyAddValue12;
    varyingColor1.w = multiplyAddValue13;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue18 = vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue19 = vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue20 = vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z;
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, productValue18));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, productValue19));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, productValue20));
    precise float productValue21 = scalarValue * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue22 = scalarValue * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue23 = scalarValue * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue24 = scalarValue * vertexVectorConstants0.packedValues[1u].w;
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    precise float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, productValue21)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, productValue22)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, productValue23)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue1, productValue24)) + vertexVectorConstants0.packedValues[3u].w;
    varyingColor1.x = multiplyAddValue24;
    varyingColor1.y = multiplyAddValue25;
    varyingColor1.z = multiplyAddValue26;
    varyingColor1.w = multiplyAddValue27;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[26u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[24u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[25u].x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[26u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[24u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[25u].y));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[26u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[24u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[25u].z));
    varyingTexCoord3.x = multiplyAddValue14;
    varyingTexCoord3.y = multiplyAddValue15;
    varyingTexCoord3.z = multiplyAddValue16;
    varyingColor1.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    varyingColor1.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    varyingColor1.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    varyingColor1.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z));
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    varyingColor1.x = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    varyingColor1.y = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    varyingColor1.z = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    varyingColor1.w = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[26u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[25u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[24u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[26u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[25u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[24u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[26u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[25u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[24u].z * vertexNormal0.x));
    varyingColor1.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    varyingColor1.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    varyingColor1.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    varyingColor1.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
    varyingColor1.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    varyingColor1.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    varyingColor1.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    varyingColor1.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingTexCoord3.x = multiplyAddValue17;
    varyingTexCoord3.y = multiplyAddValue18;
    varyingTexCoord3.z = multiplyAddValue19;
#endif
}
