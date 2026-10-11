#version 460
#extension GL_GOOGLE_include_directive : require
// ItemInHandPrepassTextured / DepthOnlyOpaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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
#ifndef RD_FEATURE_MULTI_COLOR_TINT
#define RD_FEATURE_MULTI_COLOR_TINT RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 5
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/ItemInHandPrepassTextured/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM50)
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    varyingTexCoord3.x = multiplyAddValue;
    varyingTexCoord3.y = multiplyAddValue1;
    varyingTexCoord3.z = multiplyAddValue2;
    vec4 multiplyAddValue3 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue, multiplyAddValue1 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue3);
    float sumValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue3);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue3);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue3);
    gl_Position.x = sumValue;
    gl_Position.y = sumValue1;
    gl_Position.z = scalarValue;
    gl_Position.w = scalarValue1;
    varyingColor1.x = sumValue;
    varyingColor1.y = sumValue1;
    varyingColor1.z = scalarValue;
    varyingColor1.w = scalarValue1;
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM50)
    vec4 vectorValue = vec4(vertexPosition0.x, vertexPosition0.y, vertexPosition0.z, 1.0);
    float scalarValue2 = rdDot4Precise(vectorValue, vec4(vertexTexCoord6.x, vertexTexCoord6.y, vertexTexCoord6.z, vertexTexCoord6.w));
    float scalarValue3 = rdDot4Precise(vectorValue, vec4(vertexTexCoord7.x, vertexTexCoord7.y, vertexTexCoord7.z, vertexTexCoord7.w));
    float scalarValue4 = rdDot4Precise(vectorValue, vec4(vertexTexCoord5.x, vertexTexCoord5.y, vertexTexCoord5.z, vertexTexCoord5.w));
    varyingTexCoord3.x = scalarValue3;
    varyingTexCoord3.y = scalarValue2;
    varyingTexCoord3.z = scalarValue4;
    vec4 multiplyAddValue18 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].x, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].y, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].z, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, scalarValue4, fma(vertexVectorConstants0.packedValues[4u].w, scalarValue3, scalarValue2 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue2 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue18);
    float sumValue3 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue18);
    float scalarValue5 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue18);
    float scalarValue6 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue18);
    gl_Position.x = sumValue2;
    gl_Position.y = sumValue3;
    gl_Position.z = scalarValue5;
    gl_Position.w = scalarValue6;
    varyingColor1.x = sumValue2;
    varyingColor1.y = sumValue3;
    varyingColor1.z = scalarValue5;
    varyingColor1.w = scalarValue6;
    float multiplyAddValue4 = fma(vertexNormal0.y, vertexTangent0.z, -(vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float multiplyAddValue5 = fma(vertexNormal0.z, vertexTangent0.x, -(vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float multiplyAddValue6 = fma(vertexNormal0.x, vertexTangent0.y, -(vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].x));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].y));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue4, multiplyAddValue5 * vertexVectorConstants0.packedValues[9u].z));
#elif (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].w)));
    float productValue = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue1 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue2 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue14;
    gl_Position.y = multiplyAddValue15;
    gl_Position.z = multiplyAddValue16;
    gl_Position.w = multiplyAddValue17;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue2, fma(vertexVectorConstants0.packedValues[9u].x, productValue1, vertexVectorConstants0.packedValues[8u].x * productValue));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue2, fma(vertexVectorConstants0.packedValues[9u].y, productValue1, vertexVectorConstants0.packedValues[8u].y * productValue));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue2, fma(vertexVectorConstants0.packedValues[9u].z, productValue1, vertexVectorConstants0.packedValues[8u].z * productValue));
    varyingColor1.x = multiplyAddValue14;
    varyingColor1.y = multiplyAddValue15;
    varyingColor1.z = multiplyAddValue16;
    varyingColor1.w = multiplyAddValue17;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    float multiplyAddValue19 = fma(vertexPosition0.z, vertexTexCoord7.z, fma(vertexPosition0.y, vertexTexCoord7.y, vertexPosition0.x * vertexTexCoord7.x)) + vertexTexCoord7.w;
    float multiplyAddValue20 = fma(vertexPosition0.z, vertexTexCoord6.z, fma(vertexPosition0.y, vertexTexCoord6.y, vertexPosition0.x * vertexTexCoord6.x)) + vertexTexCoord6.w;
    float multiplyAddValue21 = fma(vertexPosition0.z, vertexTexCoord5.z, fma(vertexPosition0.y, vertexTexCoord5.y, vertexPosition0.x * vertexTexCoord5.x)) + vertexTexCoord5.w;
    float multiplyAddValue22 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue20, multiplyAddValue19 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue23 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue20, multiplyAddValue19 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue24 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue20, multiplyAddValue19 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue25 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue20, multiplyAddValue19 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue26 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue23, multiplyAddValue22 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue27 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue23, multiplyAddValue22 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue28 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue23, multiplyAddValue22 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue29 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue25, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue24, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue23, multiplyAddValue22 * vertexVectorConstants0.packedValues[0u].w)));
    float productValue = ((vertexNormal0.y * vertexTangent0.z) - (vertexNormal0.z * vertexTangent0.y)) * vertexTangent0.w;
    float productValue1 = ((vertexNormal0.z * vertexTangent0.x) - (vertexNormal0.x * vertexTangent0.z)) * vertexTangent0.w;
    float productValue2 = ((vertexNormal0.x * vertexTangent0.y) - (vertexNormal0.y * vertexTangent0.x)) * vertexTangent0.w;
    gl_Position.x = multiplyAddValue26;
    gl_Position.y = multiplyAddValue27;
    gl_Position.z = multiplyAddValue28;
    gl_Position.w = multiplyAddValue29;
    varyingBitangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, productValue2, fma(vertexVectorConstants0.packedValues[9u].x, productValue1, vertexVectorConstants0.packedValues[8u].x * productValue));
    varyingBitangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, productValue2, fma(vertexVectorConstants0.packedValues[9u].y, productValue1, vertexVectorConstants0.packedValues[8u].y * productValue));
    varyingBitangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, productValue2, fma(vertexVectorConstants0.packedValues[9u].z, productValue1, vertexVectorConstants0.packedValues[8u].z * productValue));
    varyingColor1.x = multiplyAddValue26;
    varyingColor1.y = multiplyAddValue27;
    varyingColor1.z = multiplyAddValue28;
    varyingColor1.w = multiplyAddValue29;
#endif
    varyingColor0.x = 0.0;
    varyingColor0.y = 0.0;
    varyingColor0.z = 0.0;
    varyingColor0.w = 0.0;
    varyingFrontFacing0 = int(0u);
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord4 = int(0u);
#endif
    varyingTexCoord8.x = vertexTexCoord8.x;
    varyingTexCoord8.y = vertexTexCoord8.y;
    varyingTexCoord8.z = vertexTexCoord8.z;
    varyingTexCoord8.w = vertexTexCoord8.w;
#if RD_PLATFORM == RD_PLATFORM_SM50
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexNormal0.x, vertexNormal0.y * vertexVectorConstants0.packedValues[9u].z));
    varyingTexCoord5.x = fma(vertexVectorConstants0.packedValues[26u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[24u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[25u].x)) + vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord5.y = fma(vertexVectorConstants0.packedValues[26u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[24u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[25u].y)) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord5.z = fma(vertexVectorConstants0.packedValues[26u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[24u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[25u].z)) + vertexVectorConstants0.packedValues[27u].z;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].y));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexTangent0.x, vertexTangent0.y * vertexVectorConstants0.packedValues[9u].z));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingNormal0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].x * vertexNormal0.x));
    varyingNormal0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].y * vertexNormal0.x));
    varyingNormal0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexNormal0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexNormal0.y, vertexVectorConstants0.packedValues[8u].z * vertexNormal0.x));
    varyingTexCoord4 = int(0u);
    varyingTexCoord5.x = fma(vertexVectorConstants0.packedValues[26u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].x;
    varyingTexCoord5.y = fma(vertexVectorConstants0.packedValues[26u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].y;
    varyingTexCoord5.z = fma(vertexVectorConstants0.packedValues[26u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].z;
    varyingTangent0.x = fma(vertexVectorConstants0.packedValues[10u].x, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].x * vertexTangent0.x));
    varyingTangent0.y = fma(vertexVectorConstants0.packedValues[10u].y, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].y * vertexTangent0.x));
    varyingTangent0.z = fma(vertexVectorConstants0.packedValues[10u].z, vertexTangent0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexTangent0.y, vertexVectorConstants0.packedValues[8u].z * vertexTangent0.x));
#endif
    varyingTexCoord0.x = -3.0517578125e-05;
    varyingTexCoord0.y = -3.0517578125e-05;
#if (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_OFF && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue7;
    varyingTexCoord3.y = multiplyAddValue8;
    varyingTexCoord3.z = multiplyAddValue9;
#elif (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM60) || (RD_FEATURE_INSTANCING == RD_ON && RD_PLATFORM == RD_PLATFORM_SM65)
    varyingTexCoord3.x = multiplyAddValue19;
    varyingTexCoord3.y = multiplyAddValue20;
    varyingTexCoord3.z = multiplyAddValue21;
#endif
}
