// Native resource and stage-interface layouts for FSR1 / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
RWTexture2D<unorm float4> outputTexTexture : register(u1, space0);
#elif RD_BINDING_LAYOUT == 1
RWTexture2D<unorm float4> intermediateValue : register(u1);
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_FSR_CONST1 vertexConstants[0]
#define RD_UNIFORM_FSR_CONST0 vertexConstants[1]
#define RD_UNIFORM_FSR_CONST2 vertexConstants[2]
#define RD_UNIFORM_FSR_CONST3 vertexConstants[3]
cbuffer vertexUniformBuffer : register(b0, space0)
{
    float4 vertexConstants[4] : packoffset(c0);
};
Texture2D<float4> inputTexTexture : register(t0, space0);
RWTexture2D<unorm float4> outputTexTexture : register(u1, space0);
SamplerState inputTexSampler : register(s0, space0);
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_FSR_CONST1 vertexConstants[0]
#define RD_UNIFORM_FSR_CONST0 vertexConstants[1]
cbuffer vertexUniformBuffer : register(b0, space0)
{
    float4 vertexConstants[2] : packoffset(c0);
};
Texture2D<float4> inputTexTexture : register(t0, space0);
RWTexture2D<unorm float4> outputTexTexture : register(u1, space0);
SamplerState inputTexSampler : register(s0, space0);
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_FSR_CONST0 vertexConstants[0]
cbuffer vertexUniformBuffer : register(b0, space0)
{
    float4 vertexConstants[1] : packoffset(c0);
};
Texture2D<float4> inputTexTexture : register(t0, space0);
RWTexture2D<unorm float4> outputTexTexture : register(u1, space0);
#endif
static uint3 workgroupId;
static uint3 localThreadId;
struct ComputeStageInput
{
    uint3 workgroupId : SV_GroupID;
    uint3 localThreadId : SV_GroupThreadID;
};
