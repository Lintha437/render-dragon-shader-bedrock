#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunkForwardPBR / DepthOnlyOpaque / vertex forward pipeline.
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

#include "../../include/materials/RenderChunkForwardPBR/VertexBindings.glsli"

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
    precise float productValue20 = inverseLengthValue4 * sumValue20;
    precise float productValue21 = inverseLengthValue4 * sumValue21;
    precise float productValue22 = inverseLengthValue4 * sumValue22;
    precise float productValue23 = productValue22 * 0.0;
    precise float productValue24 = productValue20 * 0.0;
    precise float productValue25 = productValue21 * 1.0;
    float multiplyAddValue16 = fma(productValue20, 1.0, -productValue23);
    float multiplyAddValue17 = fma(productValue22, 0.0, -productValue25);
    vec2 vectorValue3 = vec2(multiplyAddValue16, multiplyAddValue17);
    float inverseLengthValue5 = inversesqrt(rdDot2Precise(vectorValue3, vectorValue3));
    precise float productValue26 = inverseLengthValue5 * multiplyAddValue16;
    precise float multiplyAddValue18 = inverseLengthValue5 * fma(productValue21, 0.0, -productValue24);
    precise float productValue27 = inverseLengthValue5 * multiplyAddValue17;
    precise float productValue28 = productValue20 * multiplyAddValue18;
    precise float productValue29 = productValue21 * productValue27;
    precise float productValue30 = productValue22 * productValue26;
    precise float sumValue23 = vertexColor0.z - 0.5;
    precise float sumValue24 = vertexColor0.x - 0.5;
    precise float productValue31 = productValue26 * sumValue24;
    precise float productValue32 = multiplyAddValue18 * sumValue24;
    precise float productValue33 = productValue27 * sumValue24;
    precise float multiplyAddValue19 = sumValue17 - fma(fma(productValue22, productValue27, -productValue28), sumValue23, productValue31);
    precise float multiplyAddValue20 = sumValue18 - fma(fma(productValue20, productValue26, -productValue29), sumValue23, productValue32);
    precise float multiplyAddValue21 = sumValue19 - fma(fma(productValue21, multiplyAddValue18, -productValue30), sumValue23, productValue33);
    precise float productValue34 = multiplyAddValue20 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue35 = multiplyAddValue20 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue36 = multiplyAddValue20 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue37 = multiplyAddValue20 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue19, productValue34)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue19, productValue35)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue19, productValue36)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue19, productValue37)) + vertexVectorConstants0.packedValues[3u].w;
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
    precise float sumValue32 = scalarValue2 + 0.5;
    precise float sumValue33 = scalarValue1 + 0.5;
    precise float sumValue34 = scalarValue3 + 0.5;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    precise float sumValue35 = sumValue34 - vertexVectorConstants0.packedValues[4u].z;
    precise float sumValue36 = sumValue32 - vertexVectorConstants0.packedValues[4u].x;
    precise float sumValue37 = sumValue33 - vertexVectorConstants0.packedValues[4u].y;
    vec3 vectorValue5 = vec3(sumValue35, sumValue36, sumValue37);
    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue5, vectorValue5));
    precise float productValue50 = inverseLengthValue8 * sumValue35;
    precise float productValue51 = inverseLengthValue8 * sumValue36;
    precise float productValue52 = inverseLengthValue8 * sumValue37;
    precise float productValue53 = productValue52 * 0.0;
    precise float productValue54 = productValue50 * 0.0;
    precise float productValue55 = productValue51 * 1.0;
    float multiplyAddValue33 = fma(productValue50, 1.0, -productValue53);
    float multiplyAddValue34 = fma(productValue52, 0.0, -productValue55);
    vec2 vectorValue6 = vec2(multiplyAddValue33, multiplyAddValue34);
    float inverseLengthValue9 = inversesqrt(rdDot2Precise(vectorValue6, vectorValue6));
    precise float productValue56 = inverseLengthValue9 * multiplyAddValue33;
    precise float multiplyAddValue35 = inverseLengthValue9 * fma(productValue51, 0.0, -productValue54);
    precise float productValue57 = inverseLengthValue9 * multiplyAddValue34;
    precise float productValue58 = productValue50 * multiplyAddValue35;
    precise float productValue59 = productValue51 * productValue57;
    precise float productValue60 = productValue52 * productValue56;
    precise float sumValue23 = vertexColor0.z - 0.5;
    precise float sumValue24 = vertexColor0.x - 0.5;
    precise float productValue61 = productValue56 * sumValue24;
    precise float productValue62 = multiplyAddValue35 * sumValue24;
    precise float productValue63 = productValue57 * sumValue24;
    precise float multiplyAddValue36 = sumValue32 - fma(fma(productValue52, productValue57, -productValue58), sumValue23, productValue61);
    precise float multiplyAddValue37 = sumValue33 - fma(fma(productValue50, productValue56, -productValue59), sumValue23, productValue62);
    precise float multiplyAddValue38 = sumValue34 - fma(fma(productValue51, multiplyAddValue35, -productValue60), sumValue23, productValue63);
    precise float productValue64 = multiplyAddValue37 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue65 = multiplyAddValue37 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue66 = multiplyAddValue37 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue67 = multiplyAddValue37 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue36, productValue64)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue36, productValue65)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue36, productValue66)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue36, productValue67)) + vertexVectorConstants0.packedValues[3u].w;
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
    float sumValue9 = multiplyAddValue7 + 0.5;
    float sumValue10 = multiplyAddValue8 + 0.5;
    float sumValue11 = multiplyAddValue9 + 0.5;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    float sumValue12 = sumValue11 - vertexVectorConstants0.packedValues[20u].z;
    float sumValue13 = sumValue9 - vertexVectorConstants0.packedValues[20u].x;
    float sumValue14 = sumValue10 - vertexVectorConstants0.packedValues[20u].y;
    vec3 vectorValue = vec3(sumValue12, sumValue13, sumValue14);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue, vectorValue));
    float productValue15 = inverseLengthValue2 * sumValue12;
    float productValue16 = inverseLengthValue2 * sumValue13;
    float productValue17 = inverseLengthValue2 * sumValue14;
    float scalarValue = -productValue16;
    vec2 vectorValue1 = vec2(productValue15, scalarValue);
    float inverseLengthValue3 = inversesqrt(rdDot2Precise(vectorValue1, vectorValue1));
    float productValue18 = inverseLengthValue3 * productValue15;
    float productValue19 = inverseLengthValue3 * scalarValue;
    float sumValue15 = vertexColor0.z - 0.5;
    float sumValue16 = vertexColor0.x - 0.5;
    float multiplyAddValue13 = sumValue9 - fma(productValue17 * productValue19, sumValue15, productValue18 * sumValue16);
    float multiplyAddValue14 = sumValue10 - (fma(productValue15, productValue18, -(productValue16 * productValue19)) * sumValue15);
    float multiplyAddValue15 = sumValue11 - fma(-(productValue17 * productValue18), sumValue15, productValue19 * sumValue16);
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue13, multiplyAddValue14 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue13, multiplyAddValue14 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue13, multiplyAddValue14 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue13, multiplyAddValue14 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
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
    float sumValue38 = scalarValue2 + 0.5;
    float sumValue39 = scalarValue1 + 0.5;
    float sumValue40 = scalarValue3 + 0.5;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    float sumValue41 = sumValue40 - vertexVectorConstants0.packedValues[4u].z;
    float sumValue42 = sumValue38 - vertexVectorConstants0.packedValues[4u].x;
    float sumValue43 = sumValue39 - vertexVectorConstants0.packedValues[4u].y;
    vec3 vectorValue7 = vec3(sumValue41, sumValue42, sumValue43);
    float inverseLengthValue10 = inversesqrt(rdDot3Precise2(vectorValue7, vectorValue7));
    float productValue68 = inverseLengthValue10 * sumValue41;
    float productValue69 = inverseLengthValue10 * sumValue42;
    float productValue70 = inverseLengthValue10 * sumValue43;
    float scalarValue4 = -productValue69;
    vec2 vectorValue8 = vec2(productValue68, scalarValue4);
    float inverseLengthValue11 = inversesqrt(rdDot2Precise(vectorValue8, vectorValue8));
    float productValue71 = inverseLengthValue11 * productValue68;
    float productValue72 = inverseLengthValue11 * scalarValue4;
    float sumValue15 = vertexColor0.z - 0.5;
    float sumValue16 = vertexColor0.x - 0.5;
    float multiplyAddValue43 = sumValue38 - fma(productValue70 * productValue72, sumValue15, productValue71 * sumValue16);
    float multiplyAddValue44 = sumValue39 - (fma(productValue68, productValue71, -(productValue69 * productValue72)) * sumValue15);
    float multiplyAddValue45 = sumValue40 - fma(-(productValue70 * productValue71), sumValue15, productValue72 * sumValue16);
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
    float sumValue = multiplyAddValue10 + 0.5;
    float sumValue1 = multiplyAddValue11 + 0.5;
    float sumValue2 = multiplyAddValue12 + 0.5;
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
    float sumValue25 = multiplyAddValue30 + 0.5;
    float sumValue26 = multiplyAddValue31 + 0.5;
    float sumValue27 = multiplyAddValue32 + 0.5;
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
