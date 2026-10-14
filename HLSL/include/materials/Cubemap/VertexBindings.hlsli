// Native resource and stage-interface layouts for Cubemap / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexVectorConstants0[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexVectorConstants0[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexVectorConstants0[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexVectorConstants0[7]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexVectorConstants0[8]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexVectorConstants0[9]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexVectorConstants0[10]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexVectorConstants0[11]
#define RD_UNIFORM_CUBEMAP_ROTATION_ROW_0 vertexVectorConstants0[24]
#define RD_UNIFORM_CUBEMAP_ROTATION_ROW_1 vertexVectorConstants0[25]
#define RD_UNIFORM_CUBEMAP_ROTATION_ROW_2 vertexVectorConstants0[26]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexVectorConstants0[28]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexConstants[7]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexConstants[8]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexConstants[9]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexConstants[10]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexConstants[11]
#define RD_UNIFORM_CUBEMAP_ROTATION_ROW_0 vertexConstants[24]
#define RD_UNIFORM_CUBEMAP_ROTATION_ROW_1 vertexConstants[25]
#define RD_UNIFORM_CUBEMAP_ROTATION_ROW_2 vertexConstants[26]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexConstants[28]
cbuffer vertexUniformBuffer : register(b0, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 vertexVectorConstants0[29];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 vertexConstants[29] : packoffset(c0);
};
static float4 clipSpacePosition;
static float3 vertexPosition0;
static float3 varyingTexCoord0;
struct VertexStageInput
{
    float3 vertexPosition0 : POSITION0;
};
struct VertexStageOutput
{
    float3 varyingTexCoord0 : TEXCOORD0;
    float4 clipSpacePosition : SV_Position;
};
#endif
