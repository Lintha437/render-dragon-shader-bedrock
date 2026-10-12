#version 460
#extension GL_GOOGLE_include_directive : require
// EndSkyForwardPBR / ForceForwardPBROpaque / vertex forward pipeline.
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

#include "../../include/materials/EndSkyForwardPBR/VertexBindings.glsli"

#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[7u].z;
    precise float productValue3 = multiplyAddValue7 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue4 = multiplyAddValue7 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue5 = multiplyAddValue7 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue6 = multiplyAddValue7 * vertexVectorConstants0.packedValues[1u].w;
    varyingTexCoord3.x = multiplyAddValue6;
    varyingTexCoord3.y = multiplyAddValue7;
    varyingTexCoord3.z = multiplyAddValue8;
    precise float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue6, productValue3)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue6, productValue4)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue6, productValue5)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue6, productValue6)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue9;
    gl_Position.y = multiplyAddValue10;
    gl_Position.z = multiplyAddValue11;
    gl_Position.w = multiplyAddValue12;
    varyingColor1.x = multiplyAddValue9;
    varyingColor1.y = multiplyAddValue10;
    varyingColor1.z = multiplyAddValue11;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue9 = scalarValue * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue10 = scalarValue * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue11 = scalarValue * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue12 = scalarValue * vertexVectorConstants0.packedValues[1u].w;
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    precise float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, productValue9)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, productValue10)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, productValue11)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue1, productValue12)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue27;
    gl_Position.y = multiplyAddValue28;
    gl_Position.z = multiplyAddValue29;
    gl_Position.w = multiplyAddValue30;
    varyingColor1.x = multiplyAddValue27;
    varyingColor1.y = multiplyAddValue28;
    varyingColor1.z = multiplyAddValue29;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTexCoord3.x = multiplyAddValue15;
    varyingTexCoord3.y = multiplyAddValue16;
    varyingTexCoord3.z = multiplyAddValue17;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.x = multiplyAddValue18;
    gl_Position.y = multiplyAddValue19;
    gl_Position.z = multiplyAddValue20;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingColor1.x = multiplyAddValue18;
    varyingColor1.y = multiplyAddValue19;
    varyingColor1.z = multiplyAddValue20;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.x = multiplyAddValue33;
    gl_Position.y = multiplyAddValue34;
    gl_Position.z = multiplyAddValue35;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingColor1.x = multiplyAddValue33;
    varyingColor1.y = multiplyAddValue34;
    varyingColor1.z = multiplyAddValue35;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.x = multiplyAddValue3;
    gl_Position.y = multiplyAddValue4;
    gl_Position.z = multiplyAddValue5;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingColor1.x = multiplyAddValue3;
    varyingColor1.y = multiplyAddValue4;
    varyingColor1.z = multiplyAddValue5;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue21 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue22 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue23 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.x = multiplyAddValue24;
    gl_Position.y = multiplyAddValue25;
    gl_Position.z = multiplyAddValue26;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingColor1.x = multiplyAddValue24;
    varyingColor1.y = multiplyAddValue25;
    varyingColor1.z = multiplyAddValue26;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue7 = vertexTexCoord0.y * vertexVectorConstants0.packedValues[21u].x;
    precise float productValue8 = vertexTexCoord0.y * vertexVectorConstants0.packedValues[21u].y;
    precise float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[20u].x, vertexTexCoord0.x, productValue7) + vertexVectorConstants0.packedValues[23u].x;
    precise float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[20u].y, vertexTexCoord0.x, productValue8) + vertexVectorConstants0.packedValues[23u].y;
    varyingTexCoord0.x = multiplyAddValue13;
    varyingTexCoord0.y = multiplyAddValue14;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue13 = vertexTexCoord0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue14 = vertexTexCoord0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[4u].x, vertexTexCoord0.x, productValue13) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[4u].y, vertexTexCoord0.x, productValue14) + vertexVectorConstants0.packedValues[7u].y;
    varyingTexCoord0.x = multiplyAddValue31;
    varyingTexCoord0.y = multiplyAddValue32;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord0.x = fma(vertexVectorConstants0.packedValues[20u].x, vertexTexCoord0.x, vertexTexCoord0.y * vertexVectorConstants0.packedValues[21u].x) + vertexVectorConstants0.packedValues[23u].x;
    varyingTexCoord0.y = fma(vertexVectorConstants0.packedValues[20u].y, vertexTexCoord0.x, vertexTexCoord0.y * vertexVectorConstants0.packedValues[21u].y) + vertexVectorConstants0.packedValues[23u].y;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord0.x = fma(vertexVectorConstants0.packedValues[4u].x, vertexTexCoord0.x, vertexTexCoord0.y * vertexVectorConstants0.packedValues[5u].x) + vertexVectorConstants0.packedValues[7u].x;
    varyingTexCoord0.y = fma(vertexVectorConstants0.packedValues[4u].y, vertexTexCoord0.x, vertexTexCoord0.y * vertexVectorConstants0.packedValues[5u].y) + vertexVectorConstants0.packedValues[7u].y;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = vertexVectorConstants0.packedValues[23u].x + fma(vertexVectorConstants0.packedValues[21u].x, vertexTexCoord0.y, vertexVectorConstants0.packedValues[20u].x * vertexTexCoord0.x);
    varyingTexCoord0.y = fma(vertexVectorConstants0.packedValues[21u].y, vertexTexCoord0.y, vertexVectorConstants0.packedValues[20u].y * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[23u].y;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = vertexVectorConstants0.packedValues[7u].x + fma(vertexVectorConstants0.packedValues[5u].x, vertexTexCoord0.y, vertexVectorConstants0.packedValues[4u].x * vertexTexCoord0.x);
    varyingTexCoord0.y = fma(vertexVectorConstants0.packedValues[5u].y, vertexTexCoord0.y, vertexVectorConstants0.packedValues[4u].y * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[7u].y;
    varyingTexCoord3.x = multiplyAddValue21;
    varyingTexCoord3.y = multiplyAddValue22;
    varyingTexCoord3.z = multiplyAddValue23;
#endif
}
