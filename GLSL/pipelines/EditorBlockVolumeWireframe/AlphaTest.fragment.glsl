#version 460
#extension GL_GOOGLE_include_directive : require
// EditorBlockVolumeWireframe / AlphaTest / fragment forward pipeline.
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

#include "../../include/materials/EditorBlockVolumeWireframe/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float sumValue3 = varyingTexCoord0.x + fragmentScalarConstants1.packedValues[0u];
    precise float sumValue4 = sumValue3 - trunc(sumValue3);
    if ((sumValue4 < 0.60000002384185791015625) && ((varyingTexCoord0.y == 0.0) && (sumValue4 > 0.4000000059604644775390625)))
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float sumValue1 = varyingTexCoord0.x + fragmentScalarConstants1.packedValues[0u];
    float sumValue2 = sumValue1 - trunc(sumValue1);
    if ((sumValue2 < 0.60000002384185791015625) && ((varyingTexCoord0.y == 0.0) && (sumValue2 > 0.4000000059604644775390625)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float sumValue = fragmentVectorConstants1.packedValues[0u].x + varyingTexCoord0.x;
    float scalarValue = fract(abs(sumValue));
    float comparisonValue = (sumValue >= ((-0.0) - sumValue)) ? scalarValue : ((-0.0) - scalarValue);
    if ((comparisonValue < 0.60000002384185791015625) && ((varyingTexCoord0.y == 0.0) && (comparisonValue > 0.4000000059604644775390625)))
#endif
    {
        isFragmentDiscarded = true;
    }
    fragmentColor0.x = fragmentVectorConstants1.packedValues[1u].x;
    fragmentColor0.y = fragmentVectorConstants1.packedValues[1u].y;
    fragmentColor0.z = fragmentVectorConstants1.packedValues[1u].z;
    fragmentColor0.w = fragmentVectorConstants1.packedValues[1u].w;
    discardIfRequested();
}
