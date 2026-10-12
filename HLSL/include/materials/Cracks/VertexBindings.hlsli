// Native resource and stage-interface layouts for Cracks / vertex.
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
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexVectorConstants0[8]
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
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexConstants[8]
cbuffer vertexUniformBuffer : register(b0, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 vertexVectorConstants0[9];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 vertexConstants[9] : packoffset(c0);
};
static float4 clipSpacePosition;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float2 varyingTexCoord0;
struct VertexStageInput
{
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float2 varyingTexCoord0 : TEXCOORD0;
    float4 clipSpacePosition : SV_Position;
};
#endif
