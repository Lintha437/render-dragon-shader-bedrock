// Native resource and stage-interface layouts for ClearVolume / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_CLEAR_VALUE computeVectorConstants0[0]
#define RD_UNIFORM_VOLUME_DIMENSIONS computeVectorConstants0[1]
cbuffer ComputeVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_CLEAR_VALUE vertexConstants[0]
#define RD_UNIFORM_VOLUME_DIMENSIONS vertexConstants[1]
cbuffer vertexUniformBuffer : register(b0, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 computeVectorConstants0[2] : packoffset(c0);
#elif RD_BINDING_LAYOUT == 1
    float4 vertexConstants[2] : packoffset(c0);
#endif
};
#if RD_BINDING_LAYOUT == 0
RWTexture2DArray<float4> intermediateValue : register(u0);
#elif RD_BINDING_LAYOUT == 1
RWTexture2DArray<float4> volumeTexture : register(u0, space0);
#endif
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
