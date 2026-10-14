// Native resource and stage-interface layouts for ShadowVolume / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
static float4 fragmentColor0;
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
#define RD_COMPARISON_MASK -
#endif
