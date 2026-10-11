#version 460
#extension GL_GOOGLE_include_directive : require
// SingleBlockForwardPBR / DepthOnlyOpaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_POINT_LIGHT_SHADING
#define RD_FEATURE_POINT_LIGHT_SHADING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 5
#endif

#if (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/SingleBlockForwardPBR/VertexBindings.glsli"

#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[7u].z;
    precise float productValue3 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue4 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue5 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue6 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].w;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue, productValue3)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue, productValue4)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue, productValue5)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue, productValue6)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue3;
    gl_Position.y = multiplyAddValue4;
    gl_Position.z = multiplyAddValue5;
    gl_Position.w = multiplyAddValue6;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[7u].z;
    precise float sumValue = multiplyAddValue + 0.5;
    precise float sumValue1 = multiplyAddValue1 + 0.5;
    precise float sumValue2 = multiplyAddValue2 + 0.5;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    precise float sumValue3 = sumValue2 - vertexVectorConstants0.packedValues[20u].z;
    precise float sumValue4 = sumValue - vertexVectorConstants0.packedValues[20u].x;
    precise float sumValue5 = sumValue1 - vertexVectorConstants0.packedValues[20u].y;
    vec3 vectorValue = vec3(sumValue3, sumValue4, sumValue5);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue7 = inverseLengthValue * sumValue3;
    precise float productValue8 = inverseLengthValue * sumValue4;
    precise float productValue9 = inverseLengthValue * sumValue5;
    precise float productValue10 = productValue9 * 0.0;
    precise float productValue11 = productValue7 * 0.0;
    precise float productValue12 = productValue8 * 1.0;
    float multiplyAddValue13 = fma(productValue7, 1.0, -productValue10);
    float multiplyAddValue14 = fma(productValue9, 0.0, -productValue12);
    vec2 vectorValue1 = vec2(multiplyAddValue13, multiplyAddValue14);
    float inverseLengthValue1 = inversesqrt(rdDot2Precise(vectorValue1, vectorValue1));
    precise float productValue13 = inverseLengthValue1 * multiplyAddValue13;
    precise float multiplyAddValue15 = inverseLengthValue1 * fma(productValue8, 0.0, -productValue11);
    precise float productValue14 = inverseLengthValue1 * multiplyAddValue14;
    precise float productValue15 = productValue7 * multiplyAddValue15;
    precise float productValue16 = productValue8 * productValue14;
    precise float productValue17 = productValue9 * productValue13;
    precise float sumValue6 = vertexColor0.z - 0.5;
    precise float sumValue7 = vertexColor0.x - 0.5;
    precise float productValue18 = productValue13 * sumValue7;
    precise float productValue19 = multiplyAddValue15 * sumValue7;
    precise float productValue20 = productValue14 * sumValue7;
    precise float multiplyAddValue16 = sumValue - fma(fma(productValue9, productValue14, -productValue15), sumValue6, productValue18);
    precise float multiplyAddValue17 = sumValue1 - fma(fma(productValue7, productValue13, -productValue16), sumValue6, productValue19);
    precise float multiplyAddValue18 = sumValue2 - fma(fma(productValue8, multiplyAddValue15, -productValue17), sumValue6, productValue20);
    precise float productValue21 = multiplyAddValue17 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue22 = multiplyAddValue17 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue23 = multiplyAddValue17 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue24 = multiplyAddValue17 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue16, productValue21)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue16, productValue22)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue16, productValue23)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue16, productValue24)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue19;
    gl_Position.y = multiplyAddValue20;
    gl_Position.z = multiplyAddValue21;
    gl_Position.w = multiplyAddValue22;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue1 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue38 = scalarValue1 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue39 = scalarValue1 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue40 = scalarValue1 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue41 = scalarValue1 * vertexVectorConstants0.packedValues[1u].w;
    float scalarValue2 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    precise float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue2, productValue38)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue2, productValue39)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue2, productValue40)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue2, productValue41)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue26;
    gl_Position.y = multiplyAddValue27;
    gl_Position.z = multiplyAddValue28;
    gl_Position.w = multiplyAddValue29;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue1 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float sumValue25 = scalarValue2 + 0.5;
    precise float sumValue26 = scalarValue1 + 0.5;
    precise float sumValue27 = scalarValue3 + 0.5;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    precise float sumValue28 = sumValue27 - vertexVectorConstants0.packedValues[4u].z;
    precise float sumValue29 = sumValue25 - vertexVectorConstants0.packedValues[4u].x;
    precise float sumValue30 = sumValue26 - vertexVectorConstants0.packedValues[4u].y;
    vec3 vectorValue5 = vec3(sumValue28, sumValue29, sumValue30);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    precise float productValue42 = inverseLengthValue6 * sumValue28;
    precise float productValue43 = inverseLengthValue6 * sumValue29;
    precise float productValue44 = inverseLengthValue6 * sumValue30;
    precise float productValue45 = productValue44 * 0.0;
    precise float productValue46 = productValue42 * 0.0;
    precise float productValue47 = productValue43 * 1.0;
    float multiplyAddValue33 = fma(productValue42, 1.0, -productValue45);
    float multiplyAddValue34 = fma(productValue44, 0.0, -productValue47);
    vec2 vectorValue6 = vec2(multiplyAddValue33, multiplyAddValue34);
    float inverseLengthValue7 = inversesqrt(rdDot2Precise(vectorValue6, vectorValue6));
    precise float productValue48 = inverseLengthValue7 * multiplyAddValue33;
    precise float multiplyAddValue35 = inverseLengthValue7 * fma(productValue43, 0.0, -productValue46);
    precise float productValue49 = inverseLengthValue7 * multiplyAddValue34;
    precise float productValue50 = productValue42 * multiplyAddValue35;
    precise float productValue51 = productValue43 * productValue49;
    precise float productValue52 = productValue44 * productValue48;
    precise float sumValue6 = vertexColor0.z - 0.5;
    precise float sumValue7 = vertexColor0.x - 0.5;
    precise float productValue53 = productValue48 * sumValue7;
    precise float productValue54 = multiplyAddValue35 * sumValue7;
    precise float productValue55 = productValue49 * sumValue7;
    precise float multiplyAddValue36 = sumValue25 - fma(fma(productValue44, productValue49, -productValue50), sumValue6, productValue53);
    precise float multiplyAddValue37 = sumValue26 - fma(fma(productValue42, productValue48, -productValue51), sumValue6, productValue54);
    precise float multiplyAddValue38 = sumValue27 - fma(fma(productValue43, multiplyAddValue35, -productValue52), sumValue6, productValue55);
    precise float productValue56 = multiplyAddValue37 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue57 = multiplyAddValue37 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue58 = multiplyAddValue37 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue59 = multiplyAddValue37 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue36, productValue56)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue36, productValue57)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue36, productValue58)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue36, productValue59)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue39;
    gl_Position.y = multiplyAddValue40;
    gl_Position.z = multiplyAddValue41;
    gl_Position.w = multiplyAddValue42;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
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
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float sumValue8 = multiplyAddValue7 + 0.5;
    float sumValue9 = multiplyAddValue8 + 0.5;
    float sumValue10 = multiplyAddValue9 + 0.5;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    float sumValue11 = sumValue10 - vertexVectorConstants0.packedValues[20u].z;
    float sumValue12 = sumValue8 - vertexVectorConstants0.packedValues[20u].x;
    float sumValue13 = sumValue9 - vertexVectorConstants0.packedValues[20u].y;
    vec3 vectorValue2 = vec3(sumValue11, sumValue12, sumValue13);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    float productValue25 = inverseLengthValue2 * sumValue11;
    float productValue26 = inverseLengthValue2 * sumValue12;
    float productValue27 = inverseLengthValue2 * sumValue13;
    float scalarValue = -productValue26;
    vec2 vectorValue3 = vec2(productValue25, scalarValue);
    float inverseLengthValue3 = inversesqrt(rdDot2Precise(vectorValue3, vectorValue3));
    float productValue28 = inverseLengthValue3 * productValue25;
    float productValue29 = inverseLengthValue3 * scalarValue;
    float sumValue14 = vertexColor0.z - 0.5;
    float sumValue15 = vertexColor0.x - 0.5;
    float multiplyAddValue23 = sumValue8 - fma(productValue27 * productValue29, sumValue14, productValue28 * sumValue15);
    float multiplyAddValue24 = sumValue9 - (fma(productValue25, productValue28, -(productValue26 * productValue29)) * sumValue14);
    float multiplyAddValue25 = sumValue10 - fma(-(productValue27 * productValue28), sumValue14, productValue29 * sumValue15);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue23, multiplyAddValue24 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue23, multiplyAddValue24 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue23, multiplyAddValue24 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue23, multiplyAddValue24 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue1 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue2 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue1 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float sumValue31 = scalarValue2 + 0.5;
    float sumValue32 = scalarValue1 + 0.5;
    float sumValue33 = scalarValue3 + 0.5;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    float sumValue34 = sumValue33 - vertexVectorConstants0.packedValues[4u].z;
    float sumValue35 = sumValue31 - vertexVectorConstants0.packedValues[4u].x;
    float sumValue36 = sumValue32 - vertexVectorConstants0.packedValues[4u].y;
    vec3 vectorValue7 = vec3(sumValue34, sumValue35, sumValue36);
    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue60 = inverseLengthValue8 * sumValue34;
    float productValue61 = inverseLengthValue8 * sumValue35;
    float productValue62 = inverseLengthValue8 * sumValue36;
    float scalarValue4 = -productValue61;
    vec2 vectorValue8 = vec2(productValue60, scalarValue4);
    float inverseLengthValue9 = inversesqrt(rdDot2Precise(vectorValue8, vectorValue8));
    float productValue63 = inverseLengthValue9 * productValue60;
    float productValue64 = inverseLengthValue9 * scalarValue4;
    float sumValue14 = vertexColor0.z - 0.5;
    float sumValue15 = vertexColor0.x - 0.5;
    float multiplyAddValue43 = sumValue31 - fma(productValue62 * productValue64, sumValue14, productValue63 * sumValue15);
    float multiplyAddValue44 = sumValue32 - (fma(productValue60, productValue63, -(productValue61 * productValue64)) * sumValue14);
    float multiplyAddValue45 = sumValue33 - fma(-(productValue62 * productValue63), sumValue14, productValue64 * sumValue15);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float sumValue16 = multiplyAddValue10 + 0.5;
    float sumValue17 = multiplyAddValue11 + 0.5;
    float sumValue18 = multiplyAddValue12 + 0.5;
    float sumValue19 = sumValue16 - vertexVectorConstants0.packedValues[20u].x;
    float sumValue20 = sumValue17 - vertexVectorConstants0.packedValues[20u].y;
    float sumValue21 = sumValue18 - vertexVectorConstants0.packedValues[20u].z;
    float inverseLengthValue4 = inversesqrt(dot(vec3(sumValue19, sumValue20, sumValue21), vec3(sumValue19, sumValue20, sumValue21)));
    float productValue30 = sumValue19 * inverseLengthValue4;
    float productValue31 = sumValue21 * inverseLengthValue4;
    float sumValue22 = (-0.0) - productValue30;
    float inverseLengthValue5 = inversesqrt(dot(vec3(productValue31, 0.0, sumValue22), vec3(productValue31, 0.0, sumValue22)));
    float productValue32 = inverseLengthValue5 * productValue31;
    float productValue33 = inverseLengthValue5 * sumValue22;
    float sumValue23 = vertexColor0.z + (-0.5);
    float productValue34 = (inverseLengthValue4 * sumValue23) * sumValue20;
    float sumValue24 = vertexColor0.x + (-0.5);
    float productValue35 = (sumValue16 - (productValue32 * sumValue24)) - (productValue33 * productValue34);
    float productValue36 = sumValue17 - (((productValue32 * productValue31) - (productValue33 * productValue30)) * sumValue23);
    float productValue37 = sumValue18 - ((productValue33 * sumValue24) - (productValue32 * productValue34));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, productValue37, fma(vertexVectorConstants0.packedValues[1u].x, productValue36, productValue35 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, productValue37, fma(vertexVectorConstants0.packedValues[1u].y, productValue36, productValue35 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, productValue37, fma(vertexVectorConstants0.packedValues[1u].z, productValue36, productValue35 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, productValue37, fma(vertexVectorConstants0.packedValues[1u].w, productValue36, productValue35 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue30 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue31 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue32 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue32, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue31, multiplyAddValue30 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue32, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue31, multiplyAddValue30 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue32, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue31, multiplyAddValue30 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue32, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue31, multiplyAddValue30 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue30 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue31 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue32 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue37 = multiplyAddValue30 + 0.5;
    float sumValue38 = multiplyAddValue31 + 0.5;
    float sumValue39 = multiplyAddValue32 + 0.5;
    float sumValue40 = sumValue37 - vertexVectorConstants0.packedValues[4u].x;
    float sumValue41 = sumValue38 - vertexVectorConstants0.packedValues[4u].y;
    float sumValue42 = sumValue39 - vertexVectorConstants0.packedValues[4u].z;
    float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue40, sumValue41, sumValue42), vec3(sumValue40, sumValue41, sumValue42)));
    float productValue65 = sumValue40 * inverseLengthValue10;
    float productValue66 = sumValue42 * inverseLengthValue10;
    float sumValue43 = (-0.0) - productValue65;
    float inverseLengthValue11 = inversesqrt(dot(vec3(productValue66, 0.0, sumValue43), vec3(productValue66, 0.0, sumValue43)));
    float productValue67 = inverseLengthValue11 * productValue66;
    float productValue68 = inverseLengthValue11 * sumValue43;
    float sumValue23 = vertexColor0.z + (-0.5);
    float productValue69 = (inverseLengthValue10 * sumValue23) * sumValue41;
    float sumValue24 = vertexColor0.x + (-0.5);
    float productValue70 = (sumValue37 - (productValue67 * sumValue24)) - (productValue68 * productValue69);
    float productValue71 = sumValue38 - (((productValue67 * productValue66) - (productValue68 * productValue65)) * sumValue23);
    float productValue72 = sumValue39 - ((productValue68 * sumValue24) - (productValue67 * productValue69));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, productValue72, fma(vertexVectorConstants0.packedValues[1u].x, productValue71, productValue70 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, productValue72, fma(vertexVectorConstants0.packedValues[1u].y, productValue71, productValue70 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, productValue72, fma(vertexVectorConstants0.packedValues[1u].z, productValue71, productValue70 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, productValue72, fma(vertexVectorConstants0.packedValues[1u].w, productValue71, productValue70 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#endif
    varyingBitangent0.x = 0.0;
    varyingBitangent0.y = 0.0;
    varyingBitangent0.z = 0.0;
#if RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#elif RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#endif
    varyingTexCoord2.x = 0.0;
    varyingTexCoord2.y = 0.0;
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingNormal0.x = 0.0;
    varyingNormal0.y = 0.0;
    varyingNormal0.z = 0.0;
    varyingTangent0.x = 0.0;
    varyingTangent0.y = 0.0;
    varyingTangent0.z = 0.0;
    varyingTexCoord0.x = -3.0517578125e-05;
    varyingTexCoord0.y = -3.0517578125e-05;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue10;
    varyingTexCoord3.y = multiplyAddValue11;
    varyingTexCoord3.z = multiplyAddValue12;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue30;
    varyingTexCoord3.y = multiplyAddValue31;
    varyingTexCoord3.z = multiplyAddValue32;
#endif
}
