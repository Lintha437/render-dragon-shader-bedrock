#version 460
#extension GL_GOOGLE_include_directive : require
// ShadowVolume / StencilWrite / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif


#include "../../include/materials/ShadowVolume/FragmentBindings.glsli"

void main()
{
    fragmentColor0.x = 1.0;
    fragmentColor0.y = 1.0;
    fragmentColor0.z = 1.0;
    fragmentColor0.w = 1.0;
}
