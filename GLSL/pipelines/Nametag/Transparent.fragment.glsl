#version 460
#extension GL_GOOGLE_include_directive : require
// Nametag / Transparent / fragment forward pipeline.
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

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/Nametag/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue = fragmentVectorConstants1.packedValues[0u].x - 1.0;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[0u].y - 1.0;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[0u].z - 1.0;
    precise float productValue = varyingColor0.x * fragmentVectorConstants1.packedValues[1u].x;
    precise float productValue1 = varyingColor0.y * fragmentVectorConstants1.packedValues[1u].y;
    precise float productValue2 = varyingColor0.z * fragmentVectorConstants1.packedValues[1u].z;
    precise float productValue3 = varyingColor0.w * fragmentVectorConstants1.packedValues[1u].w;
    precise float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[3u], sumValue, 1.0) * productValue;
    precise float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[3u], sumValue1, 1.0) * productValue1;
    precise float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[3u], sumValue2, 1.0) * productValue2;
    precise float productValue4 = productValue3 * 1.0;
    fragmentColor0.x = multiplyAddValue;
    fragmentColor0.y = multiplyAddValue1;
    fragmentColor0.z = multiplyAddValue2;
    fragmentColor0.w = productValue4;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    fragmentColor0.x = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - 1.0, 1.0) * (varyingColor0.x * fragmentVectorConstants1.packedValues[1u].x);
    fragmentColor0.y = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - 1.0, 1.0) * (varyingColor0.y * fragmentVectorConstants1.packedValues[1u].y);
    fragmentColor0.z = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - 1.0, 1.0) * (varyingColor0.z * fragmentVectorConstants1.packedValues[1u].z);
    fragmentColor0.w = varyingColor0.w * fragmentVectorConstants1.packedValues[1u].w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = (fragmentVectorConstants1.packedValues[1u].x * varyingColor0.x) * (((fragmentVectorConstants1.packedValues[0u].x + (-1.0)) * fragmentVectorConstants1.packedValues[0u].w) + 1.0);
    fragmentColor0.y = (fragmentVectorConstants1.packedValues[1u].y * varyingColor0.y) * (((fragmentVectorConstants1.packedValues[0u].y + (-1.0)) * fragmentVectorConstants1.packedValues[0u].w) + 1.0);
    fragmentColor0.z = (fragmentVectorConstants1.packedValues[1u].z * varyingColor0.z) * (((fragmentVectorConstants1.packedValues[0u].z + (-1.0)) * fragmentVectorConstants1.packedValues[0u].w) + 1.0);
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].w * varyingColor0.w;
#endif
}
