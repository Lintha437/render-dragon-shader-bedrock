#version 460
#extension GL_GOOGLE_include_directive : require
// RenderChunk / DepthOnlyAlphaTest / vertex forward pipeline.
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
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_EVALUATE_FLOAT_EXPRESSION_FLOAT_4 1
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
    precise float productValue11 = inverseLengthValue * sumValue16;
    precise float productValue12 = inverseLengthValue * sumValue17;
    precise float productValue13 = inverseLengthValue * sumValue18;
    precise float productValue14 = productValue13 * 0.0;
    precise float productValue15 = productValue11 * 0.0;
    precise float productValue16 = productValue12 * 1.0;
    float multiplyAddValue20 = fma(productValue11, 1.0, -productValue14);
    float multiplyAddValue21 = fma(productValue13, 0.0, -productValue16);
    vec2 vectorValue3 = vec2(multiplyAddValue20, multiplyAddValue21);
    float inverseLengthValue1 = inversesqrt(rdDot2Precise(vectorValue3, vectorValue3));
    precise float productValue17 = inverseLengthValue1 * multiplyAddValue20;
    precise float multiplyAddValue22 = inverseLengthValue1 * fma(productValue12, 0.0, -productValue15);
    precise float productValue18 = inverseLengthValue1 * multiplyAddValue21;
    precise float productValue19 = productValue11 * multiplyAddValue22;
    precise float productValue20 = productValue12 * productValue18;
    precise float productValue21 = productValue13 * productValue17;
    precise float sumValue19 = vertexColor0.z - 0.5;
    precise float sumValue20 = vertexColor0.x - 0.5;
    precise float productValue22 = productValue17 * sumValue20;
    precise float productValue23 = multiplyAddValue22 * sumValue20;
    precise float productValue24 = productValue18 * sumValue20;
    precise float multiplyAddValue23 = sumValue13 - fma(fma(productValue13, productValue18, -productValue19), sumValue19, productValue22);
    precise float multiplyAddValue24 = sumValue14 - fma(fma(productValue11, productValue17, -productValue20), sumValue19, productValue23);
    precise float multiplyAddValue25 = sumValue15 - fma(fma(productValue12, multiplyAddValue22, -productValue21), sumValue19, productValue24);
    precise float productValue25 = multiplyAddValue24 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue26 = multiplyAddValue24 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue27 = multiplyAddValue24 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue28 = multiplyAddValue24 * vertexVectorConstants0.packedValues[5u].w;
    precise float sumValue21 = vertexVectorConstants0.packedValues[29u].x - multiplyAddValue23;
    precise float sumValue22 = vertexVectorConstants0.packedValues[29u].y - multiplyAddValue24;
    precise float sumValue23 = vertexVectorConstants0.packedValues[29u].z - multiplyAddValue25;
    vec3 vectorValue4 = vec3(sumValue21, sumValue22, sumValue23);
    precise float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue23, productValue25)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue23, productValue26)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue23, productValue27)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue23, productValue28)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u];
    vec4 vectorValue5 = vec4(multiplyAddValue26, multiplyAddValue27, multiplyAddValue28, multiplyAddValue29);
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
    float scalarValue3 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue42 = scalarValue3 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue43 = scalarValue3 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue44 = scalarValue3 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue45 = scalarValue3 * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue4 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue5 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float multiplyAddValue45 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue5, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue4, productValue42)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue46 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue5, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue4, productValue43)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue47 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue5, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue4, productValue44)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue48 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue5, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue4, productValue45)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue9 = vec4(multiplyAddValue45, multiplyAddValue46, multiplyAddValue47, multiplyAddValue48);
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
    float scalarValue4 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue5 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float sumValue70 = scalarValue4 + 0.5;
    precise float sumValue71 = scalarValue3 + 0.5;
    precise float sumValue72 = scalarValue5 + 0.5;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    precise float sumValue73 = sumValue72 - vertexVectorConstants0.packedValues[13u].z;
    precise float sumValue74 = sumValue70 - vertexVectorConstants0.packedValues[13u].x;
    precise float sumValue75 = sumValue71 - vertexVectorConstants0.packedValues[13u].y;
    vec3 vectorValue13 = vec3(sumValue73, sumValue74, sumValue75);
    float inverseLengthValue8 = inversesqrt(rdDot3Precise2(vectorValue13, vectorValue13));
    precise float productValue51 = inverseLengthValue8 * sumValue73;
    precise float productValue52 = inverseLengthValue8 * sumValue74;
    precise float productValue53 = inverseLengthValue8 * sumValue75;
    precise float productValue54 = productValue53 * 0.0;
    precise float productValue55 = productValue51 * 0.0;
    precise float productValue56 = productValue52 * 1.0;
    float multiplyAddValue54 = fma(productValue51, 1.0, -productValue54);
    float multiplyAddValue55 = fma(productValue53, 0.0, -productValue56);
    vec2 vectorValue14 = vec2(multiplyAddValue54, multiplyAddValue55);
    float inverseLengthValue9 = inversesqrt(rdDot2Precise(vectorValue14, vectorValue14));
    precise float productValue57 = inverseLengthValue9 * multiplyAddValue54;
    precise float multiplyAddValue56 = inverseLengthValue9 * fma(productValue52, 0.0, -productValue55);
    precise float productValue58 = inverseLengthValue9 * multiplyAddValue55;
    precise float productValue59 = productValue51 * multiplyAddValue56;
    precise float productValue60 = productValue52 * productValue58;
    precise float productValue61 = productValue53 * productValue57;
    precise float sumValue19 = vertexColor0.z - 0.5;
    precise float sumValue20 = vertexColor0.x - 0.5;
    precise float productValue62 = productValue57 * sumValue20;
    precise float productValue63 = multiplyAddValue56 * sumValue20;
    precise float productValue64 = productValue58 * sumValue20;
    precise float multiplyAddValue57 = sumValue70 - fma(fma(productValue53, productValue58, -productValue59), sumValue19, productValue62);
    precise float multiplyAddValue58 = sumValue71 - fma(fma(productValue51, productValue57, -productValue60), sumValue19, productValue63);
    precise float multiplyAddValue59 = sumValue72 - fma(fma(productValue52, multiplyAddValue56, -productValue61), sumValue19, productValue64);
    precise float productValue65 = multiplyAddValue58 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue66 = multiplyAddValue58 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue67 = multiplyAddValue58 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue68 = multiplyAddValue58 * vertexVectorConstants0.packedValues[5u].w;
    precise float sumValue76 = vertexVectorConstants0.packedValues[13u].x - multiplyAddValue57;
    precise float sumValue77 = vertexVectorConstants0.packedValues[13u].y - multiplyAddValue58;
    precise float sumValue78 = vertexVectorConstants0.packedValues[13u].z - multiplyAddValue59;
    vec3 vectorValue15 = vec3(sumValue76, sumValue77, sumValue78);
    precise float multiplyAddValue60 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue57, productValue65)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue61 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue57, productValue66)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue62 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue57, productValue67)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue63 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue59, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue57, productValue68)) + vertexVectorConstants0.packedValues[7u].w;
    precise float sumValue52 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u];
    vec4 vectorValue16 = vec4(multiplyAddValue60, multiplyAddValue61, multiplyAddValue62, multiplyAddValue63);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue52, vertexScalarConstants0.packedValues[12u]), vectorValue16);
    precise float sumValue53 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u];
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue53, vertexScalarConstants0.packedValues[13u]), vectorValue16);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue16);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue16);
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    vec4 multiplyAddValue12 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue9, multiplyAddValue10 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue9, multiplyAddValue10 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue9, multiplyAddValue10 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue9, multiplyAddValue10 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue12);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue12);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue12);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue12);
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue25 = multiplyAddValue9 + 0.5;
    float sumValue26 = multiplyAddValue10 + 0.5;
    float sumValue27 = multiplyAddValue11 + 0.5;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    float sumValue28 = sumValue27 - vertexVectorConstants0.packedValues[29u].z;
    float sumValue29 = sumValue25 - vertexVectorConstants0.packedValues[29u].x;
    float sumValue30 = sumValue26 - vertexVectorConstants0.packedValues[29u].y;
    vec3 vectorValue6 = vec3(sumValue28, sumValue29, sumValue30);
    float inverseLengthValue2 = inversesqrt(rdDot3Precise2(vectorValue6, vectorValue6));
    float productValue29 = inverseLengthValue2 * sumValue28;
    float productValue30 = inverseLengthValue2 * sumValue29;
    float productValue31 = inverseLengthValue2 * sumValue30;
    float scalarValue2 = -productValue30;
    vec2 vectorValue7 = vec2(productValue29, scalarValue2);
    float inverseLengthValue3 = inversesqrt(rdDot2Precise(vectorValue7, vectorValue7));
    float productValue32 = inverseLengthValue3 * productValue29;
    float productValue33 = inverseLengthValue3 * scalarValue2;
    float sumValue31 = vertexColor0.z - 0.5;
    float sumValue32 = vertexColor0.x - 0.5;
    float multiplyAddValue30 = fma(productValue31 * productValue33, sumValue31, productValue32 * sumValue32);
    float multiplyAddValue31 = fma(productValue29, productValue32, -(productValue30 * productValue33)) * sumValue31;
    float multiplyAddValue32 = fma(-(productValue31 * productValue32), sumValue31, productValue33 * sumValue32);
    float sumValue33 = sumValue25 - multiplyAddValue30;
    float sumValue34 = sumValue26 - multiplyAddValue31;
    float sumValue35 = sumValue27 - multiplyAddValue32;
    vec3 sumValue36 = vec3((multiplyAddValue30 - sumValue25) + vertexVectorConstants0.packedValues[29u].x, (multiplyAddValue31 - sumValue26) + vertexVectorConstants0.packedValues[29u].y, (multiplyAddValue32 - sumValue27) + vertexVectorConstants0.packedValues[29u].z);
    vec4 multiplyAddValue33 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, sumValue35, fma(vertexVectorConstants0.packedValues[4u].x, sumValue33, sumValue34 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, sumValue35, fma(vertexVectorConstants0.packedValues[4u].y, sumValue33, sumValue34 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, sumValue35, fma(vertexVectorConstants0.packedValues[4u].z, sumValue33, sumValue34 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, sumValue35, fma(vertexVectorConstants0.packedValues[4u].w, sumValue33, sumValue34 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue33);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue33);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue33);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue33);
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue8 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue3 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue4 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue5 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    vec4 multiplyAddValue49 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue5, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue4, scalarValue3 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue5, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue4, scalarValue3 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue5, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue4, scalarValue3 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue5, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue4, scalarValue3 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue49);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue49);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue49);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue49);
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue8 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue4 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue3 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue5 = rdDot4Precise(vectorValue8, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    float sumValue60 = scalarValue4 + 0.5;
    float sumValue61 = scalarValue3 + 0.5;
    float sumValue62 = scalarValue5 + 0.5;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    float sumValue63 = sumValue62 - vertexVectorConstants0.packedValues[13u].z;
    float sumValue64 = sumValue60 - vertexVectorConstants0.packedValues[13u].x;
    float sumValue65 = sumValue61 - vertexVectorConstants0.packedValues[13u].y;
    vec3 vectorValue11 = vec3(sumValue63, sumValue64, sumValue65);
    float inverseLengthValue6 = inversesqrt(rdDot3Precise2(vectorValue11, vectorValue11));
    float productValue46 = inverseLengthValue6 * sumValue63;
    float productValue47 = inverseLengthValue6 * sumValue64;
    float productValue48 = inverseLengthValue6 * sumValue65;
    float scalarValue6 = -productValue47;
    vec2 vectorValue12 = vec2(productValue46, scalarValue6);
    float inverseLengthValue7 = inversesqrt(rdDot2Precise(vectorValue12, vectorValue12));
    float productValue49 = inverseLengthValue7 * productValue46;
    float productValue50 = inverseLengthValue7 * scalarValue6;
    float sumValue31 = vertexColor0.z - 0.5;
    float sumValue32 = vertexColor0.x - 0.5;
    float multiplyAddValue50 = fma(productValue48 * productValue50, sumValue31, productValue49 * sumValue32);
    float multiplyAddValue51 = fma(productValue46, productValue49, -(productValue47 * productValue50)) * sumValue31;
    float multiplyAddValue52 = fma(-(productValue48 * productValue49), sumValue31, productValue50 * sumValue32);
    float sumValue66 = sumValue60 - multiplyAddValue50;
    float sumValue67 = sumValue61 - multiplyAddValue51;
    float sumValue68 = sumValue62 - multiplyAddValue52;
    vec3 sumValue69 = vec3((multiplyAddValue50 - sumValue60) + vertexVectorConstants0.packedValues[13u].x, (multiplyAddValue51 - sumValue61) + vertexVectorConstants0.packedValues[13u].y, (multiplyAddValue52 - sumValue62) + vertexVectorConstants0.packedValues[13u].z);
    vec4 multiplyAddValue53 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, sumValue68, fma(vertexVectorConstants0.packedValues[4u].x, sumValue66, sumValue67 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, sumValue68, fma(vertexVectorConstants0.packedValues[4u].y, sumValue66, sumValue67 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, sumValue68, fma(vertexVectorConstants0.packedValues[4u].z, sumValue66, sumValue67 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, sumValue68, fma(vertexVectorConstants0.packedValues[4u].w, sumValue66, sumValue67 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[48u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue53);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[49u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue53);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue53);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue53);
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue10 = vertexVectorConstants0.packedValues[29u].x - multiplyAddValue13;
    float sumValue11 = vertexVectorConstants0.packedValues[29u].y - multiplyAddValue14;
    float sumValue12 = vertexVectorConstants0.packedValues[29u].z - multiplyAddValue15;
    bool conditionValue1 = vertexVectorConstants0.packedValues[26u].x > 0.5;
    float comparisonValue2 = conditionValue1 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue15, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue14, multiplyAddValue13 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue19, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue17, multiplyAddValue16 * vertexVectorConstants0.packedValues[0u].w)));
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float sumValue37 = multiplyAddValue13 + 0.5;
    float sumValue38 = multiplyAddValue14 + 0.5;
    float sumValue39 = multiplyAddValue15 + 0.5;
    float sumValue40 = sumValue37 - vertexVectorConstants0.packedValues[29u].x;
    float sumValue41 = sumValue38 - vertexVectorConstants0.packedValues[29u].y;
    float sumValue42 = sumValue39 - vertexVectorConstants0.packedValues[29u].z;
    float inverseLengthValue4 = inversesqrt(dot(vec3(sumValue40, sumValue41, sumValue42), vec3(sumValue40, sumValue41, sumValue42)));
    float productValue34 = sumValue40 * inverseLengthValue4;
    float productValue35 = sumValue42 * inverseLengthValue4;
    float sumValue43 = (-0.0) - productValue34;
    float inverseLengthValue5 = inversesqrt(dot(vec3(productValue35, 0.0, sumValue43), vec3(productValue35, 0.0, sumValue43)));
    float productValue36 = inverseLengthValue5 * productValue35;
    float productValue37 = inverseLengthValue5 * sumValue43;
    float sumValue44 = vertexColor0.z + (-0.5);
    float productValue38 = (inverseLengthValue4 * sumValue44) * sumValue41;
    float sumValue45 = vertexColor0.x + (-0.5);
    float productValue39 = (sumValue37 - (productValue36 * sumValue45)) - (productValue37 * productValue38);
    float productValue40 = sumValue38 - (((productValue36 * productValue35) - (productValue37 * productValue34)) * sumValue44);
    float productValue41 = sumValue39 - ((productValue37 * sumValue45) - (productValue36 * productValue38));
    float sumValue46 = vertexVectorConstants0.packedValues[29u].x - productValue39;
    float sumValue47 = vertexVectorConstants0.packedValues[29u].y - productValue40;
    float sumValue48 = vertexVectorConstants0.packedValues[29u].z - productValue41;
    bool conditionValue1 = vertexVectorConstants0.packedValues[26u].x > 0.5;
    float comparisonValue2 = conditionValue1 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x;
    float multiplyAddValue34 = fma(vertexVectorConstants0.packedValues[6u].x, productValue41, fma(vertexVectorConstants0.packedValues[5u].x, productValue40, productValue39 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue35 = fma(vertexVectorConstants0.packedValues[6u].y, productValue41, fma(vertexVectorConstants0.packedValues[5u].y, productValue40, productValue39 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue36 = fma(vertexVectorConstants0.packedValues[6u].z, productValue41, fma(vertexVectorConstants0.packedValues[5u].z, productValue40, productValue39 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue37 = fma(vertexVectorConstants0.packedValues[6u].w, productValue41, fma(vertexVectorConstants0.packedValues[5u].w, productValue40, productValue39 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue37, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue36, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue35, multiplyAddValue34 * vertexVectorConstants0.packedValues[0u].w)));
    varyingColor0.x = 1.0;
    varyingColor0.y = 1.0;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue38 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue39 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue40 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue49 = vertexVectorConstants0.packedValues[13u].x - multiplyAddValue38;
    float sumValue50 = vertexVectorConstants0.packedValues[13u].y - multiplyAddValue39;
    float sumValue51 = vertexVectorConstants0.packedValues[13u].z - multiplyAddValue40;
    bool conditionValue2 = vertexVectorConstants0.packedValues[10u].x > 0.5;
    float comparisonValue5 = conditionValue2 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x;
    float multiplyAddValue41 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue39, multiplyAddValue38 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue42 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue39, multiplyAddValue38 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue43 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue39, multiplyAddValue38 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue44 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue40, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue39, multiplyAddValue38 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[12u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue43, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue42, multiplyAddValue41 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[12u].y, multiplyAddValue43, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue42, multiplyAddValue41 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue43, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue42, multiplyAddValue41 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue44, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue43, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue42, multiplyAddValue41 * vertexVectorConstants0.packedValues[0u].w)));
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue38 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue39 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue40 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float sumValue80 = multiplyAddValue38 + 0.5;
    float sumValue81 = multiplyAddValue39 + 0.5;
    float sumValue82 = multiplyAddValue40 + 0.5;
    float sumValue83 = sumValue80 - vertexVectorConstants0.packedValues[13u].x;
    float sumValue84 = sumValue81 - vertexVectorConstants0.packedValues[13u].y;
    float sumValue85 = sumValue82 - vertexVectorConstants0.packedValues[13u].z;
    float inverseLengthValue10 = inversesqrt(dot(vec3(sumValue83, sumValue84, sumValue85), vec3(sumValue83, sumValue84, sumValue85)));
    float productValue69 = sumValue83 * inverseLengthValue10;
    float productValue70 = sumValue85 * inverseLengthValue10;
    float sumValue86 = (-0.0) - productValue69;
    float inverseLengthValue11 = inversesqrt(dot(vec3(productValue70, 0.0, sumValue86), vec3(productValue70, 0.0, sumValue86)));
    float productValue71 = inverseLengthValue11 * productValue70;
    float productValue72 = inverseLengthValue11 * sumValue86;
    float sumValue44 = vertexColor0.z + (-0.5);
    float productValue73 = (inverseLengthValue10 * sumValue44) * sumValue84;
    float sumValue45 = vertexColor0.x + (-0.5);
    float productValue74 = (sumValue80 - (productValue71 * sumValue45)) - (productValue72 * productValue73);
    float productValue75 = sumValue81 - (((productValue71 * productValue70) - (productValue72 * productValue69)) * sumValue44);
    float productValue76 = sumValue82 - ((productValue72 * sumValue45) - (productValue71 * productValue73));
    float sumValue87 = vertexVectorConstants0.packedValues[13u].x - productValue74;
    float sumValue88 = vertexVectorConstants0.packedValues[13u].y - productValue75;
    float sumValue89 = vertexVectorConstants0.packedValues[13u].z - productValue76;
    bool conditionValue2 = vertexVectorConstants0.packedValues[10u].x > 0.5;
    float comparisonValue5 = conditionValue2 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x;
    float multiplyAddValue64 = fma(vertexVectorConstants0.packedValues[6u].x, productValue76, fma(vertexVectorConstants0.packedValues[5u].x, productValue75, productValue74 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue65 = fma(vertexVectorConstants0.packedValues[6u].y, productValue76, fma(vertexVectorConstants0.packedValues[5u].y, productValue75, productValue74 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue66 = fma(vertexVectorConstants0.packedValues[6u].z, productValue76, fma(vertexVectorConstants0.packedValues[5u].z, productValue75, productValue74 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue67 = fma(vertexVectorConstants0.packedValues[6u].w, productValue76, fma(vertexVectorConstants0.packedValues[5u].w, productValue75, productValue74 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[12u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue66, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue65, multiplyAddValue64 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[12u].y, multiplyAddValue66, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue65, multiplyAddValue64 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue66, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue65, multiplyAddValue64 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue67, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue66, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue65, multiplyAddValue64 * vertexVectorConstants0.packedValues[0u].w)));
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
    precise float productValue7 = vertexTexCoord0.x * 65535.0;
    precise float productValue8 = vertexTexCoord0.y * 65535.0;
    uint scalarValue = uint(roundEven(productValue7));
    uint scalarValue1 = uint(roundEven(productValue8));
    precise float multiplyAddValue7 = fma(rdEvaluateFloatExpression((scalarValue >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue8 = fma(rdEvaluateFloatExpression((scalarValue1 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression((scalarValue << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue7);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression((scalarValue1 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue8);
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
    precise float productValue7 = vertexTexCoord0.x * 65535.0;
    precise float productValue8 = vertexTexCoord0.y * 65535.0;
    uint scalarValue = uint(roundEven(productValue7));
    uint scalarValue1 = uint(roundEven(productValue8));
    precise float multiplyAddValue7 = fma(rdEvaluateFloatExpression((scalarValue >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue8 = fma(rdEvaluateFloatExpression((scalarValue1 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression((scalarValue << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue7);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression((scalarValue1 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue8);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    precise float sumValue54 = vertexVectorConstants0.packedValues[13u].x - scalarValue4;
    precise float sumValue55 = vertexVectorConstants0.packedValues[13u].y - scalarValue3;
    precise float sumValue56 = vertexVectorConstants0.packedValues[13u].z - scalarValue5;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
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
    precise float productValue7 = vertexTexCoord0.x * 65535.0;
    precise float productValue8 = vertexTexCoord0.y * 65535.0;
    uint scalarValue = uint(roundEven(productValue7));
    uint scalarValue1 = uint(roundEven(productValue8));
    precise float multiplyAddValue7 = fma(rdEvaluateFloatExpression((scalarValue >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue8 = fma(rdEvaluateFloatExpression((scalarValue1 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression((scalarValue << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue7);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression((scalarValue1 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue8);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    precise float nonlinearValue3 = sqrt(rdDot3Precise2(vectorValue15, vectorValue15)) / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z);
    precise float sumValue79 = nonlinearValue3 + vertexScalarConstants0.packedValues[44u];
    precise float comparisonValue8 = sumValue79 - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x);
    precise float sumValue6 = 1.0 - 0.9900000095367431640625;
    precise float sumValue58 = vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x;
    precise float comparisonValue9 = comparisonValue8 / (conditionValue3 ? sumValue6 : sumValue58);
    varyingColor2.w = spvNClamp(comparisonValue9, 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    precise float productValue7 = vertexTexCoord0.x * 65535.0;
    precise float productValue8 = vertexTexCoord0.y * 65535.0;
    uint scalarValue = uint(roundEven(productValue7));
    uint scalarValue1 = uint(roundEven(productValue8));
    precise float multiplyAddValue7 = fma(rdEvaluateFloatExpression((scalarValue >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    precise float multiplyAddValue8 = fma(rdEvaluateFloatExpression((scalarValue1 >> 15u) & 1u), 2.0, -1.0) * 3.0517578125e-05;
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression((scalarValue << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue7);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression((scalarValue1 << 1u) & 65534u), 1.525902189314365386962890625e-05, multiplyAddValue8);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord3.x = multiplyAddValue9;
    varyingTexCoord3.y = multiplyAddValue10;
    varyingTexCoord3.z = multiplyAddValue11;
    vec3 sumValue8 = vec3(vertexVectorConstants0.packedValues[29u].x - multiplyAddValue9, vertexVectorConstants0.packedValues[29u].y - multiplyAddValue10, vertexVectorConstants0.packedValues[29u].z - multiplyAddValue11);
    bool conditionValue = vertexScalarConstants0.packedValues[104u] > 0.5;
    float sumValue9 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((sqrt(rdDot3Precise2(sumValue8, sumValue8)) / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexScalarConstants0.packedValues[108u]) - (conditionValue ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x)) / (conditionValue ? sumValue9 : (vertexVectorConstants0.packedValues[24u].y - vertexVectorConstants0.packedValues[24u].x)), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue9, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue9, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue10, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue10, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    bool conditionValue = vertexScalarConstants0.packedValues[104u] > 0.5;
    float sumValue9 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((sqrt(rdDot3Precise2(sumValue36, sumValue36)) / (conditionValue ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexScalarConstants0.packedValues[108u]) - (conditionValue ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[24u].x)) / (conditionValue ? sumValue9 : (vertexVectorConstants0.packedValues[24u].y - vertexVectorConstants0.packedValues[24u].x)), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue9, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue9, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue10, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue10, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord3.x = scalarValue4;
    varyingTexCoord3.y = scalarValue3;
    varyingTexCoord3.z = scalarValue5;
    vec3 sumValue59 = vec3(vertexVectorConstants0.packedValues[13u].x - scalarValue4, vertexVectorConstants0.packedValues[13u].y - scalarValue3, vertexVectorConstants0.packedValues[13u].z - scalarValue5);
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    float sumValue9 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((sqrt(rdDot3Precise2(sumValue59, sumValue59)) / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexScalarConstants0.packedValues[44u]) - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x)) / (conditionValue3 ? sumValue9 : (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x)), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue9, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue9, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue10, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue10, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    bool conditionValue3 = vertexScalarConstants0.packedValues[40u] > 0.5;
    float sumValue9 = 1.0 - 0.9900000095367431640625;
    varyingColor2.w = spvNClamp((((sqrt(rdDot3Precise2(sumValue69, sumValue69)) / (conditionValue3 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexScalarConstants0.packedValues[44u]) - (conditionValue3 ? 0.9900000095367431640625 : vertexVectorConstants0.packedValues[8u].x)) / (conditionValue3 ? sumValue9 : (vertexVectorConstants0.packedValues[8u].y - vertexVectorConstants0.packedValues[8u].x)), 0.0, 1.0);
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    uint productValue9 = uint(roundEven(vertexTexCoord0.x * 65535.0));
    uint productValue10 = uint(roundEven(vertexTexCoord0.y * 65535.0));
    varyingTexCoord0.x = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue9, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue9, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
    varyingTexCoord0.y = fma(rdEvaluateFloatExpression(bitfieldInsert(0u, productValue10, int(1u), int(15u))), 1.525902189314365386962890625e-05, fma(rdEvaluateFloatExpression(bitfieldExtract(productValue10, int(15u), int(1u))), 2.0, -1.0) * 3.0517578125e-05);
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor2.w = spvNClamp((((sqrt(((sumValue10 * sumValue10) + (sumValue11 * sumValue11)) + (sumValue12 * sumValue12)) / (conditionValue1 ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexVectorConstants0.packedValues[27u].x) - comparisonValue2) / ((conditionValue1 ? 1.0 : vertexVectorConstants0.packedValues[24u].y) - comparisonValue2), 0.0, 1.0);
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue13;
    varyingTexCoord3.y = multiplyAddValue14;
    varyingTexCoord3.z = multiplyAddValue15;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[25u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[25u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[25u].z;
    varyingColor2.w = spvNClamp((((sqrt(((sumValue48 * sumValue48) + (sumValue46 * sumValue46)) + (sumValue47 * sumValue47)) / (conditionValue1 ? 100000.0 : vertexVectorConstants0.packedValues[24u].z)) + vertexVectorConstants0.packedValues[27u].x) - comparisonValue2) / ((conditionValue1 ? 1.0 : vertexVectorConstants0.packedValues[24u].y) - comparisonValue2), 0.0, 1.0);
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue13;
    varyingTexCoord3.y = multiplyAddValue14;
    varyingTexCoord3.z = multiplyAddValue15;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    varyingColor2.w = spvNClamp((((sqrt(((sumValue49 * sumValue49) + (sumValue50 * sumValue50)) + (sumValue51 * sumValue51)) / (conditionValue2 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexVectorConstants0.packedValues[11u].x) - comparisonValue5) / ((conditionValue2 ? 1.0 : vertexVectorConstants0.packedValues[8u].y) - comparisonValue5), 0.0, 1.0);
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue38;
    varyingTexCoord3.y = multiplyAddValue39;
    varyingTexCoord3.z = multiplyAddValue40;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_FEATURE_RENDER_AS_BILLBOARDS == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingColor2.x = vertexVectorConstants0.packedValues[9u].x;
    varyingColor2.y = vertexVectorConstants0.packedValues[9u].y;
    varyingColor2.z = vertexVectorConstants0.packedValues[9u].z;
    varyingColor2.w = spvNClamp((((sqrt(((sumValue89 * sumValue89) + (sumValue87 * sumValue87)) + (sumValue88 * sumValue88)) / (conditionValue2 ? 100000.0 : vertexVectorConstants0.packedValues[8u].z)) + vertexVectorConstants0.packedValues[11u].x) - comparisonValue5) / ((conditionValue2 ? 1.0 : vertexVectorConstants0.packedValues[8u].y) - comparisonValue5), 0.0, 1.0);
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord0.x = ((float((productValue9 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue9 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord0.y = ((float((productValue10 >> 15u) & 1u) * 6.103515625e-05) + (-3.0517578125e-05)) + (float((productValue10 << 1u) & 65534u) * 1.525902189314365386962890625e-05);
    varyingTexCoord3.x = multiplyAddValue38;
    varyingTexCoord3.y = multiplyAddValue39;
    varyingTexCoord3.z = multiplyAddValue40;
#endif
}
