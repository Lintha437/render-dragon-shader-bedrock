// Native resource and stage-interface layouts for EditorSelectionCursor / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[3]
#define RD_UNIFORM_FRAME_TIME vertexVectorConstants0[4]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_FRAME_TIME vertexConstants[4]
cbuffer vertexUniformBuffer : register(b0, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 vertexVectorConstants0[5];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 vertexConstants[5] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexPosition0;
static float varyingTexCoord0;
struct VertexStageInput
{
    float4 vertexPosition0 : POSITION0;
};
struct VertexStageOutput
{
    float varyingTexCoord0 : TEXCOORD0;
    float4 clipSpacePosition : SV_Position;
};
#endif
