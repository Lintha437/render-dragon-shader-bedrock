#version 460
#extension GL_GOOGLE_include_directive : require
// BeaconBeam / Opaque / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 3
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_FANCY
#define RD_FEATURE_FANCY RD_ON
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/BeaconBeam/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue = fragmentVectorConstants1.packedValues[0u].x - varyingColor0.x;
    precise float sumValue1 = fragmentVectorConstants1.packedValues[0u].y - varyingColor0.y;
    precise float sumValue2 = fragmentVectorConstants1.packedValues[0u].z - varyingColor0.z;
    float multiplyAddValue3 = fma(fragmentScalarConstants1.packedValues[3u], sumValue, varyingColor0.x);
    float multiplyAddValue4 = fma(fragmentScalarConstants1.packedValues[3u], sumValue1, varyingColor0.y);
    float multiplyAddValue5 = fma(fragmentScalarConstants1.packedValues[3u], sumValue2, varyingColor0.z);
    precise float productValue3 = multiplyAddValue3 * varyingColor1.x;
    precise float productValue4 = multiplyAddValue4 * varyingColor1.y;
    precise float productValue5 = multiplyAddValue5 * varyingColor1.z;
    precise float productValue6 = varyingColor0.w * varyingColor1.w;
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue3, varyingColor1.x, varyingColor2.x), productValue3);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue4, varyingColor1.y, varyingColor2.y), productValue4);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue5, varyingColor1.z, varyingColor2.z), productValue5);
    fragmentColor0.w = productValue6;
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].x - varyingColor0.x, varyingColor0.x);
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].y - varyingColor0.y, varyingColor0.y);
    float multiplyAddValue2 = fma(fragmentScalarConstants1.packedValues[3u], fragmentVectorConstants1.packedValues[0u].z - varyingColor0.z, varyingColor0.z);
    fragmentColor0.x = fma(varyingColor2.w, fma(-multiplyAddValue, varyingColor1.x, varyingColor2.x), multiplyAddValue * varyingColor1.x);
    fragmentColor0.y = fma(varyingColor2.w, fma(-multiplyAddValue1, varyingColor1.y, varyingColor2.y), multiplyAddValue1 * varyingColor1.y);
    fragmentColor0.z = fma(varyingColor2.w, fma(-multiplyAddValue2, varyingColor1.z, varyingColor2.z), multiplyAddValue2 * varyingColor1.z);
    fragmentColor0.w = varyingColor0.w * varyingColor1.w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float productValue = (((fragmentVectorConstants1.packedValues[0u].x - varyingColor0.x) * fragmentVectorConstants1.packedValues[0u].w) + varyingColor0.x) * varyingColor1.x;
    float productValue1 = (((fragmentVectorConstants1.packedValues[0u].y - varyingColor0.y) * fragmentVectorConstants1.packedValues[0u].w) + varyingColor0.y) * varyingColor1.y;
    float productValue2 = (((fragmentVectorConstants1.packedValues[0u].z - varyingColor0.z) * fragmentVectorConstants1.packedValues[0u].w) + varyingColor0.z) * varyingColor1.z;
    fragmentColor0.x = ((varyingColor2.x - productValue) * varyingColor2.w) + productValue;
    fragmentColor0.y = ((varyingColor2.y - productValue1) * varyingColor2.w) + productValue1;
    fragmentColor0.z = ((varyingColor2.z - productValue2) * varyingColor2.w) + productValue2;
    fragmentColor0.w = varyingColor0.w * varyingColor1.w;
#endif
}
