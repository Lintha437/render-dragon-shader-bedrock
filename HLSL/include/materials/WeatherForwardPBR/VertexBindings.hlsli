// Native resource and stage-interface layouts for WeatherForwardPBR / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0 || RD_BINDING_LAYOUT == 2 || RD_BINDING_LAYOUT == 3 || RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexConstants[7]
#define RD_UNIFORM_DIMENSIONS vertexConstants[8]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexConstants[9]
#define RD_UNIFORM_FOG_COLOR vertexConstants[10]
#define RD_UNIFORM_POSITION_BASE_OFFSET vertexConstants[11]
#define RD_UNIFORM_POSITION_FORWARD_OFFSET vertexConstants[12]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexConstants[13]
#define RD_UNIFORM_UV_OFFSET_AND_SCALE vertexConstants[14]
#define RD_UNIFORM_VELOCITY vertexConstants[15]
#define RD_UNIFORM_VIEW_POSITION vertexConstants[16]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexVectorConstants0[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexVectorConstants0[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexVectorConstants0[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexVectorConstants0[7]
#define RD_UNIFORM_DIMENSIONS vertexVectorConstants0[8]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexVectorConstants0[9]
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[10]
#define RD_UNIFORM_POSITION_BASE_OFFSET vertexVectorConstants0[11]
#define RD_UNIFORM_POSITION_FORWARD_OFFSET vertexVectorConstants0[12]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexVectorConstants0[13]
#define RD_UNIFORM_UV_OFFSET_AND_SCALE vertexVectorConstants0[14]
#define RD_UNIFORM_VELOCITY vertexVectorConstants0[15]
#define RD_UNIFORM_VIEW_POSITION vertexVectorConstants0[16]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexVectorConstants0[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexVectorConstants0[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexVectorConstants0[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexVectorConstants0[7]
#define RD_UNIFORM_DIMENSIONS vertexVectorConstants0[8]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexVectorConstants0[9]
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[10]
#define RD_UNIFORM_POSITION_BASE_OFFSET vertexVectorConstants0[11]
#define RD_UNIFORM_POSITION_FORWARD_OFFSET vertexVectorConstants0[12]
#define RD_UNIFORM_PREV_POSITION_BASE_OFFSET vertexVectorConstants0[13]
#define RD_UNIFORM_PREV_POSITION_FORWARD_OFFSET vertexVectorConstants0[14]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexVectorConstants0[15]
#define RD_UNIFORM_UV_OFFSET_AND_SCALE vertexVectorConstants0[16]
#define RD_UNIFORM_VELOCITY vertexVectorConstants0[17]
#define RD_UNIFORM_VIEW_POSITION vertexVectorConstants0[18]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 6
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexConstants[7]
#define RD_UNIFORM_DIMENSIONS vertexConstants[8]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexConstants[9]
#define RD_UNIFORM_FOG_COLOR vertexConstants[10]
#define RD_UNIFORM_POSITION_BASE_OFFSET vertexConstants[11]
#define RD_UNIFORM_POSITION_FORWARD_OFFSET vertexConstants[12]
#define RD_UNIFORM_PREV_POSITION_BASE_OFFSET vertexConstants[13]
#define RD_UNIFORM_PREV_POSITION_FORWARD_OFFSET vertexConstants[14]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexConstants[15]
#define RD_UNIFORM_UV_OFFSET_AND_SCALE vertexConstants[16]
#define RD_UNIFORM_VELOCITY vertexConstants[17]
#define RD_UNIFORM_VIEW_POSITION vertexConstants[18]
cbuffer vertexUniformBuffer : register(b0, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
    float4 vertexConstants[17] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 varyingColor0;
static float4 varyingColor1;
static float3 varyingColor2;
static float varyingTexCoord2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingColor1 : COLOR1;
    float3 varyingColor2 : COLOR2;
    float varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 1
  float4 vertexVectorConstants0[17];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 2
    float4 vertexConstants[17] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 vertexTexCoord7;
static float4 vertexTexCoord6;
static float4 vertexTexCoord5;
static float4 varyingColor0;
static float4 varyingColor1;
static float3 varyingColor2;
static float varyingTexCoord2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
    float4 vertexTexCoord7 : TEXCOORD7;
    float4 vertexTexCoord6 : TEXCOORD6;
    float4 vertexTexCoord5 : TEXCOORD5;
};
struct VertexStageOutput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingColor1 : COLOR1;
    float3 varyingColor2 : COLOR2;
    float varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 3
    float4 vertexConstants[17] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 varyingColor0;
static float4 varyingColor1;
static float varyingTexCoord2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingColor1 : COLOR1;
    float varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 4
    float4 vertexConstants[17] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 vertexTexCoord7;
static float4 vertexTexCoord6;
static float4 vertexTexCoord5;
static float4 varyingColor0;
static float4 varyingColor1;
static float varyingTexCoord2;
static float2 varyingTexCoord1;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
    float4 vertexTexCoord7 : TEXCOORD7;
    float4 vertexTexCoord6 : TEXCOORD6;
    float4 vertexTexCoord5 : TEXCOORD5;
};
struct VertexStageOutput
{
    float4 varyingColor0 : COLOR0;
    float4 varyingColor1 : COLOR1;
    float varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 5
  float4 vertexVectorConstants0[19];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
    float4 vertexConstants[19] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 varyingColor1;
static float varyingTexCoord2;
static float2 varyingTexCoord1;
static float3 varyingTexCoord4;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float4 varyingColor1 : COLOR1;
    float varyingTexCoord2 : TEXCOORD2;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord4 : TEXCOORD4;
    float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#endif
