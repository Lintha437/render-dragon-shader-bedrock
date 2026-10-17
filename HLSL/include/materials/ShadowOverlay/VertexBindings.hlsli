// Native resource and stage-interface layouts for ShadowOverlay / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[3]
cbuffer VertexVectorConstants0Buffer : register(b0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 vertexConstants[4] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static float3 vertexPosition0;
static float4 varyingColor0;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    float3 vertexPosition0 : POSITION0;
};
struct VertexStageOutput
{
    float4 varyingColor0 : COLOR0;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 1
  float4 vertexVectorConstants0[4];
}
#define RD_COMPARISON_MASK -
#endif
