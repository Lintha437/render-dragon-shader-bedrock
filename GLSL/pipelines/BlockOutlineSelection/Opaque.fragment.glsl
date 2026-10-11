#version 460
#extension GL_GOOGLE_include_directive : require
// BlockOutlineSelection / Opaque / fragment forward pipeline.
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


#include "../../include/materials/BlockOutlineSelection/FragmentBindings.glsli"

void main()
{
    fragmentColor0.x = fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = fragmentVectorConstants1.packedValues[0u].z;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[0u].w;
}
