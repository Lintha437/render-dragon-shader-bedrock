#version 460
#extension GL_GOOGLE_include_directive : require
// Clouds / Transparent / vertex forward pipeline.
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

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/Clouds/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[104u];
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z;
    precise float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[11u].x;
    precise float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[11u].y;
    precise float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[11u].z;
    precise float productValue3 = multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue4 = multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue5 = multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue6 = multiplyAddValue8 * vertexVectorConstants0.packedValues[5u].w;
    precise float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue7, productValue3)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue7, productValue4)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue7, productValue5)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue7, productValue6)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue = vec4(multiplyAddValue10, multiplyAddValue11, multiplyAddValue12, multiplyAddValue13);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue, vertexScalarConstants0.packedValues[12u]), vectorValue);
    precise float sumValue1 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[105u];
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue1, vertexScalarConstants0.packedValues[13u]), vectorValue);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue);
    vec3 vectorValue1 = vec3(multiplyAddValue7, multiplyAddValue8, multiplyAddValue9);
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
    precise float nonlinearValue = sqrt(rdDot3Precise2(vectorValue1, vectorValue1)) / vertexScalarConstants0.packedValues[100u];
    precise float sumValue2 = nonlinearValue - 0.89999997615814208984375;
    precise float sumValue3 = 1.0 - spvNMax(sumValue2, 0.0);
    precise float productValue7 = vertexColor0.x * vertexVectorConstants0.packedValues[24u].x;
    precise float productValue8 = vertexColor0.y * vertexVectorConstants0.packedValues[24u].y;
    precise float productValue9 = vertexColor0.z * vertexVectorConstants0.packedValues[24u].z;
    precise float productValue10 = vertexColor0.w * vertexVectorConstants0.packedValues[24u].w;
    precise float productValue11 = spvNMax(sumValue3, 0.0) * productValue10;
    varyingColor0.w = productValue11;
    varyingColor0.x = productValue7;
    varyingColor0.y = productValue8;
    varyingColor0.z = productValue9;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM40)
    precise float sumValue4 = vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[40u];
    vec4 vectorValue3 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue3, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    precise float productValue12 = scalarValue * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue13 = scalarValue * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue14 = scalarValue * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue15 = scalarValue * vertexVectorConstants0.packedValues[5u].w;
    float scalarValue1 = rdDot4Precise(vectorValue3, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue3, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    precise float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue1, productValue12)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[6u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue1, productValue13)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[6u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue1, productValue14)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[6u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue1, productValue15)) + vertexVectorConstants0.packedValues[7u].w;
    vec4 vectorValue4 = vec4(multiplyAddValue25, multiplyAddValue26, multiplyAddValue27, multiplyAddValue28);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], sumValue4, vertexScalarConstants0.packedValues[12u]), vectorValue4);
    precise float sumValue5 = vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[41u];
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], sumValue5, vertexScalarConstants0.packedValues[13u]), vectorValue4);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), vectorValue4);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), vectorValue4);
    vec3 vectorValue5 = vec3(scalarValue1, scalarValue, scalarValue2);
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    precise float nonlinearValue1 = sqrt(rdDot3Precise2(vectorValue5, vectorValue5)) / vertexScalarConstants0.packedValues[36u];
    precise float sumValue6 = nonlinearValue1 - 0.89999997615814208984375;
    precise float sumValue7 = 1.0 - spvNMax(sumValue6, 0.0);
    precise float productValue16 = vertexColor0.x * vertexVectorConstants0.packedValues[8u].x;
    precise float productValue17 = vertexColor0.y * vertexVectorConstants0.packedValues[8u].y;
    precise float productValue18 = vertexColor0.z * vertexVectorConstants0.packedValues[8u].z;
    precise float productValue19 = vertexColor0.w * vertexVectorConstants0.packedValues[8u].w;
    precise float productValue20 = spvNMax(sumValue7, 0.0) * productValue19;
    varyingColor0.w = productValue20;
    varyingColor0.x = productValue16;
    varyingColor0.y = productValue17;
    varyingColor0.z = productValue18;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    vec4 multiplyAddValue17 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[104u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue17);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[105u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue17);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue17);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue17);
    vec3 vectorValue2 = vec3(multiplyAddValue14, multiplyAddValue15, multiplyAddValue16);
    varyingTexCoord3.x = multiplyAddValue14;
    varyingTexCoord3.y = multiplyAddValue15;
    varyingTexCoord3.z = multiplyAddValue16;
    varyingColor0.w = spvNMax(1.0 - spvNMax((sqrt(rdDot3Precise2(vectorValue2, vectorValue2)) / vertexScalarConstants0.packedValues[100u]) - 0.89999997615814208984375, 0.0), 0.0) * (vertexColor0.w * vertexVectorConstants0.packedValues[24u].w);
    varyingColor0.x = vertexColor0.x * vertexVectorConstants0.packedValues[24u].x;
    varyingColor0.y = vertexColor0.y * vertexVectorConstants0.packedValues[24u].y;
    varyingColor0.z = vertexColor0.z * vertexVectorConstants0.packedValues[24u].z;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue3 = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue = rdDot4Precise(vectorValue3, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue1 = rdDot4Precise(vectorValue3, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue2 = rdDot4Precise(vectorValue3, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    vec4 multiplyAddValue29 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue2, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue1, scalarValue * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[40u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue29);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[41u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue29);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue29);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue29);
    vec3 vectorValue5 = vec3(scalarValue1, scalarValue, scalarValue2);
    varyingTexCoord3.x = scalarValue1;
    varyingTexCoord3.y = scalarValue;
    varyingTexCoord3.z = scalarValue2;
    varyingColor0.w = spvNMax(1.0 - spvNMax((sqrt(rdDot3Precise2(vectorValue5, vectorValue5)) / vertexScalarConstants0.packedValues[36u]) - 0.89999997615814208984375, 0.0), 0.0) * (vertexColor0.w * vertexVectorConstants0.packedValues[8u].w);
    varyingColor0.x = vertexColor0.x * vertexVectorConstants0.packedValues[8u].x;
    varyingColor0.y = vertexColor0.y * vertexVectorConstants0.packedValues[8u].y;
    varyingColor0.z = vertexColor0.z * vertexVectorConstants0.packedValues[8u].z;
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[26u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[26u].y, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue5, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue4, multiplyAddValue3 * vertexVectorConstants0.packedValues[0u].w)));
    varyingColor0.x = vertexVectorConstants0.packedValues[24u].x * vertexColor0.x;
    varyingColor0.y = vertexVectorConstants0.packedValues[24u].y * vertexColor0.y;
    varyingColor0.z = vertexVectorConstants0.packedValues[24u].z * vertexColor0.z;
    varyingColor0.w = (vertexVectorConstants0.packedValues[24u].w * vertexColor0.w) * spvNMin(spvNMax(1.0 - spvNMax((sqrt(((multiplyAddValue1 * multiplyAddValue1) + (multiplyAddValue * multiplyAddValue)) + (multiplyAddValue2 * multiplyAddValue2)) / vertexVectorConstants0.packedValues[25u].x) + (-0.89999997615814208984375), 0.0), 0.0), 1.0);
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue18 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue19 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue20 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue20, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue19, multiplyAddValue18 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[10u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[10u].y, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue23, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue22, multiplyAddValue21 * vertexVectorConstants0.packedValues[0u].w)));
    varyingColor0.x = vertexVectorConstants0.packedValues[8u].x * vertexColor0.x;
    varyingColor0.y = vertexVectorConstants0.packedValues[8u].y * vertexColor0.y;
    varyingColor0.z = vertexVectorConstants0.packedValues[8u].z * vertexColor0.z;
    varyingColor0.w = (vertexVectorConstants0.packedValues[8u].w * vertexColor0.w) * spvNMin(spvNMax(1.0 - spvNMax((sqrt(((multiplyAddValue19 * multiplyAddValue19) + (multiplyAddValue18 * multiplyAddValue18)) + (multiplyAddValue20 * multiplyAddValue20)) / vertexVectorConstants0.packedValues[9u].x) + (-0.89999997615814208984375), 0.0), 0.0), 1.0);
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue18;
    varyingTexCoord3.y = multiplyAddValue19;
    varyingTexCoord3.z = multiplyAddValue20;
#endif
}
