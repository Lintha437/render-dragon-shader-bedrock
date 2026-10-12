#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunkPrepass / DepthOnlyOpaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_DITHERING
#define RD_FEATURE_DITHERING RD_OFF
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_FEATURE_RENDER_AS_BILLBOARDS
#define RD_FEATURE_RENDER_AS_BILLBOARDS RD_OFF
#endif
#ifndef RD_FEATURE_SEASONS
#define RD_FEATURE_SEASONS RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
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

#include "../../include/materials/RenderChunkPrepass/VertexBindings.glsli"

#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[7u].z;
    precise float productValue3 = multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue4 = multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue5 = multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue6 = multiplyAddValue4 * vertexVectorConstants0.packedValues[1u].w;
    varyingTexCoord3.x = multiplyAddValue3;
    varyingTexCoord3.y = multiplyAddValue4;
    varyingTexCoord3.z = multiplyAddValue5;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue3, productValue3)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue3, productValue4)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue3, productValue5)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue3, productValue6)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue6;
    gl_Position.y = multiplyAddValue7;
    gl_Position.z = multiplyAddValue8;
    gl_Position.w = multiplyAddValue9;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[7u].z;
    precise float sumValue9 = multiplyAddValue3 + 0.5;
    precise float sumValue10 = multiplyAddValue4 + 0.5;
    precise float sumValue11 = multiplyAddValue5 + 0.5;
    varyingTexCoord3.x = multiplyAddValue3;
    varyingTexCoord3.y = multiplyAddValue4;
    varyingTexCoord3.z = multiplyAddValue5;
    precise float sumValue12 = sumValue11 - vertexVectorConstants0.packedValues[20u].z;
    precise float sumValue13 = sumValue9 - vertexVectorConstants0.packedValues[20u].x;
    precise float sumValue14 = sumValue10 - vertexVectorConstants0.packedValues[20u].y;
    vec3 vectorValue = vec3(sumValue12, sumValue13, sumValue14);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue15 = inverseLengthValue2 * sumValue12;
    precise float productValue16 = inverseLengthValue2 * sumValue13;
    precise float productValue17 = inverseLengthValue2 * sumValue14;
    precise float productValue18 = productValue17 * 0.0;
    precise float productValue19 = productValue15 * 0.0;
    precise float productValue20 = productValue16 * 1.0;
    float multiplyAddValue16 = fma(productValue15, 1.0, -productValue18);
    float multiplyAddValue17 = fma(productValue17, 0.0, -productValue20);
    vec2 vectorValue1 = vec2(multiplyAddValue16, multiplyAddValue17);
    float inverseLengthValue3 = inversesqrt(rdDot2Precise(vectorValue1, vectorValue1));
    precise float productValue21 = inverseLengthValue3 * multiplyAddValue16;
    precise float multiplyAddValue18 = inverseLengthValue3 * fma(productValue16, 0.0, -productValue19);
    precise float productValue22 = inverseLengthValue3 * multiplyAddValue17;
    precise float productValue23 = productValue15 * multiplyAddValue18;
    precise float productValue24 = productValue16 * productValue22;
    precise float productValue25 = productValue17 * productValue21;
    precise float sumValue15 = vertexColor0.z - 0.5;
    precise float sumValue16 = vertexColor0.x - 0.5;
    precise float productValue26 = productValue21 * sumValue16;
    precise float productValue27 = multiplyAddValue18 * sumValue16;
    precise float productValue28 = productValue22 * sumValue16;
    precise float multiplyAddValue19 = sumValue9 - fma(fma(productValue17, productValue22, -productValue23), sumValue15, productValue26);
    precise float multiplyAddValue20 = sumValue10 - fma(fma(productValue15, productValue21, -productValue24), sumValue15, productValue27);
    precise float multiplyAddValue21 = sumValue11 - fma(fma(productValue16, multiplyAddValue18, -productValue25), sumValue15, productValue28);
    precise float productValue29 = multiplyAddValue20 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue30 = multiplyAddValue20 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue31 = multiplyAddValue20 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue32 = multiplyAddValue20 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue19, productValue29)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue19, productValue30)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue19, productValue31)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue19, productValue32)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue22;
    gl_Position.y = multiplyAddValue23;
    gl_Position.z = multiplyAddValue24;
    gl_Position.w = multiplyAddValue25;
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
    precise float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue2, productValue38)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue2, productValue39)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue2, productValue40)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue3, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue2, productValue41)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue29;
    gl_Position.y = multiplyAddValue30;
    gl_Position.z = multiplyAddValue31;
    gl_Position.w = multiplyAddValue32;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue1 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float sumValue38 = scalarValue2 + 0.5;
    precise float sumValue39 = scalarValue1 + 0.5;
    precise float sumValue40 = scalarValue3 + 0.5;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    precise float sumValue41 = sumValue40 - vertexVectorConstants0.packedValues[4u].z;
    precise float sumValue42 = sumValue38 - vertexVectorConstants0.packedValues[4u].x;
    precise float sumValue43 = sumValue39 - vertexVectorConstants0.packedValues[4u].y;
    vec3 vectorValue7 = vec3(sumValue41, sumValue42, sumValue43);
    float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    precise float productValue55 = inverseLengthValue10 * sumValue41;
    precise float productValue56 = inverseLengthValue10 * sumValue42;
    precise float productValue57 = inverseLengthValue10 * sumValue43;
    precise float productValue58 = productValue57 * 0.0;
    precise float productValue59 = productValue55 * 0.0;
    precise float productValue60 = productValue56 * 1.0;
    float multiplyAddValue36 = fma(productValue55, 1.0, -productValue58);
    float multiplyAddValue37 = fma(productValue57, 0.0, -productValue60);
    vec2 vectorValue8 = vec2(multiplyAddValue36, multiplyAddValue37);
    float inverseLengthValue11 = inversesqrt(rdDot2Precise(vectorValue8, vectorValue8));
    precise float productValue61 = inverseLengthValue11 * multiplyAddValue36;
    precise float multiplyAddValue38 = inverseLengthValue11 * fma(productValue56, 0.0, -productValue59);
    precise float productValue62 = inverseLengthValue11 * multiplyAddValue37;
    precise float productValue63 = productValue55 * multiplyAddValue38;
    precise float productValue64 = productValue56 * productValue62;
    precise float productValue65 = productValue57 * productValue61;
    precise float sumValue15 = vertexColor0.z - 0.5;
    precise float sumValue16 = vertexColor0.x - 0.5;
    precise float productValue66 = productValue61 * sumValue16;
    precise float productValue67 = multiplyAddValue38 * sumValue16;
    precise float productValue68 = productValue62 * sumValue16;
    precise float multiplyAddValue39 = sumValue38 - fma(fma(productValue57, productValue62, -productValue63), sumValue15, productValue66);
    precise float multiplyAddValue40 = sumValue39 - fma(fma(productValue55, productValue61, -productValue64), sumValue15, productValue67);
    precise float multiplyAddValue41 = sumValue40 - fma(fma(productValue56, multiplyAddValue38, -productValue65), sumValue15, productValue68);
    precise float productValue69 = multiplyAddValue40 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue70 = multiplyAddValue40 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue71 = multiplyAddValue40 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue72 = multiplyAddValue40 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue39, productValue69)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue39, productValue70)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue39, productValue71)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue39, productValue72)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue42;
    gl_Position.y = multiplyAddValue43;
    gl_Position.z = multiplyAddValue44;
    gl_Position.w = multiplyAddValue45;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTexCoord3.x = multiplyAddValue10;
    varyingTexCoord3.y = multiplyAddValue11;
    varyingTexCoord3.z = multiplyAddValue12;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue10, multiplyAddValue11 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float sumValue17 = multiplyAddValue10 + 0.5;
    float sumValue18 = multiplyAddValue11 + 0.5;
    float sumValue19 = multiplyAddValue12 + 0.5;
    varyingTexCoord3.x = multiplyAddValue10;
    varyingTexCoord3.y = multiplyAddValue11;
    varyingTexCoord3.z = multiplyAddValue12;
    float sumValue20 = sumValue19 - vertexVectorConstants0.packedValues[20u].z;
    float sumValue21 = sumValue17 - vertexVectorConstants0.packedValues[20u].x;
    float sumValue22 = sumValue18 - vertexVectorConstants0.packedValues[20u].y;
    vec3 vectorValue2 = vec3(sumValue20, sumValue21, sumValue22);
    float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    float productValue33 = inverseLengthValue4 * sumValue20;
    float productValue34 = inverseLengthValue4 * sumValue21;
    float productValue35 = inverseLengthValue4 * sumValue22;
    float scalarValue = -productValue34;
    vec2 vectorValue3 = vec2(productValue33, scalarValue);
    float inverseLengthValue5 = inversesqrt(rdDot2Precise(vectorValue3, vectorValue3));
    float productValue36 = inverseLengthValue5 * productValue33;
    float productValue37 = inverseLengthValue5 * scalarValue;
    float sumValue23 = vertexColor0.z - 0.5;
    float sumValue24 = vertexColor0.x - 0.5;
    float multiplyAddValue26 = sumValue17 - fma(productValue35 * productValue37, sumValue23, productValue36 * sumValue24);
    float multiplyAddValue27 = sumValue18 - (fma(productValue33, productValue36, -(productValue34 * productValue37)) * sumValue23);
    float multiplyAddValue28 = sumValue19 - fma(-(productValue35 * productValue36), sumValue23, productValue37 * sumValue24);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue26, multiplyAddValue27 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue26, multiplyAddValue27 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue26, multiplyAddValue27 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue28, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue26, multiplyAddValue27 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
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
    float sumValue32 = scalarValue2 + 0.5;
    float sumValue33 = scalarValue1 + 0.5;
    float sumValue34 = scalarValue3 + 0.5;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    float sumValue35 = sumValue34 - vertexVectorConstants0.packedValues[4u].z;
    float sumValue36 = sumValue32 - vertexVectorConstants0.packedValues[4u].x;
    float sumValue37 = sumValue33 - vertexVectorConstants0.packedValues[4u].y;
    vec3 vectorValue5 = vec3(sumValue35, sumValue36, sumValue37);
    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue50 = inverseLengthValue8 * sumValue35;
    float productValue51 = inverseLengthValue8 * sumValue36;
    float productValue52 = inverseLengthValue8 * sumValue37;
    float scalarValue4 = -productValue51;
    vec2 vectorValue6 = vec2(productValue50, scalarValue4);
    float inverseLengthValue9 = inversesqrt(rdDot2Precise(vectorValue6, vectorValue6));
    float productValue53 = inverseLengthValue9 * productValue50;
    float productValue54 = inverseLengthValue9 * scalarValue4;
    float sumValue23 = vertexColor0.z - 0.5;
    float sumValue24 = vertexColor0.x - 0.5;
    float multiplyAddValue33 = sumValue32 - fma(productValue52 * productValue54, sumValue23, productValue53 * sumValue24);
    float multiplyAddValue34 = sumValue33 - (fma(productValue50, productValue53, -(productValue51 * productValue54)) * sumValue23);
    float multiplyAddValue35 = sumValue34 - fma(-(productValue52 * productValue53), sumValue23, productValue54 * sumValue24);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float sumValue = multiplyAddValue + 0.5;
    float sumValue1 = multiplyAddValue1 + 0.5;
    float sumValue2 = multiplyAddValue2 + 0.5;
    float sumValue3 = sumValue - vertexVectorConstants0.packedValues[20u].x;
    float sumValue4 = sumValue1 - vertexVectorConstants0.packedValues[20u].y;
    float sumValue5 = sumValue2 - vertexVectorConstants0.packedValues[20u].z;
    float inverseLengthValue = inversesqrt(dot(vec3(sumValue3, sumValue4, sumValue5), vec3(sumValue3, sumValue4, sumValue5)));
    float productValue7 = sumValue3 * inverseLengthValue;
    float productValue8 = sumValue5 * inverseLengthValue;
    float sumValue6 = (-0.0) - productValue7;
    float inverseLengthValue1 = inversesqrt(dot(vec3(productValue8, 0.0, sumValue6), vec3(productValue8, 0.0, sumValue6)));
    float productValue9 = inverseLengthValue1 * productValue8;
    float productValue10 = inverseLengthValue1 * sumValue6;
    float sumValue7 = vertexColor0.z + (-0.5);
    float productValue11 = (inverseLengthValue * sumValue7) * sumValue4;
    float sumValue8 = vertexColor0.x + (-0.5);
    float productValue12 = (sumValue - (productValue9 * sumValue8)) - (productValue10 * productValue11);
    float productValue13 = sumValue1 - (((productValue9 * productValue8) - (productValue10 * productValue7)) * sumValue7);
    float productValue14 = sumValue2 - ((productValue10 * sumValue8) - (productValue9 * productValue11));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, productValue14, fma(vertexVectorConstants0.packedValues[1u].x, productValue13, productValue12 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, productValue14, fma(vertexVectorConstants0.packedValues[1u].y, productValue13, productValue12 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, productValue14, fma(vertexVectorConstants0.packedValues[1u].z, productValue13, productValue12 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, productValue14, fma(vertexVectorConstants0.packedValues[1u].w, productValue13, productValue12 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue13 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue14 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue15 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue13 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue14 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue15 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue25 = multiplyAddValue13 + 0.5;
    float sumValue26 = multiplyAddValue14 + 0.5;
    float sumValue27 = multiplyAddValue15 + 0.5;
    float sumValue28 = sumValue25 - vertexVectorConstants0.packedValues[4u].x;
    float sumValue29 = sumValue26 - vertexVectorConstants0.packedValues[4u].y;
    float sumValue30 = sumValue27 - vertexVectorConstants0.packedValues[4u].z;
    float inverseLengthValue6 = inversesqrt(dot(vec3(sumValue28, sumValue29, sumValue30), vec3(sumValue28, sumValue29, sumValue30)));
    float productValue42 = sumValue28 * inverseLengthValue6;
    float productValue43 = sumValue30 * inverseLengthValue6;
    float sumValue31 = (-0.0) - productValue42;
    float inverseLengthValue7 = inversesqrt(dot(vec3(productValue43, 0.0, sumValue31), vec3(productValue43, 0.0, sumValue31)));
    float productValue44 = inverseLengthValue7 * productValue43;
    float productValue45 = inverseLengthValue7 * sumValue31;
    float sumValue7 = vertexColor0.z + (-0.5);
    float productValue46 = (inverseLengthValue6 * sumValue7) * sumValue29;
    float sumValue8 = vertexColor0.x + (-0.5);
    float productValue47 = (sumValue25 - (productValue44 * sumValue8)) - (productValue45 * productValue46);
    float productValue48 = sumValue26 - (((productValue44 * productValue43) - (productValue45 * productValue42)) * sumValue7);
    float productValue49 = sumValue27 - ((productValue45 * sumValue8) - (productValue44 * productValue46));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, productValue49, fma(vertexVectorConstants0.packedValues[1u].x, productValue48, productValue47 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, productValue49, fma(vertexVectorConstants0.packedValues[1u].y, productValue48, productValue47 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, productValue49, fma(vertexVectorConstants0.packedValues[1u].z, productValue48, productValue47 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, productValue49, fma(vertexVectorConstants0.packedValues[1u].w, productValue48, productValue47 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
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
    varyingNormal0.x = 0.0;
    varyingNormal0.y = 0.0;
    varyingNormal0.z = 0.0;
    varyingTangent0.x = 0.0;
    varyingTangent0.y = 0.0;
    varyingTangent0.z = 0.0;
    varyingTexCoord0.x = -3.0517578125e-05;
    varyingTexCoord0.y = -3.0517578125e-05;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue13;
    varyingTexCoord3.y = multiplyAddValue14;
    varyingTexCoord3.z = multiplyAddValue15;
#endif
}
