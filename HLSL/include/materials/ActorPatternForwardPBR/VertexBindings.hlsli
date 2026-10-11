// Native resource and stage-interface layouts for ActorPatternForwardPBR / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
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
#define RD_UNIFORM_UV_ANIMATION vertexVectorConstants0[56]
#define RD_UNIFORM_PREV_WORLD_ROW_0 vertexVectorConstants0[89]
#define RD_UNIFORM_PREV_WORLD_ROW_1 vertexVectorConstants0[90]
#define RD_UNIFORM_PREV_WORLD_ROW_2 vertexVectorConstants0[91]
#define RD_UNIFORM_PREV_WORLD_ROW_3 vertexVectorConstants0[92]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexVectorConstants0[93]
cbuffer VertexVectorConstants0Buffer : register(b0)
{
  float4 vertexVectorConstants0[94];
}
#define RD_COMPARISON_MASK -
