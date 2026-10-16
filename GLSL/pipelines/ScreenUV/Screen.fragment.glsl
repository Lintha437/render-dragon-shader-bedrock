#version 460
#extension GL_GOOGLE_include_directive : require
// ScreenUV / Screen / fragment forward pipeline.
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


#include "../../include/materials/ScreenUV/FragmentBindings.glsli"

void main()
{
    fragmentColor0.x = varyingColor0.x;
    fragmentColor0.y = varyingColor0.y;
    fragmentColor0.z = varyingColor0.z;
    fragmentColor0.w = varyingColor0.w;
}
