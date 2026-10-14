#version 460
#extension GL_GOOGLE_include_directive : require
// GamefaceClearQuad / Transparent / vertex forward pipeline.
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


#include "../../include/materials/GamefaceClearQuad/VertexBindings.glsli"

void main()
{
    gl_Position.x = vertexPosition0.x;
    gl_Position.y = vertexPosition0.y;
    gl_Position.z = vertexPosition0.z;
    gl_Position.w = 1.0;
    varyingTexCoord1.x = 0.0;
    varyingTexCoord1.y = 0.0;
    varyingTexCoord1.z = 0.0;
    varyingTexCoord1.w = 0.0;
    varyingTexCoord0.x = vertexTexCoord1.x;
    varyingTexCoord0.y = vertexTexCoord1.y;
    varyingTexCoord0.z = vertexTexCoord1.z;
    varyingTexCoord0.w = vertexTexCoord1.w;
    varyingTexCoord4.x = 0.0;
    varyingTexCoord4.y = 0.0;
    varyingTexCoord4.z = 0.0;
    varyingTexCoord4.w = 0.0;
    varyingTexCoord2.x = 0.0;
    varyingTexCoord2.y = 0.0;
    varyingTexCoord2.z = 0.0;
    varyingTexCoord3.x = 0.0;
    varyingTexCoord3.y = 0.0;
    varyingTexCoord3.z = 0.0;
    varyingTexCoord3.w = 0.0;
    varyingTexCoord5.x = 0.0;
    varyingTexCoord5.y = 0.0;
    varyingTexCoord5.z = 0.0;
    varyingTexCoord5.w = 0.0;
}
