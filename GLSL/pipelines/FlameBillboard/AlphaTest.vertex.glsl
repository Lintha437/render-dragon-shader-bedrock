#version 460
#extension GL_GOOGLE_include_directive : require
// FlameBillboard / AlphaTest / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/FlameBillboard/VertexBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[7u].z;
    precise float productValue3 = multiplyAddValue5 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue4 = multiplyAddValue5 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue5 = multiplyAddValue5 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue6 = multiplyAddValue5 * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue4, productValue3)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue4, productValue4)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue4, productValue5)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue4, productValue6)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue7;
    gl_Position.y = multiplyAddValue8;
    gl_Position.z = multiplyAddValue9;
    gl_Position.w = multiplyAddValue10;
    precise float quotientValue = multiplyAddValue9 / vertexScalarConstants0.packedValues[82u];
    precise float sumValue = quotientValue - vertexScalarConstants0.packedValues[80u];
    precise float sumValue1 = vertexScalarConstants0.packedValues[81u] - vertexScalarConstants0.packedValues[80u];
    precise float quotientValue1 = sumValue / sumValue1;
    varyingColor0.w = spvNClamp(quotientValue1, 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue12 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue13 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue14 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = multiplyAddValue14;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue13, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue11, multiplyAddValue12 * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingColor0.w = spvNClamp(((multiplyAddValue14 / vertexScalarConstants0.packedValues[82u]) - vertexScalarConstants0.packedValues[80u]) / (vertexScalarConstants0.packedValues[81u] - vertexScalarConstants0.packedValues[80u]), 0.0, 1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = multiplyAddValue3;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue1, multiplyAddValue * vertexVectorConstants0.packedValues[0u].w)) + vertexVectorConstants0.packedValues[3u].w;
#endif
    varyingColor0.x = vertexVectorConstants0.packedValues[21u].x;
    varyingColor0.y = vertexVectorConstants0.packedValues[21u].y;
    varyingColor0.z = vertexVectorConstants0.packedValues[21u].z;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingColor0.w = spvNClamp(((multiplyAddValue3 / vertexVectorConstants0.packedValues[20u].z) - vertexVectorConstants0.packedValues[20u].x) / (vertexVectorConstants0.packedValues[20u].y - vertexVectorConstants0.packedValues[20u].x), 0.0, 1.0);
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
}
