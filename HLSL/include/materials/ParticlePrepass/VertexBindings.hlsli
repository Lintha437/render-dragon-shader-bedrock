// Native resource and stage-interface layouts for ParticlePrepass / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[3]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexVectorConstants0[4]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexVectorConstants0[5]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexVectorConstants0[6]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexVectorConstants0[7]
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[20]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexVectorConstants0[21]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexConstants[4]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexConstants[5]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexConstants[6]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexConstants[7]
#define RD_UNIFORM_FOG_COLOR vertexConstants[20]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexConstants[21]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_FOG_COLOR vertexConstants[4]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexConstants[5]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_VIEW_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[3]
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[4]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexVectorConstants0[5]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 4
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
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[24]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexVectorConstants0[25]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexVectorConstants0[26]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 5
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
#define RD_UNIFORM_FOG_COLOR vertexConstants[24]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexConstants[25]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexConstants[26]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 6
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
#define RD_UNIFORM_FOG_COLOR vertexConstants[24]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexConstants[25]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexConstants[26]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 7
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
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[24]
#define RD_UNIFORM_FOG_AND_DISTANCE_CONTROL vertexVectorConstants0[25]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexVectorConstants0[26]
cbuffer VertexVectorConstants0Buffer : register(b0)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 vertexVectorConstants0[22];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 vertexConstants[22] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float4 vertexTangent0;
static float2 vertexTexCoord0;
static float2 vertexTexCoord1;
static float3 varyingBitangent0;
static float4 varyingColor0;
static float3 varyingTexCoord2;
static float4 varyingColor1;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord1;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float4 vertexTangent0 : TANGENT0;
    float2 vertexTexCoord0 : TEXCOORD0;
    float2 vertexTexCoord1 : TEXCOORD1;
};
struct VertexStageOutput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float3 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor1 : COLOR1;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 2
    float4 vertexConstants[6] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float4 vertexTangent0;
static float2 vertexTexCoord0;
static float2 vertexTexCoord1;
static float4 vertexTexCoord7;
static float4 vertexTexCoord6;
static float4 vertexTexCoord5;
static float3 varyingBitangent0;
static float4 varyingColor0;
static float3 varyingTexCoord2;
static float4 varyingColor1;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord1;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float4 vertexTangent0 : TANGENT0;
    float2 vertexTexCoord0 : TEXCOORD0;
    float2 vertexTexCoord1 : TEXCOORD1;
    float4 vertexTexCoord7 : TEXCOORD7;
    float4 vertexTexCoord6 : TEXCOORD6;
    float4 vertexTexCoord5 : TEXCOORD5;
};
struct VertexStageOutput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float3 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor1 : COLOR1;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 3
  float4 vertexVectorConstants0[6];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4 || RD_BINDING_LAYOUT == 7
  float4 vertexVectorConstants0[27];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 5
    float4 vertexConstants[27] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float4 vertexTangent0;
static float2 vertexTexCoord0;
static float2 vertexTexCoord1;
static float3 varyingBitangent0;
static float4 varyingColor0;
static float3 varyingTexCoord2;
static float4 varyingColor1;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord1;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float4 vertexTangent0 : TANGENT0;
    float2 vertexTexCoord0 : TEXCOORD0;
    float2 vertexTexCoord1 : TEXCOORD1;
};
struct VertexStageOutput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float3 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor1 : COLOR1;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 6
    float4 vertexConstants[27] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float4 vertexTangent0;
static float2 vertexTexCoord0;
static float2 vertexTexCoord1;
static float4 vertexTexCoord7;
static float4 vertexTexCoord6;
static float4 vertexTexCoord5;
static float3 varyingBitangent0;
static float4 varyingColor0;
static float3 varyingTexCoord2;
static float4 varyingColor1;
static float3 varyingNormal0;
static float3 varyingTexCoord4;
static float3 varyingTangent0;
static float2 varyingTexCoord0;
static float2 varyingTexCoord1;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float4 vertexTangent0 : TANGENT0;
    float2 vertexTexCoord0 : TEXCOORD0;
    float2 vertexTexCoord1 : TEXCOORD1;
    float4 vertexTexCoord7 : TEXCOORD7;
    float4 vertexTexCoord6 : TEXCOORD6;
    float4 vertexTexCoord5 : TEXCOORD5;
};
struct VertexStageOutput
{
    float3 varyingBitangent0 : BITANGENT0;
    float4 varyingColor0 : COLOR0;
    float3 varyingTexCoord2 : TEXCOORD2;
    float4 varyingColor1 : COLOR1;
    float3 varyingNormal0 : NORMAL0;
    float3 varyingTexCoord4 : TEXCOORD4;
    float3 varyingTangent0 : TANGENT0;
    float2 varyingTexCoord0 : TEXCOORD0;
    float2 varyingTexCoord1 : TEXCOORD1;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#endif
