#version 460
#extension GL_GOOGLE_include_directive : require
// UIBase / Transparent / fragment forward pipeline.
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

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/UIBase/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue = fragmentScalarConstants1.packedValues[0u] * fragmentScalarConstants1.packedValues[7u];
    fragmentColor0.w = productValue;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.w = fragmentScalarConstants1.packedValues[0u] * fragmentScalarConstants1.packedValues[7u];
#endif
    fragmentColor0.x = fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = fragmentVectorConstants1.packedValues[1u].z;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.w = fragmentVectorConstants1.packedValues[0u].x * fragmentVectorConstants1.packedValues[1u].w;
#endif
}
