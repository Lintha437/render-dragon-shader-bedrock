// Native resource and stage-interface layouts for Entity / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_FOG_CONTROL vertexConstants[0]
#define RD_UNIFORM_OVERLAY_COLOR vertexConstants[1]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexConstants[2]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexConstants[3]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexConstants[4]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexConstants[5]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[18]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[19]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[20]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[21]
#define RD_UNIFORM_FOG_COLOR vertexConstants[54]
#define RD_UNIFORM_UV_ANIMATION vertexConstants[55]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexConstants[56]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_FOG_CONTROL vertexVectorConstants0[0]
#define RD_UNIFORM_OVERLAY_COLOR vertexVectorConstants0[1]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexVectorConstants0[2]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexVectorConstants0[3]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexVectorConstants0[4]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexVectorConstants0[5]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[18]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[19]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[20]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[21]
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[54]
#define RD_UNIFORM_UV_ANIMATION vertexVectorConstants0[55]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexVectorConstants0[56]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_FOG_CONTROL vertexConstants[0]
#define RD_UNIFORM_OVERLAY_COLOR vertexConstants[1]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexConstants[2]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexConstants[3]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexConstants[4]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexConstants[5]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[18]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[19]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[20]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[21]
#define RD_UNIFORM_FOG_COLOR vertexConstants[54]
#define RD_UNIFORM_UV_ANIMATION vertexConstants[55]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexConstants[56]
#define RD_UNIFORM_UV_SCALE vertexConstants[57]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_FOG_CONTROL vertexVectorConstants0[0]
#define RD_UNIFORM_OVERLAY_COLOR vertexVectorConstants0[1]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexVectorConstants0[2]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexVectorConstants0[3]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexVectorConstants0[4]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexVectorConstants0[5]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[18]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[19]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[20]
#define RD_UNIFORM_MODEL_VIEW_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[21]
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[54]
#define RD_UNIFORM_UV_ANIMATION vertexVectorConstants0[55]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexVectorConstants0[56]
#define RD_UNIFORM_UV_SCALE vertexVectorConstants0[57]
cbuffer VertexVectorConstants0Buffer : register(b0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 vertexConstants[57] : packoffset(c0);
};
static float4 clipSpacePosition;
static int vertexBlendIndices0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
struct VertexStageInput
{
    int vertexBlendIndices0 : BLENDINDICES0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 1
  float4 vertexVectorConstants0[57];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
    float4 vertexConstants[58] : packoffset(c0);
};
static float4 clipSpacePosition;
static int vertexBlendIndices0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 varyingColor2;
static float4 varyingTexCoord2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
struct VertexStageInput
{
    int vertexBlendIndices0 : BLENDINDICES0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float4 varyingColor2 : COLOR2;
    float4 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor3 : COLOR3;
    float2 varyingTexCoord0 : TEXCOORD0;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 3
  float4 vertexVectorConstants0[58];
}
#define RD_COMPARISON_MASK -
#endif
