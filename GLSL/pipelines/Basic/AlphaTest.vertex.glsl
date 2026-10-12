#version 460
#extension GL_GOOGLE_include_directive : require
// Basic / AlphaTest / vertex forward pipeline.
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
#ifndef RD_FEATURE_SAMPLE_MAT_TEXTURE
#define RD_FEATURE_SAMPLE_MAT_TEXTURE RD_OFF
#endif
#ifndef RD_FEATURE_TRANSFORM_UV0
#define RD_FEATURE_TRANSFORM_UV0 RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/Basic/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue9 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue10 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue11 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z;
    precise float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, productValue9)) + vertexVectorConstants0.packedValues[11u].x;
    precise float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, productValue10)) + vertexVectorConstants0.packedValues[11u].y;
    precise float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, productValue11)) + vertexVectorConstants0.packedValues[11u].z;
    precise float productValue12 = multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue13 = multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue14 = multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue15 = multiplyAddValue19 * vertexVectorConstants0.packedValues[5u].w;
    precise float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue18, productValue12)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue18, productValue13)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue18, productValue14)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue18, productValue15)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = multiplyAddValue21;
    gl_Position.y = multiplyAddValue22;
    gl_Position.z = multiplyAddValue23;
    gl_Position.w = multiplyAddValue24;
    precise float productValue16 = vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue17 = vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue18 = vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, productValue16));
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, productValue17));
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, productValue18));
    precise float productValue19 = multiplyAddValue26 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue20 = multiplyAddValue26 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue21 = multiplyAddValue26 * vertexVectorConstants0.packedValues[1u].z;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue25, productValue19));
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue25, productValue20));
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue25, productValue21));
    vec3 vectorValue = vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue22 = inverseLengthValue2 * multiplyAddValue28;
    precise float productValue23 = inverseLengthValue2 * multiplyAddValue29;
    precise float productValue24 = inverseLengthValue2 * multiplyAddValue30;
    precise float productValue25 = vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue26 = vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue27 = vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z;
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, productValue25));
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, productValue26));
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, productValue27));
    precise float productValue28 = multiplyAddValue32 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue29 = multiplyAddValue32 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue30 = multiplyAddValue32 * vertexVectorConstants0.packedValues[1u].z;
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue31, productValue28));
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue31, productValue29));
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue31, productValue30));
    vec3 vectorValue1 = vec3(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36);
    float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    precise float productValue31 = inverseLengthValue3 * multiplyAddValue34;
    precise float productValue32 = inverseLengthValue3 * multiplyAddValue35;
    precise float productValue33 = inverseLengthValue3 * multiplyAddValue36;
    precise float productValue34 = productValue24 * productValue32;
    precise float productValue35 = productValue22 * productValue33;
    precise float productValue36 = productValue23 * productValue31;
    float multiplyAddValue37 = fma(productValue23, productValue33, -productValue34);
    float multiplyAddValue38 = fma(productValue24, productValue31, -productValue35);
    float multiplyAddValue39 = fma(productValue22, productValue32, -productValue36);
    varyingBitangent0.x = multiplyAddValue37;
    varyingBitangent0.y = multiplyAddValue38;
    varyingBitangent0.z = multiplyAddValue39;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue51 = scalarValue * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue52 = scalarValue * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue53 = scalarValue * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue54 = scalarValue * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue1 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float multiplyAddValue75 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue1, productValue51)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue76 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue1, productValue52)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue77 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue1, productValue53)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue78 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue1, productValue54)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = multiplyAddValue75;
    gl_Position.y = multiplyAddValue76;
    gl_Position.z = multiplyAddValue77;
    gl_Position.w = multiplyAddValue78;
    precise float productValue16 = vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue17 = vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue18 = vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, productValue16));
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, productValue17));
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, productValue18));
    precise float productValue19 = multiplyAddValue26 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue20 = multiplyAddValue26 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue21 = multiplyAddValue26 * vertexVectorConstants0.packedValues[1u].z;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue25, productValue19));
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue25, productValue20));
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue27, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue25, productValue21));
    vec3 vectorValue = vec3(multiplyAddValue28, multiplyAddValue29, multiplyAddValue30);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    precise float productValue22 = inverseLengthValue2 * multiplyAddValue28;
    precise float productValue23 = inverseLengthValue2 * multiplyAddValue29;
    precise float productValue24 = inverseLengthValue2 * multiplyAddValue30;
    precise float productValue25 = vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue26 = vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue27 = vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z;
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, productValue25));
    float multiplyAddValue32 = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, productValue26));
    float multiplyAddValue33 = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, productValue27));
    precise float productValue28 = multiplyAddValue32 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue29 = multiplyAddValue32 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue30 = multiplyAddValue32 * vertexVectorConstants0.packedValues[1u].z;
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue31, productValue28));
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue31, productValue29));
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue33, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue31, productValue30));
    vec3 vectorValue1 = vec3(multiplyAddValue34, multiplyAddValue35, multiplyAddValue36);
    float inverseLengthValue3 = inversesqrt(rdDot3Precise2(vectorValue1, vectorValue1));
    precise float productValue31 = inverseLengthValue3 * multiplyAddValue34;
    precise float productValue32 = inverseLengthValue3 * multiplyAddValue35;
    precise float productValue33 = inverseLengthValue3 * multiplyAddValue36;
    precise float productValue34 = productValue24 * productValue32;
    precise float productValue35 = productValue22 * productValue33;
    precise float productValue36 = productValue23 * productValue31;
    float multiplyAddValue37 = fma(productValue23, productValue33, -productValue34);
    float multiplyAddValue38 = fma(productValue24, productValue31, -productValue35);
    float multiplyAddValue39 = fma(productValue22, productValue32, -productValue36);
    varyingBitangent0.x = multiplyAddValue37;
    varyingBitangent0.y = multiplyAddValue38;
    varyingBitangent0.z = multiplyAddValue39;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y));
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z));
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue48, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue46, multiplyAddValue47 * vertexVectorConstants0.packedValues[1u].x));
    float multiplyAddValue50 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue48, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue46, multiplyAddValue47 * vertexVectorConstants0.packedValues[1u].y));
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue48, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue46, multiplyAddValue47 * vertexVectorConstants0.packedValues[1u].z));
    vec3 vectorValue2 = vec3(multiplyAddValue49, multiplyAddValue50, multiplyAddValue51);
    float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    float productValue43 = inverseLengthValue4 * multiplyAddValue49;
    float productValue44 = inverseLengthValue4 * multiplyAddValue50;
    float productValue45 = inverseLengthValue4 * multiplyAddValue51;
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x));
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y));
    float multiplyAddValue54 = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z));
    float multiplyAddValue55 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue54, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue52, multiplyAddValue53 * vertexVectorConstants0.packedValues[1u].x));
    float multiplyAddValue56 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue54, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue52, multiplyAddValue53 * vertexVectorConstants0.packedValues[1u].y));
    float multiplyAddValue57 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue54, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue52, multiplyAddValue53 * vertexVectorConstants0.packedValues[1u].z));
    vec3 vectorValue3 = vec3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
    float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    float productValue46 = inverseLengthValue5 * multiplyAddValue55;
    float productValue47 = inverseLengthValue5 * multiplyAddValue56;
    float productValue48 = inverseLengthValue5 * multiplyAddValue57;
    float multiplyAddValue58 = fma(productValue44, productValue48, -(productValue45 * productValue47));
    float multiplyAddValue59 = fma(productValue45, productValue46, -(productValue43 * productValue48));
    float multiplyAddValue60 = fma(productValue43, productValue47, -(productValue44 * productValue46));
    varyingBitangent0.x = multiplyAddValue58;
    varyingBitangent0.y = multiplyAddValue59;
    varyingBitangent0.z = multiplyAddValue60;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue4 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue4, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue4, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x));
    float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y));
    float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z));
    float multiplyAddValue49 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue48, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue46, multiplyAddValue47 * vertexVectorConstants0.packedValues[1u].x));
    float multiplyAddValue50 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue48, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue46, multiplyAddValue47 * vertexVectorConstants0.packedValues[1u].y));
    float multiplyAddValue51 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue48, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue46, multiplyAddValue47 * vertexVectorConstants0.packedValues[1u].z));
    vec3 vectorValue2 = vec3(multiplyAddValue49, multiplyAddValue50, multiplyAddValue51);
    float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    float productValue43 = inverseLengthValue4 * multiplyAddValue49;
    float productValue44 = inverseLengthValue4 * multiplyAddValue50;
    float productValue45 = inverseLengthValue4 * multiplyAddValue51;
    float multiplyAddValue52 = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x));
    float multiplyAddValue53 = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y));
    float multiplyAddValue54 = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z));
    float multiplyAddValue55 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue54, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue52, multiplyAddValue53 * vertexVectorConstants0.packedValues[1u].x));
    float multiplyAddValue56 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue54, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue52, multiplyAddValue53 * vertexVectorConstants0.packedValues[1u].y));
    float multiplyAddValue57 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue54, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue52, multiplyAddValue53 * vertexVectorConstants0.packedValues[1u].z));
    vec3 vectorValue3 = vec3(multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
    float inverseLengthValue5 = inversesqrt(rdDot3Precise2(vectorValue3, vectorValue3));
    float productValue46 = inverseLengthValue5 * multiplyAddValue55;
    float productValue47 = inverseLengthValue5 * multiplyAddValue56;
    float productValue48 = inverseLengthValue5 * multiplyAddValue57;
    float multiplyAddValue58 = fma(productValue44, productValue48, -(productValue45 * productValue47));
    float multiplyAddValue59 = fma(productValue45, productValue46, -(productValue43 * productValue48));
    float multiplyAddValue60 = fma(productValue43, productValue47, -(productValue44 * productValue46));
    varyingBitangent0.x = multiplyAddValue58;
    varyingBitangent0.y = multiplyAddValue59;
    varyingBitangent0.z = multiplyAddValue60;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].x));
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].y));
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].z));
    float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue = inverseLengthValue * multiplyAddValue9;
    float productValue1 = inverseLengthValue * multiplyAddValue10;
    float productValue2 = inverseLengthValue * multiplyAddValue11;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue7, multiplyAddValue6 * vertexVectorConstants0.packedValues[0u].x));
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue7, multiplyAddValue6 * vertexVectorConstants0.packedValues[0u].y));
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue7, multiplyAddValue6 * vertexVectorConstants0.packedValues[0u].z));
    float inverseLengthValue1 = inversesqrt(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14)));
    float productValue3 = inverseLengthValue1 * multiplyAddValue12;
    float productValue4 = inverseLengthValue1 * multiplyAddValue13;
    float productValue5 = inverseLengthValue1 * multiplyAddValue14;
    float productValue6 = (productValue5 * productValue1) - (productValue4 * productValue2);
    float productValue7 = (productValue3 * productValue2) - (productValue5 * productValue);
    float productValue8 = (productValue4 * productValue) - (productValue3 * productValue1);
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x));
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y));
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    varyingBitangent0.x = productValue6;
    varyingBitangent0.y = productValue7;
    varyingBitangent0.z = productValue8;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue66 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue67 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue68 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].x));
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].y));
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].z));
    float inverseLengthValue = inversesqrt(dot(vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11), vec3(multiplyAddValue9, multiplyAddValue10, multiplyAddValue11)));
    float productValue = inverseLengthValue * multiplyAddValue9;
    float productValue1 = inverseLengthValue * multiplyAddValue10;
    float productValue2 = inverseLengthValue * multiplyAddValue11;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue7, multiplyAddValue6 * vertexVectorConstants0.packedValues[0u].x));
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue7, multiplyAddValue6 * vertexVectorConstants0.packedValues[0u].y));
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue8, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue7, multiplyAddValue6 * vertexVectorConstants0.packedValues[0u].z));
    float inverseLengthValue1 = inversesqrt(dot(vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14), vec3(multiplyAddValue12, multiplyAddValue13, multiplyAddValue14)));
    float productValue3 = inverseLengthValue1 * multiplyAddValue12;
    float productValue4 = inverseLengthValue1 * multiplyAddValue13;
    float productValue5 = inverseLengthValue1 * multiplyAddValue14;
    float productValue6 = (productValue5 * productValue1) - (productValue4 * productValue2);
    float productValue7 = (productValue3 * productValue2) - (productValue5 * productValue);
    float productValue8 = (productValue4 * productValue) - (productValue3 * productValue1);
    float multiplyAddValue69 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue68, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue67, multiplyAddValue66 * vertexVectorConstants0.packedValues[0u].x));
    float multiplyAddValue70 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue68, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue67, multiplyAddValue66 * vertexVectorConstants0.packedValues[0u].y));
    float multiplyAddValue71 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue68, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue67, multiplyAddValue66 * vertexVectorConstants0.packedValues[0u].z));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue68, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue67, multiplyAddValue66 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue68, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue67, multiplyAddValue66 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue68, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue67, multiplyAddValue66 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue68, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue67, multiplyAddValue66 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    varyingBitangent0.x = productValue6;
    varyingBitangent0.y = productValue7;
    varyingBitangent0.z = productValue8;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingNormal0.x = productValue22;
    varyingNormal0.y = productValue23;
    varyingNormal0.z = productValue24;
    varyingTangent0.x = productValue31;
    varyingTangent0.y = productValue32;
    varyingTangent0.z = productValue33;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    precise float productValue37 = multiplyAddValue19 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue38 = multiplyAddValue19 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue39 = multiplyAddValue19 * vertexVectorConstants0.packedValues[1u].z;
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue18, productValue37));
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue18, productValue38));
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue18, productValue39));
    varyingTexCoord1.x = multiplyAddValue18;
    varyingTexCoord1.y = multiplyAddValue19;
    varyingTexCoord1.z = multiplyAddValue20;
    precise float productValue40 = multiplyAddValue37 * multiplyAddValue41;
    precise float productValue41 = multiplyAddValue38 * multiplyAddValue41;
    precise float productValue42 = multiplyAddValue39 * multiplyAddValue41;
    varyingTexCoord2.x = fma(multiplyAddValue42, productValue22, fma(multiplyAddValue40, productValue31, productValue40));
    varyingTexCoord2.y = fma(multiplyAddValue42, productValue23, fma(multiplyAddValue40, productValue32, productValue41));
    varyingTexCoord2.z = fma(multiplyAddValue42, productValue24, fma(multiplyAddValue40, productValue33, productValue42));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingNormal0.x = productValue22;
    varyingNormal0.y = productValue23;
    varyingNormal0.z = productValue24;
    varyingTangent0.x = productValue31;
    varyingTangent0.y = productValue32;
    varyingTangent0.z = productValue33;
    precise float productValue49 = vertexTexCoord0.y * vertexVectorConstants0.packedValues[25u].x;
    precise float productValue50 = vertexTexCoord0.y * vertexVectorConstants0.packedValues[25u].y;
    precise float multiplyAddValue64 = fma(vertexVectorConstants0.packedValues[24u].x, vertexTexCoord0.x, productValue49) + vertexVectorConstants0.packedValues[27u].x;
    precise float multiplyAddValue65 = fma(vertexVectorConstants0.packedValues[24u].y, vertexTexCoord0.x, productValue50) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord0.x = multiplyAddValue64;
    varyingTexCoord0.y = multiplyAddValue65;
    precise float productValue37 = multiplyAddValue19 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue38 = multiplyAddValue19 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue39 = multiplyAddValue19 * vertexVectorConstants0.packedValues[1u].z;
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue18, productValue37));
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue18, productValue38));
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue18, productValue39));
    varyingTexCoord1.x = multiplyAddValue18;
    varyingTexCoord1.y = multiplyAddValue19;
    varyingTexCoord1.z = multiplyAddValue20;
    precise float productValue40 = multiplyAddValue37 * multiplyAddValue41;
    precise float productValue41 = multiplyAddValue38 * multiplyAddValue41;
    precise float productValue42 = multiplyAddValue39 * multiplyAddValue41;
    varyingTexCoord2.x = fma(multiplyAddValue42, productValue22, fma(multiplyAddValue40, productValue31, productValue40));
    varyingTexCoord2.y = fma(multiplyAddValue42, productValue23, fma(multiplyAddValue40, productValue32, productValue41));
    varyingTexCoord2.z = fma(multiplyAddValue42, productValue24, fma(multiplyAddValue40, productValue33, productValue42));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingNormal0.x = productValue22;
    varyingNormal0.y = productValue23;
    varyingNormal0.z = productValue24;
    varyingTangent0.x = productValue31;
    varyingTangent0.y = productValue32;
    varyingTangent0.z = productValue33;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    precise float productValue55 = scalarValue * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue56 = scalarValue * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue57 = scalarValue * vertexVectorConstants0.packedValues[1u].z;
    varyingTexCoord1.x = scalarValue1;
    varyingTexCoord1.y = scalarValue;
    varyingTexCoord1.z = scalarValue2;
    float multiplyAddValue79 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, productValue55));
    float multiplyAddValue80 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, productValue56));
    float multiplyAddValue81 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, productValue57));
    precise float productValue58 = multiplyAddValue37 * multiplyAddValue80;
    precise float productValue59 = multiplyAddValue38 * multiplyAddValue80;
    precise float productValue60 = multiplyAddValue39 * multiplyAddValue80;
    varyingTexCoord2.x = fma(multiplyAddValue81, productValue22, fma(multiplyAddValue79, productValue31, productValue58));
    varyingTexCoord2.y = fma(multiplyAddValue81, productValue23, fma(multiplyAddValue79, productValue32, productValue59));
    varyingTexCoord2.z = fma(multiplyAddValue81, productValue24, fma(multiplyAddValue79, productValue33, productValue60));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingNormal0.x = productValue22;
    varyingNormal0.y = productValue23;
    varyingNormal0.z = productValue24;
    varyingTangent0.x = productValue31;
    varyingTangent0.y = productValue32;
    varyingTangent0.z = productValue33;
    precise float productValue49 = vertexTexCoord0.y * vertexVectorConstants0.packedValues[25u].x;
    precise float productValue50 = vertexTexCoord0.y * vertexVectorConstants0.packedValues[25u].y;
    precise float multiplyAddValue64 = fma(vertexVectorConstants0.packedValues[24u].x, vertexTexCoord0.x, productValue49) + vertexVectorConstants0.packedValues[27u].x;
    precise float multiplyAddValue65 = fma(vertexVectorConstants0.packedValues[24u].y, vertexTexCoord0.x, productValue50) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord0.x = multiplyAddValue64;
    varyingTexCoord0.y = multiplyAddValue65;
    precise float productValue55 = scalarValue * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue56 = scalarValue * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue57 = scalarValue * vertexVectorConstants0.packedValues[1u].z;
    varyingTexCoord1.x = scalarValue1;
    varyingTexCoord1.y = scalarValue;
    varyingTexCoord1.z = scalarValue2;
    float multiplyAddValue79 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, productValue55));
    float multiplyAddValue80 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, productValue56));
    float multiplyAddValue81 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, productValue57));
    precise float productValue58 = multiplyAddValue37 * multiplyAddValue80;
    precise float productValue59 = multiplyAddValue38 * multiplyAddValue80;
    precise float productValue60 = multiplyAddValue39 * multiplyAddValue80;
    varyingTexCoord2.x = fma(multiplyAddValue81, productValue22, fma(multiplyAddValue79, productValue31, productValue58));
    varyingTexCoord2.y = fma(multiplyAddValue81, productValue23, fma(multiplyAddValue79, productValue32, productValue59));
    varyingTexCoord2.z = fma(multiplyAddValue81, productValue24, fma(multiplyAddValue79, productValue33, productValue60));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingNormal0.x = productValue43;
    varyingNormal0.y = productValue44;
    varyingNormal0.z = productValue45;
    varyingTangent0.x = productValue46;
    varyingTangent0.y = productValue47;
    varyingTangent0.z = productValue48;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    float multiplyAddValue61 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[1u].x));
    float multiplyAddValue62 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[1u].y));
    float multiplyAddValue63 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[1u].z));
    varyingTexCoord1.x = multiplyAddValue43;
    varyingTexCoord1.y = multiplyAddValue44;
    varyingTexCoord1.z = multiplyAddValue45;
    varyingTexCoord2.x = fma(multiplyAddValue63, productValue43, fma(multiplyAddValue61, productValue46, multiplyAddValue58 * multiplyAddValue62));
    varyingTexCoord2.y = fma(multiplyAddValue63, productValue44, fma(multiplyAddValue61, productValue47, multiplyAddValue59 * multiplyAddValue62));
    varyingTexCoord2.z = fma(multiplyAddValue63, productValue45, fma(multiplyAddValue61, productValue48, multiplyAddValue60 * multiplyAddValue62));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingNormal0.x = productValue43;
    varyingNormal0.y = productValue44;
    varyingNormal0.z = productValue45;
    varyingTangent0.x = productValue46;
    varyingTangent0.y = productValue47;
    varyingTangent0.z = productValue48;
    varyingTexCoord0.x = fma(vertexVectorConstants0.packedValues[24u].x, vertexTexCoord0.x, vertexTexCoord0.y * vertexVectorConstants0.packedValues[25u].x) + vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord0.y = fma(vertexVectorConstants0.packedValues[24u].y, vertexTexCoord0.x, vertexTexCoord0.y * vertexVectorConstants0.packedValues[25u].y) + vertexVectorConstants0.packedValues[27u].y;
    float multiplyAddValue61 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[1u].x));
    float multiplyAddValue62 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[1u].y));
    float multiplyAddValue63 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue45, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue43, multiplyAddValue44 * vertexVectorConstants0.packedValues[1u].z));
    varyingTexCoord1.x = multiplyAddValue43;
    varyingTexCoord1.y = multiplyAddValue44;
    varyingTexCoord1.z = multiplyAddValue45;
    varyingTexCoord2.x = fma(multiplyAddValue63, productValue43, fma(multiplyAddValue61, productValue46, multiplyAddValue58 * multiplyAddValue62));
    varyingTexCoord2.y = fma(multiplyAddValue63, productValue44, fma(multiplyAddValue61, productValue47, multiplyAddValue59 * multiplyAddValue62));
    varyingTexCoord2.z = fma(multiplyAddValue63, productValue45, fma(multiplyAddValue61, productValue48, multiplyAddValue60 * multiplyAddValue62));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingNormal0.x = productValue43;
    varyingNormal0.y = productValue44;
    varyingNormal0.z = productValue45;
    varyingTangent0.x = productValue46;
    varyingTangent0.y = productValue47;
    varyingTangent0.z = productValue48;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord1.x = scalarValue1;
    varyingTexCoord1.y = scalarValue;
    varyingTexCoord1.z = scalarValue2;
    float multiplyAddValue72 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].x));
    float multiplyAddValue73 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].y));
    float multiplyAddValue74 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].z));
    varyingTexCoord2.x = fma(multiplyAddValue74, productValue43, fma(multiplyAddValue72, productValue46, multiplyAddValue58 * multiplyAddValue73));
    varyingTexCoord2.y = fma(multiplyAddValue74, productValue44, fma(multiplyAddValue72, productValue47, multiplyAddValue59 * multiplyAddValue73));
    varyingTexCoord2.z = fma(multiplyAddValue74, productValue45, fma(multiplyAddValue72, productValue48, multiplyAddValue60 * multiplyAddValue73));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingNormal0.x = productValue43;
    varyingNormal0.y = productValue44;
    varyingNormal0.z = productValue45;
    varyingTangent0.x = productValue46;
    varyingTangent0.y = productValue47;
    varyingTangent0.z = productValue48;
    varyingTexCoord0.x = fma(vertexVectorConstants0.packedValues[24u].x, vertexTexCoord0.x, vertexTexCoord0.y * vertexVectorConstants0.packedValues[25u].x) + vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord0.y = fma(vertexVectorConstants0.packedValues[24u].y, vertexTexCoord0.x, vertexTexCoord0.y * vertexVectorConstants0.packedValues[25u].y) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord1.x = scalarValue1;
    varyingTexCoord1.y = scalarValue;
    varyingTexCoord1.z = scalarValue2;
    float multiplyAddValue72 = fma(vertexVectorConstants0.packedValues[2u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].x));
    float multiplyAddValue73 = fma(vertexVectorConstants0.packedValues[2u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].y));
    float multiplyAddValue74 = fma(vertexVectorConstants0.packedValues[2u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[0u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[1u].z));
    varyingTexCoord2.x = fma(multiplyAddValue74, productValue43, fma(multiplyAddValue72, productValue46, multiplyAddValue58 * multiplyAddValue73));
    varyingTexCoord2.y = fma(multiplyAddValue74, productValue44, fma(multiplyAddValue72, productValue47, multiplyAddValue59 * multiplyAddValue73));
    varyingTexCoord2.z = fma(multiplyAddValue74, productValue45, fma(multiplyAddValue72, productValue48, multiplyAddValue60 * multiplyAddValue73));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = productValue;
    varyingNormal0.y = productValue1;
    varyingNormal0.z = productValue2;
    varyingTangent0.x = productValue3;
    varyingTangent0.y = productValue4;
    varyingTangent0.z = productValue5;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord2.x = fma(multiplyAddValue17, productValue, fma(multiplyAddValue16, productValue6, multiplyAddValue15 * productValue3));
    varyingTexCoord2.y = fma(multiplyAddValue17, productValue1, fma(multiplyAddValue16, productValue7, multiplyAddValue15 * productValue4));
    varyingTexCoord2.z = fma(multiplyAddValue17, productValue2, fma(multiplyAddValue16, productValue8, multiplyAddValue15 * productValue5));
    varyingTexCoord1.x = multiplyAddValue;
    varyingTexCoord1.y = multiplyAddValue1;
    varyingTexCoord1.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = productValue;
    varyingNormal0.y = productValue1;
    varyingNormal0.z = productValue2;
    varyingTangent0.x = productValue3;
    varyingTangent0.y = productValue4;
    varyingTangent0.z = productValue5;
    varyingTexCoord0.x = vertexVectorConstants0.packedValues[27u].x + fma(vertexVectorConstants0.packedValues[25u].x, vertexTexCoord0.y, vertexVectorConstants0.packedValues[24u].x * vertexTexCoord0.x);
    varyingTexCoord0.y = fma(vertexVectorConstants0.packedValues[25u].y, vertexTexCoord0.y, vertexVectorConstants0.packedValues[24u].y * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.x = fma(multiplyAddValue17, productValue, fma(multiplyAddValue16, productValue6, multiplyAddValue15 * productValue3));
    varyingTexCoord2.y = fma(multiplyAddValue17, productValue1, fma(multiplyAddValue16, productValue7, multiplyAddValue15 * productValue4));
    varyingTexCoord2.z = fma(multiplyAddValue17, productValue2, fma(multiplyAddValue16, productValue8, multiplyAddValue15 * productValue5));
    varyingTexCoord1.x = multiplyAddValue;
    varyingTexCoord1.y = multiplyAddValue1;
    varyingTexCoord1.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = productValue;
    varyingNormal0.y = productValue1;
    varyingNormal0.z = productValue2;
    varyingTangent0.x = productValue3;
    varyingTangent0.y = productValue4;
    varyingTangent0.z = productValue5;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
    varyingTexCoord2.x = fma(multiplyAddValue71, productValue, fma(multiplyAddValue70, productValue6, multiplyAddValue69 * productValue3));
    varyingTexCoord2.y = fma(multiplyAddValue71, productValue1, fma(multiplyAddValue70, productValue7, multiplyAddValue69 * productValue4));
    varyingTexCoord2.z = fma(multiplyAddValue71, productValue2, fma(multiplyAddValue70, productValue8, multiplyAddValue69 * productValue5));
    varyingTexCoord1.x = multiplyAddValue66;
    varyingTexCoord1.y = multiplyAddValue67;
    varyingTexCoord1.z = multiplyAddValue68;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_TRANSFORM_UV0 == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingNormal0.x = productValue;
    varyingNormal0.y = productValue1;
    varyingNormal0.z = productValue2;
    varyingTangent0.x = productValue3;
    varyingTangent0.y = productValue4;
    varyingTangent0.z = productValue5;
    varyingTexCoord0.x = vertexVectorConstants0.packedValues[27u].x + fma(vertexVectorConstants0.packedValues[25u].x, vertexTexCoord0.y, vertexVectorConstants0.packedValues[24u].x * vertexTexCoord0.x);
    varyingTexCoord0.y = fma(vertexVectorConstants0.packedValues[25u].y, vertexTexCoord0.y, vertexVectorConstants0.packedValues[24u].y * vertexTexCoord0.x) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord2.x = fma(multiplyAddValue71, productValue, fma(multiplyAddValue70, productValue6, multiplyAddValue69 * productValue3));
    varyingTexCoord2.y = fma(multiplyAddValue71, productValue1, fma(multiplyAddValue70, productValue7, multiplyAddValue69 * productValue4));
    varyingTexCoord2.z = fma(multiplyAddValue71, productValue2, fma(multiplyAddValue70, productValue8, multiplyAddValue69 * productValue5));
    varyingTexCoord1.x = multiplyAddValue66;
    varyingTexCoord1.y = multiplyAddValue67;
    varyingTexCoord1.z = multiplyAddValue68;
#endif
}
