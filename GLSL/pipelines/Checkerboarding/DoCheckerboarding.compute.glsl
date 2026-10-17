#version 460
#extension GL_GOOGLE_include_directive : require
// Checkerboarding / DoCheckerboarding / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 1
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 0
#endif

#extension GL_EXT_samplerless_texture_functions : require

#include "../../include/materials/Checkerboarding/ComputeBindings.glsli"

void main()
{
    uint comparisonValue = ((((gl_GlobalInvocationID.y ^ gl_GlobalInvocationID.x) & 1u) == 0u) ? uint(computeVectorConstants0.packedValues[0u].x) : 0u) + uint(int(gl_GlobalInvocationID.x) / int(2u));
    imageStore(colorMetalnessOutputTexture, ivec2(uvec2(comparisonValue, gl_GlobalInvocationID.y)), vec4(texelFetch(colorMetalnessInputTexture, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u))));
    imageStore(normalOutputTexture, ivec2(uvec2(comparisonValue, gl_GlobalInvocationID.y)), vec4(texelFetch(normalInputTexture, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)).xyxx));
    imageStore(emissiveLinearRoughnessOutputTexture, ivec2(uvec2(comparisonValue, gl_GlobalInvocationID.y)), vec4(texelFetch(emissiveLinearRoughnessInputTexture, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u))));
    imageStore(planeIdOutputTexture, ivec2(uvec2(comparisonValue, gl_GlobalInvocationID.y)), uvec4(texelFetch(planeIdInputTexture, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)).x));
    imageStore(worldPositionOutputTexture, ivec2(uvec2(comparisonValue, gl_GlobalInvocationID.y)), vec4(texelFetch(worldPositionInputTexture, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u))));
    imageStore(lowPrecisionWorldPositionOutputTexture, ivec2(uvec2(comparisonValue, gl_GlobalInvocationID.y)), vec4(texelFetch(lowPrecisionWorldPositionInputTexture, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u))));
    imageStore(viewDirectionAndSplitMaskOutputTexture, ivec2(uvec2(comparisonValue, gl_GlobalInvocationID.y)), vec4(texelFetch(viewDirectionAndSplitMaskInputTexture, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u))));
}
