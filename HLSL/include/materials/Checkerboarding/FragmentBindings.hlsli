// Native resource and stage-interface layouts for Checkerboarding / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
static float4 fragmentColor0;
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
