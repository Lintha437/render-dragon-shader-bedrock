#version 460
#extension GL_GOOGLE_include_directive : require
// Stars / Transparent / fragment forward pipeline.
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


#include "../../include/materials/Stars/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue = varyingColor0.w * fragmentVectorConstants1.packedValues[0u].x;
    precise float productValue1 = varyingColor0.w * fragmentVectorConstants1.packedValues[0u].y;
    precise float productValue2 = varyingColor0.w * fragmentVectorConstants1.packedValues[0u].z;
    precise float productValue3 = productValue * varyingColor0.x;
    precise float productValue4 = productValue1 * varyingColor0.y;
    precise float productValue5 = productValue2 * varyingColor0.z;
    fragmentColor0.x = productValue3;
    fragmentColor0.y = productValue4;
    fragmentColor0.z = productValue5;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = (varyingColor0.w * fragmentVectorConstants1.packedValues[0u].x) * varyingColor0.x;
    fragmentColor0.y = (varyingColor0.w * fragmentVectorConstants1.packedValues[0u].y) * varyingColor0.y;
    fragmentColor0.z = (varyingColor0.w * fragmentVectorConstants1.packedValues[0u].z) * varyingColor0.z;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = (varyingColor0.w * varyingColor0.x) * fragmentVectorConstants1.packedValues[0u].x;
    fragmentColor0.y = (varyingColor0.w * varyingColor0.y) * fragmentVectorConstants1.packedValues[0u].y;
    fragmentColor0.z = (varyingColor0.w * varyingColor0.z) * fragmentVectorConstants1.packedValues[0u].z;
#endif
    fragmentColor0.w = varyingColor0.w;
}
