#version 460
#extension GL_GOOGLE_include_directive : require
// CloudsForwardPBR / MotionOnly / fragment forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 2
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_FEATURE_INSTANCING
#define RD_FEATURE_INSTANCING RD_OFF
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 7
#endif

#if RD_PLATFORM == RD_PLATFORM_SM50
#extension GL_EXT_scalar_block_layout : require
#endif

#include "../../include/materials/CloudsForwardPBR/FragmentBindings.glsli"

void main()
{
    float sumValue = varyingTexCoord6.x - fragmentVectorConstants1.packedValues[8u].x;
    float sumValue1 = varyingTexCoord6.y - fragmentVectorConstants1.packedValues[8u].y;
    float sumValue2 = varyingTexCoord6.z - fragmentVectorConstants1.packedValues[8u].z;
#if RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue = fma(fragmentScalarConstants1.packedValues[27u], sumValue2, fma(fragmentScalarConstants1.packedValues[19u], sumValue, sumValue1 * fragmentScalarConstants1.packedValues[23u])) + fragmentScalarConstants1.packedValues[31u];
    float multiplyAddValue1 = fma(fragmentScalarConstants1.packedValues[11u], varyingTexCoord3.z, fma(fragmentScalarConstants1.packedValues[3u], varyingTexCoord3.x, varyingTexCoord3.y * fragmentScalarConstants1.packedValues[7u])) + fragmentScalarConstants1.packedValues[15u];
    fragmentColor0.z = fma((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].x, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue1, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[4u].x, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[5u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue, 0.5, 0.5);
    fragmentColor0.w = fma((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[0u].y, varyingTexCoord3.x, varyingTexCoord3.y * fragmentVectorConstants1.packedValues[1u].y)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue1, 0.5, 0.5) - fma((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[4u].y, sumValue, sumValue1 * fragmentVectorConstants1.packedValues[5u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue, 0.5, 0.5);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float multiplyAddValue2 = fma(fragmentVectorConstants1.packedValues[2u].w, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].w, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].w * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].w;
    float multiplyAddValue3 = fma(fragmentVectorConstants1.packedValues[6u].w, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].w, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].w)) + fragmentVectorConstants1.packedValues[7u].w;
#endif
    fragmentColor0.x = 0.0;
    fragmentColor0.y = 0.0;
#if RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    fragmentColor0.z = (((fma(fragmentVectorConstants1.packedValues[2u].x, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].x, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].x * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].x) / multiplyAddValue2) - ((fma(fragmentVectorConstants1.packedValues[6u].x, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].x, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].x)) + fragmentVectorConstants1.packedValues[7u].x) / multiplyAddValue3)) * 0.5;
    fragmentColor0.w = (((fma(fragmentVectorConstants1.packedValues[2u].y, varyingTexCoord3.z, fma(fragmentVectorConstants1.packedValues[1u].y, varyingTexCoord3.y, fragmentVectorConstants1.packedValues[0u].y * varyingTexCoord3.x)) + fragmentVectorConstants1.packedValues[3u].y) / multiplyAddValue2) - ((fma(fragmentVectorConstants1.packedValues[6u].y, sumValue2, fma(fragmentVectorConstants1.packedValues[5u].y, sumValue1, sumValue * fragmentVectorConstants1.packedValues[4u].y)) + fragmentVectorConstants1.packedValues[7u].y) / multiplyAddValue3)) * 0.5;
#endif
}
