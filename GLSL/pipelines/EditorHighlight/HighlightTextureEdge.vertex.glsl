#version 460
#extension GL_GOOGLE_include_directive : require
// EditorHighlight / HighlightTextureEdge / vertex forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 1
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/EditorHighlight/VertexBindings.glsli"

void main()
{
    gl_Position.x = (vertexPosition0.x * 2.0) + (-1.0);
    gl_Position.y = (vertexPosition0.y * 2.0) + (-1.0);
    gl_Position.z = vertexPosition0.z;
    gl_Position.w = 1.0;
    varyingTexCoord0.x = vertexTexCoord0.x;
    varyingTexCoord0.y = vertexTexCoord0.y;
}
