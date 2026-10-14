#version 460
#extension GL_GOOGLE_include_directive : require
// GamefacePath / Transparent / fragment forward pipeline.
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

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif
#extension GL_EXT_spirv_intrinsics : require

#include "../../include/materials/GamefacePath/FragmentBindings.glsli"

void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    uint reinterpretedBits3 = (floatBitsToUint(varyingTexCoord3.z) << 4u) + ((floatBitsToUint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue3 = reinterpretedBits3 + 1u;
    uint productValue9 = uint(int(fragmentScalarConstants1.packedValues[reinterpretedBits3 * 4u]));
#elif RD_PLATFORM == RD_PLATFORM_SM50
    uint reinterpretedBits2 = bitfieldInsert(bitfieldExtract(floatBitsToUint(varyingTexCoord3.y), int(4u), int(4u)), floatBitsToUint(varyingTexCoord3.z), int(4u), int(28u));
    uint sumValue1 = reinterpretedBits2 + 1u;
    uint productValue7 = uint(int(fragmentScalarConstants1.packedValues[reinterpretedBits2 * 4u]));
#endif
    uint reinterpretedBits = floatBitsToUint(varyingTexCoord3.w);
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    uint reinterpretedBits1 = (floatBitsToUint(varyingTexCoord3.z) << 4u) | ((floatBitsToUint(varyingTexCoord3.y) >> 4u) & 15u);
    uint sumValue = reinterpretedBits1 + 1u;
    uint scalarValue = uint(int(fragmentVectorConstants1.packedValues[reinterpretedBits1].x));
    float productValue3;
    float productValue4;
    float productValue5;
    float productValue6;
#endif
    if (reinterpretedBits == 14u)
    {
#if RD_PLATFORM == RD_PLATFORM_SM40
        float scalarValue3 = -varyingTexCoord0.y;
        precise float sumValue4 = varyingTexCoord0.x + varyingTexCoord0.x;
        float multiplyAddValue4 = fma(sumValue4, dFdx(varyingTexCoord0.x), -dFdx(varyingTexCoord0.y));
        float multiplyAddValue5 = fma(sumValue4, dFdy(-varyingTexCoord0.x), -dFdy(scalarValue3));
        float multiplyAddValue2 = fma(varyingTexCoord0.x, varyingTexCoord0.x, scalarValue3);
        precise float productValue10 = multiplyAddValue2 * multiplyAddValue2;
        precise float productValue11 = multiplyAddValue5 * multiplyAddValue5;
        precise float multiplyAddValue6 = productValue10 / fma(multiplyAddValue4, multiplyAddValue4, productValue11);
        precise float nonlinearValue1 = 1.0 - sqrt(multiplyAddValue6);
        uint productValue12 = productValue9 * 4u;
        precise float productValue13 = fragmentScalarConstants1.packedValues[productValue12] * fragmentVectorConstants1.packedValues[sumValue3].x;
        precise float productValue14 = fragmentScalarConstants1.packedValues[productValue12] * fragmentVectorConstants1.packedValues[sumValue3].y;
        precise float productValue15 = fragmentScalarConstants1.packedValues[productValue12] * fragmentVectorConstants1.packedValues[sumValue3].z;
        precise float productValue16 = fragmentScalarConstants1.packedValues[productValue12] * fragmentVectorConstants1.packedValues[sumValue3].w;
        float scalarValue5 = spvNMax(nonlinearValue1, 0.0);
        precise float productValue17 = scalarValue5 * productValue13;
        precise float productValue18 = scalarValue5 * productValue14;
        precise float productValue19 = scalarValue5 * productValue15;
        precise float productValue20 = scalarValue5 * productValue16;
        fragmentColor0.x = productValue17;
        fragmentColor0.y = productValue18;
        fragmentColor0.z = productValue19;
        fragmentColor0.w = productValue20;
#elif RD_PLATFORM == RD_PLATFORM_SM50
        float scalarValue3 = -varyingTexCoord0.y;
        float sumValue2 = varyingTexCoord0.x + varyingTexCoord0.x;
        float multiplyAddValue = fma(sumValue2, dFdxCoarse(varyingTexCoord0.x), -dFdxCoarse(varyingTexCoord0.y));
        float multiplyAddValue1 = fma(sumValue2, dFdyCoarse(-varyingTexCoord0.x), -dFdyCoarse(scalarValue3));
        float multiplyAddValue2 = fma(varyingTexCoord0.x, varyingTexCoord0.x, scalarValue3);
        uint productValue8 = productValue7 * 4u;
        float multiplyAddValue3 = spvNMax(1.0 - sqrt((multiplyAddValue2 * multiplyAddValue2) / fma(multiplyAddValue, multiplyAddValue, multiplyAddValue1 * multiplyAddValue1)), 0.0);
        fragmentColor0.x = multiplyAddValue3 * (fragmentScalarConstants1.packedValues[productValue8] * fragmentVectorConstants1.packedValues[sumValue1].x);
        fragmentColor0.y = multiplyAddValue3 * (fragmentScalarConstants1.packedValues[productValue8] * fragmentVectorConstants1.packedValues[sumValue1].y);
        fragmentColor0.z = multiplyAddValue3 * (fragmentScalarConstants1.packedValues[productValue8] * fragmentVectorConstants1.packedValues[sumValue1].z);
        fragmentColor0.w = multiplyAddValue3 * (fragmentScalarConstants1.packedValues[productValue8] * fragmentVectorConstants1.packedValues[sumValue1].w);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float scalarValue1 = varyingTexCoord0.x * 2.0;
        float productValue = (dFdxCoarse(varyingTexCoord0.x) * scalarValue1) - dFdxCoarse(varyingTexCoord0.y);
        float productValue1 = (dFdyCoarse((-0.0) - varyingTexCoord0.x) * scalarValue1) - dFdyCoarse((-0.0) - varyingTexCoord0.y);
        float productValue2 = (varyingTexCoord0.x * varyingTexCoord0.x) - varyingTexCoord0.y;
        float nonlinearValue = spvNClamp(1.0 - sqrt((productValue2 * productValue2) / ((productValue1 * productValue1) + (productValue * productValue))), 0.0, 1.0) * fragmentVectorConstants1.packedValues[scalarValue].x;
        productValue3 = nonlinearValue * fragmentVectorConstants1.packedValues[sumValue].x;
        productValue4 = nonlinearValue * fragmentVectorConstants1.packedValues[sumValue].y;
        productValue5 = nonlinearValue * fragmentVectorConstants1.packedValues[sumValue].z;
        productValue6 = nonlinearValue * fragmentVectorConstants1.packedValues[sumValue].w;
#endif
    }
    else
    {
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        float branchMergedValue;
        float branchMergedValue1;
        float branchMergedValue2;
        float branchMergedValue3;
#endif
        if (reinterpretedBits == 11u)
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float scalarValue6 = 1.0 - abs(fma(varyingTexCoord0.y, fragmentScalarConstants1.packedValues[(productValue9 * 4u) + 1u], -fragmentScalarConstants1.packedValues[(productValue9 * 4u) + 2u]));
            precise float productValue21 = scalarValue6 * fragmentScalarConstants1.packedValues[productValue9 * 4u];
            float scalarValue7 = spvNMin(productValue21, 1.0);
            precise float productValue22 = scalarValue7 * fragmentVectorConstants1.packedValues[sumValue3].x;
            precise float productValue23 = scalarValue7 * fragmentVectorConstants1.packedValues[sumValue3].y;
            precise float productValue24 = scalarValue7 * fragmentVectorConstants1.packedValues[sumValue3].z;
            precise float productValue25 = scalarValue7 * fragmentVectorConstants1.packedValues[sumValue3].w;
            fragmentColor0.x = productValue22;
            fragmentColor0.y = productValue23;
            fragmentColor0.z = productValue24;
            fragmentColor0.w = productValue25;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            float scalarValue4 = spvNMin((1.0 - abs(fma(varyingTexCoord0.y, fragmentScalarConstants1.packedValues[(productValue7 * 4u) + 1u], -fragmentScalarConstants1.packedValues[(productValue7 * 4u) + 2u]))) * fragmentScalarConstants1.packedValues[productValue7 * 4u], 1.0);
            fragmentColor0.x = scalarValue4 * fragmentVectorConstants1.packedValues[sumValue1].x;
            fragmentColor0.y = scalarValue4 * fragmentVectorConstants1.packedValues[sumValue1].y;
            fragmentColor0.z = scalarValue4 * fragmentVectorConstants1.packedValues[sumValue1].z;
            fragmentColor0.w = scalarValue4 * fragmentVectorConstants1.packedValues[sumValue1].w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            float scalarValue2 = spvNMin(1.0, (1.0 - abs((fragmentVectorConstants1.packedValues[scalarValue].y * varyingTexCoord0.y) - fragmentVectorConstants1.packedValues[scalarValue].z)) * fragmentVectorConstants1.packedValues[scalarValue].x);
            branchMergedValue = scalarValue2 * fragmentVectorConstants1.packedValues[sumValue].x;
            branchMergedValue1 = scalarValue2 * fragmentVectorConstants1.packedValues[sumValue].y;
            branchMergedValue2 = scalarValue2 * fragmentVectorConstants1.packedValues[sumValue].z;
            branchMergedValue3 = scalarValue2 * fragmentVectorConstants1.packedValues[sumValue].w;
#endif
        }
        else
        {
#if RD_PLATFORM == RD_PLATFORM_SM40
            precise float productValue26 = varyingTexCoord0.y * fragmentVectorConstants1.packedValues[sumValue3].x;
            precise float productValue27 = varyingTexCoord0.y * fragmentVectorConstants1.packedValues[sumValue3].y;
            precise float productValue28 = varyingTexCoord0.y * fragmentVectorConstants1.packedValues[sumValue3].z;
            precise float productValue29 = varyingTexCoord0.y * fragmentVectorConstants1.packedValues[sumValue3].w;
            fragmentColor0.x = productValue26;
            fragmentColor0.y = productValue27;
            fragmentColor0.z = productValue28;
            fragmentColor0.w = productValue29;
#elif RD_PLATFORM == RD_PLATFORM_SM50
            fragmentColor0.x = varyingTexCoord0.y * fragmentVectorConstants1.packedValues[sumValue1].x;
            fragmentColor0.y = varyingTexCoord0.y * fragmentVectorConstants1.packedValues[sumValue1].y;
            fragmentColor0.z = varyingTexCoord0.y * fragmentVectorConstants1.packedValues[sumValue1].z;
            fragmentColor0.w = varyingTexCoord0.y * fragmentVectorConstants1.packedValues[sumValue1].w;
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
            branchMergedValue = fragmentVectorConstants1.packedValues[sumValue].x * varyingTexCoord0.y;
            branchMergedValue1 = fragmentVectorConstants1.packedValues[sumValue].y * varyingTexCoord0.y;
            branchMergedValue2 = fragmentVectorConstants1.packedValues[sumValue].z * varyingTexCoord0.y;
            branchMergedValue3 = fragmentVectorConstants1.packedValues[sumValue].w * varyingTexCoord0.y;
#endif
        }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
        productValue3 = branchMergedValue;
        productValue4 = branchMergedValue1;
        productValue5 = branchMergedValue2;
        productValue6 = branchMergedValue3;
#endif
    }
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.x = productValue3;
    fragmentColor0.y = productValue4;
    fragmentColor0.z = productValue5;
    fragmentColor0.w = productValue6;
#endif
}
