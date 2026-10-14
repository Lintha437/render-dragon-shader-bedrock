// Native resource and stage-interface layouts for UIBase / fragment.
// RD_BINDING_LAYOUT is selected by the material build recipe.
#if RD_BINDING_LAYOUT == 0
#define RD_UNIFORM_HUD_OPACITY fragmentVectorConstants1[0]
#define RD_UNIFORM_TINT_COLOR fragmentVectorConstants1[1]
cbuffer FragmentVectorConstants1Buffer : register(b1)
#elif RD_BINDING_LAYOUT == 1
#define RD_UNIFORM_HUD_OPACITY fragmentConstants[0]
#define RD_UNIFORM_TINT_COLOR fragmentConstants[1]
cbuffer fragmentUniformBuffer : register(b1, space0)
#endif
{
#if RD_BINDING_LAYOUT == 0
  float4 fragmentVectorConstants1[2];
}
#define RD_COMPARISON_MASK -
#elif RD_BINDING_LAYOUT == 1
    float4 fragmentConstants[2] : packoffset(c0);
};
static float4 fragmentColor0;
struct FragmentStageOutput
{
    float4 fragmentColor0 : SV_Target0;
};
#endif
