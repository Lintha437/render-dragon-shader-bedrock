#version 460
#extension GL_GOOGLE_include_directive : require
// MinecraftColor / Opaque / fragment forward pipeline.
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
#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#define RD_USE_DOT3_PRECISE2_FLOAT_3 1
#endif

#include "../../include/materials/MinecraftColor/FragmentBindings.glsli"

#if RD_PLATFORM == RD_PLATFORM_SM40 || RD_PLATFORM == RD_PLATFORM_SM50
#include "../../include/Math.glsli"
#endif
void main()
{
#if RD_PLATFORM == RD_PLATFORM_SM40
    precise float productValue = fragmentVectorConstants1.packedValues[1u].x * fragmentScalarConstants1.packedValues[17u];
    precise float productValue1 = fragmentVectorConstants1.packedValues[1u].y * fragmentScalarConstants1.packedValues[17u];
    precise float productValue2 = fragmentVectorConstants1.packedValues[1u].z * fragmentScalarConstants1.packedValues[17u];
    precise float multiplyAddValue1 = spvNClamp(rdDot3Precise2(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(-fma(fragmentVectorConstants1.packedValues[2u].x, fragmentScalarConstants1.packedValues[18u], fma(fragmentVectorConstants1.packedValues[0u].x, fragmentScalarConstants1.packedValues[16u], productValue)), -fma(fragmentVectorConstants1.packedValues[2u].y, fragmentScalarConstants1.packedValues[18u], fma(fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[16u], productValue1)), -fma(fragmentVectorConstants1.packedValues[2u].z, fragmentScalarConstants1.packedValues[18u], fma(fragmentVectorConstants1.packedValues[0u].z, fragmentScalarConstants1.packedValues[16u], productValue2)))), 0.0, 1.0) * 0.800000011920928955078125;
    fragmentColor0.x = fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[5u].x, 0.20000000298023223876953125);
    fragmentColor0.y = fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[5u].y, 0.20000000298023223876953125);
    fragmentColor0.z = fma(multiplyAddValue1, fragmentVectorConstants1.packedValues[5u].z, 0.20000000298023223876953125);
#elif RD_PLATFORM == RD_PLATFORM_SM50
    float multiplyAddValue2 = spvNClamp(rdDot3Precise2(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3(-fma(fragmentVectorConstants1.packedValues[2u].x, fragmentScalarConstants1.packedValues[18u], fma(fragmentVectorConstants1.packedValues[0u].x, fragmentScalarConstants1.packedValues[16u], fragmentVectorConstants1.packedValues[1u].x * fragmentScalarConstants1.packedValues[17u])), -fma(fragmentVectorConstants1.packedValues[2u].y, fragmentScalarConstants1.packedValues[18u], fma(fragmentVectorConstants1.packedValues[0u].y, fragmentScalarConstants1.packedValues[16u], fragmentVectorConstants1.packedValues[1u].y * fragmentScalarConstants1.packedValues[17u])), -fma(fragmentVectorConstants1.packedValues[2u].z, fragmentScalarConstants1.packedValues[18u], fma(fragmentVectorConstants1.packedValues[0u].z, fragmentScalarConstants1.packedValues[16u], fragmentVectorConstants1.packedValues[1u].z * fragmentScalarConstants1.packedValues[17u])))), 0.0, 1.0) * 0.800000011920928955078125;
    fragmentColor0.x = fma(multiplyAddValue2, fragmentVectorConstants1.packedValues[5u].x, 0.20000000298023223876953125);
    fragmentColor0.y = fma(multiplyAddValue2, fragmentVectorConstants1.packedValues[5u].y, 0.20000000298023223876953125);
    fragmentColor0.z = fma(multiplyAddValue2, fragmentVectorConstants1.packedValues[5u].z, 0.20000000298023223876953125);
#elif RD_PLATFORM == RD_PLATFORM_SM60 || RD_PLATFORM == RD_PLATFORM_SM65
    float multiplyAddValue = spvNClamp(dot(vec3(varyingNormal0.x, varyingNormal0.y, varyingNormal0.z), vec3((-0.0) - fma(fragmentVectorConstants1.packedValues[2u].x, fragmentVectorConstants1.packedValues[4u].z, fma(fragmentVectorConstants1.packedValues[1u].x, fragmentVectorConstants1.packedValues[4u].y, fragmentVectorConstants1.packedValues[4u].x * fragmentVectorConstants1.packedValues[0u].x)), (-0.0) - fma(fragmentVectorConstants1.packedValues[2u].y, fragmentVectorConstants1.packedValues[4u].z, fma(fragmentVectorConstants1.packedValues[1u].y, fragmentVectorConstants1.packedValues[4u].y, fragmentVectorConstants1.packedValues[4u].x * fragmentVectorConstants1.packedValues[0u].y)), (-0.0) - fma(fragmentVectorConstants1.packedValues[2u].z, fragmentVectorConstants1.packedValues[4u].z, fma(fragmentVectorConstants1.packedValues[1u].z, fragmentVectorConstants1.packedValues[4u].y, fragmentVectorConstants1.packedValues[4u].x * fragmentVectorConstants1.packedValues[0u].z)))), 0.0, 1.0) * 0.800000011920928955078125;
    fragmentColor0.x = (multiplyAddValue * fragmentVectorConstants1.packedValues[5u].x) + 0.20000000298023223876953125;
    fragmentColor0.y = (multiplyAddValue * fragmentVectorConstants1.packedValues[5u].y) + 0.20000000298023223876953125;
    fragmentColor0.z = (multiplyAddValue * fragmentVectorConstants1.packedValues[5u].z) + 0.20000000298023223876953125;
#endif
    fragmentColor0.w = 1.0;
}
