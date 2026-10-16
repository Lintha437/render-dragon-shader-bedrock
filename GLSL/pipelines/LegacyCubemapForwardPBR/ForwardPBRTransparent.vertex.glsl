#version 460
#extension GL_GOOGLE_include_directive : require
// LegacyCubemapForwardPBR / ForwardPBRTransparent / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 4
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

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/LegacyCubemapForwardPBR/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[26u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[24u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[25u].x)) + vertexVectorConstants0.packedValues[27u].x;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[26u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[24u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[25u].y)) + vertexVectorConstants0.packedValues[27u].y;
    float multiplyAddValue17 = fma(vertexVectorConstants0.packedValues[26u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[24u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[25u].z)) + vertexVectorConstants0.packedValues[27u].z;
    float multiplyAddValue18 = fma(vertexVectorConstants0.packedValues[26u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[24u].w, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[25u].w)) + vertexVectorConstants0.packedValues[27u].w;
    float multiplyAddValue19 = fma(vertexVectorConstants0.packedValues[11u].x, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].x, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].x)));
    float multiplyAddValue20 = fma(vertexVectorConstants0.packedValues[11u].y, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].y, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].y)));
    float multiplyAddValue21 = fma(vertexVectorConstants0.packedValues[11u].z, multiplyAddValue18, fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue17, fma(vertexVectorConstants0.packedValues[8u].z, multiplyAddValue15, multiplyAddValue16 * vertexVectorConstants0.packedValues[9u].z)));
    varyingTexCoord3.x = multiplyAddValue19;
    varyingTexCoord3.y = multiplyAddValue20;
    varyingTexCoord3.z = multiplyAddValue21;
    vec4 multiplyAddValue22 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue21, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue19, multiplyAddValue20 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    float sumValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue22);
    float sumValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue22);
    float scalarValue = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue22);
    float scalarValue1 = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue22);
    gl_Position.x = sumValue;
    gl_Position.y = sumValue1;
    gl_Position.z = scalarValue;
    gl_Position.w = scalarValue1;
    varyingTexCoord1.x = sumValue;
    varyingTexCoord1.y = sumValue1;
    varyingTexCoord1.z = scalarValue;
    varyingTexCoord1.w = scalarValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[26u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[26u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[26u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[26u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[25u].w, vertexPosition0.y, vertexVectorConstants0.packedValues[24u].w * vertexPosition0.x)) + vertexVectorConstants0.packedValues[27u].w;
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[11u].x, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[10u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[9u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[8u].x)));
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[11u].y, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[10u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[9u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[8u].y)));
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[11u].z, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[10u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[9u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[8u].z)));
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].x)));
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].y)));
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].z)));
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[0u].w)));
    gl_Position.x = multiplyAddValue11;
    gl_Position.y = multiplyAddValue12;
    gl_Position.z = multiplyAddValue13;
    gl_Position.w = multiplyAddValue14;
    varyingTexCoord1.x = multiplyAddValue11;
    varyingTexCoord1.y = multiplyAddValue12;
    varyingTexCoord1.z = multiplyAddValue13;
    varyingTexCoord1.w = multiplyAddValue14;
#endif
    varyingColor0.x = vertexColor0.x;
    varyingColor0.y = vertexColor0.y;
    varyingColor0.z = vertexColor0.z;
    varyingColor0.w = vertexColor0.w;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord3.x = multiplyAddValue4;
    varyingTexCoord3.y = multiplyAddValue5;
    varyingTexCoord3.z = multiplyAddValue6;
#endif
}
