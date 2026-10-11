// Native resource and stage-interface layouts for Checkerboarding / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#define RD_UNIFORM_OTHER_SIDE_OFFSET vertexConstants[0]
cbuffer vertexUniformBuffer : register(b0, space0)
{
    float4 vertexConstants[1] : packoffset(c0);
};
Texture2D<unorm float4> colorMetalnessInputTexture : register(t0, space0);
Texture2D<float4> emissiveLinearRoughnessInputTexture : register(t2, space0);
Texture2D<float4> lowPrecisionWorldPositionInputTexture : register(t4, space0);
Texture2D<float4> normalInputTexture : register(t6, space0);
Texture2D<uint4> planeIdInputTexture : register(t8, space0);
Texture2D<float4> viewDirectionAndSplitMaskInputTexture : register(t10, space0);
Texture2D<float4> worldPositionInputTexture : register(t12, space0);
RWTexture2D<unorm float4> colorMetalnessOutputTexture : register(u1, space0);
RWTexture2D<float4> emissiveLinearRoughnessOutputTexture : register(u3, space0);
RWTexture2D<float4> lowPrecisionWorldPositionOutputTexture : register(u5, space0);
RWTexture2D<float4> normalOutputTexture : register(u7, space0);
RWTexture2D<uint4> planeIdOutputTexture : register(u9, space0);
RWTexture2D<float4> viewDirectionAndSplitMaskOutputTexture : register(u11, space0);
RWTexture2D<float4> worldPositionOutputTexture : register(u13, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
