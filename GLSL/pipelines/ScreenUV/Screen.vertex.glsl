#version 460
#extension GL_GOOGLE_include_directive : require
// ScreenUV / Screen / vertex forward pipeline.
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


#include "../../include/materials/ScreenUV/VertexBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    gl_Position.x = fma(vertexPosition0.x, 2.0, -1.0);
    gl_Position.y = fma(vertexPosition0.y, 2.0, -1.0);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    gl_Position.x = (vertexPosition0.x * 2.0) + (-1.0);
    gl_Position.y = (vertexPosition0.y * 2.0) + (-1.0);
#endif
    gl_Position.z = 0.0;
    gl_Position.w = 1.0;
    varyingColor0.x = vertexTexCoord0.x;
    varyingColor0.y = vertexTexCoord0.y;
    varyingColor0.z = 1.0;
    varyingColor0.w = 1.0;
}
