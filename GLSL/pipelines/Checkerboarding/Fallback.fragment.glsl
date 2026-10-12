#version 460
#extension GL_GOOGLE_include_directive : require
// Checkerboarding / Fallback / fragment forward pipeline.
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


#include "../../include/materials/Checkerboarding/FragmentBindings.glsli"

void main()
{
    fragmentColor0.x = 0.0;
    fragmentColor0.y = 0.0;
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
}
