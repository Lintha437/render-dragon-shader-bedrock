#version 460
#extension GL_GOOGLE_include_directive : require
// ShadowOverlay / Transparent / fragment forward pipeline.
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


#include "../../include/materials/ShadowOverlay/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue = fragmentVectorConstants1.packedValues[0u].x - varyingColor0.x;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[0u].y - varyingColor0.y;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[0u].z - varyingColor0.z;
    fragmentColor0.x = fma(varyingColor0.w, sumValue, varyingColor0.x);
    fragmentColor0.y = fma(varyingColor0.w, sumValue1, varyingColor0.y);
    fragmentColor0.z = fma(varyingColor0.w, sumValue2, varyingColor0.z);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = fma(varyingColor0.w, fragmentVectorConstants1.packedValues[0u].x - varyingColor0.x, varyingColor0.x);
    fragmentColor0.y = fma(varyingColor0.w, fragmentVectorConstants1.packedValues[0u].y - varyingColor0.y, varyingColor0.y);
    fragmentColor0.z = fma(varyingColor0.w, fragmentVectorConstants1.packedValues[0u].z - varyingColor0.z, varyingColor0.z);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = ((fragmentVectorConstants1.packedValues[0u].x - varyingColor0.x) * varyingColor0.w) + varyingColor0.x;
    fragmentColor0.y = ((fragmentVectorConstants1.packedValues[0u].y - varyingColor0.y) * varyingColor0.w) + varyingColor0.y;
    fragmentColor0.z = ((fragmentVectorConstants1.packedValues[0u].z - varyingColor0.z) * varyingColor0.w) + varyingColor0.z;
#endif
    fragmentColor0.w = 1.0;
}
