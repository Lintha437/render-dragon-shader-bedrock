// Native resource and stage-interface layouts for ScreenUV / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
static float4 clipSpacePosition;
static float3 vertexPosition0;
static float2 vertexTexCoord0;
static float4 varyingColor0;
struct VertexStageInput
{
    float3 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float4 varyingColor0 : COLOR0;
    float4 clipSpacePosition : SV_Position;
};
#endif
