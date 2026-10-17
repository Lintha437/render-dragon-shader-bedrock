// Native resource and stage-interface layouts for FloatingPointClear / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#define RD_UNIFORM_CLEAR_COLOR fragmentConstants[0]
cbuffer fragmentUniformBuffer : register(b1, space0)
{
    float4 fragmentConstants[1] : packoffset(c0);
};
static float4 fragmentColor0;
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
