#version 460
#extension GL_GOOGLE_include_directive : require
// LegacyCubemap / ForceForwardPBROpaque / vertex forward pipeline.
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


#include "../../include/materials/LegacyCubemap/VertexBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z;
    precise float productValue3 = vertexPosition0.y * vertexVectorConstants0.packedValues[5u].w;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[7u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[7u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[7u].z;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].w, vertexPosition0.x, productValue3)) + vertexVectorConstants0.packedValues[7u].w;
    precise float productValue4 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue5 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue6 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue7 = multiplyAddValue1 * vertexVectorConstants0.packedValues[1u].w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue, productValue4)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue, productValue5)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue, productValue6)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue3, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue2, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue, productValue7)));
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue8 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue9 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].y)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue10 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].z)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue11 = fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[4u].w, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[5u].w)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[0u].x, multiplyAddValue8, multiplyAddValue9 * vertexVectorConstants0.packedValues[1u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[0u].y, multiplyAddValue8, multiplyAddValue9 * vertexVectorConstants0.packedValues[1u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[0u].z, multiplyAddValue8, multiplyAddValue9 * vertexVectorConstants0.packedValues[1u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue11, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue10, fma(vertexVectorConstants0.packedValues[0u].w, multiplyAddValue8, multiplyAddValue9 * vertexVectorConstants0.packedValues[1u].w)));
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float multiplyAddValue4 = fma(vertexVectorConstants0.packedValues[6u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].x;
    float multiplyAddValue5 = fma(vertexVectorConstants0.packedValues[6u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].y;
    float multiplyAddValue6 = fma(vertexVectorConstants0.packedValues[6u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].z;
    float multiplyAddValue7 = fma(vertexVectorConstants0.packedValues[6u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[5u].w, vertexPosition0.y, vertexVectorConstants0.packedValues[4u].w * vertexPosition0.x)) + vertexVectorConstants0.packedValues[7u].w;
    gl_Position.x = fma(vertexVectorConstants0.packedValues[3u].x, multiplyAddValue7, fma(vertexVectorConstants0.packedValues[2u].x, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[1u].x, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[0u].x)));
    gl_Position.y = fma(vertexVectorConstants0.packedValues[3u].y, multiplyAddValue7, fma(vertexVectorConstants0.packedValues[2u].y, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[1u].y, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[0u].y)));
    gl_Position.z = fma(vertexVectorConstants0.packedValues[3u].z, multiplyAddValue7, fma(vertexVectorConstants0.packedValues[2u].z, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[1u].z, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[0u].z)));
    gl_Position.w = fma(vertexVectorConstants0.packedValues[3u].w, multiplyAddValue7, fma(vertexVectorConstants0.packedValues[2u].w, multiplyAddValue6, fma(vertexVectorConstants0.packedValues[1u].w, multiplyAddValue5, multiplyAddValue4 * vertexVectorConstants0.packedValues[0u].w)));
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
}
