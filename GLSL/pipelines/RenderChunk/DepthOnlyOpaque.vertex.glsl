#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunk / DepthOnlyOpaque / vertex forward pipeline.
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
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40) || (RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
#define RD_USE_DOT2_PRECISE_FLOAT_5 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/RenderChunk/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u];
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[11u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[11u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[11u].z;
    precise float productValue3 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue4 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue5 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue6 = multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].w;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue, productValue3)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue, productValue4)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue, productValue5)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue, productValue6)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(multiplyAddValue3, multiplyAddValue4, multiplyAddValue5, multiplyAddValue6);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u];
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue);
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[11u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[11u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[11u].z;
    precise float sumValue13 = multiplyAddValue + 0.5;
    precise float sumValue14 = multiplyAddValue1 + 0.5;
    precise float sumValue15 = multiplyAddValue2 + 0.5;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    precise float sumValue16 = sumValue15 - vertexVectorConstants0.packedValues[29u].z;
    precise float sumValue17 = sumValue13 - vertexVectorConstants0.packedValues[29u].x;
    precise float sumValue18 = sumValue14 - vertexVectorConstants0.packedValues[29u].y;
    vec3 vectorValue2 = vec3(sumValue16, sumValue17, sumValue18);
    float inverseLengthValue = inversesqrt(rdDot3Precise2(vectorValue2, vectorValue2));
    precise float productValue7 = inverseLengthValue * sumValue16;
    precise float productValue8 = inverseLengthValue * sumValue17;
    precise float productValue9 = inverseLengthValue * sumValue18;
    precise float productValue10 = productValue9 * 0.0;
    precise float productValue11 = productValue7 * 0.0;
    precise float productValue12 = productValue8 * 1.0;
    float multiplyAddValue18 = fma(productValue7, 1.0, -productValue10);
    float multiplyAddValue19 = fma(productValue9, 0.0, -productValue12);
    vec2 vectorValue3 = vec2(multiplyAddValue18, multiplyAddValue19);
    float inverseLengthValue1 = inversesqrt(rdDot2Precise(vectorValue3, vectorValue3));
    precise float productValue13 = inverseLengthValue1 * multiplyAddValue18;
    precise float multiplyAddValue20 = inverseLengthValue1 * fma(productValue8, 0.0, -productValue11);
    precise float productValue14 = inverseLengthValue1 * multiplyAddValue19;
    precise float productValue15 = productValue7 * multiplyAddValue20;
    precise float productValue16 = productValue8 * productValue14;
    precise float productValue17 = productValue9 * productValue13;
    precise float sumValue19 = vertexColor0.z - 0.5;
    precise float sumValue20 = vertexColor0.x - 0.5;
    precise float productValue18 = productValue13 * sumValue20;
    precise float productValue19 = multiplyAddValue20 * sumValue20;
    precise float productValue20 = productValue14 * sumValue20;
    precise float multiplyAddValue21 = sumValue13 - fma(fma(productValue9, productValue14, -productValue15), sumValue19, productValue18);
    precise float multiplyAddValue22 = sumValue14 - fma(fma(productValue7, productValue13, -productValue16), sumValue19, productValue19);
    precise float multiplyAddValue23 = sumValue15 - fma(fma(productValue8, multiplyAddValue20, -productValue17), sumValue19, productValue20);
    precise float productValue21 = multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue22 = multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue23 = multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue24 = multiplyAddValue22 * vertexVectorConstants0.packedValues[5u].w;
    precise float sumValue21 = vertexVectorConstants0.packedValues[29u].x - multiplyAddValue21;
    precise float sumValue22 = vertexVectorConstants0.packedValues[29u].y - multiplyAddValue22;
    precise float sumValue23 = vertexVectorConstants0.packedValues[29u].z - multiplyAddValue23;
    vec3 vectorValue4 = vec3(sumValue21, sumValue22, sumValue23);
    precise float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue21, productValue21)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue21, productValue22)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue21, productValue23)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue21, productValue24)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u];
    vec4 vectorValue5 = vec4(multiplyAddValue24, multiplyAddValue25, multiplyAddValue26, multiplyAddValue27);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue5);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u];
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue5);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue5);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue5);
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue52 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u];
    vec4 vectorValue8 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue1 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue38 = scalarValue1 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue39 = scalarValue1 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue40 = scalarValue1 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue41 = scalarValue1 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue2 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue2, productValue38)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue2, productValue39)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue2, productValue40)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue2, productValue41)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue9 = vec4(multiplyAddValue43, multiplyAddValue44, multiplyAddValue45, multiplyAddValue46);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue52, vertexScalarConstants0.packedValues[12u]), vectorValue9);
    precise float sumValue53 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u];
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue53, vertexScalarConstants0.packedValues[13u]), vectorValue9);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue9);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue9);
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    vec4 vectorValue8 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue1 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float sumValue60 = scalarValue2 + 0.5;
    precise float sumValue61 = scalarValue1 + 0.5;
    precise float sumValue62 = scalarValue3 + 0.5;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    precise float sumValue63 = sumValue62 - vertexVectorConstants0.packedValues[13u].z;
    precise float sumValue64 = sumValue60 - vertexVectorConstants0.packedValues[13u].x;
    precise float sumValue65 = sumValue61 - vertexVectorConstants0.packedValues[13u].y;
    vec3 vectorValue11 = vec3(sumValue63, sumValue64, sumValue65);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
    precise float productValue42 = inverseLengthValue6 * sumValue63;
    precise float productValue43 = inverseLengthValue6 * sumValue64;
    precise float productValue44 = inverseLengthValue6 * sumValue65;
    precise float productValue45 = productValue44 * 0.0;
    precise float productValue46 = productValue42 * 0.0;
    precise float productValue47 = productValue43 * 1.0;
    float multiplyAddValue48 = fma(productValue42, 1.0, -productValue45);
    float multiplyAddValue49 = fma(productValue44, 0.0, -productValue47);
    vec2 vectorValue12 = vec2(multiplyAddValue48, multiplyAddValue49);
    float inverseLengthValue7 = inversesqrt(rdDot2Precise(vectorValue12, vectorValue12));
    precise float productValue48 = inverseLengthValue7 * multiplyAddValue48;
    precise float multiplyAddValue50 = inverseLengthValue7 * fma(productValue43, 0.0, -productValue46);
    precise float productValue49 = inverseLengthValue7 * multiplyAddValue49;
    precise float productValue50 = productValue42 * multiplyAddValue50;
    precise float productValue51 = productValue43 * productValue49;
    precise float productValue52 = productValue44 * productValue48;
    precise float sumValue19 = vertexColor0.z - 0.5;
    precise float sumValue20 = vertexColor0.x - 0.5;
    precise float productValue53 = productValue48 * sumValue20;
    precise float productValue54 = multiplyAddValue50 * sumValue20;
    precise float productValue55 = productValue49 * sumValue20;
    precise float multiplyAddValue51 = sumValue60 - fma(fma(productValue44, productValue49, -productValue50), sumValue19, productValue53);
    precise float multiplyAddValue52 = sumValue61 - fma(fma(productValue42, productValue48, -productValue51), sumValue19, productValue54);
    precise float multiplyAddValue53 = sumValue62 - fma(fma(productValue43, multiplyAddValue50, -productValue52), sumValue19, productValue55);
    precise float productValue56 = multiplyAddValue52 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue57 = multiplyAddValue52 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue58 = multiplyAddValue52 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue59 = multiplyAddValue52 * vertexVectorConstants0.packedValues[5u].w;
    precise float sumValue66 = vertexVectorConstants0.packedValues[13u].x - multiplyAddValue51;
    precise float sumValue67 = vertexVectorConstants0.packedValues[13u].y - multiplyAddValue52;
    precise float sumValue68 = vertexVectorConstants0.packedValues[13u].z - multiplyAddValue53;
    vec3 vectorValue13 = vec3(sumValue66, sumValue67, sumValue68);
    precise float multiplyAddValue54 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue51, productValue56)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue55 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue51, productValue57)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue56 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue51, productValue58)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue57 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue53, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue51, productValue59)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue52 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u];
    vec4 vectorValue14 = vec4(multiplyAddValue54, multiplyAddValue55, multiplyAddValue56, multiplyAddValue57);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue52, vertexScalarConstants0.packedValues[12u]), vectorValue14);
    precise float sumValue53 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u];
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue53, vertexScalarConstants0.packedValues[13u]), vectorValue14);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue14);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue14);
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    vec4 multiplyAddValue10 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue7, multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue10);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue10);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue10);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue10);
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue37 = multiplyAddValue7 + 0.5;
    float sumValue38 = multiplyAddValue8 + 0.5;
    float sumValue39 = multiplyAddValue9 + 0.5;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    float sumValue40 = sumValue39 - vertexVectorConstants0.packedValues[29u].z;
    float sumValue41 = sumValue37 - vertexVectorConstants0.packedValues[29u].x;
    float sumValue42 = sumValue38 - vertexVectorConstants0.packedValues[29u].y;
    vec3 vectorValue6 = vec3(sumValue40, sumValue41, sumValue42);
    float inverseLengthValue4 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
    float productValue33 = inverseLengthValue4 * sumValue40;
    float productValue34 = inverseLengthValue4 * sumValue41;
    float productValue35 = inverseLengthValue4 * sumValue42;
    float scalarValue = -productValue34;
    vec2 vectorValue7 = vec2(productValue33, scalarValue);
    float inverseLengthValue5 = inversesqrt(rdDot2Precise(vectorValue7, vectorValue7));
    float productValue36 = inverseLengthValue5 * productValue33;
    float productValue37 = inverseLengthValue5 * scalarValue;
    float sumValue43 = vertexColor0.z - 0.5;
    float sumValue44 = vertexColor0.x - 0.5;
    float multiplyAddValue32 = fma(productValue35 * productValue37, sumValue43, productValue36 * sumValue44);
    float multiplyAddValue33 = fma(productValue33, productValue36, -(productValue34 * productValue37)) * sumValue43;
    float multiplyAddValue34 = fma(-(productValue35 * productValue36), sumValue43, productValue37 * sumValue44);
    float sumValue45 = sumValue37 - multiplyAddValue32;
    float sumValue46 = sumValue38 - multiplyAddValue33;
    float sumValue47 = sumValue39 - multiplyAddValue34;
    vec3 sumValue48 = vec3((multiplyAddValue32 - sumValue37) + vertexVectorConstants0.packedValues[29u].x, (multiplyAddValue33 - sumValue38) + vertexVectorConstants0.packedValues[29u].y, (multiplyAddValue34 - sumValue39) + vertexVectorConstants0.packedValues[29u].z);
    vec4 multiplyAddValue35 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, sumValue47, fma(vertexVectorConstants0.packedValues[4u].x, sumValue45, sumValue46 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, sumValue47, fma(vertexVectorConstants0.packedValues[4u].y, sumValue45, sumValue46 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, sumValue47, fma(vertexVectorConstants0.packedValues[4u].z, sumValue45, sumValue46 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, sumValue47, fma(vertexVectorConstants0.packedValues[4u].w, sumValue45, sumValue46 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue35);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue35);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue35);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue35);
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue8 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue1 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue2 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    vec4 multiplyAddValue47 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue3, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue2, scalarValue1 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue47);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue47);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue47);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue47);
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue8 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue1 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float sumValue70 = scalarValue2 + 0.5;
    float sumValue71 = scalarValue1 + 0.5;
    float sumValue72 = scalarValue3 + 0.5;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    float sumValue73 = sumValue72 - vertexVectorConstants0.packedValues[13u].z;
    float sumValue74 = sumValue70 - vertexVectorConstants0.packedValues[13u].x;
    float sumValue75 = sumValue71 - vertexVectorConstants0.packedValues[13u].y;
    vec3 vectorValue15 = vec3(sumValue73, sumValue74, sumValue75);
    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue15, vectorValue15));
    float productValue60 = inverseLengthValue8 * sumValue73;
    float productValue61 = inverseLengthValue8 * sumValue74;
    float productValue62 = inverseLengthValue8 * sumValue75;
    float scalarValue4 = -productValue61;
    vec2 vectorValue16 = vec2(productValue60, scalarValue4);
    float inverseLengthValue9 = inversesqrt(rdDot2Precise(vectorValue16, vectorValue16));
    float productValue63 = inverseLengthValue9 * productValue60;
    float productValue64 = inverseLengthValue9 * scalarValue4;
    float sumValue43 = vertexColor0.z - 0.5;
    float sumValue44 = vertexColor0.x - 0.5;
    float multiplyAddValue58 = fma(productValue62 * productValue64, sumValue43, productValue63 * sumValue44);
    float multiplyAddValue59 = fma(productValue60, productValue63, -(productValue61 * productValue64)) * sumValue43;
    float multiplyAddValue60 = fma(-(productValue62 * productValue63), sumValue43, productValue64 * sumValue44);
    float sumValue76 = sumValue70 - multiplyAddValue58;
    float sumValue77 = sumValue71 - multiplyAddValue59;
    float sumValue78 = sumValue72 - multiplyAddValue60;
    vec3 sumValue79 = vec3((multiplyAddValue58 - sumValue70) + vertexVectorConstants0.packedValues[13u].x, (multiplyAddValue59 - sumValue71) + vertexVectorConstants0.packedValues[13u].y, (multiplyAddValue60 - sumValue72) + vertexVectorConstants0.packedValues[13u].z);
    vec4 multiplyAddValue61 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, sumValue78, fma(vertexVectorConstants0.packedValues[4u].x, sumValue76, sumValue77 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, sumValue78, fma(vertexVectorConstants0.packedValues[4u].y, sumValue76, sumValue77 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, sumValue78, fma(vertexVectorConstants0.packedValues[4u].z, sumValue76, sumValue77 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, sumValue78, fma(vertexVectorConstants0.packedValues[4u].w, sumValue76, sumValue77 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue61);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue61);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue61);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue61);
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue10 = vertexVectorConstants0.packedValues[29u].x - multiplyAddValue11;
    float sumValue11 = vertexVectorConstants0.packedValues[29u].y - multiplyAddValue12;
    float sumValue12 = vertexVectorConstants0.packedValues[29u].z - multiplyAddValue13;
    bool conditionValue1 = vertexVectorConstants0.packedValues[26u].x > 0.5;
    float comparisonValue2 = conditionValue1 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue12, multiplyAddValue11 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue15, multiplyAddValue14 * vertexVectorConstants0.packedValues[0u].w)));
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue25 = multiplyAddValue11 + 0.5;
    float sumValue26 = multiplyAddValue12 + 0.5;
    float sumValue27 = multiplyAddValue13 + 0.5;
    float sumValue28 = sumValue25 - vertexVectorConstants0.packedValues[29u].x;
    float sumValue29 = sumValue26 - vertexVectorConstants0.packedValues[29u].y;
    float sumValue30 = sumValue27 - vertexVectorConstants0.packedValues[29u].z;
    float inverseLengthValue2 = inversesqrt(dot(vec3(sumValue28, sumValue29, sumValue30), vec3(sumValue28, sumValue29, sumValue30)));
    float productValue25 = sumValue28 * inverseLengthValue2;
    float productValue26 = sumValue30 * inverseLengthValue2;
    float sumValue31 = (-0.0) - productValue25;
    float inverseLengthValue3 = inversesqrt(dot(vec3(productValue26, 0.0, sumValue31), vec3(productValue26, 0.0, sumValue31)));
    float productValue27 = inverseLengthValue3 * productValue26;
    float productValue28 = inverseLengthValue3 * sumValue31;
    float sumValue32 = vertexColor0.z + (-0.5);
    float productValue29 = (inverseLengthValue2 * sumValue32) * sumValue29;
    float sumValue33 = vertexColor0.x + (-0.5);
    float productValue30 = (sumValue25 - (productValue27 * sumValue33)) - (productValue28 * productValue29);
    float productValue31 = sumValue26 - (((productValue27 * productValue26) - (productValue28 * productValue25)) * sumValue32);
    float productValue32 = sumValue27 - ((productValue28 * sumValue33) - (productValue27 * productValue29));
    float sumValue34 = vertexVectorConstants0.packedValues[29u].x - productValue30;
    float sumValue35 = vertexVectorConstants0.packedValues[29u].y - productValue31;
    float sumValue36 = vertexVectorConstants0.packedValues[29u].z - productValue32;
    bool conditionValue1 = vertexVectorConstants0.packedValues[26u].x > 0.5;
    float comparisonValue2 = conditionValue1 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x;
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].x, productValue32, fma(vertexVectorConstants0.packedValues[5u].x, productValue31, productValue30 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[6u].y, productValue32, fma(vertexVectorConstants0.packedValues[5u].y, productValue31, productValue30 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue30 = fma(vertexVectorConstants0.packedValues[6u].z, productValue32, fma(vertexVectorConstants0.packedValues[5u].z, productValue31, productValue30 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue31 = fma(vertexVectorConstants0.packedValues[6u].w, productValue32, fma(vertexVectorConstants0.packedValues[5u].w, productValue31, productValue30 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue31, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue30, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue29, multiplyAddValue28 * vertexVectorConstants0.packedValues[0u].w)));
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue36 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue37 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue38 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue49 = vertexVectorConstants0.packedValues[13u].x - multiplyAddValue36;
    float sumValue50 = vertexVectorConstants0.packedValues[13u].y - multiplyAddValue37;
    float sumValue51 = vertexVectorConstants0.packedValues[13u].z - multiplyAddValue38;
    bool conditionValue2 = vertexVectorConstants0.packedValues[10u].x > 0.5;
    float comparisonValue5 = conditionValue2 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x;
    float multiplyAddValue39 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue40 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue38, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue37, multiplyAddValue36 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[12u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[12u].y, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue42, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue41, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue40, multiplyAddValue39 * vertexVectorConstants0.packedValues[0u].w)));
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue36 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue37 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue38 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue80 = multiplyAddValue36 + 0.5;
    float sumValue81 = multiplyAddValue37 + 0.5;
    float sumValue82 = multiplyAddValue38 + 0.5;
    float sumValue83 = sumValue80 - vertexVectorConstants0.packedValues[13u].x;
    float sumValue84 = sumValue81 - vertexVectorConstants0.packedValues[13u].y;
    float sumValue85 = sumValue82 - vertexVectorConstants0.packedValues[13u].z;
    float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue83, sumValue84, sumValue85), vec3(sumValue83, sumValue84, sumValue85)));
    float productValue65 = sumValue83 * inverseLengthValue10;
    float productValue66 = sumValue85 * inverseLengthValue10;
    float sumValue86 = (-0.0) - productValue65;
    float inverseLengthValue11 = inversesqrt(dot(vec3(productValue66, 0.0, sumValue86), vec3(productValue66, 0.0, sumValue86)));
    float productValue67 = inverseLengthValue11 * productValue66;
    float productValue68 = inverseLengthValue11 * sumValue86;
    float sumValue32 = vertexColor0.z + (-0.5);
    float productValue69 = (inverseLengthValue10 * sumValue32) * sumValue84;
    float sumValue33 = vertexColor0.x + (-0.5);
    float productValue70 = (sumValue80 - (productValue67 * sumValue33)) - (productValue68 * productValue69);
    float productValue71 = sumValue81 - (((productValue67 * productValue66) - (productValue68 * productValue65)) * sumValue32);
    float productValue72 = sumValue82 - ((productValue68 * sumValue33) - (productValue67 * productValue69));
    float sumValue87 = vertexVectorConstants0.packedValues[13u].x - productValue70;
    float sumValue88 = vertexVectorConstants0.packedValues[13u].y - productValue71;
    float sumValue89 = vertexVectorConstants0.packedValues[13u].z - productValue72;
    bool conditionValue2 = vertexVectorConstants0.packedValues[10u].x > 0.5;
    float comparisonValue5 = conditionValue2 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x;
    float multiplyAddValue62 = fma(vertexVectorConstants0.packedValues[6u].x, productValue72, fma(vertexVectorConstants0.packedValues[5u].x, productValue71, productValue70 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue63 = fma(vertexVectorConstants0.packedValues[6u].y, productValue72, fma(vertexVectorConstants0.packedValues[5u].y, productValue71, productValue70 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue64 = fma(vertexVectorConstants0.packedValues[6u].z, productValue72, fma(vertexVectorConstants0.packedValues[5u].z, productValue71, productValue70 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue65 = fma(vertexVectorConstants0.packedValues[6u].w, productValue72, fma(vertexVectorConstants0.packedValues[5u].w, productValue71, productValue70 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue65, fma(vertexVectorConstants0.packedValues[12u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue64, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue63, multiplyAddValue62 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue65, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[12u].y, multiplyAddValue64, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue63, multiplyAddValue62 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue65, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue64, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue63, multiplyAddValue62 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue65, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue64, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue63, multiplyAddValue62 * vertexVectorConstants0.packedValues[0u].w)));
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#endif
    varyingTexCoord2.x = 0.0;
    varyingTexCoord2.y = 0.0;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    precise float sumValue2 = vertexVectorConstants0.packedValues[29u].x - multiplyAddValue;
    precise float sumValue3 = vertexVectorConstants0.packedValues[29u].y - multiplyAddValue1;
    precise float sumValue4 = vertexVectorConstants0.packedValues[29u].z - multiplyAddValue2;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    vec3 vectorValue1 = vec3(sumValue2, sumValue3, sumValue4);
    bool conditionValue = vertexScalarConstants0.packedValues[104u] > 0.5;
    precise float nonlinearValue = sqrt(rdDot3Precise2(vectorValue1, vectorValue1)) / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].z);
    precise float sumValue5 = nonlinearValue + vertexScalarConstants0.packedValues[108u];
    precise float comparisonValue = sumValue5 - (conditionValue ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x);
    precise float sumValue6 = 1.0 - 0.9900000095367431640625;
    precise float sumValue7 = vertexVectorConstants0.packedValues[24u].y - vertexVectorConstants0.packedValues[24u].x;
    precise float comparisonValue1 = comparisonValue / (conditionValue ? sumValue6 : sumValue7);
    varyingColor2.w = spvNClamp(comparisonValue1, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    bool conditionValue = vertexScalarConstants0.packedValues[104u] > 0.5;
    precise float nonlinearValue1 = sqrt(rdDot3Precise2(vectorValue4, vectorValue4)) / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].z);
    precise float sumValue24 = nonlinearValue1 + vertexScalarConstants0.packedValues[108u];
    precise float comparisonValue3 = sumValue24 - (conditionValue ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x);
    precise float sumValue6 = 1.0 - 0.9900000095367431640625;
    precise float sumValue7 = vertexVectorConstants0.packedValues[24u].y - vertexVectorConstants0.packedValues[24u].x;
    precise float comparisonValue4 = comparisonValue3 / (conditionValue ? sumValue6 : sumValue7);
    varyingColor2.w = spvNClamp(comparisonValue4, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    precise float sumValue54 = vertexVectorConstants0.packedValues[13u].x - scalarValue2;
    precise float sumValue55 = vertexVectorConstants0.packedValues[13u].y - scalarValue1;
    precise float sumValue56 = vertexVectorConstants0.packedValues[13u].z - scalarValue3;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    vec3 vectorValue10 = vec3(sumValue54, sumValue55, sumValue56);
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    precise float nonlinearValue2 = sqrt(rdDot3Precise2(vectorValue10, vectorValue10)) / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z);
    precise float sumValue57 = nonlinearValue2 + vertexScalarConstants0.packedValues[44u];
    precise float comparisonValue6 = sumValue57 - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x);
    precise float sumValue6 = 1.0 - 0.9900000095367431640625;
    precise float sumValue58 = vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x;
    precise float comparisonValue7 = comparisonValue6 / (conditionValue3 ? sumValue6 : sumValue58);
    varyingColor2.w = spvNClamp(comparisonValue7, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    precise float nonlinearValue3 = sqrt(rdDot3Precise2(vectorValue13, vectorValue13)) / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z);
    precise float sumValue69 = nonlinearValue3 + vertexScalarConstants0.packedValues[44u];
    precise float comparisonValue8 = sumValue69 - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x);
    precise float sumValue6 = 1.0 - 0.9900000095367431640625;
    precise float sumValue58 = vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x;
    precise float comparisonValue9 = comparisonValue8 / (conditionValue3 ? sumValue6 : sumValue58);
    varyingColor2.w = spvNClamp(comparisonValue9, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    vec3 sumValue8 = vec3(vertexVectorConstants0.packedValues[29u].x - multiplyAddValue7, vertexVectorConstants0.packedValues[29u].y - multiplyAddValue8, vertexVectorConstants0.packedValues[29u].z - multiplyAddValue9);
    bool conditionValue = vertexScalarConstants0.packedValues[104u] > 0.5;
    float sumValue9 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((sqrt(rdDot3Precise2(sumValue8, sumValue8)) / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexScalarConstants0.packedValues[108u]) - (conditionValue ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x)) / (conditionValue ? sumValue9 : (vertexVectorConstants0.packedValues[24u].y - vertexVectorConstants0.packedValues[24u].x)), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    bool conditionValue = vertexScalarConstants0.packedValues[104u] > 0.5;
    float sumValue9 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((sqrt(rdDot3Precise2(sumValue48, sumValue48)) / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexScalarConstants0.packedValues[108u]) - (conditionValue ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x)) / (conditionValue ? sumValue9 : (vertexVectorConstants0.packedValues[24u].y - vertexVectorConstants0.packedValues[24u].x)), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord3.x = scalarValue2;
    varyingTexCoord3.y = scalarValue1;
    varyingTexCoord3.z = scalarValue3;
    vec3 sumValue59 = vec3(vertexVectorConstants0.packedValues[13u].x - scalarValue2, vertexVectorConstants0.packedValues[13u].y - scalarValue1, vertexVectorConstants0.packedValues[13u].z - scalarValue3);
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    float sumValue9 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((sqrt(rdDot3Precise2(sumValue59, sumValue59)) / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexScalarConstants0.packedValues[44u]) - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x)) / (conditionValue3 ? sumValue9 : (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x)), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    float sumValue9 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((sqrt(rdDot3Precise2(sumValue79, sumValue79)) / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexScalarConstants0.packedValues[44u]) - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x)) / (conditionValue3 ? sumValue9 : (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x)), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor2.w = spvNClamp((((sqrt(((sumValue10 * sumValue10) + (sumValue11 * sumValue11)) + (sumValue12 * sumValue12)) / (conditionValue1 ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexVectorConstants0.packedValues[27u].x) - comparisonValue2) / ((conditionValue1 ? 1.0 : vertexVectorConstants0.packedValues[24u].y) - comparisonValue2), 0.0, 1.0);
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor2.w = spvNClamp((((sqrt(((sumValue36 * sumValue36) + (sumValue34 * sumValue34)) + (sumValue35 * sumValue35)) / (conditionValue1 ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexVectorConstants0.packedValues[27u].x) - comparisonValue2) / ((conditionValue1 ? 1.0 : vertexVectorConstants0.packedValues[24u].y) - comparisonValue2), 0.0, 1.0);
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    varyingColor2.w = spvNClamp((((sqrt(((sumValue49 * sumValue49) + (sumValue50 * sumValue50)) + (sumValue51 * sumValue51)) / (conditionValue2 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexVectorConstants0.packedValues[11u].x) - comparisonValue5) / ((conditionValue2 ? 1.0 : vertexVectorConstants0.packedValues[8u].y) - comparisonValue5), 0.0, 1.0);
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    varyingColor2.w = spvNClamp((((sqrt(((sumValue89 * sumValue89) + (sumValue87 * sumValue87)) + (sumValue88 * sumValue88)) / (conditionValue2 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexVectorConstants0.packedValues[11u].x) - comparisonValue5) / ((conditionValue2 ? 1.0 : vertexVectorConstants0.packedValues[8u].y) - comparisonValue5), 0.0, 1.0);
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
#endif
    varyingTexCoord0.x = -3.0517578125e-05;
    varyingTexCoord0.y = -3.0517578125e-05;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue11;
    varyingTexCoord3.y = multiplyAddValue12;
    varyingTexCoord3.z = multiplyAddValue13;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue36;
    varyingTexCoord3.y = multiplyAddValue37;
    varyingTexCoord3.z = multiplyAddValue38;
#endif
}
