#version 460
#extension GL_GOOGLE_include_directive : require
// EditorSelectionCursor / RasterizedTransparent / fragment forward pipeline.
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

#include "../../include/materials/EditorSelectionCursor/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue = fragmentScalarConstants1.packedValues[0u] * 6.28318023681640625;
    fragmentColor0.w = fma(sin(productValue), 0.015625, fragmentScalarConstants1.packedValues[7u]);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.w = fma(sin(fragmentScalarConstants1.packedValues[0u] * 6.28318023681640625), 0.015625, fragmentScalarConstants1.packedValues[7u]);
#endif
    fragmentColor0.x = fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = fragmentVectorConstants1.packedValues[1u].z;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.w = (sin(fragmentVectorConstants1.packedValues[0u].x * 6.28318023681640625) * 0.015625) + fragmentVectorConstants1.packedValues[1u].w;
#endif
}
