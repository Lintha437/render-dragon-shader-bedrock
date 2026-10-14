// Native resource and stage-interface layouts for UIFill / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
static float4 varyingColor0;
static float4 fragmentColor0;
struct FragmentStageInput
{
    float4 varyingColor0 : COLOR0;
};
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#elif RD_BINDING_LAYOUT == 1
#define RD_COMPARISON_MASK -
#endif
