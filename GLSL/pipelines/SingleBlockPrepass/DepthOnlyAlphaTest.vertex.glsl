#version 460
#extension GL_GOOGLE_include_directive : require
// SingleBlockPrepass / DepthOnlyAlphaTest / vertex forward pipeline.
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

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#if defined(GL_ARB_gpu_shader_int64)
#extension GL_ARB_gpu_shader_int64 : require
#else
#error No extension available for 64-bit integers.
#endif
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
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
#endif

#include "../../include/materials/SingleBlockPrepass/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
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
    precise float sumValue17 = multiplyAddValue + 0.5;
    precise float sumValue18 = multiplyAddValue1 + 0.5;
    precise float sumValue19 = multiplyAddValue2 + 0.5;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    precise float sumValue20 = sumValue19 - vertexVectorConstants0.packedValues[20u].z;
    precise float sumValue21 = sumValue17 - vertexVectorConstants0.packedValues[20u].x;
    precise float sumValue22 = sumValue18 - vertexVectorConstants0.packedValues[20u].y;
    vec3 vectorValue2 = vec3(sumValue20, sumValue21, sumValue22);
    float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    precise float productValue24 = inverseLengthValue4 * sumValue20;
    precise float productValue25 = inverseLengthValue4 * sumValue21;
    precise float productValue26 = inverseLengthValue4 * sumValue22;
    precise float productValue27 = productValue26 * 0.0;
    precise float productValue28 = productValue24 * 0.0;
    precise float productValue29 = productValue25 * 1.0;
    float multiplyAddValue18 = fma(productValue24, 1.0, -productValue27);
    float multiplyAddValue19 = fma(productValue26, 0.0, -productValue29);
    vec2 vectorValue3 = vec2(multiplyAddValue18, multiplyAddValue19);
    float inverseLengthValue5 = inversesqrt(rdDot2Precise(vectorValue3, vectorValue3));
    precise float productValue30 = inverseLengthValue5 * multiplyAddValue18;
    precise float multiplyAddValue20 = inverseLengthValue5 * fma(productValue25, 0.0, -productValue28);
    precise float productValue31 = inverseLengthValue5 * multiplyAddValue19;
    precise float productValue32 = productValue24 * multiplyAddValue20;
    precise float productValue33 = productValue25 * productValue31;
    precise float productValue34 = productValue26 * productValue30;
    precise float sumValue23 = vertexColor0.z - 0.5;
    precise float sumValue24 = vertexColor0.x - 0.5;
    precise float productValue35 = productValue30 * sumValue24;
    precise float productValue36 = multiplyAddValue20 * sumValue24;
    precise float productValue37 = productValue31 * sumValue24;
    precise float multiplyAddValue21 = sumValue17 - fma(fma(productValue26, productValue31, -productValue32), sumValue23, productValue35);
    precise float multiplyAddValue22 = sumValue18 - fma(fma(productValue24, productValue30, -productValue33), sumValue23, productValue36);
    precise float multiplyAddValue23 = sumValue19 - fma(fma(productValue25, multiplyAddValue20, -productValue34), sumValue23, productValue37);
    precise float productValue38 = multiplyAddValue22 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue39 = multiplyAddValue22 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue40 = multiplyAddValue22 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue41 = multiplyAddValue22 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue21, productValue38)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue21, productValue39)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue21, productValue40)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue21, productValue41)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue24;
    gl_Position.y = multiplyAddValue25;
    gl_Position.z = multiplyAddValue26;
    gl_Position.w = multiplyAddValue27;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue3 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue42 = scalarValue3 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue43 = scalarValue3 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue44 = scalarValue3 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue45 = scalarValue3 * vertexVectorConstants0.packedValues[1u].w;
    float scalarValue4 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue5 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    precise float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue4, productValue42)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue4, productValue43)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue4, productValue44)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue4, productValue45)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue28;
    gl_Position.y = multiplyAddValue29;
    gl_Position.z = multiplyAddValue30;
    gl_Position.w = multiplyAddValue31;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue4 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue5 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float sumValue25 = scalarValue4 + 0.5;
    precise float sumValue26 = scalarValue3 + 0.5;
    precise float sumValue27 = scalarValue5 + 0.5;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    precise float sumValue28 = sumValue27 - vertexVectorConstants0.packedValues[4u].z;
    precise float sumValue29 = sumValue25 - vertexVectorConstants0.packedValues[4u].x;
    precise float sumValue30 = sumValue26 - vertexVectorConstants0.packedValues[4u].y;
    vec3 vectorValue5 = vec3(sumValue28, sumValue29, sumValue30);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    precise float productValue46 = inverseLengthValue6 * sumValue28;
    precise float productValue47 = inverseLengthValue6 * sumValue29;
    precise float productValue48 = inverseLengthValue6 * sumValue30;
    precise float productValue49 = productValue48 * 0.0;
    precise float productValue50 = productValue46 * 0.0;
    precise float productValue51 = productValue47 * 1.0;
    float multiplyAddValue35 = fma(productValue46, 1.0, -productValue49);
    float multiplyAddValue36 = fma(productValue48, 0.0, -productValue51);
    vec2 vectorValue6 = vec2(multiplyAddValue35, multiplyAddValue36);
    float inverseLengthValue7 = inversesqrt(rdDot2Precise(vectorValue6, vectorValue6));
    precise float productValue52 = inverseLengthValue7 * multiplyAddValue35;
    precise float multiplyAddValue37 = inverseLengthValue7 * fma(productValue47, 0.0, -productValue50);
    precise float productValue53 = inverseLengthValue7 * multiplyAddValue36;
    precise float productValue54 = productValue46 * multiplyAddValue37;
    precise float productValue55 = productValue47 * productValue53;
    precise float productValue56 = productValue48 * productValue52;
    precise float sumValue23 = vertexColor0.z - 0.5;
    precise float sumValue24 = vertexColor0.x - 0.5;
    precise float productValue57 = productValue52 * sumValue24;
    precise float productValue58 = multiplyAddValue37 * sumValue24;
    precise float productValue59 = productValue53 * sumValue24;
    precise float multiplyAddValue38 = sumValue25 - fma(fma(productValue48, productValue53, -productValue54), sumValue23, productValue57);
    precise float multiplyAddValue39 = sumValue26 - fma(fma(productValue46, productValue52, -productValue55), sumValue23, productValue58);
    precise float multiplyAddValue40 = sumValue27 - fma(fma(productValue47, multiplyAddValue37, -productValue56), sumValue23, productValue59);
    precise float productValue60 = multiplyAddValue39 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue61 = multiplyAddValue39 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue62 = multiplyAddValue39 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue63 = multiplyAddValue39 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue38, productValue60)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue38, productValue61)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue38, productValue62)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue38, productValue63)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue41;
    gl_Position.y = multiplyAddValue42;
    gl_Position.z = multiplyAddValue43;
    gl_Position.w = multiplyAddValue44;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue9, multiplyAddValue10 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue9, multiplyAddValue10 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue9, multiplyAddValue10 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue9, multiplyAddValue10 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float sumValue = multiplyAddValue9 + 0.5;
    float sumValue1 = multiplyAddValue10 + 0.5;
    float sumValue2 = multiplyAddValue11 + 0.5;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    float sumValue3 = sumValue2 - vertexVectorConstants0.packedValues[20u].z;
    float sumValue4 = sumValue - vertexVectorConstants0.packedValues[20u].x;
    float sumValue5 = sumValue1 - vertexVectorConstants0.packedValues[20u].y;
    vec3 vectorValue = vec3(sumValue3, sumValue4, sumValue5);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue11 = inverseLengthValue * sumValue3;
    float productValue12 = inverseLengthValue * sumValue4;
    float productValue13 = inverseLengthValue * sumValue5;
    float scalarValue2 = -productValue12;
    vec2 vectorValue1 = vec2(productValue11, scalarValue2);
    float inverseLengthValue1 = inversesqrt(rdDot2Precise(vectorValue1, vectorValue1));
    float productValue14 = inverseLengthValue1 * productValue11;
    float productValue15 = inverseLengthValue1 * scalarValue2;
    float sumValue6 = vertexColor0.z - 0.5;
    float sumValue7 = vertexColor0.x - 0.5;
    float multiplyAddValue15 = sumValue - fma(productValue13 * productValue15, sumValue6, productValue14 * sumValue7);
    float multiplyAddValue16 = sumValue1 - (fma(productValue11, productValue14, -(productValue12 * productValue15)) * sumValue6);
    float multiplyAddValue17 = sumValue2 - fma(-(productValue13 * productValue14), sumValue6, productValue15 * sumValue7);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue3 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue4 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue5 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue4, scalarValue3 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue4, scalarValue3 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue4, scalarValue3 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue4, scalarValue3 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue4 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue5 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float sumValue31 = scalarValue4 + 0.5;
    float sumValue32 = scalarValue3 + 0.5;
    float sumValue33 = scalarValue5 + 0.5;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    float sumValue34 = sumValue33 - vertexVectorConstants0.packedValues[4u].z;
    float sumValue35 = sumValue31 - vertexVectorConstants0.packedValues[4u].x;
    float sumValue36 = sumValue32 - vertexVectorConstants0.packedValues[4u].y;
    vec3 vectorValue7 = vec3(sumValue34, sumValue35, sumValue36);
    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue64 = inverseLengthValue8 * sumValue34;
    float productValue65 = inverseLengthValue8 * sumValue35;
    float productValue66 = inverseLengthValue8 * sumValue36;
    float scalarValue6 = -productValue65;
    vec2 vectorValue8 = vec2(productValue64, scalarValue6);
    float inverseLengthValue9 = inversesqrt(rdDot2Precise(vectorValue8, vectorValue8));
    float productValue67 = inverseLengthValue9 * productValue64;
    float productValue68 = inverseLengthValue9 * scalarValue6;
    float sumValue6 = vertexColor0.z - 0.5;
    float sumValue7 = vertexColor0.x - 0.5;
    float multiplyAddValue45 = sumValue31 - fma(productValue66 * productValue68, sumValue6, productValue67 * sumValue7);
    float multiplyAddValue46 = sumValue32 - (fma(productValue64, productValue67, -(productValue65 * productValue68)) * sumValue6);
    float multiplyAddValue47 = sumValue33 - fma(-(productValue66 * productValue67), sumValue6, productValue68 * sumValue7);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue45, multiplyAddValue46 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue45, multiplyAddValue46 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue45, multiplyAddValue46 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue47, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue45, multiplyAddValue46 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue14, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue13, multiplyAddValue12 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float sumValue8 = multiplyAddValue12 + 0.5;
    float sumValue9 = multiplyAddValue13 + 0.5;
    float sumValue10 = multiplyAddValue14 + 0.5;
    float sumValue11 = sumValue8 - vertexVectorConstants0.packedValues[20u].x;
    float sumValue12 = sumValue9 - vertexVectorConstants0.packedValues[20u].y;
    float sumValue13 = sumValue10 - vertexVectorConstants0.packedValues[20u].z;
    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue11, sumValue12, sumValue13), vec3(sumValue11, sumValue12, sumValue13)));
    float productValue16 = sumValue11 * inverseLengthValue2;
    float productValue17 = sumValue13 * inverseLengthValue2;
    float sumValue14 = (-0.0) - productValue16;
    float inverseLengthValue3 = inversesqrt(dot(vec3(productValue17, 0.0, sumValue14), vec3(productValue17, 0.0, sumValue14)));
    float productValue18 = inverseLengthValue3 * productValue17;
    float productValue19 = inverseLengthValue3 * sumValue14;
    float sumValue15 = vertexColor0.z + (-0.5);
    float productValue20 = (inverseLengthValue2 * sumValue15) * sumValue12;
    float sumValue16 = vertexColor0.x + (-0.5);
    float productValue21 = (sumValue8 - (productValue18 * sumValue16)) - (productValue19 * productValue20);
    float productValue22 = sumValue9 - (((productValue18 * productValue17) - (productValue19 * productValue16)) * sumValue15);
    float productValue23 = sumValue10 - ((productValue19 * sumValue16) - (productValue18 * productValue20));
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, productValue23, fma(vertexVectorConstants0.packedValues[1u].x, productValue22, productValue21 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, productValue23, fma(vertexVectorConstants0.packedValues[1u].y, productValue22, productValue21 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, productValue23, fma(vertexVectorConstants0.packedValues[1u].z, productValue22, productValue21 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, productValue23, fma(vertexVectorConstants0.packedValues[1u].w, productValue22, productValue21 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue32 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue33 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue34 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue34, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue33, multiplyAddValue32 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue32 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue33 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue34 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue37 = multiplyAddValue32 + 0.5;
    float sumValue38 = multiplyAddValue33 + 0.5;
    float sumValue39 = multiplyAddValue34 + 0.5;
    float sumValue40 = sumValue37 - vertexVectorConstants0.packedValues[4u].x;
    float sumValue41 = sumValue38 - vertexVectorConstants0.packedValues[4u].y;
    float sumValue42 = sumValue39 - vertexVectorConstants0.packedValues[4u].z;
    float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue40, sumValue41, sumValue42), vec3(sumValue40, sumValue41, sumValue42)));
    float productValue69 = sumValue40 * inverseLengthValue10;
    float productValue70 = sumValue42 * inverseLengthValue10;
    float sumValue43 = (-0.0) - productValue69;
    float inverseLengthValue11 = inversesqrt(dot(vec3(productValue70, 0.0, sumValue43), vec3(productValue70, 0.0, sumValue43)));
    float productValue71 = inverseLengthValue11 * productValue70;
    float productValue72 = inverseLengthValue11 * sumValue43;
    float sumValue15 = vertexColor0.z + (-0.5);
    float productValue73 = (inverseLengthValue10 * sumValue15) * sumValue41;
    float sumValue16 = vertexColor0.x + (-0.5);
    float productValue74 = (sumValue37 - (productValue71 * sumValue16)) - (productValue72 * productValue73);
    float productValue75 = sumValue38 - (((productValue71 * productValue70) - (productValue72 * productValue69)) * sumValue15);
    float productValue76 = sumValue39 - ((productValue72 * sumValue16) - (productValue71 * productValue73));
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, productValue76, fma(vertexVectorConstants0.packedValues[1u].x, productValue75, productValue74 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, productValue76, fma(vertexVectorConstants0.packedValues[1u].y, productValue75, productValue74 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, productValue76, fma(vertexVectorConstants0.packedValues[1u].z, productValue75, productValue74 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, productValue76, fma(vertexVectorConstants0.packedValues[1u].w, productValue75, productValue74 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
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
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue7 = vertexTexCoord0.x * 65535.0;
    precise float productValue8 = vertexTexCoord0.y * 65535.0;
    uint scalarValue = uint(roundEven(productValue7));
    uint scalarValue1 = uint(roundEven(productValue8));
    precise float multiplyAddValue7 = fma(rdEvaluateFloatExpression((scalarValue >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue8 = fma(rdEvaluateFloatExpression((scalarValue1 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression((scalarValue << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue7);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression((scalarValue1 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue8);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue9, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue9, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue10, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue10, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue12;
    varyingTexCoord3.y = multiplyAddValue13;
    varyingTexCoord3.z = multiplyAddValue14;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue32;
    varyingTexCoord3.y = multiplyAddValue33;
    varyingTexCoord3.z = multiplyAddValue34;
#endif
}
