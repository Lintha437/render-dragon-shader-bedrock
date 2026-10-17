// Native resource and stage-interface layouts for FloatingPointClear / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
static float4 clipSpacePosition;
static float3 vertexPosition0;
struct VertexStageInput
{
    float3 vertexPosition0 : POSITION0;
};
struct VertexStageOutput
{
    float4 clipSpacePosition : SV_Position;
};
#elif RD_BINDING_LAYOUT == 1
#define RD_COMPARISON_MASK -
#endif
