#version 460
#extension GL_GOOGLE_include_directive : require
// GamefaceStencilPath / Transparent / fragment forward pipeline.
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

#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/GamefaceStencilPath/FragmentBindings.glsli"

void main()
{
    isFragmentDiscarded = false;
    uint scalarValue = uint(varyingTexCoord3.w);
#if RD_PLATFORM == RD_PLATFORM_SM40
    bool comparisonValue = scalarValue == 15u;
    float scalarValue1 = abs(varyingTexCoord0.x);
    float scalarValue2 = abs(varyingTexCoord0.y);
    float scalarValue3 = -scalarValue2;
    precise float sumValue = scalarValue1 + scalarValue1;
    float multiplyAddValue = fma(sumValue, dFdx(scalarValue1), -dFdx(scalarValue2));
    float multiplyAddValue1 = fma(sumValue, dFdy(-scalarValue1), -dFdy(scalarValue3));
    precise float productValue3 = multiplyAddValue1 * multiplyAddValue1;
    precise float multiplyAddValue2 = fma(scalarValue1, scalarValue1, scalarValue3) / sqrt(fma(multiplyAddValue, multiplyAddValue, productValue3));
    if (comparisonValue && (spvNClamp(-multiplyAddValue2, 0.0, 1.0) < 0.00390625))
#elif RD_PLATFORM == RD_PLATFORM_SM50
    bool comparisonValue = scalarValue == 15u;
    float scalarValue1 = abs(varyingTexCoord0.x);
    float scalarValue2 = abs(varyingTexCoord0.y);
    float scalarValue3 = -scalarValue2;
    float sumValue1 = scalarValue1 + scalarValue1;
    float multiplyAddValue3 = fma(sumValue1, dFdxCoarse(scalarValue1), -dFdxCoarse(scalarValue2));
    float multiplyAddValue4 = fma(sumValue1, dFdyCoarse(-scalarValue1), -dFdyCoarse(scalarValue3));
    if (comparisonValue && (spvNClamp(-(fma(scalarValue1, scalarValue1, scalarValue3) / sqrt(fma(multiplyAddValue3, multiplyAddValue3, multiplyAddValue4 * multiplyAddValue4))), 0.0, 1.0) < 0.00390625))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    if (scalarValue == 15u)
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        isFragmentDiscarded = true;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float scalarValue1 = abs(varyingTexCoord0.x);
        float scalarValue2 = abs(varyingTexCoord0.y);
        float productValue = scalarValue1 * 2.0;
        float productValue1 = (dFdxCoarse(scalarValue1) * productValue) - dFdxCoarse(scalarValue2);
        float productValue2 = (dFdyCoarse((-0.0) - scalarValue1) * productValue) - dFdyCoarse((-0.0) - scalarValue2);
        if (spvNClamp((-0.0) - (((scalarValue1 * scalarValue1) - scalarValue2) / sqrt((productValue2 * productValue2) + (productValue1 * productValue1))), 0.0, 1.0) < 0.00390625)
        {
            isFragmentDiscarded = true;
        }
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
    if ((varyingTexCoord0.y < 0.00390625) && ((!comparisonValue) && (scalarValue != 16u)))
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    else
#endif
    {
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
        isFragmentDiscarded = true;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        if ((scalarValue != 16u) && (varyingTexCoord0.y < 0.00390625))
        {
            isFragmentDiscarded = true;
        }
#endif
    }
    fragmentColor0.x = 0.0;
    fragmentColor0.y = 0.0;
    fragmentColor0.z = 0.0;
    fragmentColor0.w = 0.0;
    discardIfRequested();
}
