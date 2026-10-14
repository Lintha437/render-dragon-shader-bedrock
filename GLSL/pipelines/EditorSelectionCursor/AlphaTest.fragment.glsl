#version 460
#extension GL_GOOGLE_include_directive : require
// EditorSelectionCursor / AlphaTest / fragment forward pipeline.
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


#include "../../include/materials/EditorSelectionCursor/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue = varyingTexCoord0 + varyingTexCoord0;
    if (fma(-floor(sumValue), 0.5, varyingTexCoord0) > 0.375)
#elif RD_PLATFORM == RD_PLATFORM_SM50
    if (fma(-floor(varyingTexCoord0 + varyingTexCoord0), 0.5, varyingTexCoord0) > 0.375)
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if ((varyingTexCoord0 - (floor(varyingTexCoord0 * 2.0) * 0.5)) > 0.375)
#endif
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = fragmentVectorConstants1.packedValues[0u].z;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[0u].w;
    discardIfRequested();
}
