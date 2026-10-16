// Native resource and stage-interface layouts for Actor / vertex.
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
#define RD_UNIFORM_FOG_CONTROL vertexVectorConstants0[8]
#define RD_UNIFORM_OVERLAY_COLOR vertexVectorConstants0[9]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexVectorConstants0[10]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexVectorConstants0[11]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexVectorConstants0[12]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexVectorConstants0[13]
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[26]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexVectorConstants0[59]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexVectorConstants0[60]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 1 || RD_BINDING_LAYOUT == 2
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexConstants[7]
#define RD_UNIFORM_FOG_CONTROL vertexConstants[8]
#define RD_UNIFORM_OVERLAY_COLOR vertexConstants[9]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexConstants[10]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexConstants[11]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexConstants[12]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexConstants[13]
#define RD_UNIFORM_FOG_COLOR vertexConstants[26]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexConstants[59]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexConstants[60]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 3
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexVectorConstants0[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexVectorConstants0[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexVectorConstants0[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexVectorConstants0[7]
#define RD_UNIFORM_FOG_CONTROL vertexVectorConstants0[8]
#define RD_UNIFORM_OVERLAY_COLOR vertexVectorConstants0[9]
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[10]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexVectorConstants0[11]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexVectorConstants0[12]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 4
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexConstants[7]
#define RD_UNIFORM_FOG_CONTROL vertexConstants[8]
#define RD_UNIFORM_OVERLAY_COLOR vertexConstants[9]
#define RD_UNIFORM_FOG_COLOR vertexConstants[10]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexConstants[11]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexConstants[12]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 5
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexVectorConstants0[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexVectorConstants0[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexVectorConstants0[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexVectorConstants0[7]
#define RD_UNIFORM_FOG_CONTROL vertexVectorConstants0[8]
#define RD_UNIFORM_OVERLAY_COLOR vertexVectorConstants0[9]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexVectorConstants0[10]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexVectorConstants0[11]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexVectorConstants0[12]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexVectorConstants0[13]
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[26]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexVectorConstants0[59]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexVectorConstants0[60]
#define RD_UNIFORM_UV_ANIMATION vertexVectorConstants0[61]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 6 || RD_BINDING_LAYOUT == 7
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexConstants[7]
#define RD_UNIFORM_FOG_CONTROL vertexConstants[8]
#define RD_UNIFORM_OVERLAY_COLOR vertexConstants[9]
#define RD_UNIFORM_MODEL_MATRICES_ROW_0 vertexConstants[10]
#define RD_UNIFORM_MODEL_MATRICES_ROW_1 vertexConstants[11]
#define RD_UNIFORM_MODEL_MATRICES_ROW_2 vertexConstants[12]
#define RD_UNIFORM_MODEL_MATRICES_ROW_3 vertexConstants[13]
#define RD_UNIFORM_FOG_COLOR vertexConstants[26]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexConstants[59]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexConstants[60]
#define RD_UNIFORM_UV_ANIMATION vertexConstants[61]
cbuffer vertexUniformBuffer : register(b0, space0)
#elif RD_BINDING_LAYOUT == 8
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexVectorConstants0[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexVectorConstants0[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexVectorConstants0[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexVectorConstants0[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexVectorConstants0[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexVectorConstants0[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexVectorConstants0[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexVectorConstants0[7]
#define RD_UNIFORM_FOG_CONTROL vertexVectorConstants0[8]
#define RD_UNIFORM_OVERLAY_COLOR vertexVectorConstants0[9]
#define RD_UNIFORM_FOG_COLOR vertexVectorConstants0[10]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexVectorConstants0[11]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexVectorConstants0[12]
#define RD_UNIFORM_UV_ANIMATION vertexVectorConstants0[13]
cbuffer VertexVectorConstants0Buffer : register(b0)
#elif RD_BINDING_LAYOUT == 9
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_0 vertexConstants[0]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_1 vertexConstants[1]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_2 vertexConstants[2]
#define RD_UNIFORM_PROJECTION_MATRIX_ROW_3 vertexConstants[3]
#define RD_UNIFORM_VIEW_MATRIX_ROW_0 vertexConstants[4]
#define RD_UNIFORM_VIEW_MATRIX_ROW_1 vertexConstants[5]
#define RD_UNIFORM_VIEW_MATRIX_ROW_2 vertexConstants[6]
#define RD_UNIFORM_VIEW_MATRIX_ROW_3 vertexConstants[7]
#define RD_UNIFORM_FOG_CONTROL vertexConstants[8]
#define RD_UNIFORM_OVERLAY_COLOR vertexConstants[9]
#define RD_UNIFORM_FOG_COLOR vertexConstants[10]
#define RD_UNIFORM_SUB_PIXEL_OFFSET vertexConstants[11]
#define RD_UNIFORM_TILE_LIGHT_COLOR vertexConstants[12]
#define RD_UNIFORM_UV_ANIMATION vertexConstants[13]
cbuffer vertexUniformBuffer : register(b0, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 vertexVectorConstants0[61];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 vertexConstants[61] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static int vertexBlendIndices0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    int vertexBlendIndices0 : BLENDINDICES0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 2
    float4 vertexConstants[61] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static int vertexBlendIndices0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 vertexTexCoord7;
static float4 vertexTexCoord6;
static float4 vertexTexCoord5;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    int vertexBlendIndices0 : BLENDINDICES0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
    float4 vertexTexCoord7 : TEXCOORD7;
    float4 vertexTexCoord6 : TEXCOORD6;
    float4 vertexTexCoord5 : TEXCOORD5;
};
struct VertexStageOutput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 3
  float4 vertexVectorConstants0[13];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 4
    float4 vertexConstants[13] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static int vertexBlendIndices0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 vertexTexCoord7;
static float4 vertexTexCoord6;
static float4 vertexTexCoord5;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    int vertexBlendIndices0 : BLENDINDICES0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
    float4 vertexTexCoord7 : TEXCOORD7;
    float4 vertexTexCoord6 : TEXCOORD6;
    float4 vertexTexCoord5 : TEXCOORD5;
};
struct VertexStageOutput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 5
  float4 vertexVectorConstants0[62];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 6
    float4 vertexConstants[62] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static int vertexBlendIndices0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    int vertexBlendIndices0 : BLENDINDICES0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 7
    float4 vertexConstants[62] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static int vertexBlendIndices0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 vertexTexCoord7;
static float4 vertexTexCoord6;
static float4 vertexTexCoord5;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    int vertexBlendIndices0 : BLENDINDICES0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
    float4 vertexTexCoord7 : TEXCOORD7;
    float4 vertexTexCoord6 : TEXCOORD6;
    float4 vertexTexCoord5 : TEXCOORD5;
};
struct VertexStageOutput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 8
  float4 vertexVectorConstants0[14];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 9
    float4 vertexConstants[14] : packoffset(c0);
};
static float4 clipSpacePosition;
static float4 vertexColor0;
static int vertexBlendIndices0;
static float4 vertexNormal0;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 vertexTexCoord7;
static float4 vertexTexCoord6;
static float4 vertexTexCoord5;
static float4 varyingColor1;
static float4 varyingColor0;
static float4 varyingColor2;
static float4 varyingColor3;
static float2 varyingTexCoord0;
static float3 varyingTexCoord3;
struct VertexStageInput
{
    float4 vertexColor0 : COLOR0;
    int vertexBlendIndices0 : BLENDINDICES0;
    float4 vertexNormal0 : NORMAL0;
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
    float4 vertexTexCoord7 : TEXCOORD7;
    float4 vertexTexCoord6 : TEXCOORD6;
    float4 vertexTexCoord5 : TEXCOORD5;
};
struct VertexStageOutput
{
    float4 varyingColor1 : COLOR1;
    float4 varyingColor0 : COLOR0;
    float4 varyingColor2 : COLOR2;
    float4 varyingColor3 : COLOR3;
    centroid float2 varyingTexCoord0 : TEXCOORD0;
    float3 varyingTexCoord3 : TEXCOORD3;
    float4 clipSpacePosition : SV_Position;
};
#endif
