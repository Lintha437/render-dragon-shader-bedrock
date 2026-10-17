#version 460
#extension GL_GOOGLE_include_directive : require
// GamefaceClearQuad / Transparent / fragment forward pipeline.
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


#include "../../include/materials/GamefaceClearQuad/FragmentBindings.glsli"

void main()
{
    fragmentColor0.x = varyingTexCoord1.x;
    fragmentColor0.y = varyingTexCoord1.y;
    fragmentColor0.z = varyingTexCoord1.z;
    fragmentColor0.w = varyingTexCoord1.w;
}
