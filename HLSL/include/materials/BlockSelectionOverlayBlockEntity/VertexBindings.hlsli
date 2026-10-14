// Native resource and stage-interface layouts for BlockSelectionOverlayBlockEntity / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexConstants[4]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexConstants[5]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexConstants[6]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexConstants[7]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[3]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexVectorConstants0[4]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexVectorConstants0[5]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexVectorConstants0[6]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexVectorConstants0[7]
cbuffer VertexVectorConstants0Buffer : register(b0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 vertexConstants[52] : packoffset(c0);
};
static float4 clipSpacePosition;
static int vertexBlendIndices0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float2 varyingTexCoord0;
struct VertexStageInput
{
    int vertexBlendIndices0 : BLENDINDICES0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float2 varyingTexCoord0 : TEXCOORD0;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 1
  float4 vertexVectorConstants0[52];
}
#define RD_COMPARISON_MASK -
#endif
