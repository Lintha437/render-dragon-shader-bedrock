// Native resource and stage-interface layouts for Checkerboarding / vertex.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
static float4 clipSpacePosition;
struct VertexStageOutput
{
    float4 clipSpacePosition : SV_Position;
};
#endif
