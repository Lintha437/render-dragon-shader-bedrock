// Native resource and stage-interface layouts for PostFX.Debug.VoxelBuffer / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
static float4 clipSpacePosition;
static float4 vertexPosition0;
static float2 vertexTexCoord0;
static float2 varyingTexCoord0;
struct VertexStageInput
{
    float4 vertexPosition0 : POSITION0;
    float2 vertexTexCoord0 : TEXCOORD0;
};
struct VertexStageOutput
{
    float2 varyingTexCoord0 : TEXCOORD0;
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 1
#define RD_COMPARISON_MASK -
#endif
