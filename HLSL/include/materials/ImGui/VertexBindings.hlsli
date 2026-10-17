// Native resource and stage-interface layouts for ImGui / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_IM_GUI_PROJ_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_IM_GUI_PROJ_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_IM_GUI_PROJ_ROW_3 vertexVectorConstants0[3]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_IM_GUI_PROJ_ROW_0 vertexConstants[0]
#define RD_UNIFORM_IM_GUI_PROJ_ROW_1 vertexConstants[1]
#define RD_UNIFORM_IM_GUI_PROJ_ROW_3 vertexConstants[3]
cbuffer vertexUniformBuffer : register(b0, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 vertexVectorConstants0[4];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 vertexConstants[4] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static float2 vertexPosition0;
static float2 vertexTexCoord0;
static float4 varyingColor0;
static float2 varyingTexCoord0;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    float2 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float4 varyingColor0 : COLOR0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float4 clipSpacePosition : SV_Position;
};
#endif
