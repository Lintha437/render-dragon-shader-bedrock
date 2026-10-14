#version 460
#extension GL_GOOGLE_include_directive : require
// RTXStub / TileClassification / compute forward pipeline.
// Feature macros choose supported code paths; native layouts come from the build recipe.
#include "../../include/ProjectConfig.h"

#ifndef RD_CONFIGURATION
#define RD_CONFIGURATION 0
#endif
#ifndef RD_PLATFORM
#define RD_PLATFORM RD_PLATFORM_SM65
#endif
#ifndef RD_BINDING_LAYOUT
#define RD_BINDING_LAYOUT 18
#endif

#if defined(GL_EXT_control_flow_attributes)
#extension GL_EXT_control_flow_attributes : require
#define SPIRV_CROSS_FLATTEN [[flatten]]
#define SPIRV_CROSS_BRANCH [[dont_flatten]]
#define SPIRV_CROSS_UNROLL [[unroll]]
#define SPIRV_CROSS_LOOP [[dont_unroll]]
#else
#define SPIRV_CROSS_FLATTEN
#define SPIRV_CROSS_BRANCH
#define SPIRV_CROSS_UNROLL
#define SPIRV_CROSS_LOOP
#endif
#extension GL_KHR_shader_subgroup_basic : require
#extension GL_EXT_samplerless_texture_functions : require
#extension GL_KHR_shader_subgroup_vote : require
#extension GL_KHR_shader_subgroup_ballot : require
#define RD_USE_DIVIDE_UNSIGNED_UINT_11 1

#include "../../include/materials/RTXStub/ComputeBindings.glsli"

#include "../../include/Math.glsli"
void main()
{
    uint scalarValue = rdDivideUnsigned(256u, gl_SubgroupSize);
    uvec4 sampledTextureValue = uvec4(texelFetch(inputPlaneIdentifier, ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u)));
    uint scalarValue1 = sampledTextureValue.x;
    bool comparisonValue = scalarValue1 == 0u;
    uint intermediateValue5;
    uint intermediateValue7;
    if (subgroupAll(comparisonValue))
    {
        intermediateValue5 = 0u;
        intermediateValue7 = 1u;
    }
    else
    {
        uint scalarValue2 = subgroupBroadcastFirst(scalarValue1);
        intermediateValue5 = scalarValue2;
        intermediateValue7 = subgroupAll(int(scalarValue2 - scalarValue1) < int(50u)) ? 2u : 0u;
    }
    vec4 sampledTextureValue1 = texelFetch(shadowDenoisingInputs[0u], ivec2(uvec2(gl_GlobalInvocationID.x, gl_GlobalInvocationID.y)), int(0u));
    float scalarValue3 = sampledTextureValue1.x;
    float scalarValue4 = sampledTextureValue1.y;
    float scalarValue5 = sampledTextureValue1.z;
    float scalarValue6 = subgroupBroadcastFirst(scalarValue3);
    float scalarValue7 = subgroupBroadcastFirst(scalarValue4);
    float scalarValue8 = subgroupBroadcastFirst(scalarValue5);
    bool bitwiseValue = subgroupAll(comparisonValue || (((abs(scalarValue3 - scalarValue6) < 0.00999999977648258209228515625) && (abs(scalarValue4 - scalarValue7) < 0.00999999977648258209228515625)) && (abs(scalarValue5 - scalarValue8) < 0.00999999977648258209228515625)));
    uint bitwiseValue1 = intermediateValue7 | 4u;
    uint comparisonValue1 = bitwiseValue ? bitwiseValue1 : intermediateValue7;
    uint scalarValue9 = rdDivideUnsigned(gl_LocalInvocationIndex, gl_SubgroupSize);
    if (subgroupElect())
    {
        intermediateValue[scalarValue9] = comparisonValue1;
        intermediateValue1[scalarValue9] = intermediateValue5;
    }
    barrier();
    if ((scalarValue9 == 0u) && subgroupElect())
    {
        uint intermediateValue15;
        uint intermediateValue16;
        intermediateValue15 = comparisonValue1;
        intermediateValue16 = 1u;
        uint comparisonValue2;
        for (;;)
        {
            uint bitwiseValue2 = intermediateValue[intermediateValue16] & intermediateValue15;
            comparisonValue2 = (int(intermediateValue1[intermediateValue16] - scalarValue1) > int(49u)) ? (bitwiseValue2 & 4294967293u) : bitwiseValue2;
            uint sumValue = intermediateValue16 + 1u;
            if (sumValue < scalarValue)
            {
                intermediateValue15 = comparisonValue2;
                intermediateValue16 = sumValue;
            }
            else
            {
                break;
            }
        }
        uint comparisonValue3 = ((comparisonValue2 & 1u) != 0u) ? (comparisonValue2 | 6u) : comparisonValue2;
        imageStore(outputTileClassification, ivec2(uvec2(gl_GlobalInvocationID.x >> 4u, gl_GlobalInvocationID.y >> 4u)), ivec4(uvec4((((comparisonValue3 & 2u) != 0u) ? (scalarValue1 & 4294967288u) : 0u) | comparisonValue3)));
    }
}
