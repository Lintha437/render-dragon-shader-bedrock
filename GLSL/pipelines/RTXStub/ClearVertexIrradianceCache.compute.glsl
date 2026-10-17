#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / ClearVertexIrradianceCache / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 19
#endif

#extension GL_EXT_nonuniform_qualifier : require
#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
#extension GL_EXT_shader_16bit_storage : require
#if defined(GL_AMD_gpu_shader_half_float)
#extension GL_AMD_gpu_shader_half_float : require
#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
#else
#error No extension available for FP16.
#endif

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

void main()
{
    uvec4 reinterpretedBits = floatBitsToUint(RootConstants.packedValues[0u]);
    uint scalarValue = reinterpretedBits.x;
    if (gl_GlobalInvocationID.x < (scalarValue >> 12u))
    {
        uint sumValue = reinterpretedBits.y + gl_GlobalInvocationID.x;
        uint bitwiseValue = (scalarValue & 4095u) + 0u;
        vertexIrradianceCache[nonuniformEXT(bitwiseValue)].packedValues[sumValue * 2u] = u16vec4(float16BitsToUint16(float16_t(0.0)), float16BitsToUint16(float16_t(0.0)), float16BitsToUint16(float16_t(0.0)), float16BitsToUint16(float16_t(0.0)));
        vertexIrradianceCache[nonuniformEXT(bitwiseValue)].packedValues[(sumValue * 2u) + 1u] = u16vec4(float16BitsToUint16(float16_t(0.0)), float16BitsToUint16(float16_t(0.0)), float16BitsToUint16(float16_t(0.0)), float16BitsToUint16(float16_t(0.0)));
    }
}
