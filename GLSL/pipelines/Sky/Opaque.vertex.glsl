#version 460
#extension GL_GOOGLE_include_directive : require
// Sky / Opaque / vertex forward pipeline.
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
#define RD_BINDING_LAYOUT 0
#endif

#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/Sky/VertexBindings.glsli"

#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue4 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue5 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue6 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue4)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue5)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue6)) + vertexVectorConstants0.packedValues[7u].z;
    precise float productValue7 = multiplyAddValue11 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue8 = multiplyAddValue11 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue9 = multiplyAddValue11 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue10 = multiplyAddValue11 * vertexVectorConstants0.packedValues[1u].w;
    varyingTexCoord3.x = multiplyAddValue10;
    varyingTexCoord3.y = multiplyAddValue11;
    varyingTexCoord3.z = multiplyAddValue12;
    precise float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue10, productValue7)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue10, productValue8)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue10, productValue9)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue10, productValue10)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue13;
    gl_Position.y = multiplyAddValue14;
    gl_Position.z = multiplyAddValue15;
    gl_Position.w = multiplyAddValue16;
    precise float sumValue4 = vertexVectorConstants0.packedValues[20u].x - vertexVectorConstants0.packedValues[21u].x;
    precise float sumValue5 = vertexVectorConstants0.packedValues[20u].y - vertexVectorConstants0.packedValues[21u].y;
    precise float sumValue6 = vertexVectorConstants0.packedValues[20u].z - vertexVectorConstants0.packedValues[21u].z;
    precise float sumValue7 = vertexVectorConstants0.packedValues[20u].w - vertexVectorConstants0.packedValues[21u].w;
    varyingColor0.x = fma(vertexColor0, sumValue4, vertexVectorConstants0.packedValues[21u].x);
    varyingColor0.y = fma(vertexColor0, sumValue5, vertexVectorConstants0.packedValues[21u].y);
    varyingColor0.z = fma(vertexColor0, sumValue6, vertexVectorConstants0.packedValues[21u].z);
    varyingColor0.w = fma(vertexColor0, sumValue7, vertexVectorConstants0.packedValues[21u].w);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue = scalarValue * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue1 = scalarValue * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue2 = scalarValue * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue3 = scalarValue * vertexVectorConstants0.packedValues[1u].w;
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, productValue)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, productValue1)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, productValue2)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue1, productValue3)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue3;
    gl_Position.y = multiplyAddValue4;
    gl_Position.z = multiplyAddValue5;
    gl_Position.w = multiplyAddValue6;
    precise float sumValue = vertexVectorConstants0.packedValues[4u].x - vertexVectorConstants0.packedValues[5u].x;
    precise float sumValue1 = vertexVectorConstants0.packedValues[4u].y - vertexVectorConstants0.packedValues[5u].y;
    precise float sumValue2 = vertexVectorConstants0.packedValues[4u].z - vertexVectorConstants0.packedValues[5u].z;
    precise float sumValue3 = vertexVectorConstants0.packedValues[4u].w - vertexVectorConstants0.packedValues[5u].w;
    varyingColor0.x = fma(vertexColor0, sumValue, vertexVectorConstants0.packedValues[5u].x);
    varyingColor0.y = fma(vertexColor0, sumValue1, vertexVectorConstants0.packedValues[5u].y);
    varyingColor0.z = fma(vertexColor0, sumValue2, vertexVectorConstants0.packedValues[5u].z);
    varyingColor0.w = fma(vertexColor0, sumValue3, vertexVectorConstants0.packedValues[5u].w);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingColor0.x = fma(vertexColor0, vertexVectorConstants0.packedValues[20u].x - vertexVectorConstants0.packedValues[21u].x, vertexVectorConstants0.packedValues[21u].x);
    varyingColor0.y = fma(vertexColor0, vertexVectorConstants0.packedValues[20u].y - vertexVectorConstants0.packedValues[21u].y, vertexVectorConstants0.packedValues[21u].y);
    varyingColor0.z = fma(vertexColor0, vertexVectorConstants0.packedValues[20u].z - vertexVectorConstants0.packedValues[21u].z, vertexVectorConstants0.packedValues[21u].z);
    varyingColor0.w = fma(vertexColor0, vertexVectorConstants0.packedValues[20u].w - vertexVectorConstants0.packedValues[21u].w, vertexVectorConstants0.packedValues[21u].w);
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
    varyingColor0.x = fma(vertexColor0, vertexVectorConstants0.packedValues[4u].x - vertexVectorConstants0.packedValues[5u].x, vertexVectorConstants0.packedValues[5u].x);
    varyingColor0.y = fma(vertexColor0, vertexVectorConstants0.packedValues[4u].y - vertexVectorConstants0.packedValues[5u].y, vertexVectorConstants0.packedValues[5u].y);
    varyingColor0.z = fma(vertexColor0, vertexVectorConstants0.packedValues[4u].z - vertexVectorConstants0.packedValues[5u].z, vertexVectorConstants0.packedValues[5u].z);
    varyingColor0.w = fma(vertexColor0, vertexVectorConstants0.packedValues[4u].w - vertexVectorConstants0.packedValues[5u].w, vertexVectorConstants0.packedValues[5u].w);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingColor0.x = ((vertexVectorConstants0.packedValues[20u].x - vertexVectorConstants0.packedValues[21u].x) * vertexColor0.x) + vertexVectorConstants0.packedValues[21u].x;
    varyingColor0.y = ((vertexVectorConstants0.packedValues[20u].y - vertexVectorConstants0.packedValues[21u].y) * vertexColor0.x) + vertexVectorConstants0.packedValues[21u].y;
    varyingColor0.z = ((vertexVectorConstants0.packedValues[20u].z - vertexVectorConstants0.packedValues[21u].z) * vertexColor0.x) + vertexVectorConstants0.packedValues[21u].z;
    varyingColor0.w = ((vertexVectorConstants0.packedValues[20u].w - vertexVectorConstants0.packedValues[21u].w) * vertexColor0.x) + vertexVectorConstants0.packedValues[21u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue17 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue18 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue19 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue18, multiplyAddValue17 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingColor0.x = ((vertexVectorConstants0.packedValues[4u].x - vertexVectorConstants0.packedValues[5u].x) * vertexColor0.x) + vertexVectorConstants0.packedValues[5u].x;
    varyingColor0.y = ((vertexVectorConstants0.packedValues[4u].y - vertexVectorConstants0.packedValues[5u].y) * vertexColor0.x) + vertexVectorConstants0.packedValues[5u].y;
    varyingColor0.z = ((vertexVectorConstants0.packedValues[4u].z - vertexVectorConstants0.packedValues[5u].z) * vertexColor0.x) + vertexVectorConstants0.packedValues[5u].z;
    varyingColor0.w = ((vertexVectorConstants0.packedValues[4u].w - vertexVectorConstants0.packedValues[5u].w) * vertexColor0.x) + vertexVectorConstants0.packedValues[5u].w;
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue17;
    varyingTexCoord3.y = multiplyAddValue18;
    varyingTexCoord3.z = multiplyAddValue19;
#endif
}
