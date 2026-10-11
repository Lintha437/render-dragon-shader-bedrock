// Native resource and stage-interface layouts for Bloom / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_VIEWPORT_SCALE vertexVectorConstants0[0]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_VIEWPORT_SCALE vertexConstants[0]
cbuffer vertexUniformBuffer : register(b0, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 vertexVectorConstants0[1];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 vertexConstants[1] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexPosition0;
static float2 vertexTexCoord0;
static float4 varyingTexCoord0;
struct VertexStageInput
{
    float4 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float4 varyingTexCoord0 : TEXCOORD0;
    float4 clipSpacePosition : SV_Position;
};
#endif
