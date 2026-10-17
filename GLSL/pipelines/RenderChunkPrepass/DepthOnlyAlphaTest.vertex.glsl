#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunkPrepass / DepthOnlyAlphaTest / vertex forward pipeline.
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

#include "../../include/materials/RenderChunkPrepass/VertexBindings.glsli"

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
    precise float sumValue9 = multiplyAddValue + 0.5;
    precise float sumValue10 = multiplyAddValue1 + 0.5;
    precise float sumValue11 = multiplyAddValue2 + 0.5;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    precise float sumValue12 = sumValue11 - vertexVectorConstants0.packedValues[20u].z;
    precise float sumValue13 = sumValue9 - vertexVectorConstants0.packedValues[20u].x;
    precise float sumValue14 = sumValue10 - vertexVectorConstants0.packedValues[20u].y;
    vec3 vectorValue = vec3(sumValue12, sumValue13, sumValue14);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue19 = inverseLengthValue2 * sumValue12;
    precise float productValue20 = inverseLengthValue2 * sumValue13;
    precise float productValue21 = inverseLengthValue2 * sumValue14;
    precise float productValue22 = productValue21 * 0.0;
    precise float productValue23 = productValue19 * 0.0;
    precise float productValue24 = productValue20 * 1.0;
    float multiplyAddValue18 = fma(productValue19, 1.0, -productValue22);
    float multiplyAddValue19 = fma(productValue21, 0.0, -productValue24);
    vec2 vectorValue1 = vec2(multiplyAddValue18, multiplyAddValue19);
    float inverseLengthValue3 = inversesqrt(rdDot2Precise(vectorValue1, vectorValue1));
    precise float productValue25 = inverseLengthValue3 * multiplyAddValue18;
    precise float multiplyAddValue20 = inverseLengthValue3 * fma(productValue20, 0.0, -productValue23);
    precise float productValue26 = inverseLengthValue3 * multiplyAddValue19;
    precise float productValue27 = productValue19 * multiplyAddValue20;
    precise float productValue28 = productValue20 * productValue26;
    precise float productValue29 = productValue21 * productValue25;
    precise float sumValue15 = vertexColor0.z - 0.5;
    precise float sumValue16 = vertexColor0.x - 0.5;
    precise float productValue30 = productValue25 * sumValue16;
    precise float productValue31 = multiplyAddValue20 * sumValue16;
    precise float productValue32 = productValue26 * sumValue16;
    precise float multiplyAddValue21 = sumValue9 - fma(fma(productValue21, productValue26, -productValue27), sumValue15, productValue30);
    precise float multiplyAddValue22 = sumValue10 - fma(fma(productValue19, productValue25, -productValue28), sumValue15, productValue31);
    precise float multiplyAddValue23 = sumValue11 - fma(fma(productValue20, multiplyAddValue20, -productValue29), sumValue15, productValue32);
    precise float productValue33 = multiplyAddValue22 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue34 = multiplyAddValue22 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue35 = multiplyAddValue22 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue36 = multiplyAddValue22 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue21, productValue33)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue21, productValue34)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue21, productValue35)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue21, productValue36)) + vertexVectorConstants0.packedValues[3u].w;
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
    precise float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue4, productValue42)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue4, productValue43)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue4, productValue44)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[2u].w, scalarValue5, fma(vertexVectorConstants0.packedValues[0u].w, scalarValue4, productValue45)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue31;
    gl_Position.y = multiplyAddValue32;
    gl_Position.z = multiplyAddValue33;
    gl_Position.w = multiplyAddValue34;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue4 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue5 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float sumValue32 = scalarValue4 + 0.5;
    precise float sumValue33 = scalarValue3 + 0.5;
    precise float sumValue34 = scalarValue5 + 0.5;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    precise float sumValue35 = sumValue34 - vertexVectorConstants0.packedValues[4u].z;
    precise float sumValue36 = sumValue32 - vertexVectorConstants0.packedValues[4u].x;
    precise float sumValue37 = sumValue33 - vertexVectorConstants0.packedValues[4u].y;
    vec3 vectorValue5 = vec3(sumValue35, sumValue36, sumValue37);
    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    precise float productValue54 = inverseLengthValue8 * sumValue35;
    precise float productValue55 = inverseLengthValue8 * sumValue36;
    precise float productValue56 = inverseLengthValue8 * sumValue37;
    precise float productValue57 = productValue56 * 0.0;
    precise float productValue58 = productValue54 * 0.0;
    precise float productValue59 = productValue55 * 1.0;
    float multiplyAddValue35 = fma(productValue54, 1.0, -productValue57);
    float multiplyAddValue36 = fma(productValue56, 0.0, -productValue59);
    vec2 vectorValue6 = vec2(multiplyAddValue35, multiplyAddValue36);
    float inverseLengthValue9 = inversesqrt(rdDot2Precise(vectorValue6, vectorValue6));
    precise float productValue60 = inverseLengthValue9 * multiplyAddValue35;
    precise float multiplyAddValue37 = inverseLengthValue9 * fma(productValue55, 0.0, -productValue58);
    precise float productValue61 = inverseLengthValue9 * multiplyAddValue36;
    precise float productValue62 = productValue54 * multiplyAddValue37;
    precise float productValue63 = productValue55 * productValue61;
    precise float productValue64 = productValue56 * productValue60;
    precise float sumValue15 = vertexColor0.z - 0.5;
    precise float sumValue16 = vertexColor0.x - 0.5;
    precise float productValue65 = productValue60 * sumValue16;
    precise float productValue66 = multiplyAddValue37 * sumValue16;
    precise float productValue67 = productValue61 * sumValue16;
    precise float multiplyAddValue38 = sumValue32 - fma(fma(productValue56, productValue61, -productValue62), sumValue15, productValue65);
    precise float multiplyAddValue39 = sumValue33 - fma(fma(productValue54, productValue60, -productValue63), sumValue15, productValue66);
    precise float multiplyAddValue40 = sumValue34 - fma(fma(productValue55, multiplyAddValue37, -productValue64), sumValue15, productValue67);
    precise float productValue68 = multiplyAddValue39 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue69 = multiplyAddValue39 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue70 = multiplyAddValue39 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue71 = multiplyAddValue39 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue38, productValue68)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue38, productValue69)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue38, productValue70)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue38, productValue71)) + vertexVectorConstants0.packedValues[3u].w;
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
    float sumValue17 = multiplyAddValue9 + 0.5;
    float sumValue18 = multiplyAddValue10 + 0.5;
    float sumValue19 = multiplyAddValue11 + 0.5;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    float sumValue20 = sumValue19 - vertexVectorConstants0.packedValues[20u].z;
    float sumValue21 = sumValue17 - vertexVectorConstants0.packedValues[20u].x;
    float sumValue22 = sumValue18 - vertexVectorConstants0.packedValues[20u].y;
    vec3 vectorValue2 = vec3(sumValue20, sumValue21, sumValue22);
    float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    float productValue37 = inverseLengthValue4 * sumValue20;
    float productValue38 = inverseLengthValue4 * sumValue21;
    float productValue39 = inverseLengthValue4 * sumValue22;
    float scalarValue2 = -productValue38;
    vec2 vectorValue3 = vec2(productValue37, scalarValue2);
    float inverseLengthValue5 = inversesqrt(rdDot2Precise(vectorValue3, vectorValue3));
    float productValue40 = inverseLengthValue5 * productValue37;
    float productValue41 = inverseLengthValue5 * scalarValue2;
    float sumValue23 = vertexColor0.z - 0.5;
    float sumValue24 = vertexColor0.x - 0.5;
    float multiplyAddValue28 = sumValue17 - fma(productValue39 * productValue41, sumValue23, productValue40 * sumValue24);
    float multiplyAddValue29 = sumValue18 - (fma(productValue37, productValue40, -(productValue38 * productValue41)) * sumValue23);
    float multiplyAddValue30 = sumValue19 - fma(-(productValue39 * productValue40), sumValue23, productValue41 * sumValue24);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue28, multiplyAddValue29 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue28, multiplyAddValue29 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue28, multiplyAddValue29 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue28, multiplyAddValue29 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
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
    float sumValue38 = scalarValue4 + 0.5;
    float sumValue39 = scalarValue3 + 0.5;
    float sumValue40 = scalarValue5 + 0.5;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    float sumValue41 = sumValue40 - vertexVectorConstants0.packedValues[4u].z;
    float sumValue42 = sumValue38 - vertexVectorConstants0.packedValues[4u].x;
    float sumValue43 = sumValue39 - vertexVectorConstants0.packedValues[4u].y;
    vec3 vectorValue7 = vec3(sumValue41, sumValue42, sumValue43);
    float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue72 = inverseLengthValue10 * sumValue41;
    float productValue73 = inverseLengthValue10 * sumValue42;
    float productValue74 = inverseLengthValue10 * sumValue43;
    float scalarValue6 = -productValue73;
    vec2 vectorValue8 = vec2(productValue72, scalarValue6);
    float inverseLengthValue11 = inversesqrt(rdDot2Precise(vectorValue8, vectorValue8));
    float productValue75 = inverseLengthValue11 * productValue72;
    float productValue76 = inverseLengthValue11 * scalarValue6;
    float sumValue23 = vertexColor0.z - 0.5;
    float sumValue24 = vertexColor0.x - 0.5;
    float multiplyAddValue45 = sumValue38 - fma(productValue74 * productValue76, sumValue23, productValue75 * sumValue24);
    float multiplyAddValue46 = sumValue39 - (fma(productValue72, productValue75, -(productValue73 * productValue76)) * sumValue23);
    float multiplyAddValue47 = sumValue40 - fma(-(productValue74 * productValue75), sumValue23, productValue76 * sumValue24);
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
    float sumValue = multiplyAddValue12 + 0.5;
    float sumValue1 = multiplyAddValue13 + 0.5;
    float sumValue2 = multiplyAddValue14 + 0.5;
    float sumValue3 = sumValue - vertexVectorConstants0.packedValues[20u].x;
    float sumValue4 = sumValue1 - vertexVectorConstants0.packedValues[20u].y;
    float sumValue5 = sumValue2 - vertexVectorConstants0.packedValues[20u].z;
    float inverseLengthValue = inversesqrt(dot(vec3(sumValue3, sumValue4, sumValue5), vec3(sumValue3, sumValue4, sumValue5)));
    float productValue11 = sumValue3 * inverseLengthValue;
    float productValue12 = sumValue5 * inverseLengthValue;
    float sumValue6 = (-0.0) - productValue11;
    float inverseLengthValue1 = inversesqrt(dot(vec3(productValue12, 0.0, sumValue6), vec3(productValue12, 0.0, sumValue6)));
    float productValue13 = inverseLengthValue1 * productValue12;
    float productValue14 = inverseLengthValue1 * sumValue6;
    float sumValue7 = vertexColor0.z + (-0.5);
    float productValue15 = (inverseLengthValue * sumValue7) * sumValue4;
    float sumValue8 = vertexColor0.x + (-0.5);
    float productValue16 = (sumValue - (productValue13 * sumValue8)) - (productValue14 * productValue15);
    float productValue17 = sumValue1 - (((productValue13 * productValue12) - (productValue14 * productValue11)) * sumValue7);
    float productValue18 = sumValue2 - ((productValue14 * sumValue8) - (productValue13 * productValue15));
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, productValue18, fma(vertexVectorConstants0.packedValues[1u].x, productValue17, productValue16 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, productValue18, fma(vertexVectorConstants0.packedValues[1u].y, productValue17, productValue16 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, productValue18, fma(vertexVectorConstants0.packedValues[1u].z, productValue17, productValue16 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, productValue18, fma(vertexVectorConstants0.packedValues[1u].w, productValue17, productValue16 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue15 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue16 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue17 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue16, multiplyAddValue15 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue16, multiplyAddValue15 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue16, multiplyAddValue15 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue16, multiplyAddValue15 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue15 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue16 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue17 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue25 = multiplyAddValue15 + 0.5;
    float sumValue26 = multiplyAddValue16 + 0.5;
    float sumValue27 = multiplyAddValue17 + 0.5;
    float sumValue28 = sumValue25 - vertexVectorConstants0.packedValues[4u].x;
    float sumValue29 = sumValue26 - vertexVectorConstants0.packedValues[4u].y;
    float sumValue30 = sumValue27 - vertexVectorConstants0.packedValues[4u].z;
    float inverseLengthValue6 = inversesqrt(dot(vec3(sumValue28, sumValue29, sumValue30), vec3(sumValue28, sumValue29, sumValue30)));
    float productValue46 = sumValue28 * inverseLengthValue6;
    float productValue47 = sumValue30 * inverseLengthValue6;
    float sumValue31 = (-0.0) - productValue46;
    float inverseLengthValue7 = inversesqrt(dot(vec3(productValue47, 0.0, sumValue31), vec3(productValue47, 0.0, sumValue31)));
    float productValue48 = inverseLengthValue7 * productValue47;
    float productValue49 = inverseLengthValue7 * sumValue31;
    float sumValue7 = vertexColor0.z + (-0.5);
    float productValue50 = (inverseLengthValue6 * sumValue7) * sumValue29;
    float sumValue8 = vertexColor0.x + (-0.5);
    float productValue51 = (sumValue25 - (productValue48 * sumValue8)) - (productValue49 * productValue50);
    float productValue52 = sumValue26 - (((productValue48 * productValue47) - (productValue49 * productValue46)) * sumValue7);
    float productValue53 = sumValue27 - ((productValue49 * sumValue8) - (productValue48 * productValue50));
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, productValue53, fma(vertexVectorConstants0.packedValues[1u].x, productValue52, productValue51 * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, productValue53, fma(vertexVectorConstants0.packedValues[1u].y, productValue52, productValue51 * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, productValue53, fma(vertexVectorConstants0.packedValues[1u].z, productValue52, productValue51 * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, productValue53, fma(vertexVectorConstants0.packedValues[1u].w, productValue52, productValue51 * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
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
    varyingTexCoord3.x = multiplyAddValue15;
    varyingTexCoord3.y = multiplyAddValue16;
    varyingTexCoord3.z = multiplyAddValue17;
#endif
}
