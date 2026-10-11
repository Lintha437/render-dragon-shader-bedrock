#version 460
#extension GL_GOOGLE_include_directive : require
// Cubemap / Opaque / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 1
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT4_PRECISE_FLOAT_0 1
#endif

#include "../../include/materials/Cubemap/VertexBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
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
    precise float productValue7 = multiplyAddValue1 * vertexVectorConstants0.packedValues[25u].x;
    precise float productValue8 = multiplyAddValue1 * vertexVectorConstants0.packedValues[25u].y;
    precise float productValue9 = multiplyAddValue1 * vertexVectorConstants0.packedValues[25u].z;
    varyingTexCoord0.x = fma(vertexVectorConstants0.packedValues[26u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[24u].x, multiplyAddValue, productValue7));
    varyingTexCoord0.y = fma(vertexVectorConstants0.packedValues[26u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[24u].y, multiplyAddValue, productValue8));
    varyingTexCoord0.z = fma(vertexVectorConstants0.packedValues[26u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[24u].z, multiplyAddValue, productValue9));
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue15 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].y)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue16 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[8u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[9u].z)) + vertexVectorConstants0.packedValues[11u].z;
    vec4 multiplyAddValue17 = vec4(fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].x, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x, fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].y, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y, fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].z, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z, fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[4u].w, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w);
    gl_Position.x = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[0u], vertexScalarConstants0.packedValues[4u], vertexScalarConstants0.packedValues[8u] + vertexScalarConstants0.packedValues[112u], vertexScalarConstants0.packedValues[12u]), multiplyAddValue17);
    gl_Position.y = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[1u], vertexScalarConstants0.packedValues[5u], vertexScalarConstants0.packedValues[9u] - vertexScalarConstants0.packedValues[113u], vertexScalarConstants0.packedValues[13u]), multiplyAddValue17);
    gl_Position.z = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[2u], vertexScalarConstants0.packedValues[6u], vertexScalarConstants0.packedValues[10u], vertexScalarConstants0.packedValues[14u]), multiplyAddValue17);
    gl_Position.w = rdDot4Precise(vec4(vertexScalarConstants0.packedValues[3u], vertexScalarConstants0.packedValues[7u], vertexScalarConstants0.packedValues[11u], vertexScalarConstants0.packedValues[15u]), multiplyAddValue17);
    varyingTexCoord0.x = fma(vertexVectorConstants0.packedValues[26u].x, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[24u].x, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[25u].x));
    varyingTexCoord0.y = fma(vertexVectorConstants0.packedValues[26u].y, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[24u].y, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[25u].y));
    varyingTexCoord0.z = fma(vertexVectorConstants0.packedValues[26u].z, multiplyAddValue16, fma(vertexVectorConstants0.packedValues[24u].z, multiplyAddValue14, multiplyAddValue15 * vertexVectorConstants0.packedValues[25u].z));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[10u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].x;
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[10u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].y;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[10u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[9u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[8u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[11u].z;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].x, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].y, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].z, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].w, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[5u].w, multiplyAddValue8, multiplyAddValue7 * vertexVectorConstants0.packedValues[4u].w)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[28u].x + vertexVectorConstants0.packedValues[2u].x, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].y - vertexVectorConstants0.packedValues[28u].y, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue12, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue11, multiplyAddValue10 * vertexVectorConstants0.packedValues[0u].w)));
    varyingTexCoord0.x = fma(vertexVectorConstants0.packedValues[26u].x, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[25u].x, multiplyAddValue8, vertexVectorConstants0.packedValues[24u].x * multiplyAddValue7));
    varyingTexCoord0.y = fma(vertexVectorConstants0.packedValues[26u].y, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[25u].y, multiplyAddValue8, vertexVectorConstants0.packedValues[24u].y * multiplyAddValue7));
    varyingTexCoord0.z = fma(vertexVectorConstants0.packedValues[26u].z, multiplyAddValue9, fma(vertexVectorConstants0.packedValues[25u].z, multiplyAddValue8, vertexVectorConstants0.packedValues[24u].z * multiplyAddValue7));
#endif
}
