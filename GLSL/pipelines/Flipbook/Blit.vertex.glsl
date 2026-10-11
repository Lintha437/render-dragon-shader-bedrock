#version 460
#extension GL_GOOGLE_include_directive : require
// Flipbook / Blit / vertex forward pipeline.
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


#include "../../include/materials/Flipbook/VertexBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue = vertexPosition0.y * vertexVectorConstants0.packedValues[1u].x;
    precise float productValue1 = vertexPosition0.y * vertexVectorConstants0.packedValues[1u].y;
    precise float productValue2 = vertexPosition0.y * vertexVectorConstants0.packedValues[1u].z;
    precise float productValue3 = vertexPosition0.y * vertexVectorConstants0.packedValues[1u].w;
    precise float multiplyAddValue = fma(vertexVectorConstants0.packedValues[2u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[0u].x, vertexPosition0.x, productValue)) + vertexVectorConstants0.packedValues[3u].x;
    precise float multiplyAddValue1 = fma(vertexVectorConstants0.packedValues[2u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[0u].y, vertexPosition0.x, productValue1)) + vertexVectorConstants0.packedValues[3u].y;
    precise float multiplyAddValue2 = fma(vertexVectorConstants0.packedValues[2u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[0u].z, vertexPosition0.x, productValue2)) + vertexVectorConstants0.packedValues[3u].z;
    precise float multiplyAddValue3 = fma(vertexVectorConstants0.packedValues[2u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[0u].w, vertexPosition0.x, productValue3)) + vertexVectorConstants0.packedValues[3u].w;
    gl_Position.x = multiplyAddValue;
    gl_Position.y = multiplyAddValue1;
    gl_Position.z = multiplyAddValue2;
    gl_Position.w = multiplyAddValue3;
    precise float sumValue = vertexTexCoord0.y + vertexVectorConstants0.packedValues[4u].x;
    precise float sumValue1 = vertexTexCoord0.y + vertexVectorConstants0.packedValues[4u].y;
    varyingTexCoord0.y = sumValue;
    varyingTexCoord1.y = sumValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[0u].x, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[1u].x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[0u].y, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[1u].y)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[0u].z, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[1u].z)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[0u].w, vertexPosition0.x, vertexPosition0.y * vertexVectorConstants0.packedValues[1u].w)) + vertexVectorConstants0.packedValues[3u].w;
    varyingTexCoord0.y = vertexTexCoord0.y + vertexVectorConstants0.packedValues[4u].x;
    varyingTexCoord1.y = vertexTexCoord0.y + vertexVectorConstants0.packedValues[4u].y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    gl_Position.x = fma(vertexVectorConstants0.packedValues[2u].x, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].x, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].x * vertexPosition0.x)) + vertexVectorConstants0.packedValues[3u].x;
    gl_Position.y = fma(vertexVectorConstants0.packedValues[2u].y, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].y, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].y * vertexPosition0.x)) + vertexVectorConstants0.packedValues[3u].y;
    gl_Position.z = fma(vertexVectorConstants0.packedValues[2u].z, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].z, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].z * vertexPosition0.x)) + vertexVectorConstants0.packedValues[3u].z;
    gl_Position.w = fma(vertexVectorConstants0.packedValues[2u].w, vertexPosition0.z, fma(vertexVectorConstants0.packedValues[1u].w, vertexPosition0.y, vertexVectorConstants0.packedValues[0u].w * vertexPosition0.x)) + vertexVectorConstants0.packedValues[3u].w;
#endif
    varyingTexCoord0.x = vertexTexCoord0.x;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord0.y = vertexVectorConstants0.packedValues[4u].x + vertexTexCoord0.y;
#endif
    varyingTexCoord1.x = vertexTexCoord0.x;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord1.y = vertexVectorConstants0.packedValues[4u].y + vertexTexCoord0.y;
#endif
}
