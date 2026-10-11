// Native resource and stage-interface layouts for GamefacePath / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexConstants[0]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexConstants[1]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexConstants[2]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexConstants[3]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexVectorConstants0[3]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 2
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 3
cbuffer VertexVectorConstants0Buffer : register(b0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 vertexConstants[144] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexPosition0;
static float4 varyingTexCoord0;
static float4 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexPosition0 : POSITION0;
};
struct VertexStageOutput
{
    float4 varyingTexCoord0 : TEXCOORD0;
    nointerpolation float4 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 1
  float4 vertexVectorConstants0[144];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
    float4 vertexConstants[128] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexPosition0;
static float4 vertexTexCoord8;
static float4 varyingTexCoord0;
static float4 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexPosition0 : POSITION0;
    float4 vertexTexCoord8 : TEXCOORD8;
};
struct VertexStageOutput
{
    float4 varyingTexCoord0 : TEXCOORD0;
    nointerpolation float4 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 3
  float4 vertexVectorConstants0[128];
}
#define RD_COMPARISON_MASK -
#endif
