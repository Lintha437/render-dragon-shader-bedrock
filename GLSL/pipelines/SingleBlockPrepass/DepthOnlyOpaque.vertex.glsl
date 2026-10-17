#version 460
#extension GL_GOOGLE_include_directive : require
// SingleBlockPrepass / DepthOnlyOpaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 12
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
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

#include "../../include/materials/SingleBlockPrepass/VertexBindings.glsli"

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
    precise float sumValue6 = vertexColor0.z - 0.5;
    precise float sumValue7 = vertexColor0.x - 0.5;
    precise float productValue66 = productValue61 * sumValue7;
    precise float productValue67 = multiplyAddValue38 * sumValue7;
    precise float productValue68 = productValue62 * sumValue7;
    precise float multiplyAddValue39 = sumValue38 - fma(fma(productValue57, productValue62, -productValue63), sumValue6, productValue66);
    precise float multiplyAddValue40 = sumValue39 - fma(fma(productValue55, productValue61, -productValue64), sumValue6, productValue67);
    precise float multiplyAddValue41 = sumValue40 - fma(fma(productValue56, multiplyAddValue38, -productValue65), sumValue6, productValue68);
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
    float sumValue25 = scalarValue2 + 0.5;
    float sumValue26 = scalarValue1 + 0.5;
    float sumValue27 = scalarValue3 + 0.5;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    float sumValue28 = sumValue27 - vertexVectorConstants0.packedValues[4u].z;
    float sumValue29 = sumValue25 - vertexVectorConstants0.packedValues[4u].x;
    float sumValue30 = sumValue26 - vertexVectorConstants0.packedValues[4u].y;
    vec3 vectorValue5 = vec3(sumValue28, sumValue29, sumValue30);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    float productValue42 = inverseLengthValue6 * sumValue28;
    float productValue43 = inverseLengthValue6 * sumValue29;
    float productValue44 = inverseLengthValue6 * sumValue30;
    float scalarValue4 = -productValue43;
    vec2 vectorValue6 = vec2(productValue42, scalarValue4);
    float inverseLengthValue7 = inversesqrt(rdDot2Precise(vectorValue6, vectorValue6));
    float productValue45 = inverseLengthValue7 * productValue42;
    float productValue46 = inverseLengthValue7 * scalarValue4;
    float sumValue14 = vertexColor0.z - 0.5;
    float sumValue15 = vertexColor0.x - 0.5;
    float multiplyAddValue33 = sumValue25 - fma(productValue44 * productValue46, sumValue14, productValue45 * sumValue15);
    float multiplyAddValue34 = sumValue26 - (fma(productValue42, productValue45, -(productValue43 * productValue46)) * sumValue14);
    float multiplyAddValue35 = sumValue27 - fma(-(productValue44 * productValue45), sumValue14, productValue46 * sumValue15);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue35, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue33, multiplyAddValue34 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
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
    float sumValue31 = multiplyAddValue30 + 0.5;
    float sumValue32 = multiplyAddValue31 + 0.5;
    float sumValue33 = multiplyAddValue32 + 0.5;
    float sumValue34 = sumValue31 - vertexVectorConstants0.packedValues[4u].x;
    float sumValue35 = sumValue32 - vertexVectorConstants0.packedValues[4u].y;
    float sumValue36 = sumValue33 - vertexVectorConstants0.packedValues[4u].z;
    float inverseLengthValue8 = inversesqrt(dot(vec3(sumValue34, sumValue35, sumValue36), vec3(sumValue34, sumValue35, sumValue36)));
    float productValue47 = sumValue34 * inverseLengthValue8;
    float productValue48 = sumValue36 * inverseLengthValue8;
    float sumValue37 = (-0.0) - productValue47;
    float inverseLengthValue9 = inversesqrt(dot(vec3(productValue48, 0.0, sumValue37), vec3(productValue48, 0.0, sumValue37)));
    float productValue49 = inverseLengthValue9 * productValue48;
    float productValue50 = inverseLengthValue9 * sumValue37;
    float sumValue23 = vertexColor0.z + (-0.5);
    float productValue51 = (inverseLengthValue8 * sumValue23) * sumValue35;
    float sumValue24 = vertexColor0.x + (-0.5);
    float productValue52 = (sumValue31 - (productValue49 * sumValue24)) - (productValue50 * productValue51);
    float productValue53 = sumValue32 - (((productValue49 * productValue48) - (productValue50 * productValue47)) * sumValue23);
    float productValue54 = sumValue33 - ((productValue50 * sumValue24) - (productValue49 * productValue51));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, productValue54, fma(vertexVectorConstants0.packedValues[1u].x, productValue53, productValue52 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, productValue54, fma(vertexVectorConstants0.packedValues[1u].y, productValue53, productValue52 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, productValue54, fma(vertexVectorConstants0.packedValues[1u].z, productValue53, productValue52 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, productValue54, fma(vertexVectorConstants0.packedValues[1u].w, productValue53, productValue52 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#endif
    varyingBitangent0.x = 0.0;
    varyingBitangent0.y = 0.0;
    varyingBitangent0.z = 0.0;
    varyingColor1.x = 0.0;
    varyingColor1.y = 0.0;
    varyingColor1.z = 0.0;
    varyingColor1.w = 0.0;
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
    varyingFrontFacing0 = int(0u);
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord4 = int(0u);
#endif
    varyingNormal0.x = 0.0;
    varyingNormal0.y = 0.0;
    varyingNormal0.z = 0.0;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord4 = int(0u);
#endif
    varyingTexCoord5.x = 0.0;
    varyingTexCoord5.y = 0.0;
    varyingTexCoord5.z = 0.0;
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
