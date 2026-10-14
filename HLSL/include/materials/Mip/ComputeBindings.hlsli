// Native resource and stage-interface layouts for Mip / compute.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0

#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_LEVELS vertexConstants[0]
#define RD_UNIFORM_SCREEN_SIZE vertexConstants[1]
#define RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_0 vertexConstants[2]
#define RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_1 vertexConstants[3]
#define RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_2 vertexConstants[4]
#define RD_UNIFORM_SCENE_INVERSE_PROJECTION_ROW_3 vertexConstants[5]
cbuffer vertexUniformBuffer : register(b0, space0)
{
    float4 vertexConstants[6] : packoffset(c0);
};
Texture2D<float4> framebufferDepthTexture : register(t0, space0);
Texture2D<float4> inputMipTexture : register(t1, space0);
RWTexture2D<float4> outputMipTexture : register(u2, space0);
static uint3 dispatchThreadId;
struct ComputeStageInput
{
    uint3 dispatchThreadId : SV_DispatchThreadID;
};
#endif
