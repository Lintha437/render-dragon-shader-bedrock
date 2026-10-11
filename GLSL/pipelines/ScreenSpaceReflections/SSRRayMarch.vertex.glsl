#version 460
#extension GL_GOOGLE_include_directive : require
// ScreenSpaceReflections / SSRRayMarch / vertex forward pipeline.
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


#include "../../include/materials/ScreenSpaceReflections/VertexBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue = fma(vertexPosition0.x, 2.0, -1.0);
    float multiplyAddValue1 = fma(vertexPosition0.y, 2.0, -1.0);
    gl_Position.x = multiplyAddValue;
    gl_Position.y = multiplyAddValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (vertexPosition0.x * 2.0) + (-1.0);
    float productValue1 = (vertexPosition0.y * 2.0) + (-1.0);
    gl_Position.x = productValue;
    gl_Position.y = productValue1;
#endif
    gl_Position.z = 0.0;
    gl_Position.w = 1.0;
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord1.x = multiplyAddValue;
    varyingTexCoord1.y = multiplyAddValue1;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord1.x = productValue;
    varyingTexCoord1.y = productValue1;
#endif
    varyingTexCoord1.z = 0.0;
    varyingTexCoord1.w = 1.0;
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue2 = vertexTexCoord0.x * vertexVectorConstants0.packedValues[0u].x;
    precise float productValue3 = vertexTexCoord0.y * vertexVectorConstants0.packedValues[0u].y;
    varyingTexCoord0.x = productValue2;
    varyingTexCoord0.y = productValue3;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    varyingTexCoord0.x = vertexTexCoord0.x * vertexVectorConstants0.packedValues[0u].x;
    varyingTexCoord0.y = vertexTexCoord0.y * vertexVectorConstants0.packedValues[0u].y;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    varyingTexCoord0.x = vertexVectorConstants0.packedValues[0u].x * vertexTexCoord0.x;
    varyingTexCoord0.y = vertexVectorConstants0.packedValues[0u].y * vertexTexCoord0.y;
#endif
    varyingTexCoord0.z = vertexTexCoord0.x;
    varyingTexCoord0.w = vertexTexCoord0.y;
}
